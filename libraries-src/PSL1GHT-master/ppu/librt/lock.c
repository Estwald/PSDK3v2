#include <stdio.h>
#include <_ansi.h>
#include <_syslist.h>
#include <sys/reent.h>
#include <sys/errno.h>

#include <sys/mutex.h>

int __librt_sys_lwmutex_create_r(struct _reent *r,sys_lwmutex_t *lwmutex,const sys_lwmutex_attr_t *attr)
{
	return sysLwMutexCreate(lwmutex,attr);
}

int __librt_sys_lwmutex_destroy_r(struct _reent *r,sys_lwmutex_t *lwmutex)
{
	return sysLwMutexDestroy(lwmutex);
}

int __librt_sys_lwmutex_lock_r(struct _reent *r,sys_lwmutex_t *lwmutex,unsigned long long timeout)
{
	return sysLwMutexLock(lwmutex,timeout);
}

int __librt_sys_lwmutex_trylock_r(struct _reent *r,sys_lwmutex_t *lwmutex)
{
	return sysLwMutexTryLock(lwmutex);
}

int __librt_sys_lwmutex_unlock_r(struct _reent *r,sys_lwmutex_t *lwmutex)
{
	return sysLwMutexUnlock(lwmutex);
}
