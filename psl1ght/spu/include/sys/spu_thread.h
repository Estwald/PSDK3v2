/*! \file spu_thread.h
  \brief SPU runtime library.

  These are the SPU library calls for SPU threads.

  \see \ref spu_man
*/

#ifndef __SPU_THREAD_H__
#define __SPU_THREAD_H__

#include <sys/cdefs.h>

#define SPU_THREAD_BASE							0xF0000000ULL
#define SPU_THREAD_OFFSET						0x00100000ULL

#define SPU_THREAD_Sig_Notify_1					0x5400C
#define SPU_THREAD_Sig_Notify_2					0x5C00C

#ifdef __cplusplus
extern "C" {
#endif

/*! \brief Terminate the running SPU thread group.
 \param status
 The thread group's returned exit status value.
*/
void spu_thread_group_exit(int status);

/*! \brief Preempt the running SPU thread group.

*/
void spu_thread_group_yield(void);
	
/*! \brief Terminate the running SPU thread.
 \param status
 The thread's returned exit status value.
*/
void spu_thread_exit(int status);

#ifdef __cplusplus
	}
#endif

#endif
