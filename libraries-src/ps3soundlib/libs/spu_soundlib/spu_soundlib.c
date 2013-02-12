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


#include "spu_soundlib.h"

#define PRIORITY 501 // High Priority

#define SPU_CMD_EXIT				0x666
#define SPU_CMD_SETVOICE			0x667
#define SPU_CMD_GETVOICES_STATUS	0x668
#define SPU_CMD_UPDATEVOICES		0x669
#define SPU_CMD_MUTE				0x670

#define VOICE_UPDATE_FLAG2 32768 // update all buffers
#define VOICE_LOCKED       512
#define VOICE_REMOTE_SEND  256
#define VOICE_ON           128
#define VOICE_UPDATE_FLAG   64  // update only second buffer
#define VOICE_PAUSED        32
#define VOICE_DOUBLEBUFFER   8
#define VOICE_INFINITE       4

static audioPortParam params;
static audioPortConfig config;
static u32 portNum;
static int snd_on = 0;
static int send_mute = 0, mute_on = 1;

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

    void (*callback) (int voice);

    u32 pad[5];

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

static sys_ppu_thread_t thread_sound_id;

static t_spu_voice_status spu_voice_status __attribute__ ((aligned(128)));
static t_voice Voice[16];
static t_voice_update spu_voice_update[MAX_SND_VOICES];

static volatile int thread_sound_running = 1;

static u32 SPU;

static u32 send_spu_cmd(u32 cmd, u32 addr)
{
    sysSpuRawWriteProblemStorage(SPU, SPU_In_MBox, cmd);

    sysSpuRawWriteProblemStorage(SPU, SPU_In_MBox, addr);

    while (!(sysSpuRawReadProblemStorage(SPU, SPU_MBox_Status) & 1))
	    asm volatile ("eieio"::);

    return sysSpuRawReadProblemStorage(SPU, SPU_Out_MBox);

}


static void thread_sound_start(void * arg)
{
    int n, update_snd = 0;
   

    while (thread_sound_running) {
    
	if (snd_on) {

	    if (send_mute) {
            send_mute = 0;
            send_spu_cmd(SPU_CMD_MUTE, (u32) mute_on);
	    }

	    if (mute_on) {
		    usleep(20000);	// waits 20 ms
		    continue;	// ignore all on mute mode
	    }


	    // get voice status
	    
        if(send_spu_cmd(SPU_CMD_GETVOICES_STATUS, (u32) (u64) & spu_voice_status)!=0x12340000) {usleep(500);continue;}	// spu_voice_status must be aligned to 128

	    // send new voices
	    for (n = 0; n < MAX_SND_VOICES; n++) {

		if (Voice[n].flags & VOICE_REMOTE_SEND) {

		    Voice[n].flags &= ~VOICE_REMOTE_SEND;

		    spu_voice_status.flags[n] = Voice[n].flags & ~VOICE_UPDATE_FLAG;	// change spu flags with the new voice flags

		    send_spu_cmd(SPU_CMD_SETVOICE, (u32) (u64) & Voice[n]);	// Voice can be unaligned

		}
        else if((spu_voice_status.flags[n] & (VOICE_UPDATE_FLAG2 | VOICE_UPDATE_FLAG))==(VOICE_UPDATE_FLAG2 | VOICE_UPDATE_FLAG)) {
        
            Voice[n].voice_addr = Voice[n].voice_addr_end= Voice[n].voice_addr2 = Voice[n].voice_addr_end2 = 0;
        }
		
        // test stop from SPU
		if (!(spu_voice_status.flags[n] & VOICE_ON))
		    Voice[n].flags = 0;	// update flag with stop values

	    }

	    // update callback voices
	    for (n = 0; n < MAX_SND_VOICES; n++) {
            if(Voice[n].flags & VOICE_LOCKED) continue;

            // test if need to uptade from callbak
            if ((spu_voice_status.flags[n] & VOICE_UPDATE_FLAG) && Voice[n].callback && (Voice[n].flags & VOICE_ON)) {
                // if 'used'  clear voice_addr2
                if (Voice[n].voice_addr_end2 == 0) {
                
                    Voice[n].voice_addr2 = 0;
                }

                Voice[n].callback(n);
            }
		
            // don´t update when voice is locked

            if(Voice[n].flags & VOICE_LOCKED) 
                spu_voice_update[n].flags = 0;
            else
            // test if voice is recent stopped
            if ((Voice[n].flags & (VOICE_UPDATE_FLAG | VOICE_ON)) == VOICE_UPDATE_FLAG) {
               
                update_snd = 1;
                spu_voice_update[n].flags = 2;	// stop voice in SPU
                Voice[n].flags = 0;	// update flag with stop values

            } else if (Voice[n].flags & VOICE_UPDATE_FLAG) {
		    
                Voice[n].flags &= ~VOICE_UPDATE_FLAG;
                update_snd = 1;
                spu_voice_update[n].flags = 1 | (Voice[n].flags & VOICE_PAUSED);	// update
                
                if ((spu_voice_status.flags[n] & VOICE_UPDATE_FLAG) && Voice[n].voice_addr_end2 != 0) {

                    spu_voice_update[n].voice_addr     = Voice[n].voice_addr2;
                    spu_voice_update[n].voice_addr_end = Voice[n].voice_addr_end2;
                    Voice[n].voice_addr_end2 = 0;	// mark as 'used'

                } else {
                    
                    spu_voice_update[n].voice_addr     = 0;
                    spu_voice_update[n].voice_addr_end = 0;
                }

                spu_voice_update[n].volume_l = Voice[n].volume_l;
                spu_voice_update[n].volume_r = Voice[n].volume_r;
                spu_voice_update[n].freq     = Voice[n].freq;

            } else
                spu_voice_update[n].flags = 0;	// don´t update
	    }

        // sending update datas to SPU

	    if (update_snd) {
		    
            update_snd = 0;

		    send_spu_cmd(SPU_CMD_UPDATEVOICES, (u32) (u64) & spu_voice_update);	// spu_voice_update must be aligned to 128

	    }
    
    usleep(2000);		// waits 2 ms

    } else usleep(1000); // waits 1 ms
   

    }

    thread_sound_running = -1;
    sysThreadExit(0);
}


