/* 
    Copyright (C) 1985, 2010  Francisco Muñoz "Hermes" <www.elotrolado.net>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

*/


#include "audioplayer.h"

#include "vorbis/vorbisfile.h"

#ifdef USE_MP3
#include "mpg123.h"
#endif

#include <string.h>

// Audio thread control
#define PLAYER_PRIORITY 900 // PS3 thread priority
#define STACKSIZE       1024*128

static sys_sem_t audioplayer_semaid;
static sys_sem_attr_t audioplayer_sema_attr;


static sys_ppu_thread_t h_audioplayer;
static volatile int audio_thread_running = 0;

#ifdef USE_48KHZ_MIXER
#define FREQ_MIXER 48000
#else
#define FREQ_MIXER private_audio.rate
#endif

// used to get SFX data sound from mediaplayer
//#define UPDATE_SFX_DATA 

/* OGG control */

#define READ_SAMPLES 4096*2 // samples that it must read before to send
#define MAX_PCMOUT 4096     // minimum size to read ogg samples

#define VOICE 0 // by default 0

typedef struct {
// Ogg section
    OggVorbis_File vf;
    vorbis_info *vi;
    int current_section;

    int is_ogg;

// MP3 Section

    int err;
    int channels, encoding;
    off_t rate;
    size_t buffer_size;

#ifdef USE_MP3
    mpg123_handle *mh;

#endif

// Audio file operation
    FILE *fd;
    int mode;
    int eof;
    int flag;
    int volume;
    int seek_time;

    int total_time;

/* Audio buffer control */
    short pcmout[2][65536] __attribute__ ((aligned(128)));
    int pcmout_pos;
    int pcm_indx;


} private_data_audio;

static short pcmout[65536] __attribute__ ((aligned(32)));

static int last_volume = 127;
static private_data_audio private_audio;

#ifdef UPDATE_SFX_DATA

short pcm_outsample[512] __attribute__ ((aligned(32)));
static int pcm_outsample_pos = 0;

#endif

static int _disable_thread = 0;

extern int f_read(void *punt, int bytes, int blocks, void *f);
extern off_t f_seek(void *f, int offset, int mode);
extern int f_close(void *f);
extern int f_tell(void *f);

static int _fseek64_wrap(FILE * fp, ogg_int64_t off, int whence)
{
    return f_seek(fp, (int) off, whence);
}

int my_ov_open(FILE * f, OggVorbis_File * vf, const char *initial,
           long ibytes)
{
    ov_callbacks callbacks = {
    (size_t(*)(void *, size_t, size_t, void *)) f_read,
    (int (*)(void *, ogg_int64_t, int)) _fseek64_wrap,
    (int (*)(void *)) f_close,
    (long (*)(void *)) f_tell
    };

    return ov_open_callbacks((void *) f, vf, initial, ibytes, callbacks);
}

#ifdef USE_MP3

static ssize_t mp3_read(int fd, void *punt, size_t count)
{
    return f_read(punt, 1, (u32) count, (FILE *) private_audio.fd);
}

static off_t mp3_lseek(int fd, off_t off, int whence)
{
    if(f_seek((FILE *) private_audio.fd, (int) off, whence)<0) ;
    return (off_t) f_tell((FILE *) private_audio.fd);
}

#endif

void DI_AudioThread(int flag)
{
    _disable_thread = flag;
}



#ifdef USE_48KHZ_MIXER

static int re_freq = 44100;

static int re_left, re_right, re_step, re_div;

static int re_mono = 0;


static void Resample_Init(int freq, int mono)
{
    if (freq > 48000) freq  = 48000; // out of range

    re_freq  = freq;
    re_mono  = mono;
    re_left  = 0;
    re_right = 0;
    re_step  = 0;

}

