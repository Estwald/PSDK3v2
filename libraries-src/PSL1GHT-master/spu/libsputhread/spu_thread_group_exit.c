#include <spu_intrinsics.h>

void spu_thread_group_exit(int status)
{
	spu_writech(SPU_WrOutMbox,status);
	spu_stop(0x101);
}
