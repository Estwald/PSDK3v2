#include <stdio.h>
#include <stdlib.h>
#include <ppu-asm.h>

#include <lv2/sysfs.h>

extern s32 sysFsAioReadEx(void *aio,s32 *id,opd32 *opd);
extern s32 sysFsAioWriteEx(void *aio,s32 *id,opd32 *opd);

s32 sysFsAioRead(sysFSAio *aio,s32 *id,sysFsAioCallback cb)
{
	return sysFsAioReadEx(aio,id,(opd32*)__get_opd32(cb));
}

s32 sysFsAioWrite(sysFSAio *aio,s32 *id,sysFsAioCallback cb)
{
	return sysFsAioWriteEx(aio,id,(opd32*)__get_opd32(cb));
}