static int Resample_to48khz(short *s, short *o, int nsamples)
{
    int n, m;
    int ret = 0;
    int sampl, sampr;
    int ssampl, ssampr;

// resample mono
    if (re_mono) {
        for (n = 0; n < nsamples; n++) {
                
                re_div = -1;
                
                while (re_step < 48000) {
                    re_div++;
                    re_step += re_freq;
                }

            re_step -= 48000;

            sampl = *s++;

            if (re_div < 1) {
                
                *o++ = sampl;
                ret += 2;

            } else {
                
                ssampl = sampl - re_left;

                for (m = 0; m <= re_div; m++) {
                    *o++ = re_left + (ssampl * m) / re_div;
                    ret += 2;
                }
            }
        
        re_left = sampl;
        
        }

    } else {

// resample stereo
    nsamples >>= 1;

    for (n = 0; n < nsamples; n++) {
        
        re_div = -1;
        
        while (re_step < 48000) {
            
            re_div++;
            re_step += re_freq;
        }
        
        re_step -= 48000;

        sampl = *s++;
        sampr = *s++;

        if (re_div < 1) {
        
            *o++ = sampl;
            *o++ = sampr;
            ret += 4;

        } else {
        
            ssampl = sampl - re_left;
            ssampr = sampr - re_right;

            for (m = 0; m <= re_div; m++) {
                
                *o++ = re_left + (ssampl * m) / re_div;
                *o++ = re_right + (ssampr * m) / re_div;
                
                ret += 4;
            }
        }

        re_left = sampl;
        re_right = sampr;
    }
    }

    return ret;
}

#endif


static void audio_add_callback(int voice)
{
    if (audio_thread_running <= 0) {

        SND_StopVoice(VOICE);
    
        return;
    }

    if (private_audio.flag & 128)   return; // Audio is paused

    if (private_audio.pcm_indx >= READ_SAMPLES && (private_audio.flag & 2) == 2) {

        if (SND_AddVoice (VOICE, (void *) private_audio.pcmout[private_audio.pcmout_pos], private_audio.pcm_indx << 1) == 0) {

#ifdef UPDATE_SFX_DATA

            int k, n;
            short *p1, *p2;

            n = 512 - pcm_outsample_pos;

            if (n > 0) {

                p1 = &pcm_outsample[pcm_outsample_pos];
                p2 = &private_audio.pcmout[private_audio.pcmout_pos][0];
                for (k = 0; k < (n >> 1); k++) {
                    *p1++ = *p2++;
                    *p1++ = *p2;
                    p2 += 7;
                }

            }

            pcm_outsample_pos += n;
            if (pcm_outsample_pos >= 512) {
                
                p1 = &pcm_outsample[0];
                p2 = &private_audio.pcmout[private_audio.pcmout_pos][n];

                for (k = 0; k < ((512 - n) >> 1); k++) {
                
                    *p1++ = *p2++;
                    *p1++ = *p2;
                    
                    p2+= 7;
                }
            pcm_outsample_pos = 512 - n;

            }
#endif
            private_audio.pcmout_pos ^= 1;
            private_audio.pcm_indx = 0;
            private_audio.flag = 0;
            sysSemPost(audioplayer_semaid, 1);
        }
    } else {    
      
        if ((private_audio.flag & 66)==66) {
            private_audio.flag &= ~66;
            sysSemPost(audioplayer_semaid, 1);
            }
    }
}


