/*! \file lv2errno.h
 \brief LV2 error management functions
*/

#ifndef __SYS_LV2_ERRNO_H__
#define __SYS_LV2_ERRNO_H__

#include <reent.h>
#include <errno.h>
#include <ppu-types.h>

#ifdef __cplusplus
extern "C" {
#endif

s32 lv2error(s32 error);
s32 lv2errno(s32 error);
s32 lv2errno_r(struct _reent *r,s32 error);

#ifdef __cplusplus
	}
#endif

#endif
