#include <stdio.h>
#include <fcntl.h>
#include <_ansi.h>
#include <_syslist.h>
#include <sys/reent.h>
#include <sys/errno.h>
#include <sys/types.h>
#include <sys/lv2errno.h>

mode_t g_umask = (S_IWGRP | S_IWOTH);

mode_t
_DEFUN(__librt_umask_r,(r,cmask),
	   struct _reent *r _AND
	   mode_t cmask)
{
	mode_t mode = g_umask;
	g_umask = cmask&(S_IRWXU|S_IRWXG|S_IRWXO);
	return mode;
}