void audio_player_thread(u64 value)
{

    int first_time = 1;

    audio_thread_running = 0;

    if (private_audio.is_ogg) {
        private_audio.vi       = ov_info(&private_audio.vf, -1);
        private_audio.rate     = private_audio.vi->rate;
        private_audio.channels = private_audio.vi->channels;
    }

    SND_Pause(0);

    private_audio.pcm_indx        = 0;
    private_audio.pcmout_pos      = 0;
    private_audio.eof             = 0;
    private_audio.flag            = 0;
    private_audio.current_section = 0;

    audio_thread_running = 1;

    SND_StopVoice(VOICE);

#ifdef USE_48KHZ_MIXER
    Resample_Init(private_audio.rate, private_audio.channels < 2);
#endif

    while (!private_audio.eof) {
    
        long ret;

        if (audio_thread_running <= 0)
            break;

//        sys_ppu_thread_yield();

        if (private_audio.flag) {
        
            private_audio.flag |= 2;

            sysSemWait(audioplayer_semaid, 0);  // wait only when i have samples to send

            if (private_audio.flag & 2) {
                private_audio.flag |= 64;
                continue;
            }
        }
    
    if (_disable_thread) {
        usleep(100);
        continue;
    }


    if (audio_thread_running <= 0)
        break;

    if (private_audio.flag == 0) { // wait to all samples are sended

        if (SND_TestVoiceBufferReady(VOICE) == 0) {
            private_audio.flag |= 64;
            continue;
         }
        
        if (private_audio.pcm_indx < READ_SAMPLES) {
            private_audio.flag = 3;

            if (private_audio.seek_time >= 0) {
                //off_t pos;
                if (private_audio.is_ogg) {
                ov_time_seek(&private_audio.vf,
                         private_audio.seek_time);
                } else {
#ifdef USE_MP3
                    mpg123_seek(private_audio.mh, (int) (((long long) private_audio.seek_time * (long long) private_audio.rate) / 1000LL), SEEK_SET);
#endif
                }
            private_audio.seek_time = -1;
            }

            if (private_audio.is_ogg) {

                ret = ov_read(&private_audio.vf, (void *) pcmout, MAX_PCMOUT, 1, 2, 1, &private_audio.current_section);

                private_audio.flag &= 192;

                if (ret == 0) {
                /* EOF */
                    if (private_audio.mode & 1)
                        ov_time_seek(&private_audio.vf, 0); // repeat
                    else
                        private_audio.eof = 1;  // stops
            //
                } else if (ret < 0) {
                /* error in the stream.  Not a problem, just reporting it in
                case we (the app) cares.  In this case, we don't. */

                    if (ret != OV_HOLE) {
                        if (private_audio.mode & 1)
                            ov_time_seek(&private_audio.vf, 0); // repeat
                    else
                         private_audio.eof = 1;  // stops
                    }
                } else {
                /* we don't bother dealing with sample rate changes, etc, but
                you'll have to */
#ifdef USE_48KHZ_MIXER
                    ret = Resample_to48khz(pcmout, &private_audio.pcmout[private_audio.pcmout_pos][private_audio.pcm_indx], ret >> 1);
#else
                    memcpy(&private_audio.pcmout[private_audio.pcmout_pos][private_audio.pcm_indx], pcmout, ret);
#endif
                    private_audio.pcm_indx += ret >> 1; //get 16 bits samples
                }
            
            } else {   // MP3

#ifdef USE_MP3
                size_t done = 0;

                ret = mpg123_read(private_audio.mh, (void *) pcmout, private_audio.buffer_size, &done);
            
                private_audio.flag &= 192;
                if (ret == MPG123_DONE) {
                    if (private_audio.mode & 1)   
                        mpg123_seek_frame(private_audio.mh, 0, SEEK_SET);
                    else
                        private_audio.eof = 1;  // stops

                } else if (ret == MPG123_OK) {
               
                    if (done >= 0) {
#ifdef USE_48KHZ_MIXER
                        done = Resample_to48khz(pcmout, &private_audio.pcmout[private_audio.pcmout_pos][private_audio.pcm_indx], done >> 1);
#else
                        memcpy(&private_audio.pcmout[private_audio.pcmout_pos][private_audio.pcm_indx], pcmout, done);
#endif
                        private_audio.pcm_indx += done >> 1;
                    }
                }
#endif
            }
        } else
            private_audio.flag = 1;
    }

    if (private_audio.flag == 1) {
        
        if (SND_StatusVoice(VOICE) == SND_UNUSED || first_time) {
           
            first_time = 0;
            
            if (private_audio.channels == 2) {
                SND_SetVoice(VOICE, VOICE_STEREO_16BIT, FREQ_MIXER, 0, (void *) private_audio.pcmout[private_audio.pcmout_pos],
                    private_audio.pcm_indx << 1, private_audio.volume, private_audio.volume, audio_add_callback);

                private_audio.pcmout_pos ^= 1;
                private_audio.pcm_indx = 0;
                private_audio.flag = 0;
            } else {
                SND_SetVoice(VOICE, VOICE_MONO_16BIT, FREQ_MIXER, 0, (void *) private_audio.pcmout[private_audio.pcmout_pos],
                    private_audio.pcm_indx << 1, private_audio.volume, private_audio.volume, audio_add_callback);
            
                private_audio.pcmout_pos ^= 1;
                private_audio.pcm_indx = 0;
                private_audio.flag = 0;
            }
        }

    }

    }


    if (private_audio.is_ogg)
        ov_clear(&private_audio.vf);

    private_audio.pcm_indx = 0;
    audio_thread_running = 0;

#ifdef USE_MP3
    // mp3
    if (!private_audio.is_ogg && private_audio.mh) {

        mpg123_close(private_audio.mh);
        mpg123_delete(private_audio.mh);
        mpg123_exit();
        mem_close((u32) (u64) private_audio.fd);    // mem_close() can too close files from devices 
    }

    private_audio.mh          = NULL;
    private_audio.err         = MPG123_DONE;

#endif

    private_audio.fd          = NULL;
    private_audio.channels    = 0;
    private_audio.encoding    = 0;
    private_audio.rate        = 0;
    private_audio.buffer_size = 0;

    sysSemDestroy(audioplayer_semaid);

    sysThreadExit(0);
}


