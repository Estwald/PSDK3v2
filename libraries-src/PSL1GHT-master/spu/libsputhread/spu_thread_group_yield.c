#include <spu_intrinsics.h>

void spu_thread_group_yield(void)
{
	spu_stop(0x100);
}