/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

void SND_End()
{
    u64 retval;

    if (!snd_on)
	    return;

    thread_sound_running = 0;
    sysThreadJoin(thread_sound_id, &retval);

    snd_on = 0;
    
    while (thread_sound_running != -1)
	    usleep(40000);

    thread_sound_running = 0;

    // exit from SPU

    sysSpuRawWriteProblemStorage(SPU, SPU_In_MBox, SPU_CMD_EXIT);

    while (!(sysSpuRawReadProblemStorage(SPU, SPU_MBox_Status) & 1))
	    asm volatile ("eieio"::);

    sysSpuRawReadProblemStorage(SPU, SPU_Out_MBox);

    // stop audio port
    audioPortStop(portNum);
    // close audio port
    audioPortClose(portNum);

    audioQuit();

}

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

int SND_Init(u32 spu)
{

    if (snd_on)
	    return 1;

    SPU = spu;

    send_mute = 0;
    mute_on = 1;

    // create the control thread
    sysThreadCreate(&thread_sound_id, thread_sound_start, 0ULL, PRIORITY, 0x1000, THREAD_JOINABLE, "Control Thread SPU Sound");

    /* info from lousyphreak sample */

    //initialize the audio system
    if (audioInit() < 0)
	    return -1;
    //set some parameters we want
    //either 2 or 8 channel
    params.numChannels = AUDIO_PORT_2CH;
    //8 16 or 32 block buffer
    params.numBlocks = AUDIO_BLOCK_8;
    //extended attributes
    params.attrib = 0x1000;
    //sound level
    params.level = 1.0f;

    //open the port (still stopped)
    if (audioPortOpen(&params, &portNum) < 0) {
	    
        audioQuit();
	    return -2;

    }

    //get the params for the buffers, etc

    if (audioGetPortConfig(portNum, &config) < 0 || audioPortStart(portNum) < 0) {
	    audioPortClose(portNum);
	    audioQuit();
	    return -3;
    }

    // run SPU
    sysSpuRawWriteProblemStorage(spu, SPU_RunCtrl, 1);

    // set config to SPU (can be unaligned)
    sysSpuRawWriteProblemStorage(spu, SPU_In_MBox, (u32) (u64) & config);

    snd_on = 1;

    return SND_OK;
}

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

void SND_Pause(int paused)
{
    paused = paused != 0;

    if (mute_on != paused) {
	    
        send_mute = 1;
	    mute_on = paused;
    }
}

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