void StopAudio()
{
    SND_StopVoice(VOICE);
    
    if (audio_thread_running > 0) {
        
        audio_thread_running = -2;
        sysSemPost(audioplayer_semaid, 1);
        
        while (((volatile int) audio_thread_running) != 0) {
            usleep(5000); sysSemPost(audioplayer_semaid, 1);
        }
    
        sysThreadJoin(h_audioplayer, NULL);
    }
}

int DecodeAudio(void *audiofile, int size, short *samples, int *size_samples, int *freq, int *is_stereo)
{
    int err;
    int n_bytes = 0;

    StopAudio();

    FILE *fd = (FILE *) mem_open(audiofile, size);

    audio_thread_running = 0;

    private_audio.fd          = fd;
    private_audio.mode        = 0;
    private_audio.eof         = 0;
    private_audio.volume      = last_volume;
    private_audio.flag        = 0;
    private_audio.seek_time   = -1;

#ifdef USE_MP3
    // MP3
    private_audio.mh          = NULL;
    private_audio.err         = MPG123_OK;
#endif
    private_audio.channels    = 0;
    private_audio.encoding    = 0;
    private_audio.rate        = 0;
    private_audio.buffer_size = 0;

    private_audio.is_ogg      = 1;

    if ((err = my_ov_open((void *) private_audio.fd, &private_audio.vf, NULL, 0)) < 0) {
#ifndef USE_MP3
        mem_close((u32) (u64) private_audio.fd);    // mem_close() can too close files from devices 
        private_audio.fd = NULL;
#else
        mp3_lseek((int) (long) private_audio.fd, 0, SEEK_SET);
#endif


        if (err == OV_ENOTVORBIS) {
#ifdef USE_MP3
            private_audio.err = mpg123_init();
            
            if (private_audio.err != MPG123_OK || (private_audio.mh = mpg123_new(NULL, &private_audio.err)) == NULL
            || mpg123_replace_reader(private_audio.mh, mp3_read, mp3_lseek) != MPG123_OK
            || mpg123_open_fd(private_audio.mh, (int) (long) private_audio.fd) != MPG123_OK
            //|| mpg123_open(private_audio.mh, name) != MPG123_OK 
            || mpg123_getformat(private_audio.mh, (void *) &private_audio.rate, &private_audio.channels, &private_audio.encoding) != MPG123_OK) {
                
                mpg123_close(private_audio.mh);
                mpg123_delete(private_audio.mh);
                mpg123_exit();
                mem_close((u32) (u64) private_audio.fd);    // mem_close() can too close files from devices 
                private_audio.fd = NULL;
            } else {
                err = 0;

                /* Ensure that this output format will not change (it could, when we allow it). */
                mpg123_format_none(private_audio.mh);
                mpg123_format(private_audio.mh, private_audio.rate, private_audio.channels, private_audio.encoding);

               /* Buffer could be almost any size here, mpg123_outblock() is just some recommendation.
                  Important, especially for sndfile writing, is that the size is a multiple of sample size. */
          
                private_audio.buffer_size = mpg123_outblock(private_audio.mh);

                private_audio.total_time = (int) (((long long) mpg123_length(private_audio.mh)) * 1000LL / (long long) private_audio.rate);

                private_audio.is_ogg = 0;
            }
#endif
        }
        if (err < 0) {
        
            audio_thread_running = -1;
            return -1;
        
        }
    }


    if (private_audio.is_ogg) {

        private_audio.total_time = ov_time_total(&private_audio.vf, -1);
        private_audio.vi = ov_info(&private_audio.vf, -1);
        private_audio.rate = private_audio.vi->rate;
        private_audio.channels = private_audio.vi->channels;
        
        }

    private_audio.pcm_indx = 0;
    private_audio.pcmout_pos = 0;
    private_audio.eof = 0;
    private_audio.flag = 0;
    private_audio.current_section = 0;

    while (!private_audio.eof && *size_samples > 0) {
        
        long ret;
        
        if (private_audio.is_ogg) {

            ret = ov_read(&private_audio.vf, (void *) pcmout, MAX_PCMOUT, 1, 2, 1, &private_audio.current_section);

            if (ret == 0) {
            /* EOF */
                if (private_audio.mode & 1) ov_time_seek(&private_audio.vf, 0); // repeat
            else
                private_audio.eof = 1;  // stops

        } else if (ret < 0) {
            /* error in the stream.  Not a problem, just reporting it in
            case we (the app) cares.  In this case, we don't. */
            if (ret != OV_HOLE) {
                if (private_audio.mode & 1) ov_time_seek(&private_audio.vf, 0); // repeat
                    else private_audio.eof = 1;  // stops
            }
        } else {
            /* we don't bother dealing with sample rate changes, etc, but
            you'll have to */

            if (ret > *size_samples)
                ret = *size_samples;
            
            memcpy(samples, pcmout, ret);

            samples += ret >> 1;    //get 16 bits samples
            n_bytes += ret;
            size_samples[0] -= ret;
        }
    } else {      // MP3
    
#ifdef USE_MP3
        
        size_t done = 0;

        ret = mpg123_read(private_audio.mh, (void *) pcmout, private_audio.buffer_size, &done);

        if (ret == MPG123_DONE) {
                  
            private_audio.eof = 1;  // stops
        
        } else if (ret == MPG123_OK) {
            if (done >= 0) {
                if (done > *size_samples) done = *size_samples;
                
                    memcpy(samples, pcmout, done);

                    samples += done >> 1;   //get 16 bits samples
                    n_bytes += done;
                    size_samples[0] -= done;
                }
            }
#endif
        }
    }

    *size_samples = n_bytes;    // samples to bytes
    *freq = private_audio.rate;
    *is_stereo = private_audio.channels > 1;

    if (private_audio.is_ogg)
        ov_clear(&private_audio.vf);

    private_audio.pcm_indx = 0;
    audio_thread_running = 0;

#ifdef USE_MP3
    // mp3

    if (!private_audio.is_ogg && private_audio.mh) {

        mpg123_close(private_audio.mh);
        mpg123_delete(private_audio.mh);
        mpg123_exit();
        mem_close((u32) (u64) private_audio.fd);    // mem_close() can too close files from devices 
    }

    private_audio.mh          = NULL;
    private_audio.err         = MPG123_DONE;
#endif

    private_audio.fd          = NULL;
    private_audio.channels    = 0;
    private_audio.encoding    = 0;
    private_audio.rate        = 0;
    private_audio.buffer_size = 0;
    private_audio.eof         = 0;

    return 0;

}

