#include <sysutil/sysutil.h>

#include "pad.h"

static u32 btn_pressed = 0;
static u32 btn_pressed_old = 0;

u32 pad_read()
{
	u32 i,btn;
	u32 pad_alive;
	padInfo padinfo;
	padData paddata;

	sysUtilCheckCallback();

	btn = 0;
	pad_alive = 0;
	ioPadGetInfo(&padinfo);
	for(i=0;i<MAX_PADS;i++) {
		if(padinfo.status[i]) {
			pad_alive = 1;
			ioPadGetData(i, &paddata);
			btn = ((paddata.button[2]<<8) | (paddata.button[3]&0xff));
			break;
		}
	}

	if(!pad_alive) btn = 0;

	btn_pressed = btn&(~btn_pressed_old);
	btn_pressed_old = btn;

	return btn_pressed;
}
