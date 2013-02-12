#include <stdio.h>
#include <errno.h>
#include <ppu-asm.h>
#include <sys/thread.h>

extern s32 sysThreadCreateEx(sys_ppu_thread_t *threadid,opd32 *opdentry,void *arg,s32 priority,u64 stacksize,u64 flags,char *threadname);

s32 sysThreadCreate(sys_ppu_thread_t *threadid,void (*entry)(void*),void *arg,s32 priority,u64 stacksize,u64 flags,char *threadname)
{
	return sysThreadCreateEx(threadid,(opd32*)__get_opd32(entry),arg,priority,stacksize,flags,threadname);
}
