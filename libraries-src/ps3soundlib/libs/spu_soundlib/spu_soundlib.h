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


#ifndef SPU_SNDLIB_H
#define SPU_SNDLIB_H

#include <ppu-lv2.h>
#include <sys/spu.h>
#include <lv2/spu.h>

#include <lv2/process.h>
#include <sys/thread.h>
#include <sys/systime.h>
#include <sys/sem.h>
#include <sysmodule/sysmodule.h>

#include <sysutil/sysutil.h>

#include <audio/audio.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_SND_VOICES 16

#define MIN_FREQ      1		// 1 Hz
#define F44100HZ_FREQ 44100	// 44100Hz
#define MAX_FREQ      144000	// 144000Hz (more process time for freq>48000)


// SND return values

#define SND_OK               0
#define SND_INVALID         -1
#define SND_ISNOTASONGVOICE -2
#define SND_BUSY             1

// SND_StatusVoice additional return values

#define SND_UNUSED   0		// you can use this voice
#define SND_WORKING  1		// this voice is in progress
#define SND_WAITING  2		// this voice is in progress and waiting to one SND_AddVoice function (the voice handler is called continuously)

// SND_SetVoice format

#define VOICE_MONO_8BIT    0
#define VOICE_STEREO_8BIT  1
#define VOICE_MONO_16BIT   2
#define VOICE_STEREO_16BIT 3

// Voice volume Range

#define MIN_VOLUME 0
#define MID_VOLUME 127
#define MAX_VOLUME 255

// note codification

enum {
    NOTE_DO = 0,
    NOTE_DOs,
    NOTE_REb = NOTE_DOs,
    NOTE_RE,
    NOTE_REs,
    NOTE_MIb = NOTE_REs,
    NOTE_MI,
    NOTE_FA,
    NOTE_FAs,
    NOTE_SOLb = NOTE_FAs,
    NOTE_SOL,
    NOTE_SOLs,
    NOTE_LAb = NOTE_SOLs,
    NOTE_LA,
    NOTE_LAs,
    NOTE_SIb = NOTE_LAs,
    NOTE_SI
};

enum {
    NOTE_C = 0,
    NOTE_Cs,
    NOTE_Db = NOTE_Cs,
    NOTE_D,
    NOTE_Ds,
    NOTE_Eb = NOTE_Ds,
    NOTE_E,
    NOTE_F,
    NOTE_Fs,
    NOTE_Gb = NOTE_Fs,
    NOTE_G,
    NOTE_Gs,
    NOTE_Ab = NOTE_Gs,
    NOTE_A,
    NOTE_As,
    NOTE_Bb = NOTE_As,
    NOTE_B
};

#define NOTE(note,octave) (note+(octave<<3)+(octave<<2))	// final note codification. Used in Note2Freq()

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/


/* int Note2Freq(int note, int freq_base,int note_base);

Convert note to freq.

-- Params ---

note: Note codified to play. For example: NOTE(C,4) for note C and octave 4

freq_base: Frequency base of the sample. For example 8000Hz

note_base: Note codified of the sample. For example: NOTE(L,3) for note L and octave 3 (LA 3) 

return: frequency (in Hz)

*/

int Note2Freq(int note, int freq_base, int note_base);

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* General Sound Functions                                                                                                                              */
/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* void SND_Init();

Initializes the  spu_soundlib and fix the hardware sample rate to 48000.

-- Params ---


return: nothing

*/

int SND_Init(u32 spu);

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* void SND_End();

De-initializes the spu_soundlib.

return: nothing

*/

void SND_End();

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* void SND_Pause(int paused);

Used to pause (or not) the sound. When you call to the SND_Init() function, the sound is paused.


-- Params ---

paused: use 0 to run or 1 to pause

return: nothing

*/

void SND_Pause(int paused);

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* Voice Functions                                                                                                                                      */
/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* int SND_SetVoice(int voice, int format, int freq,int delay, void *snd, int size_snd, int volume_l, int volume_r, void (*callback) (int voice));

Set a PCM voice to play. This function stops one previously voice. Use the SND_StatusVoice() to test the status condition

NOTE: The voices are played in stereo and 16 bits independently of the source format.

-- Params ---

voice: use one from 0 to (MAX_SND_VOICES-1)

format: PCM format from VOICE_MONO_8BIT to VOICE_STEREO_16BIT

freq: frequency to play (in Hz) 

delay: delay time in milliseconds (ms). Time to wait before to play the voice

