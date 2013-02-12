#include <stdio.h>
#include <fcntl.h>
#include <_ansi.h>
#include <_syslist.h>
#include <sys/reent.h>
#include <sys/errno.h>
#include <sys/types.h>
#include <sys/lv2errno.h>

#include <sys/file.h>

#define UMASK(mode)		((mode)&~g_umask)

extern mode_t g_umask;

int
_DEFUN(__librt_mkdir_r,(r,path,mode),
	   struct _reent *r _AND
	   const char *path _AND
	   mode_t mode)
{
	return lv2errno_r(r,sysLv2FsMkdir(path,UMASK(mode)));
}
