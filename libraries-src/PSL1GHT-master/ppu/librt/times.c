#include <stdio.h>
#include <_ansi.h>
#include <_syslist.h>
#include <sys/reent.h>
#include <sys/errno.h>
#include <sys/types.h>
#include <sys/times.h>
#include <sys/lv2errno.h>

#include <ppu-asm.h>

clock_t
_DEFUN(__librt_times_r,(r,buf),
	   struct _reent *r _AND
	   struct tms *buf)
{
	u64 systime = __gettime();
	return (clock_t)systime;
}