snd: buffer containing the samples (aligned and padded to 32 bytes!!!)

size_snd: size (in bytes) of the buffer samples

volume_l: volume to the left channel from 0 to 255

volume_r: volume to the right channel from 0 to 255

callback: can be NULL or one callback function is used to implement a double buffer use. When the second buffer is empty, the callback is called sending 
          the voice number as parameter. You can use "void callback(int voice)" function to call SND_AddVoice() and add one voice to the second buffer.
		  NOTE: When callback is fixed the voice never stops and it turn in SND_WAITING status if success one timeout condition.

return: SND_OK or SND_INVALID

*/

int SND_SetVoice(int voice, int format, int freq, int delay, void *snd,
		 int size_snd, int volume_l, int volume_r,
		 void (*callback) (int voice));

// the same of SND_SetVoice with continous play and without the callback

int SND_SetInfiniteVoice(int voice, int format, int freq, int delay,
			 void *snd, int size_snd, int volume_l,
			 int volume_r);

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* int SND_AddVoice(int voice, void *snd, int size_snd);

Add a PCM voice in the second buffer to play. This function requires one previously call to SND_SetVoice() and one condition status different 
        of 'SND_UNUSED' 

-- Params ---

voice: use one from 0 to (MAX_SND_VOICES-1)

snd: buffer containing the samples (aligned and padded to 32 bytes!) in the same format of the previously SND_SetVoice() use

size_snd: size (in bytes) of the buffer samples

return: SND_OK, SND_INVALID or SND_BUSY if the second buffer is not empty and de voice cannot be add

*/

int SND_AddVoice(int voice, void *snd, int size_snd);

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* int SND_StopVoice(int voice);

Stops the voice selected. 

If the voice is used in song mode, you need to assign the samples with SND_SetSongSampleVoice() again. Use SND_PauseSongVoice() in this case to stops
        the voice without lose the samples.

-- Params ---

voice: use one from 0 to (MAX_SND_VOICES-1)

return: SND_OK, SND_INVALID

*/

int SND_StopVoice(int voice);

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* int SND_PauseVoice(int voice, int pause);

Pause the voice selected. 



-- Params ---

voice: use one from 0 to (MAX_SND_VOICES-1)

return: SND_OK, SND_INVALID

*/

int SND_PauseVoice(int voice, int pause);

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* int SND_StatusVoice(int voice);

Return the status of the voice selected

-- Params ---

voice: use one from 0 to (MAX_SND_VOICES-1)

return: SND_INVALID 
        SND_UNUSED   you can use this voice
        SND_WORKING  this voice is in progress
        SND_WAITING  this voice is in progress and waiting to one SND_AddVoice function (the voice handler is called continuously)

*/

int SND_StatusVoice(int voice);

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* int SND_GetFirstUnusedVoice();

Get the first unused voice. The voice 0 is tried especially and it is the last possible result. The idea is to reserve that voice for a Mod/Ogg/MP3 
       Player or similar. So if the function return a value <1 you can be sure the rest of the voices are working.

-- Params ---

None

return: SND_INVALID or the first free voice (from 0 to (MAX_SND_VOICES-1))

*/

int SND_GetFirstUnusedVoice();

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* int SND_ChangeFreqVoice(int voice, int freq);

Use this function to change the voice freq in real-time. You can use this to create audio effects.

-- Params ---

voice: use one from 0 to (MAX_SND_VOICES-1)

return: SND_OK, SND_INVALID

*/

int SND_ChangeFreqVoice(int voice, int freq);

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* int SND_ChangeVolumeVoice(int voice, int volume_l, int volume_r);

Use this function to change the voice volume in real-time. You can use this to create audio effects.

-- Params ---

voice: use one from 0 to (MAX_SND_VOICES-1)

volume_l: volume to the left channel from 0 to 255

volume_r: volume to the right channel from 0 to 255

return: SND_OK, SND_INVALID

*/

int SND_ChangeVolumeVoice(int voice, int volume_l, int volume_r);


/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* int SND_TestVoiceBufferReady(int voice);

Test if the Voice is Ready to receive a new buffer sample with SND_AddVoice(). You can use this function to block a reader when you use double buffering
as similar form of the SND_TestPointer() function without passing one address to test

-- Params ---

voice: use one from 0 to (MAX_SND_VOICES-1)

return: SND_INVALID, 0-> not ready to receive a new AddVoice(), 1->ready to receive a new AddVoice()

*/

int SND_TestVoiceBufferReady(int voice);

#endif