int PlayAudiofd(FILE * fd, int time_pos, int mode)
{
    int err;

    StopAudio();

    audio_thread_running = 0;

    private_audio.fd        = fd;
    private_audio.mode      = mode;
    private_audio.eof       = 0;
    private_audio.volume    = last_volume;
    private_audio.flag      = 0;
    private_audio.seek_time = -1;

    // MP3
#ifdef USE_MP3
    private_audio.mh          = NULL;
    private_audio.err         = MPG123_OK;
#endif
    private_audio.channels    = 0;
    private_audio.encoding    = 0;
    private_audio.rate        = 0;
    private_audio.buffer_size = 0;

    if (time_pos > 0)
        private_audio.seek_time = time_pos;

    if (fd == NULL) {
        private_audio.fd = NULL;
        return -1;
    }

    private_audio.is_ogg = 1;

    if ((err = my_ov_open((void *) private_audio.fd, &private_audio.vf, NULL, 0)) < 0) {

#ifndef USE_MP3
        mem_close((u32) (u64) private_audio.fd);    // mem_close() can too close files from devices 
        private_audio.fd = NULL;
#else
        mp3_lseek((int) (long) private_audio.fd, 0, SEEK_SET);
#endif
        if (err == OV_ENOTVORBIS) {
#ifdef USE_MP3
            private_audio.err = mpg123_init();
            if (private_audio.err != MPG123_OK || (private_audio.mh = mpg123_new(NULL, &private_audio.err)) == NULL
                || mpg123_replace_reader(private_audio.mh, mp3_read, mp3_lseek) != MPG123_OK
                || mpg123_open_fd(private_audio.mh, (int) (long) private_audio.fd) != MPG123_OK
                || mpg123_getformat(private_audio.mh, (void *) &private_audio.rate, &private_audio.channels, &private_audio.encoding) != MPG123_OK) {
                    
                    mpg123_close(private_audio.mh);
                    mpg123_delete(private_audio.mh);
                    mpg123_exit();
                    mem_close((u32) (u64) private_audio.fd);    // mem_close() can too close files from devices 
                    private_audio.fd = NULL;

            } else {
                err = 0;

                /* Ensure that this output format will not change (it could, when we allow it). */
                mpg123_format_none(private_audio.mh);
                mpg123_format(private_audio.mh, private_audio.rate, private_audio.channels, private_audio.encoding);

                /* Buffer could be almost any size here, mpg123_outblock() is just some recommendation.
                   Important, especially for sndfile writing, is that the size is a multiple of sample size. */
                
                private_audio.buffer_size = mpg123_outblock(private_audio.mh);

                private_audio.total_time = (int) (((long long) mpg123_length(private_audio.mh)) * 1000LL / (long long) private_audio.rate);

                private_audio.is_ogg = 0;
            }
#endif
        }
        
        if (err < 0) {
            audio_thread_running = -1;
            return -1;
        }
    }

    if (private_audio.is_ogg) private_audio.total_time = ov_time_total(&private_audio.vf, -1);

    memset(&audioplayer_sema_attr, 0, sizeof(sys_sem_attr_t));

    audioplayer_sema_attr.attr_protocol = 0x2;
    audioplayer_sema_attr.attr_pshared  = 0x2 << 8;

    sysSemCreate(&audioplayer_semaid, &audioplayer_sema_attr, 0, 1);

    if (sysThreadCreate(&h_audioplayer, (void *) audio_player_thread, (void *) &private_audio, PLAYER_PRIORITY, STACKSIZE,
        THREAD_JOINABLE, "Audioplayer") < 0) {

        audio_thread_running = -1;

        if (!private_audio.is_ogg) {
#ifdef USE_MP3
            mpg123_close(private_audio.mh);
            mpg123_delete(private_audio.mh);
            mpg123_exit();
            mem_close((u32) (u64) private_audio.fd);    // mem_close() can too close files from devices 
#endif
        } else
            ov_clear(&private_audio.vf);

        private_audio.fd = NULL;
        audio_thread_running = -1;
        return -1;
    }
    
    sysSemPost(audioplayer_semaid, 1);
    
    while (((volatile int) audio_thread_running) == 0) {

        usleep(1000);

        }
    return 0;
}