int SND_SetVoice(int voice, int format, int freq, int delay, void *snd,
		 int size_snd, int volume_l, int volume_r,
		 void (*callback) (int voice))
{
    if (voice < 0 || voice >= MAX_SND_VOICES)
	    return SND_INVALID;

    if (Voice[voice].flags & VOICE_ON)
	    return SND_BUSY;

    if (size_snd <= 0 || snd == NULL)
	    return SND_INVALID;	// invalid voice

    if (freq < 1)
	    freq = MIN_FREQ;

    if (freq > MAX_FREQ)
	    freq = MAX_FREQ;

    if(volume_l < MIN_VOLUME) volume_l = MIN_VOLUME;
    if(volume_r < MIN_VOLUME) volume_r = MIN_VOLUME;
    if(volume_l > MAX_VOLUME) volume_l = MAX_VOLUME;
    if(volume_r > MAX_VOLUME) volume_r = MAX_VOLUME;

    delay = 48 * delay;

    Voice[voice].flags           = VOICE_LOCKED;	// disable voice
   
    Voice[voice].num_voice       = voice;
    Voice[voice].voice_addr      = (u32) (u64) snd;
    Voice[voice].voice_addr_end  = ((u32) (u64) snd) + size_snd;

    Voice[voice].voice_addr2     = 0;
    Voice[voice].voice_addr_end2 = 0;

    Voice[voice].delay           = delay;
    Voice[voice].freq            = freq;
    Voice[voice].volume_l        = volume_l;
    Voice[voice].volume_r        = volume_r;
    Voice[voice].callback        = callback;
    Voice[voice].flags           = VOICE_REMOTE_SEND | VOICE_ON | (format & 3) | ((callback) ? VOICE_DOUBLEBUFFER : 0);
    Voice[voice].flags          &= ~VOICE_LOCKED;

    return SND_OK;
}

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

int SND_SetInfiniteVoice(int voice, int format, int freq, int delay,
			 void *snd, int size_snd, int volume_l, int volume_r)
{
    if (voice < 0 || voice >= MAX_SND_VOICES)
	    return SND_INVALID;

    if (Voice[voice].flags & VOICE_ON)
	    return SND_BUSY;

    if (size_snd <= 0 || snd == NULL)
	    return SND_INVALID;	// invalid voice

    if (freq < 1)        freq = MIN_FREQ;
    if (freq > MAX_FREQ) freq = MAX_FREQ;

    if(volume_l < MIN_VOLUME) volume_l = MIN_VOLUME;
    if(volume_r < MIN_VOLUME) volume_r = MIN_VOLUME;
    if(volume_l > MAX_VOLUME) volume_l = MAX_VOLUME;
    if(volume_r > MAX_VOLUME) volume_r = MAX_VOLUME;

    delay = 48 * delay;

    Voice[voice].flags           = VOICE_LOCKED;	// disable voice
  
    Voice[voice].num_voice       = voice;
    Voice[voice].voice_addr      = (u32) (u64) snd;
    Voice[voice].voice_addr_end  = ((u32) (u64) snd) + size_snd;
    Voice[voice].voice_addr2     = (u32) (u64) snd;
    Voice[voice].voice_addr_end2 = ((u32) (u64) snd) + size_snd;

    Voice[voice].delay           = delay;
    Voice[voice].freq            = freq;
    Voice[voice].volume_l        = volume_l;
    Voice[voice].volume_r        = volume_r;

    Voice[voice].flags           = VOICE_REMOTE_SEND | VOICE_ON | (format & 3) | VOICE_INFINITE;
    Voice[voice].flags          &= ~VOICE_LOCKED;

    return SND_OK;
}

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

int SND_AddVoice(int voice, void *snd, int size_snd)
{
    if (voice < 0 || voice >= MAX_SND_VOICES)
	    return SND_INVALID;	// invalid voice

    if (!(Voice[voice].flags & VOICE_ON))
	    return SND_INVALID;	// invalid voice

    if (size_snd <= 0 || snd == NULL)
	    return SND_INVALID;	// invalid voice

    if (Voice[voice].voice_addr2 != 0 || (Voice[voice].flags & VOICE_PAUSED ))
	    return SND_BUSY;	// busy

    Voice[voice].flags          |= VOICE_LOCKED;
   
    Voice[voice].voice_addr2     =      (u32) (u64) snd;
    Voice[voice].voice_addr_end2 = ((u32) (u64) snd) + size_snd;

    Voice[voice].flags          |= VOICE_UPDATE_FLAG;
    Voice[voice].flags          &= ~VOICE_LOCKED;

    return SND_OK;
}

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

int SND_StopVoice(int voice)
{
    if (voice < 0 || voice >= MAX_SND_VOICES)
	    return SND_INVALID;	// invalid voice

    if (!(Voice[voice].flags & VOICE_ON))
	    return SND_INVALID;	// invalid voice

    Voice[voice].flags       = VOICE_UPDATE_FLAG | VOICE_LOCKED;

    Voice[voice].voice_addr2 = 0;
    Voice[voice].voice_addr  = 0;

    Voice[voice].flags      &= ~VOICE_LOCKED;

    return SND_OK;
}

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

