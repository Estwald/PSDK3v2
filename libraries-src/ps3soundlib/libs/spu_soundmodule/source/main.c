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

#include <spu_intrinsics.h>
#include <spu_mfcio.h>
#include <stdint.h>

#include <string.h>

#define SPU_CMD_EXIT				0x666
#define SPU_CMD_SETVOICE			0x667
#define SPU_CMD_GETVOICES_STATUS	0x668
#define SPU_CMD_UPDATEVOICES		0x669
#define SPU_CMD_MUTE				0x670

volatile int spu_mute = 1;

#define AUDIO_BLOCK_SAMPLES   256

#define u64 uint64_t
#define u32 uint32_t
#define u16 uint16_t
#define u8	uint8_t

typedef struct {
    u32 readIndex;		//pointer to u32
    u32 status;
    u64 channelCount;
    u64 numBlocks;
    u32 portSize;
    u32 audioDataStart;		//pointer to float
} AudioPortConfig;

AudioPortConfig audio_config;

#define MAX_SND_VOICES 16

#define VOICE_UPDATE_FLAG2 32768
#define VOICE_ON           128
#define VOICE_UPDATE_FLAG   64

#define VOICE_PAUSED        32

#define VOICE_DOUBLEBUFFER   8
#define VOICE_INFINITE       4

#define VOICE_MONO_8BIT      0
#define VOICE_STEREO_8BIT    1
#define VOICE_MONO_16BIT     2
#define VOICE_STEREO_16BIT   3

typedef struct {
    u32 num_voice;
    u32 flags;

    u32 voice_addr;
    u32 voice_addr_end;

    u32 voice_addr2;
    u32 voice_addr_end2;

    int delay;			// sample delay
    int freq;
    int volume_l;
    int volume_r;

    u32 pad[6];

} t_voice;

typedef struct {
    u32 voice_addr;
    u32 voice_addr_end;

    u16 flags;
    u8 volume_l;
    u8 volume_r;

    int freq;

} t_voice_update;

typedef struct {
    u16 flags[MAX_SND_VOICES];
    u16 pad[64 - MAX_SND_VOICES];

} t_spu_voice_status;

static t_spu_voice_status spu_voice_status __attribute__ ((aligned(128)));

typedef struct {
    t_voice voice;

    u32 sample_addr;		// current sample addr

    int acum;

    int acum2;

    float old_l, old_r;

} t_spu_voice;

t_spu_voice spu_voice[MAX_SND_VOICES];

short cache_samples[MAX_SND_VOICES][64] __attribute__ ((aligned(128)));	// cached samples from voices
float samples[2 * AUDIO_BLOCK_SAMPLES] __attribute__ ((aligned(128)));


void unaligned_read(u32 ppu_addr, void *spu_addr, int bytes)
{
    u8 temp[2048] __attribute__ ((aligned(128)));
    u32 un = ppu_addr & 127;

    mfc_get(temp, (unsigned int) (ppu_addr - un), (bytes + un + 127) & ~127, 1, 0, 0);
    mfc_write_tag_mask(1 << 1);
    mfc_read_tag_status_all();

    memcpy(spu_addr, temp + un, bytes);
}

#define REFRESH_SMP_CACHE(x) \
    if(temp_voice->sample_addr!= ((x) & ~127))\
        { \
        temp_voice->sample_addr= (x) & ~127; \
        mfc_get(samp,(u32) temp_voice->sample_addr, 128 , 2, 0, 0); \
        mfc_write_tag_mask(1<<2); \
        mfc_read_tag_status_all(); \
        }

