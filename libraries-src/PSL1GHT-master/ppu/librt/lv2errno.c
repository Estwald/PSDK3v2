#include <lv2errno.h>

s32 lv2error(s32 error)
{
	switch(error) {
		case 0x00000000:
			return 0;
		case 0x80010009:/* Not super-user */
			return EPERM;
		case 0x80010006:/* No such file or directory */
			return ENOENT;
		case 0x80010005:/* No such process */
			return ESRCH;
		case 0x8001001F:/* Interrupted system call */
			return EINTR;
		case 0x8001002B:/* I/O error */
			return EIO;
		case 0x8001002F:/* No such device or address */
			return ENXIO; /* 6 */
		case 0x80010007:/* Exec format error */
			return ENOEXEC; /* 8 */
		case 0x8001002A:/* Bad file number */
			return EBADF; /* 9 */
		case 0x80010001:/* No more processes */
			return EAGAIN; /* 11 */
		case 0x80010004:/* Not enough core */
			return ENOMEM; /* 12 */
		case 0x80010029:/* Permission denied */
			return EACCES; /* 13 */
		case 0x8001000D:/* Bad address */
			return EFAULT; /* 14 */
		case 0x8001000A:/* Mount device busy */
			return EBUSY; /* 16 */
		case 0x80010014:/* File exists */
			return EEXIST; /* 17 */
		case 0x80010030:/* Cross-device link */
			return EXDEV; /* 18 */
		case 0x8001002D:/* No such device */
			return ENODEV; /* 19 */
		case 0x8001002E:/* Not a directory */
			return ENOTDIR; /* 20 */
		case 0x80010012:/* Is a directory */
			return EISDIR; /* 21 */
		case 0x80010002:/* Invalid argument */
			return EINVAL; /* 22 */
		case 0x80010022:/* Too many open files in system */
			return ENFILE; /* 23 */
		case 0x8001002C:/* Too many open files */
			return EMFILE; /* 24 */
		case 0x80010024:/* Not a typewriter */
			return ENOTTY; /* 25 */
		case 0x80010020:/* File too large */
			return EFBIG; /* 27 */
		case 0x80010023:/* No space left on device */
			return ENOSPC; /* 28 */
		case 0x80010027:/* Illegal seek */
			return ESPIPE; /* 29 */
		case 0x80010026:/* Read only file system */
			return EROFS; /* 30 */
		case 0x80010021:/* Too many links */
			return EMLINK; /* 31 */
		case 0x80010025:/* Broken pipe */
			return EPIPE; /* 32 */
		case 0x8001001B:/* Math arg out of domain of func */
			return EDOM; /* 33 */
		case 0x8001001C:/* Math result not representable */
			return ERANGE; /* 34 */
		case 0x80010008:/* Deadlock condition */
			return EDEADLK; /* 45 */
		case 0x80010035:/* No record locks available */
			return ENOLCK; /* 46 */
		case 0x80010031:/* Trying to read unreadable message */
			return EBADMSG; /* 77 */
		case 0x80010003:/* Function not implemented */
			return ENOSYS; /* 88 */
		case 0x80010036:/* Directory not empty */
			return ENOTEMPTY; /* 90 */
		case 0x80010034:/* File or path name too long */
			return ENAMETOOLONG; /* 91 */
		case 0x8001000B:/* Connection timed out */
			return ETIMEDOUT; /* 116 */
		case 0x80010032:/* Connection already in progress */
			return EINPROGRESS; /* 119 */
		case 0x80010033:/* Message too long */
			return EMSGSIZE; /* 122 */
		case 0x80010015:/* Socket is already connected */
			return EISCONN; /* 127 */
		case 0x80010016:/* Socket is not connected */
			return ENOTCONN; /* 128 */
		case 0x80010037:/* Not supported */
			return ENOTSUP; /* 134 */
		case 0x8001001D:
			return EILSEQ; /* 138 */
		case 0x80010039:/* Value too large for defined data type */
			return EOVERFLOW; /* 139 */
		case 0x80010013:/* Operation canceled */
			return ECANCELED; /* 140 */
		default:
			return EINVAL;
	}
}

s32 lv2errno(s32 error)
{
	if(error>=0) return error;

	errno = lv2error(error);
	return -1;
}

s32 lv2errno_r(struct _reent *r,s32 error)
{
	if(error>=0) return error;

	r->_errno = lv2error(error);
	return -1;
}