int SND_PauseVoice(int voice, int pause)
{
    if (voice < 0 || voice >= MAX_SND_VOICES)
	    return SND_INVALID;	// invalid voice

    if (!(Voice[voice].flags & VOICE_ON))
	    return SND_INVALID;	// invalid voice

    Voice[voice].flags     |= VOICE_LOCKED;
   
    if (pause)
	    Voice[voice].flags |= VOICE_PAUSED;
    else
	    Voice[voice].flags &= ~VOICE_PAUSED;

        Voice[voice].flags |= VOICE_UPDATE_FLAG;
        Voice[voice].flags &= ~VOICE_LOCKED;

    return SND_OK;
}

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

int SND_StatusVoice(int voice)
{

    if (voice < 0 || voice >= MAX_SND_VOICES)
	    return SND_INVALID;	// invalid voice

    if (!(Voice[voice].flags & VOICE_ON))
	    return SND_UNUSED;

    if (Voice[voice].flags & VOICE_PAUSED)
	    return SND_WAITING;

    return SND_WORKING;
}

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

int SND_GetFirstUnusedVoice()
{

    int n;

    for (n = 1; n < MAX_SND_VOICES; n++)

	if (!(Voice[n].flags & VOICE_ON))
	    return n;

    if (!(Voice[0].flags & VOICE_ON))
	    return 0;		// voice 0 is an special case

    return SND_INVALID;		// all voices used

}

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

int SND_ChangeFreqVoice(int voice, int freq)
{
    if (voice < 0 || voice >= MAX_SND_VOICES)
	    return SND_INVALID;	// invalid voice

    if (!(Voice[voice].flags & VOICE_ON))
	    return SND_INVALID;	// invalid voice

    Voice[voice].flags |= VOICE_LOCKED;
   
    if (freq < 1)        freq = MIN_FREQ;
    if (freq > MAX_FREQ) freq = MAX_FREQ;

    Voice[voice].freq = freq;
    Voice[voice].flags |= VOICE_UPDATE_FLAG;
    Voice[voice].flags &= ~VOICE_LOCKED;

    return SND_OK;
}

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

int SND_ChangeVolumeVoice(int voice, int volume_l, int volume_r)
{
    if (voice < 0 || voice >= MAX_SND_VOICES)
	    return SND_INVALID;	// invalid voice

    if (!(Voice[voice].flags & VOICE_ON))
	    return SND_INVALID;	// invalid voice
    
    Voice[voice].flags |= VOICE_LOCKED;

    if(volume_l < MIN_VOLUME) volume_l = MIN_VOLUME;
    if(volume_r < MIN_VOLUME) volume_r = MIN_VOLUME;
    if(volume_l > MAX_VOLUME) volume_l = MAX_VOLUME;
    if(volume_r > MAX_VOLUME) volume_r = MAX_VOLUME;

    Voice[voice].volume_l = volume_l;
    Voice[voice].volume_r = volume_r;

    Voice[voice].flags |= VOICE_UPDATE_FLAG;
    Voice[voice].flags &= ~VOICE_LOCKED;


    return SND_OK;
}

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

int SND_TestVoiceBufferReady(int voice)
{
    if (voice < 0 || voice >= MAX_SND_VOICES)
	    return 0;		// invalid voice: not ready (of course XD)

    if (Voice[voice].voice_addr2)
	    return 0;		// not ready

    return 1;			// ready
}

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

int Note2Freq(int note, int freq_base, int note_base)
{
    int n;
    static int one = 1;
    static u32 tab_piano_frac[12];

    if (one) {
	    float note = 1.0f;
	    one = 0;
	    for (n = 0; n < 12; n++) {	// table note

	        tab_piano_frac[n] = (u32) (10000.0f * note);
	        note *= 1.0594386f;
	    }
    }

    // obtain octave 3 (notes 36 to 47)

    n = (note / 12) - (note_base / 12);
    if (n >= 0)
        freq_base <<= n;
    else 
        freq_base >>= -n;


    if (freq_base <= 0x1ffff)	// Math precision
        n = (s32) (((u32) freq_base) * tab_piano_frac[(note % 12)] / tab_piano_frac[(note_base % 12)]);
    else
	    n = (s32) (((u64) freq_base) * ((u64) tab_piano_frac[(note % 12)]) / ((u64) tab_piano_frac[(note_base % 12)]));

    return n;
}