#define MIX_SMP_MONO(type, incre, divider) { \
    for(m=0;m<AUDIO_BLOCK_SAMPLES;m++) { \
            /* delay time section */\
            if(temp_voice->voice.delay>0) {temp_voice->voice.delay--; s += 2; continue;}\
            \
            if(temp_voice->voice.voice_addr>=temp_voice->voice.voice_addr_end) \
                { \
                if(temp_voice->voice.flags & VOICE_DOUBLEBUFFER) \
                    { \
                    temp_voice->voice.voice_addr     = temp_voice->voice.voice_addr2; \
                    temp_voice->voice.voice_addr_end = temp_voice->voice.voice_addr_end2; \
                    temp_voice->voice.flags |= VOICE_UPDATE_FLAG; \
                    temp_voice->voice.voice_addr2 = temp_voice->voice.voice_addr_end2 = 0; \
					temp_voice->sample_addr = 0; \
                    temp_voice->acum = 0; temp_voice->acum2 = 0; \
                    if(temp_voice->voice.voice_addr == 0) break; \
                    } \
                else \
                if(temp_voice->voice.flags & VOICE_INFINITE) \
                    { \
                    temp_voice->voice.voice_addr     = temp_voice->voice.voice_addr2; \
                    temp_voice->voice.voice_addr_end = temp_voice->voice.voice_addr_end2; \
					temp_voice->sample_addr = 0; \
                    temp_voice->acum = 0; temp_voice->acum2 = 0; \
                    if(temp_voice->voice.voice_addr == 0) break; \
                    } \
                else \
                    { \
                    temp_voice->voice.flags = 0; \
                    break; \
                    } \
                } \
            REFRESH_SMP_CACHE(temp_voice->voice.voice_addr)\
            cl= cr = ((float ) * ((type *) &samp[temp_voice->voice.voice_addr & 127])) / divider; \
             /* interpolate sample with old sample if freq < 48000 */ \
            temp_voice->acum2 += temp_voice->voice.freq; \
            if(temp_voice->voice.freq < 48000) \
                { \
                if(temp_voice->acum2 >= 48000) \
                    { \
                    temp_voice->acum2 = 0; \
                    temp_voice->old_l = cl; \
                    } \
                else \
                    { \
                    cl = ((cl - temp_voice->old_l) * ((float) temp_voice->acum2) / 48000.0f) + temp_voice->old_l; \
                    cr = cl; \
                    } \
                } \
            /* mix sample */ \
            s[0] += cl * vl; \
            s[1] += cr * vr; \
            \
            if(s[0] > 1.0f) samples[0] = 1.0f; \
            else if(s[0] < -1.0f) samples[0] = -1.0f; \
            \
            if(s[1] > 1.0f) samples[1] = 1.0f; \
            else if(s[1] < -1.0f) samples[1] = -1.0f; \
            \
            s += 2;\
            /* increment pointer*/ \
            temp_voice->acum += temp_voice->voice.freq;\
            \
            if(temp_voice->acum >= 48000) \
                 do { \
                    temp_voice->acum -= 48000; \
                    temp_voice->voice.voice_addr += incre; \
                    } while(temp_voice->acum >= 48000);  /* to be sure it is < freq*/ \
            }\
        }\

#define MIX_SMP_STEREO(type, incre, incre2, divider) { \
    for(m=0;m<AUDIO_BLOCK_SAMPLES;m++) { \
            /* delay time section */\
            if(temp_voice->voice.delay > 0) {temp_voice->voice.delay--; s += 2; continue;}\
            /* end procedure*/ \
            if(temp_voice->voice.voice_addr >= temp_voice->voice.voice_addr_end) \
                { \
                if(temp_voice->voice.flags & VOICE_DOUBLEBUFFER) \
                    { \
                    temp_voice->voice.voice_addr     = temp_voice->voice.voice_addr2; \
                    temp_voice->voice.voice_addr_end = temp_voice->voice.voice_addr_end2; \
                    temp_voice->voice.flags |= VOICE_UPDATE_FLAG; \
                    temp_voice->voice.voice_addr2 = temp_voice->voice.voice_addr_end2 = 0; \
					temp_voice->sample_addr = 0; \
                    temp_voice->acum = 0;temp_voice->acum2 = 0; \
                    if(temp_voice->voice.voice_addr == 0) break; \
                    } \
                else \
                if(temp_voice->voice.flags & VOICE_INFINITE) \
                    { \
                    temp_voice->voice.voice_addr     = temp_voice->voice.voice_addr2; \
                    temp_voice->voice.voice_addr_end = temp_voice->voice.voice_addr_end2; \
					temp_voice->sample_addr = 0; \
                    temp_voice->acum = 0; temp_voice->acum2 = 0; \
                    if(temp_voice->voice.voice_addr == 0) break; \
                    } \
                else \
                    { \
                    temp_voice->voice.flags = 0; \
                    break; \
                    } \
                } \
            REFRESH_SMP_CACHE(temp_voice->voice.voice_addr)\
            cl=((float ) * ((type *) &samp[temp_voice->voice.voice_addr & 127])) / divider; \
            REFRESH_SMP_CACHE(temp_voice->voice.voice_addr+incre)\
            cr=((float ) * ((type *) &samp[(temp_voice->voice.voice_addr + incre) & 127])) / divider; \
            /* interpolate sample with old sample if freq < 48000 */ \
            temp_voice->acum2 += temp_voice->voice.freq; \
            if(temp_voice->voice.freq < 48000) \
                { \
                if(temp_voice->acum2 >= 48000) \
                    { \
                    temp_voice->acum2 = 0; \
                    temp_voice->old_l = cl; \
                    temp_voice->old_r = cr; \
                    } \
                else \
                    { \
                    cl = ((cl - temp_voice->old_l) * ((float) temp_voice->acum2) / 48000.0f) + temp_voice->old_l; \
                    cr = ((cr - temp_voice->old_r) * ((float) temp_voice->acum2) / 48000.0f) + temp_voice->old_r; \
                    } \
                } \
            /* mix sample */ \
            s[0] += cl*vl; \
            s[1] += cr*vr; \
            \
            if(s[0] > 1.0f)       samples[0] = 1.0f; \
            else if(s[0] < -1.0f) samples[0] = -1.0f; \
            \
            if(s[1] > 1.0f)       samples[1] = 1.0f; \
            else if(s[1] < -1.0f) samples[1] = -1.0f; \
            \
            s += 2;\
            /* increment pointer*/ \
            temp_voice->acum += temp_voice->voice.freq;\
            \
            if(temp_voice->acum >= 48000) \
                 do { \
                    temp_voice->acum -= 48000; \
                    temp_voice->voice.voice_addr += incre2; \
                    } while(temp_voice->acum >= 48000);  /* to be sure it is < freq*/ \
            }\
        }\

