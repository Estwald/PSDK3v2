#ifndef __LV2_JPGDEC_H__
#define __LV2_JPGDEC_H__

#include <ppu-types.h>

#define JPGDEC_DISABLE			0
#define JPGDEC_ENABLE			1

#define JPGDEC_TOP_TO_BOTTOM	0
#define JPGDEC_BOTTOM_TO_TOP	1

#define JPGDEC_HIGH_QUALITY		0
#define JPGDEC_LOW_QUALITY		5

#ifdef __cplusplus
extern "C" {
#endif

typedef enum
{
	JPGDEC_FILE		= 0,
	JPGDEC_BUFFER	= 1
} jpgStreamSel;

typedef enum
{
	JPGDEC_GRAYSCALE		= 1,
	JPGDEC_RGB				= 2,
	JPGDEC_YCBCR			= 3,
	JPGDEC_RGBA				= 10,
	JPGDEC_UPSTREAM			= 11,
	JPGDEC_ARGB				= 20,
} jpgColorSpace;

typedef struct _jpgdec_thread_in_param
{
	s32 enable;
	u32 ppu_prio;
	u32 spu_prio;
	u32 malloc_func;
	u32 malloc_arg;
	u32 free_func;
	u32 free_arg;
} jpgDecThreadInParam;

typedef struct _jpgdec_thread_out_param
{
	u32 version;
} jpgDecThreadOutParam;

typedef struct _jpgdec_src
{
	jpgStreamSel stream;
	u32 file_name;
	s64 file_offset;
	u32 file_size;
	u32 stream_ptr;
	u32 stream_size;
	s32 enable;
} jpgDecSource;

typedef struct _jpgdec_info
{
	u32 width;
	u32 height;
	u32 num_comp;
	jpgColorSpace space;
} jpgDecInfo;

typedef struct _jpgdec_data_info
{
	f32 value;
	u32 output_lines;
	s32 status;
} jpgDecDataInfo;

typedef struct _jpgdec_in_param
{
	u32 cmd_ptr;
	u32 down_scale;
	s32 quality;
	s32 mode;
	jpgColorSpace space;
	u8 alpha;
	u8 pad[3];
} jpgDecInParam;

typedef struct _jpgdec_out_param
{
	u64 width_bytes;
	u32 width;
	u32 height;
	u32 num_comp;
	s32 mode;
	jpgColorSpace space;
	u32 down_scale;
	u32 use_memory_space;
} jpgDecOutParam;

typedef struct _jpg_data
{
	void *bmp_out;

	u32 pitch;
	u32 width;
	u32 height;
} jpgData;

s32 jpgDecCreate(s32 *handle,jpgDecThreadInParam *in,jpgDecThreadOutParam *out);
s32 jpgDecOpen(s32 handle,s32 *subhandle,const jpgDecSource *src,u32 *space_allocated);
s32 jpgDecReadHeader(s32 handle,s32 subhandle,jpgDecInfo *info);
s32 jpgDecSetParameter(s32 handle,s32 subhandle,const jpgDecInParam *in,jpgDecOutParam *out);
s32 jpgDecDecodeData(s32 handle,s32 subhandle,u8 *data,const u64 *bytes_per_line,jpgDecDataInfo *info);
s32 jpgDecClose(s32 handle,s32 subhandle);
s32 jpgDecDestroy(s32 handle);

s32 jpgLoadFromFile(const char *filename,jpgData *out);
s32 jpgLoadFromBuffer(const void *buffer,u32 size,jpgData *out);

#ifdef __cplusplus
	}
#endif

#endif
