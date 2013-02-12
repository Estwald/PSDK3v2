#include <_ansi.h>
#include <_syslist.h>
#include <sys/reent.h>
#include <sys/errno.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/lv2errno.h>

#include <sys/file.h>

extern int closesocket(int socket);

int
_DEFUN(__librt_close_r,(ptr,fd),
	   struct _reent *ptr _AND
		   int fd)
{
	if(fd&SOCKET_FD_MASK)
		return lv2errno_r(ptr,closesocket(fd));

	return lv2errno_r(ptr,sysLv2FsClose(fd));
}
