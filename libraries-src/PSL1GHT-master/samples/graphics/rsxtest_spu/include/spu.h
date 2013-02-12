#ifndef __SPU_H__
#define __SPU_H__

#define MAX_PHYSICAL_SPU		6
#define MAX_RAW_SPU				1

typedef struct _spu_param
{
	u32 fragment_const_addr;
	u32 spu_read_label_addr;
	u32 spu_write_label_addr;
} spu_param;


s32 init_spu();
void shutdown_spu();
void signal_spu_ppu();
void signal_spu_rsx();
void wait_signal_spu();
void clear_signal_spu();
void setup_shared_buffer(u32 const_addr,u32 read_addr,u32 write_addr);

#endif
