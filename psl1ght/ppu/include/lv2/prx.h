/*! \file lv2/prx.h
 \brief dynamic libraries.
*/

#ifndef __LV2_PRX_H__
#define __LV2_PRX_H__

#include <ppu-types.h>
#include <sys/prx.h>


#ifdef __cplusplus
extern "C" {
#endif


extern s32 sysPrxVersion;

sysPrxId sysPrxLoadModule(const char *path, sysPrxFlags flags, sysPrxLoadModuleOption *opt);
sysPrxId sysPrxUnloadModule(sysPrxId id, sysPrxFlags flags, sysPrxLoadModuleOption *opt);

s32 sysPrxStartModule(sysPrxId id, size_t args, void *argp, s32 *modres, sysPrxFlags flags, sysPrxStartModuleOption *opt);
s32 sysPrxStopModule(sysPrxId id, size_t args, void *argp, s32 *modres, sysPrxFlags flags, sysPrxStartModuleOption *opt);

s32 sysPrxRegisterModule( const sysPrxRegisterModuleOption *opt);

s32 sysPrxGetModuleList(sysPrxFlags flags, sysPrxModuleList *list);
s32 sysPrxGetModuleInfo(sysPrxId id, sysPrxFlags flags, sysPrxModuleInfo *info);
sysPrxId sysPrxGetModuleIdByName(const char *name, sysPrxFlags flags, sysPrxGetModuleIdByNameOption *opt);


#ifdef __cplusplus
	}
#endif

#endif

