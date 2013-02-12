#ifndef __PAD_H__
#define __PAD_H__

#include <io/pad.h>

#define BUTTON_LEFT				0x8000
#define BUTTON_DOWN				0x4000
#define BUTTON_RIGHT			0x2000
#define BUTTON_UP				0x1000
#define BUTTON_START			0x0800
#define BUTTON_R3				0x0400
#define BUTTON_L3				0x0200
#define BUTTON_SELECT			0x0100
#define BUTTON_SQUARE			0x0080
#define BUTTON_CROSS			0x0040
#define BUTTON_CIRCLE			0x0020
#define BUTTON_TRIANGLE			0x0010
#define BUTTON_R1				0x0008
#define BUTTON_L1				0x0004
#define BUTTON_R2				0x0002
#define BUTTON_L2				0x0001

#ifdef __cplusplus
extern "C" {
#endif

u32 pad_read();

#ifdef __cplusplus
	}
#endif

#endif
