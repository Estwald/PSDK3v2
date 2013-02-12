#include <_ansi.h>
#include <_syslist.h>
#include <sys/reent.h>
#include <sys/errno.h>
#include <sys/types.h>
#include <sys/lv2errno.h>

#include <sys/file.h>

_off_t
_DEFUN(__librt_lseek_r,(r,fd,pos,dir),
	   struct _reent *r _AND
		   int fd _AND
		   _off_t pos _AND
		   int dir)
{
	s32 ret = 0;
	u64 position = 0;

	ret = sysLv2FsLSeek64(fd,pos,dir,&position);
	if(ret) return (_off_t)lv2errno_r(r,ret);

	return (_off_t)position;
}

_off64_t
_DEFUN(__librt_lseek64_r,(r,fd,pos,dir),
	   struct _reent *r _AND
	   int fd _AND
	   _off64_t pos _AND
	   int dir)
{
	s32 ret = 0;
	u64 position = 0;

	ret = sysLv2FsLSeek64(fd,pos,dir,&position);
	if(ret) return (_off64_t)lv2errno_r(r,ret);

	return (_off64_t)position;
}
