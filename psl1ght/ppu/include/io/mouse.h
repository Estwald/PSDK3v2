#ifndef __LV2_MOUSE_H__
#define __LV2_MOUSE_H__

#include <ppu-types.h>

#define MAX_MICE				127
#define MOUSE_MAX_CODES			64

#define MOUSE_MAX_DATA_LIST		(8)

#ifdef __cplusplus
extern "C" {
#endif


typedef struct _mouse_info
{
	u32 max;					/* max mice allowed to connect */
	u32 connected;				/* how many mice connected */
	u32 info;					/* bit 0 lets the system intercept pad? other bits are reserved */
	u16 vendor_id[MAX_MICE];	/* vendor id */
	u16 product_id[MAX_MICE];	/* product id */
	u8  status[MAX_MICE];		/* 0: Not connected, 1: Connected, 5: Connected to custom controller.*/
} mouseInfo;

typedef struct _mouse_info_tablet
{
	u32 supported;
	u32 mode;
} mouseInfoTablet;

typedef struct _mouse_raw_data
{
	s32 len;
	u8 data[MOUSE_MAX_CODES];
} mouseRawData;

typedef struct _mouse_data
{
	u8 update;
	u8 buttons;
	s8 x_axis;
	s8 y_axis;
	s8 wheel;
	s8 tilt;	
} mouseData;

typedef struct _mouse_data_list
{
	u32 count;
	mouseData list[MOUSE_MAX_DATA_LIST];
}mouseDataList;

typedef struct _mouse_tablet_data
{
	s32 len;
	u8 data[MOUSE_MAX_CODES];
} mouseTabletData;

typedef struct _mouse_tablet_data_list
{
	u32 count;
	mouseTabletData list[MOUSE_MAX_DATA_LIST];
} mouseTabletDataList;

s32 ioMouseInit(u32 max);
s32 ioMouseEnd();
s32 ioMouseClearBuf(u32 port);
s32 ioMouseGetInfo(mouseInfo* info);
s32 ioMouseGetRawData(u32 port, mouseRawData* rawData);
s32 ioMouseGetData(u32 port, mouseData* data);
s32 ioMouseGetDataList(u32 port, mouseDataList* dataList);
s32 ioMouseGetTabletDataList(u32 port, mouseTabletDataList* tabletDataList);
s32 ioMouseInfoTabletMode(u32 port, mouseInfoTablet* infoTablet);
s32 ioMouseSetTabletMode(u32 port, u32 mode);


#ifdef __cplusplus
	}
#endif

#endif
