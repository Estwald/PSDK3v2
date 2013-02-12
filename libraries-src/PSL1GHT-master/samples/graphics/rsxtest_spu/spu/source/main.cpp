#include <spu_intrinsics.h>
#include <spu_mfcio.h>

#define TAG				1
#define BUF_SIZE		128
#define ALIGN16(x)		((((x) + 15)/16)*16)

typedef struct _spu_param_t
{
	unsigned int fragment_const_addr;
	unsigned int spu_read_label_addr;
	unsigned int spu_write_label_addr;
} spu_param_t;

spu_param_t spuparam __attribute__((aligned(128)));

float dma_buffer[BUF_SIZE/sizeof(float)] __attribute__((aligned(128)));
unsigned int read_label_buffer[16] __attribute__((aligned(128)));
unsigned int write_label_buffer[16] __attribute__((aligned(128)));

static void wait_dma_completion(void) 
{
	mfc_write_tag_mask(1<<TAG);
	spu_mfcstat(MFC_TAG_UPDATE_ALL);
}

static inline void mfcGetData(void *ls,unsigned int ea,unsigned int size)
{
	while(size) {
		unsigned int chunk = size > 16*1024 ? 16*1024 : size;
		mfc_get(ls,ea,size,TAG,0,0);
		wait_dma_completion();
		size -= chunk;
		ls = (void*)((unsigned int)ls + chunk);
		ea += chunk;
	}
}

static inline void mfcPutData(void *ls,unsigned int ea,unsigned int size)
{
	while(size) {
		unsigned int chunk = size > 16*1024 ? 16*1024 : size;
		mfc_put(ls,ea,size,TAG,0,0);
		wait_dma_completion();
		size -= chunk;
		ls = (void*)((unsigned int)ls + chunk);
		ea += chunk;
	}
}

static inline unsigned int swapU32_16(const unsigned int v)
{
	return (v >> 16) | (v << 16);
}

static inline float swapF32_16(const float f)
{
	union ieee32
	{
		unsigned int ui;
		float f;
	} v;

	v.f = f;
	v.ui = swapU32_16(v.ui);
	return v.f;
}

float Light[4] = { 0.0f, 0.0f, 1.0f, 0.0f };
int main(int argc,char *argv[])
{
	int i;
	unsigned int buff = (unsigned int)spu_readch(SPU_RdInMbox);

	mfcGetData(&spuparam,buff,ALIGN16(sizeof(spu_param_t)));

	while(1) {
		float *ptr = dma_buffer;
		unsigned int buff_ea = spuparam.fragment_const_addr;

		*ptr++ = swapF32_16(Light[0]);
		*ptr++ = swapF32_16(Light[1]);
		*ptr++ = swapF32_16(Light[2]);
		*ptr++ = swapF32_16(Light[3]);

		unsigned int size = ALIGN16(((unsigned int)ptr - (unsigned int)dma_buffer));
		while(1) {
			mfcGetData(read_label_buffer,spuparam.spu_read_label_addr,16);
			if(read_label_buffer[0]==0xbeefbeef) {
				for(i=0;i<4;i++)
					read_label_buffer[i] = 0xcafecafe;

				mfcPutData(read_label_buffer,spuparam.spu_read_label_addr,16);
				break;
			}
		}
		mfcPutData(dma_buffer,buff_ea,size);

		for(i=0;i<4;i++)
			write_label_buffer[i] = 0xabcdabcd;
		mfcPutData(write_label_buffer,spuparam.spu_write_label_addr,16);
	}
	return 0;
}
