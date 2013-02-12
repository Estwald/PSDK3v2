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

#ifndef __AUDIOPLAYER_H__
#define __AUDIOPLAYER_H__



#include "spu_soundlib.h"	// sound library

#include <unistd.h>

#ifdef __cplusplus
extern "C" {
#endif

#define AUDIO_ONE_TIME         0
#define AUDIO_INFINITE_TIME    1

#define AUDIO_STATUS_RUNNING   1
#define AUDIO_STATUS_ERR      -1
#define AUDIO_STATUS_PAUSED    2
#define AUDIO_STATUS_EOF     255

    extern short pcm_outsample[512];	// ring with 512 stereo samples to use with GX effects


    void DI_AudioThread(int flag);	// to disable/enable the work in the sound thread 

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* Utils functions                                                                                                                                      */
/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

//  to open OGG files from mem
    long mem_open(char *ogg, int size);
    int mem_close(long fd);

/* you can use so: 
 
	FILE *fp =(FILE *) memopen(ogg_mp3_file, size_ogg_mp3_file); 
	
	fp= receive 0x666 to 0x699 symbolic address and internally, memfile.c use it to simulate a mem device

	mem_close is called internally by audioplayer lib and can close all devices.
*/

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* Decode OGG/MP3 function from memory                                                                                                                  */
/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

    int DecodeAudio(void *audiofile, int size, short *samples,
		    int *size_samples, int *freq, int *is_stereo);

/* int DecodeAudio(void *audiofile, int size, int *freq, int *is_stereo, short *samples, int *max_samples);

Decode in memory (from memory) an Audio file (MP3 or OGG).

NOTE: This function stops other OGG/MP3 playing from the background. It decode to PCM 16 bits samples signed

-- Params ---

audiofile: pointer with the OGG/MP3 file

size: size in bytes of the OGG/MP3 file

samples: buffer passed by user to put the decoded samples

size_samples: int pointer that receive the number of bytes of the "samples" buffer (from the user) and return the bytes decoded

freq: Receive the frequency toplay the samples

is_stereo: 1-> STEREO, 0-> MONO

return: 0- Ok, -1 Error

Usage:
 
	int size_samples= sizeof(audiofile)*20;
	short *samples= malloc(size_samples);
	int freq, is_stereo;

	DecodeAudio( audiofile, sizeof(audiofile), samples, &size_samples, &freq, &is_stereo);
	// Play in voice 2
	SND_SetVoice( 2, (is_stereo) ? VOICE_STEREO_16BIT : VOICE_MONO_16BIT, freq, 0, samples, size_samples, 255, 255, NULL);
*/

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* Player OGG/MP3 functions                                                                                                                             */
/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* int PlayAudiofd(FILE *fd, int time_pos, int mode);

Play an Audio file (MP3 or OGG).
This file can be loaded from memory (mem_open(void *ogg, int size_ogg)) or from device with fopen("device:file.ogg","r");

NOTE: The file is closed by the player when you call PlayAudio(), StopAudio() or if it fail. 

-- Params ---

fd: file descriptor from open() or mem_open()

time_pos: initial time position in the file (in milliseconds). For example, use 30000 to advance 30 seconds

mode: Use AUDIO_ONE_TIME or AUDIO_INFINITE_TIME. When you use AUDIO_ONE_TIME the sound stops and StatusAudio() return AUDIO_STATUS_EOF

return: 0- Ok, -1 Error

*/

    int PlayAudiofd(FILE * fd, int time_pos, int mode);

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* int PlayAudio(char *name, int time_pos, int mode);

Play an Audio file (MP3 or OGG)

NOTE: The file is closed by the player when you call PlayAudio(), StopAudio() or if it fail. 

-- Params ---

name: filename with path

time_pos: initial time position in the file (in milliseconds). For example, use 30000 to advance 30 seconds

mode: Use AUDIO_ONE_TIME or AUDIO_INFINITE_TIME. When you use AUDIO_ONE_TIME the sound stops and StatusAudio() return AUDIO_STATUS_EOF

return: 0- Ok, -1 Error

*/

    int PlayAudio(char *name, int time_pos, int mode);

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* void StopAudio();

Stop an Audio file. 

NOTE: The file is closed and the player thread is released

-- Params ---


*/

    void StopAudio();

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* void PauseAudio(int pause);

Pause an Audio file.

-- Params ---

pause: 0 -> continue, 1-> pause

*/

    void PauseAudio(int pause);

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* int StatusAudio();

Return the Audio status

-- Params ---


return: AUDIO_STATUS_RUNNING 
        AUDIO_STATUS_ERR    -> not initialized?
        AUDIO_STATUS_PAUSED    
        AUDIO_STATUS_EOF    -> player stopped by End Of File

*/

    int StatusAudio();

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* void SetVolumeAudio(int volume);

Set the Audio playing volume.
NOTE: it change the volume of voice 0 (used for the Audio player)

-- Params ---

volume: 0 to 255 (max)

*/

    void SetVolumeAudio(int volume);

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* s32 GetTotalTimeAudio();

Return the total Audio time of the file

-- Params ---

return:  0 -> Ok or error condition  (you must ignore this value)
        >0 -> time in milliseconds

*/

    s32 GetTotalTimeAudio();

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* s32 GetTimeAudio();

Return the Audio time from the starts of the file

-- Params ---

return:  0 -> Ok or error condition  (you must ignore this value)
        >0 -> time in milliseconds from the starts

*/

    s32 GetTimeAudio();

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* void SetTimeAudio(s32 time_pos);

Set the time position

NOTE: The file is closed by the player when you call PlayAudio(), StopOgg() or if it fail. 

-- Params ---

time_pos: time position in the file (in milliseconds). For example, use 30000 to advance 30 seconds

*/

    void SetTimeAudio(s32 time_pos);

/*------------------------------------------------------------------------------------------------------------------------------------------------------*/

#ifdef __cplusplus
}
#endif
#endif
