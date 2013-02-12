#ifndef __LV2_PNGDEC_H__
#define __LV2_PNGDEC_H__

#include <ppu-types.h>

#define PNGDEC_DISABLE			0
#define PNGDEC_ENABLE			1

#define PNGDEC_TOP_TO_BOTTOM	0
#define PNGDEC_BOTTOM_TO_TOP	1

#ifdef __cplusplus
extern "C" {
#endif

typedef enum
{
	PNGDEC_FILE		= 0,
	PNGDEC_BUFFER	= 1
} pngStreamSel;

typedef enum
{
	PNGDEC_GRAYSCALE		= 1,
	PNGDEC_RGB				= 2,
	PNGDEC_PALETTE			= 4,
	PNGDEC_GRAYSCALE_ALPHA	= 9,
	PNGDEC_RGBA				= 10,
	PNGDEC_ARGB				= 20
} pngColorSpace;

typedef struct _pngdec_thread_in_param
{
	s32 enable;
	u32 ppu_prio;
	u32 spu_prio;
	u32 malloc_func;
	u32 malloc_arg;
	u32 free_func;
	u32 free_arg;
} pngDecThreadInParam;

typedef struct _pngdec_thread_out_param
{
	u32 version;
} pngDecThreadOutParam;

typedef struct _pngdec_src
{
	pngStreamSel stream;
	u32 file_name;
	s64 file_offset;
	u32 file_size;
	u32 stream_ptr;
	u32 stream_size;
	s32 enable;
} pngDecSource;

typedef struct _pngdec_info
{
	u32 width;
	u32 height;
	u32 num_comp;
	pngColorSpace space;
	u32 bit_depth;
	s32 interlaced;
	u32 chunk_info;
} pngDecInfo;

typedef struct _pngdec_data_info
{
	u32 chunk_info;
	u32 num_text;
	u32 num_unk_chunk;
	s32 status;
} pngDecDataInfo;

typedef struct _pngdec_in_param
{
	u32 cmd_ptr;
	s32 mode;
	pngColorSpace space;
	u32 bit_depth;
	s32 pack_flag;
	s32 alpha_select;
	u32 alpha;
} pngDecInParam;

typedef struct _pngdec_out_param
{
	u64 width_byte;
	u32 width;
	u32 height;
	u32 num_comp;
	u32 bit_depth;
	s32 mode;
	pngColorSpace space;
	u32 use_memory_space;
} pngDecOutParam;

typedef struct _png_data
{
	void *bmp_out;

	u32 pitch;
	u32 width;
	u32 height;
} pngData;

s32 pngDecCreate(s32 *handle,pngDecThreadInParam *in,pngDecThreadOutParam *out);
s32 pngDecOpen(s32 handle,s32 *subhandle,const pngDecSource *src,u32 *space_allocated);
s32 pngDecReadHeader(s32 handle,s32 subhandle,pngDecInfo *info);
s32 pngDecSetParameter(s32 handle,s32 subhandle,const pngDecInParam *in,pngDecOutParam *out);
s32 pngDecDecodeData(s32 handle,s32 subhandle,u8 *data,const u64 *bytes_per_line,pngDecDataInfo *info);
s32 pngDecClose(s32 handle,s32 subhandle);
s32 pngDecDestroy(s32 handle);

s32 pngLoadFromFile(const char *filename,pngData *out);
s32 pngLoadFromBuffer(const void *buffer,u32 size,pngData *out);

#ifdef __cplusplus
	}
#endif

#endif
