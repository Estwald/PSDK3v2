/*! \file sys/prx.h
 \brief dynamic libraries.
*/

#ifndef __LV2_PRX_H__
#define __LV2_PRX_H__

#include <ppu-types.h>
#include <lv2/prx.h>


#ifdef __cplusplus
extern "C" {
#endif


#define SYS_PRX_RESIDENT                         0
#define SYS_PRX_NO_RESIDENT                      1

#define SYS_PRX_START_OK                         0

#define SYS_PRX_STOP_SUCCESS                     0
#define SYS_PRX_STOP_OK                          0
#define SYS_PRX_STOP_FAIL                        1

#define SYS_PRX_MODULE_FILENAME_SIZE             512

#define SYS_PRX_PROCESS_ELF_ID                   0

#define SYS_PRX_LOAD_MODULE_FLAGS_VALIDMASK     0x0000000000000001
#define SYS_PRX_LOAD_MODULE_FLAGS_FIXEDADDR     0x0000000000000001      /* PRX is pre fixed */


typedef s32 sysPrxId ;
typedef u64 sysPrxFlags ;

typedef struct _sys_prx_segment_info
{
  u64 base ;
  u64 filesize ;
  u64 memsize ;
  u64 index ;
  u64 type ;
} sysPrxSegmentInfo ;

typedef s32 (*sys_prx_entry_t) (size_t args, void *argv);

typedef s32 (*sys_prx_entry_pe_t) (u64 entry, size_t args, void *argv);

typedef struct _sys_prx_start_option {
  u64 size;                          /* sizeof(this) */
} sysPrxStartOption;

typedef struct _sys_prx_stop_option {
  u64 size;                          /* sizeof(this) */
} sysPrxStopOption;

typedef struct _sys_prx_load_module_option {
  u64 size;                          /* sizeof(this) */
} sysPrxLoadModuleOption;

typedef struct _sys_prx_load_module_list_option {
  u64 size;                          /* sizeof(this) */
} sysPrxLoadModuleListOption;

typedef struct _sys_prx_start_module_option {
  u64 size;                          /* sizeof(this) */
} sysPrxStartModuleOption;

typedef struct _sys_prx_stop_module_option {
  u64 size;                          /* sizeof(this) */
} sysPrxStopModuleOption;

typedef struct _sys_prx_unload_module_option {
  u64 size;                          /* sizeof(this) */
} sysPrxUnloadModuleOption;

typedef struct _sys_prx_register_module_option {
  u64 size;                          /* sizeof(this) */
} sysPrxRegisterModuleOption;

typedef struct _sys_prx_get_module_id_by_name_option {
  u64 size;                          /* sizeof(this) */
} sysPrxGetModuleIdByNameOption;

#ifdef  __LP64__
typedef u32 sysPrxUserPchar;
typedef u32 sysPrxUserSegmentVector;
typedef u32 sysPrxUserPprxId;
typedef u32 sysPrxUserPconstVoid;
typedef u32 sysPrxUserPstopLevel;
#else
typedef char *sysPrxUser_pchar;
typedef sysPrxSegmentInfo *sysPrxUserSegmentVector;
typedef sysPrxId *sysPrxUserPprxId;
typedef const void *sysPrxUserPconstVoid;
typedef const void *sysPrxUserPstopLevel;
#endif

typedef struct sys_prx_get_module_list_t {
  u64 size;                        /* 8 */
  u32 max;
  u32 count;                       /* 16 */
  sysPrxUserPprxId idlist;
  sysPrxUserPstopLevel levellist;  /* 24 */
} sysPrxModuleList;

typedef struct sys_prx_module_info_t {
  u64 size;
  char name[30];
  char version[2];
  u32 modattribute;
  u32 start_entry;
  u32 stop_entry;
  u32 all_segments_num;
  sysPrxUserPchar filename;
  u32 filename_size;
  sysPrxUserSegmentVector segments;
  u32 segments_num;
} sysPrxModuleInfo;


#ifdef __cplusplus
	}
#endif

#endif

