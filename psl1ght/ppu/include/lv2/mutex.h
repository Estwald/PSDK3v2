/*! \file lv2/mutex.h
 \brief Lightweight mutex library.
*/

#ifndef __LV2_MUTEX_H__
#define __LV2_MUTEX_H__

#include <ppu-types.h>

#define SYS_LWMUTEX_ATTR_PROTOCOL		0x0002
#define SYS_LWMUTEX_ATTR_RECURSIVE		0x0010

/*! \brief FIFO lightweight mutex scheduling policy. */
#define SYS_LWMUTEX_PROTOCOL_FIFO				1
/*! \brief Priority-based lightweight mutex scheduling policy. */
#define SYS_LWMUTEX_PROTOCOL_PRIO				2
/*! \brief Priority-based lightweight mutex scheduling policy with inheritance. */
#define SYS_LWMUTEX_PROTOCOL_PRIO_INHERIT		3

/*! \brief Lightweight mutex is recursive. */
#define SYS_LWMUTEX_ATTR_RECURSIVE		0x0010
/*! \brief Lightweight mutex is not recursive. */
#define SYS_LWMUTEX_ATTR_NOT_RECURSIVE	0x0020


#ifdef __cplusplus
extern "C" {
#endif

/*! \brief Lightweight mutex data structure. */
typedef struct sys_lwmutex
{
	u64 lock_var;			/*!< \brief Locking variable. */
	u32 attribute;			/*!< \brief Attribute. */
	u32 recursive_count;	/*!< \brief Recursive count. */
	u32 sleep_queue;		/*!< \brief Sleep queue. */
	u32 _pad;				/*!< \brief Unused padding element. */
} sys_lwmutex_t;

/*! \brief Lightweight mutex attributes data structure. */
typedef struct sys_lwmutex_attr
{
	/*! \brief Scheduling policy.

	Possible values are:
	- \ref SYS_LWMUTEX_PROTOCOL_FIFO
	- \ref SYS_LWMUTEX_PROTOCOL_PRIO
	- \ref SYS_LWMUTEX_PROTOCOL_PRIO_INHERIT
	*/
	u32 attr_protocol;
	/*! \brief Recursive setting.

	Possible values are:
	- \ref SYS_LWMUTEX_ATTR_RECURSIVE
	- \ref SYS_LWMUTEX_ATTR_NOT_RECURSIVE
	*/
	u32 attr_recursive;
	/*! \brief Lightweight mutex name. */
	char name[8];
} sys_lwmutex_attr_t;

/*! \brief Create a lightweight mutex.
\param mutex Pointer to the lightweight mutex structure to be initialized.
\param attr Pointer to the lightweight mutex attributes.
\return zero if no error occured, nonzero otherwise.
*/
s32 sysLwMutexCreate(sys_lwmutex_t *mutex,const sys_lwmutex_attr_t *attr);

/*! \brief Destroy a lightweight mutex.
\param mutex Pointer to the lightweight mutex structure.
\return zero if no error occured, nonzero otherwise.
*/
s32 sysLwMutexDestroy(sys_lwmutex_t *mutex);

/*! \brief Lock a lightweight mutex.
\param mutex Pointer to the lightweight mutex structure.
\param timeout_usec Timeout value in microseconds, or 0 if no timeout is used.
\return zero if the lightweight mutex was successfully locked,
nonzero in case of error or if a timeout occured.
*/
s32 sysLwMutexLock(sys_lwmutex_t *mutex,u64 timeout);

/*! \brief Try to lock a lightweight mutex (non-blocking).
\param mutex Pointer to the lightweight mutex structure.
\return zero if the lightweight mutex was successfully locked,
nonzero in case of error or if the lightweight mutex is already locked by
another thread.
*/
s32 sysLwMutexTryLock(sys_lwmutex_t *mutex);

/*! \brief Unlock a previously locked lightweight mutex.
\param mutex Pointer to the lightweight mutex structure.
\return zero if no error occured, nonzero otherwise.
*/
s32 sysLwMutexUnlock(sys_lwmutex_t *mutex);

#ifdef __cplusplus
	}
#endif

#endif
