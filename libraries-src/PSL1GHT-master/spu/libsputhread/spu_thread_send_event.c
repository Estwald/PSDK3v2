#include <stdint.h>
#include <spu_intrinsics.h>

#include <sys/spu_event.h>

int spu_thread_send_event(uint8_t spup,uint32_t data0,uint32_t data1)
{
	uint32_t val = ((spup<<EVENT_PORT_SHIFT) | (data0&EVENT_DATA0_MASK));

	if(spup>EVENT_PORT_MAX_NUM) return 0x80010002;
	if(spu_readchcnt(SPU_RdInMbox)>0) return 0x8001000A;

	spu_writech(SPU_WrOutMbox,data1);
	spu_writech(SPU_WrOutIntrMbox,val);

	return (int)spu_readch(SPU_RdInMbox);
}
