/*! \file audio.h
\brief Audio library.

This library manages communications of the application with the system
audio server. It basically allows the application to play raw PCM audio
by filling a circular buffer.

To play audio, follow these steps:
 - Initialize the audio system for the application (\ref audioInit).
 - Open an audio port with \ref audioPortOpen, which returns a unique port number.
 - Allocate a \ref audioPortConfig object with \ref audioGetPortConfig.
 - Create a notify event queue (\ref audioCreateNotifyEventQueue).
 - Set the created event queue as the current event queue
   (\ref audioSetNotifyEventQueue).
 - Eventually drain the existing events in the queue (\ref sysEventQueueDrain).
 - Start the audio port (\ref audioPortStart).
 - As soon as you receive an event from the notify event queue
   (\ref sysEventQueueReceive), you can write
   the next block into the buffer. The first block number is 0, the following
   is 1, and so on until you reach the number of allocated blocks (specified
   in the audioPortParam::numBlocks value you provide when you call \ref
   audioPortOpen), then the block number returns to 0. The address of block 0
   is the \ref audioPortConfig::audioDataStart "audioDataStart" field of the
   \ref audioPortConfig structure. Then the address of block \c x is
   <code>audioDataStart + x * numChannels * AUDIO_BLOCK_SAMPLES *
   sizeof(float)</code>. The size of each block in bytes is
   <code>numChannels * AUDIO_BLOCK_SAMPLES * sizeof(float)</code>.

To stop playing audio, the steps are:
 - Stop the audio port (\ref audioPortStop).
 - Unset the current event queue (\ref audioRemoveNotifyEventQueue).
 - Close the audio port (\ref audioPortClose).
 - Destroy the event queue (\ref sysEventQueueDestroy).
 - Quit the audio system (\ref audioQuit).

The PCM audio sample format is 32-bit floating point where sample values vary
from -1 to 1. Samples are interlaced: for instance in stereo mode, even sample
positions correspond to the left channel, and odd ones correspond to the right
channel.
*/

#ifndef __LV2_AUDIO_H__
#define __LV2_AUDIO_H__

#include <sys/event_queue.h>

/*! \brief Number of samples in an audio block. */
#define AUDIO_BLOCK_SAMPLES				256

/*! \brief Audio port is ready to play. */
#define AUDIO_STATUS_READY				1
/*! \brief Audio port is playing. */
#define AUDIO_STATUS_RUN				2
/*! \brief Audio port has been closed. */
#define AUDIO_STATUS_CLOSE				0x1010

/*! \brief 2-channel (stereo) output. */
#define AUDIO_PORT_2CH					2
/*! \brief 8-channel output. */
#define AUDIO_PORT_8CH					8

/*! \brief Set initial output level. */
#define AUDIO_PORT_INITLEVEL			0x1000

/*! \brief 8 blocks are allocated in the audio buffer */
#define AUDIO_BLOCK_8					8
/*! \brief 16 blocks are allocated in the audio buffer */
#define AUDIO_BLOCK_16					16
/*! \brief 32 blocks are allocated in the audio buffer */
#define AUDIO_BLOCK_32					32

#ifdef __cplusplus
extern "C" {
#endif

/*! \brief Audio port parameter data structure. */
typedef struct _audio_port_param
{
	/*! \brief Number of channels.

	Possible values are:
	- \ref AUDIO_PORT_2CH
	- \ref AUDIO_PORT_8CH
	*/
	u64 numChannels;
	/*! \brief Number of blocks in audio buffer.

	Possible values are:
	- \ref AUDIO_BLOCK_8
	- \ref AUDIO_BLOCK_16
	- \ref AUDIO_BLOCK_32
	*/
	u64 numBlocks;

	/*! \brief Special attributes.

	This value must be either 0 or \ref AUDIO_PORT_INITLEVEL.
	*/
	u64 attrib;

	/*! \Brief Initial volume.

	Valid only if \ref attrib was set to \ref AUDIO_PORT_INITLEVEL.

	Possible values vary from 0 to 1.
	*/
	f32 level;
} audioPortParam;

/*! \brief Audio port config data structure. */
typedef struct _audio_port_config
{
	u32 readIndex;			/*!< \brief index of currently read block in audio port buffer */
	/*! \brief audio port status

	Possible values are:
	- \ref AUDIO_STATUS_READY
	- \ref AUDIO_STATUS_RUN
	- \ref AUDIO_STATUS_CLOSE
	*/
	u32 status;
	u64 channelCount;		/*!< \brief number of channels */
	/*! \brief number of blocks

	Possible values are:
	- \ref AUDIO_BLOCK_8
	- \ref AUDIO_BLOCK_16
	- \ref AUDIO_BLOCK_32
	*/
	u64 numBlocks;
	u32 portSize;			/*!< \brief port size */
	u32 audioDataStart;		/*!< \brief start address of audio port buffer */
} audioPortConfig;

/*! \brief Initialize audio subsystem.
\return zero if no error, nonzero otherwise.
*/
s32 audioInit();

/*! \brief Initialize audio subsystem.
\return zero if no error, nonzero otherwise.
*/
s32 audioQuit();

/*! \brief Open audio port.
\param param Pointer to and audio port parameter data structure.
\param portNum Pointer to storage for the returned port id.
\return zero if no error, nonzero otherwise.
*/
s32 audioPortOpen(audioPortParam *param,u32 *portNum);

/*! \brief Start playing on audio port.
\param portNum Port id as returned by \ref audioPortOpen.
\return zero if no error, nonzero otherwise.
*/
s32 audioPortStart(u32 portNum);

/*! \brief Stop playing on audio port.
\param portNum Port id as returned by \ref audioPortOpen.
\return zero if no error, nonzero otherwise.
*/
s32 audioPortStop(u32 portNum);

/*! \brief Get config of opened audio port.
\param portNum Port id as returned by \ref audioPortOpen.
\param config Pointer to the port config structure to be updated.
\return zero if no error, nonzero otherwise.
*/
s32 audioGetPortConfig(u32 portNum,audioPortConfig *config);

/*! \brief Close an opened audio port.
\param portNum Port id as returned by \ref audioPortOpen.
\return zero if no error, nonzero otherwise.
*/
s32 audioPortClose(u32 portNum);

/*! \brief Create a notify event queue for audio events.
\param eventQ Pointer to the event queue object to be updated.
\param queueKey Pointer to storage for the returned queue key.
\return zero if no error, nonzero otherwise.
*/
s32 audioCreateNotifyEventQueue(sys_event_queue_t *eventQ,sys_ipc_key_t *queueKey);

/*! \brief Set the current event queue for audio events.
\param queueKey The queue key value (musthave been created using
   \ref audioCreateNotifyEventQueue).
\return zero if no error, nonzero otherwise.
*/
s32 audioSetNotifyEventQueue(sys_ipc_key_t queueKey);

/*! \brief Disconnect the current event queue from the audio subsystem.
\param queueKey The queue key value (must have been created using
   \ref audioCreateNotifyEventQueue).
\return zero if no error, nonzero otherwise.
*/
s32 audioRemoveNotifyEventQueue(sys_ipc_key_t queueKey);

#ifdef __cplusplus
	}
#endif

#endif