int receive_command(void)
{

    uint32_t temp[256] __attribute__ ((aligned(128)));
    t_voice *cur_voice;
    int ret = 0, n;
    uint32_t addr;

    if (spu_stat_in_mbox() > 0) {
	u32 cmd;
	cmd = spu_read_in_mbox();

	switch (cmd) {

	case SPU_CMD_EXIT:

	    spu_write_out_mbox(0x12340E0F);
	    ret = 0x666;
	    break;

	case SPU_CMD_SETVOICE:

	    while (spu_stat_in_mbox() <= 0);

	    addr = spu_read_in_mbox();

	    unaligned_read((u32) addr, temp, sizeof(t_voice));

	    cur_voice = (t_voice *) temp;

	    if (cur_voice->num_voice >= 0 && cur_voice->num_voice < MAX_SND_VOICES) {
            
            spu_voice[cur_voice->num_voice].voice = *cur_voice;
            spu_voice[cur_voice->num_voice].sample_addr = 0;
            spu_voice[cur_voice->num_voice].acum = 0;
		    spu_write_out_mbox(0x12340000);

	    } else
		    spu_write_out_mbox(0x12340BAD);

	    break;

	case SPU_CMD_GETVOICES_STATUS:

	    while (spu_stat_in_mbox() <= 0);

	    addr = spu_read_in_mbox();

	    for (n = 0; n < MAX_SND_VOICES; n++) {
		   
            spu_voice_status.flags[n] = (u16) spu_voice[n].voice.flags;
            if(spu_voice[n].voice.voice_addr==0) spu_voice_status.flags[n] |= VOICE_UPDATE_FLAG2;
        }

	    mfc_put(&spu_voice_status, (u32) addr, 128, 2, 0, 0);
	    mfc_write_tag_mask(1 << 2);
	    mfc_read_tag_status_all();

	    spu_write_out_mbox(0x12340000);

	    break;

	case SPU_CMD_UPDATEVOICES:
	    {
		t_voice_update *spu_voice_update;

		while (spu_stat_in_mbox() <= 0);

		addr = spu_read_in_mbox();

		mfc_get(temp, (u32) addr, 128, 1, 0, 0);
		mfc_write_tag_mask(1 << 1);
		mfc_read_tag_status_all();

		spu_voice_update = (t_voice_update *) temp;

		for (n = 0; n < MAX_SND_VOICES; n++) {
		    switch (spu_voice_update[n].flags & 3) {

		    case 1:	// update command

			if ((spu_voice[n].voice.flags & VOICE_UPDATE_FLAG)  && spu_voice_update[n].voice_addr) {

                if(spu_voice[n].voice.voice_addr==0)
                {
                    spu_voice[n].voice.voice_addr = spu_voice_update[n].voice_addr;
			        spu_voice[n].voice.voice_addr_end = spu_voice_update[n].voice_addr_end;
                }
                else
                {
                    spu_voice[n].voice.voice_addr2 = spu_voice_update[n].voice_addr;
                    spu_voice[n].voice.voice_addr_end2 = spu_voice_update[n].voice_addr_end;
                    spu_voice[n].voice.flags &= ~(VOICE_UPDATE_FLAG);
                }
			    
			}


			if (spu_voice_update[n].flags & VOICE_PAUSED)
			    spu_voice[n].voice.flags |= VOICE_PAUSED;
			else
			    spu_voice[n].voice.flags &= ~(VOICE_PAUSED);

			spu_voice[n].voice.volume_l = spu_voice_update[n].volume_l;
			spu_voice[n].voice.volume_r = spu_voice_update[n].volume_r;
			spu_voice[n].voice.freq = spu_voice_update[n].freq;
			
            break;

		    case 2:	// stop command
			    spu_voice[n].voice.flags = 0;
			break;

		    default:
			break;
		    }
		}

		spu_write_out_mbox(0x12340000);
		break;
	    }

	case SPU_CMD_MUTE:

	    while (spu_stat_in_mbox() <= 0);

	    spu_mute = spu_read_in_mbox();

	    spu_write_out_mbox(0x12340000);

	    break;

	}
    }

    return ret;
}


