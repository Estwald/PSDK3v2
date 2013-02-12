#include <stdint.h>
#include <spu_intrinsics.h>

int spu_thread_tryreceive_event(uint32_t spuq,uint32_t *data0,uint32_t *data1,uint32_t *data2)
{
	int ret;

	if(spu_readchcnt(SPU_RdInMbox)>0) return 0x8001000A;

	spu_writech(SPU_WrOutMbox,spuq);
	spu_stop(0x111);

	ret = spu_readch(SPU_RdInMbox);
	if(ret) return ret;

	*data0 = spu_readch(SPU_RdInMbox);
	*data1 = spu_readch(SPU_RdInMbox);
	*data2 = spu_readch(SPU_RdInMbox);

	return ret;
}
