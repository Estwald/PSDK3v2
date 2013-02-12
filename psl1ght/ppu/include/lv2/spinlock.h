#ifndef __LV2_SPINLOCK_H__
#define __LV2_SPINLOCK_H__

#include <ppu-types.h>

#ifdef __cplusplus
extern "C" {
#endif

void sysSpinlockInitialize(s32 *lock);
void sysSpinlockLock(s32 *lock);
s32 sysSpinlockTryLock(s32 *lock);
void sysSpinlockUnlock(s32 *lock);

#ifdef __cplusplus
	}
#endif

#endif
