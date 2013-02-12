#ifndef __LV2_MSG_H__
#define __LV2_MSG_H__

#include <ppu-types.h>

#define MSG_PROGRESSBAR_INDEX0			0
#define MSG_PROGRESSBAR_INDEX1			1

#ifdef __cplusplus
extern "C" {
#endif

typedef enum
{
	MSG_DIALOG_ERROR				= 0,
	MSG_DIALOG_NORMAL				= 1,
	MSG_DIALOG_MUTE_ON				= 2,
	MSG_DIALOG_BKG_INVISIBLE		= 4,
	MSG_DIALOG_BTN_TYPE_YESNO		= 16,
	MSG_DIALOG_BTN_TYPE_OK			= 32,
	MSG_DIALOG_DISABLE_CANCEL_ON	= 128,
	MSG_DIALOG_DEFAULT_CURSOR_NO	= 256,

	MSG_DIALOG_SINGLE_PROGRESSBAR	= 4096,
	MSG_DIALOG_DOUBLE_PROGRESSBAR	= 8192
} msgType;

typedef enum
{
	MSG_DIALOG_BTN_NONE				= -1,
	MSG_DIALOG_BTN_INVALID,
	MSG_DIALOG_BTN_OK,
	MSG_DIALOG_BTN_YES				= 1,
	MSG_DIALOG_BTN_NO,
	MSG_DIALOG_BTN_ESCAPE
} msgButton;

typedef void (*msgDialogCallback)(msgButton button,void *usrData);

s32 msgDialogAbort();
s32 msgDialogClose(f32 waitMs);
s32 msgDialogOpen(msgType type,const char *msg,msgDialogCallback cb,void *usrData,void *unused);
s32 msgDialogOpen2(msgType type,const char *msg,msgDialogCallback cb,void *usrData,void *unused);
s32 msgDialogOpenErrorCode(u32 errorCode,msgDialogCallback cb,void *usrData,void *unused);

s32 msgDialogProgressBarSetMsg(u32 index,const char *msg);
s32 msgDialogProgressBarReset(u32 index);
s32 msgDialogProgressBarInc(u32 index,u32 percent);

#ifdef __cplusplus
	}
#endif

#endif
