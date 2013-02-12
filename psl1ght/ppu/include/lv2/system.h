#ifndef __LV2_RANDOM_H__
#define __LV2_RANDOM_H__

#include <ppu-types.h>


#define RANDOM_NUMBER_MAX_SIZE                      (4096)


#ifdef __cplusplus
extern "C" {
#endif


/*
 * FIPS186-2 DSS
 *
 * addr, pointer to random number storage
 * size, size in bytes of random
*/
u32 sysGetRandomNumber(void *addr, u64 size);


#ifdef __cplusplus
	}
#endif

#endif