int main()
{
    uint32_t addr;

    u32 audio_block_index = 0xfea;

    int samples_ready = 0;

    while (spu_stat_in_mbox() <= 0);

    addr = spu_read_in_mbox();

    unaligned_read((u32) addr, &audio_config, sizeof(AudioPortConfig));

    while (1) {

	if (receive_command() == 0x666)
	    break;


	// get sound index

	u64 index;

	unaligned_read((u32) (audio_config.readIndex), &index, 8);

	index = (index + 1) % audio_config.numBlocks;

	if (audio_block_index != index) {

	    audio_block_index = index;

	    if (!samples_ready)
		memset(&samples[0], 0, AUDIO_BLOCK_SAMPLES * 8);	// fill with zero

	    float *buf =
		((float *) audio_config.audioDataStart) + 2 * AUDIO_BLOCK_SAMPLES * audio_block_index;

	    //audio_block_index = (audio_block_index + 1) % audio_config.numBlocks;

	    mfc_put(&samples[0], (unsigned int) buf, AUDIO_BLOCK_SAMPLES * 8, 2, 0, 0);
	    mfc_write_tag_mask(1 << 2);
	    mfc_read_tag_status_all();

	    samples_ready = 0;

	}

	if (spu_mute)
	    continue;

	// mixer
	if (!samples_ready) {
	    int n, m;
	    float cl, cr;
	    float vl, vr;

	    float *s;

	    t_spu_voice *temp_voice;

	    samples_ready = 1;

	    memset(&samples[0], 0, AUDIO_BLOCK_SAMPLES * 8);

	    for (n = 0; n < MAX_SND_VOICES; n++) {
            if (receive_command() == 0x666)
                return 0;
            
            temp_voice = &spu_voice[n];

            if ((temp_voice->voice.flags & (VOICE_ON | VOICE_PAUSED)) == VOICE_ON) {

                char *samp = (char *) &cache_samples[temp_voice->voice.num_voice][0];

                // fix update flag if double buffer and buffer 2 is empty
                if ((temp_voice->voice.flags & VOICE_DOUBLEBUFFER)) {
                    if (temp_voice->voice.voice_addr == 0) {
                        if(temp_voice->voice.voice_addr2){
                            temp_voice->voice.voice_addr = temp_voice->voice.voice_addr2;
                            temp_voice->voice.voice_addr_end = temp_voice->voice.voice_addr_end2;
                            temp_voice->voice.voice_addr2 = temp_voice->voice.voice_addr_end2 = 0;
                            temp_voice->voice.flags |= VOICE_UPDATE_FLAG;
                        }
                        else {
                            temp_voice->voice.flags |= VOICE_UPDATE_FLAG2 | VOICE_UPDATE_FLAG;
                            continue;
                        }
                    }

                } else {

                    if (temp_voice->voice.voice_addr == 0)
                        continue;
                }


                vl = (float) temp_voice->voice.volume_l / 255.0f;
                vr = (float) temp_voice->voice.volume_r / 255.0f;

                s = samples;

                switch (temp_voice->voice.flags & 3) {

                case 0:	// MONO 8 bits
                    MIX_SMP_MONO(char, 1, 128.0f);
                break;

                case 1:	// STEREO 8 bits
                    MIX_SMP_STEREO(char, 1, 2, 128.0f);
                break;

                case 2:	// MONO 16 bits
                    MIX_SMP_MONO(short, 2, 32768.0f);
                break;

                case 3:	// STEREO 16 bits
                    MIX_SMP_STEREO(short, 2, 4, 32768.0f);
                break;
                }

            }
	    }
	}


    }

    return 0;
}

