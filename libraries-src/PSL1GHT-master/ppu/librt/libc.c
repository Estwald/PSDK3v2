#include <stdlib.h>
#include <string.h>
#include <sys/reent.h>

struct _reent libc_global_reent;

void __libc_init()
{
	libc_global_reent = (struct _reent)_REENT_INIT((libc_global_reent));
	_REENT = &libc_global_reent;
}