int PlayAudio(char *name, int time_pos, int mode)
{
    FILE *fd;

    StopAudio();

    audio_thread_running = 0;

    fd = fopen(name, "r");

    return PlayAudiofd(fd, time_pos, mode);

}

void PauseAudio(int pause)
{

    if (pause) {

        private_audio.flag |= 128;

    } else {
        if (private_audio.flag & 128) {

            private_audio.flag |= 66;
            private_audio.flag &= ~128;

            if (audio_thread_running > 0) {

            sysSemPost(audioplayer_semaid, 1);
           
            }
        }
    }
}

int StatusAudio()
{

    if (private_audio.eof)
        return AUDIO_STATUS_EOF;    // EOF

    if (audio_thread_running <= 0)
        return AUDIO_STATUS_ERR;    // Error

    if (private_audio.flag & 128)
        return AUDIO_STATUS_PAUSED; // paused

    return AUDIO_STATUS_RUNNING;    // running
}

void SetVolumeAudio(int volume)
{

    private_audio.volume = last_volume = volume;

    SND_ChangeVolumeVoice(VOICE, volume, volume);
}

int GetTimeAudio()
{
    int ret = 0;

    if (private_audio.seek_time >= 0)
        return 0;

    if (audio_thread_running <= 0)
        return 0;

    if (private_audio.is_ogg) {

        if (private_audio.fd == NULL)
            return 0;

        DI_AudioThread(1);
        ret = ((int) ov_time_tell(&private_audio.vf))*1000;
        DI_AudioThread(0);

    } else {
#ifdef USE_MP3
        DI_AudioThread(1);
        ret = (int) mpg123_tell(private_audio.mh);

        if (ret >= 0)
            ret = (int) (((long long) ret) * 1000LL / (long long) private_audio.rate);
        DI_AudioThread(0);
#endif
    }

    if (ret < 0)
        ret = 0;

    return ret;
}

void SetTimeAudio(int time_pos)
{
    if (private_audio.seek_time < 0 && time_pos >= 0)
        private_audio.seek_time = time_pos;

}

int GetTotalTimeAudio()
{
    if (audio_thread_running <= 0)
        return 0;
    if ((private_audio.is_ogg && private_audio.fd == NULL)
#ifdef USE_MP3
    || (!private_audio.is_ogg && private_audio.mh == NULL)
#endif
    ) return 0;

    return private_audio.total_time;

}


