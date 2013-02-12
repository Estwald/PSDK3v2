#include <spu_intrinsics.h>
#include <spu_mfcio.h>

#include <sys/spu_thread.h>

#include "spustr.h"

#define TAG				1

static uint64_t spu_ea;
static spustr_t spu __attribute__((aligned(128)));

/* wait for dma transfer to be finished */
static void wait_for_completion(void)
{
	mfc_write_tag_mask(1<<TAG);
	spu_mfcstat(MFC_TAG_UPDATE_ALL);
}

static void send_response(uint32_t x)
{
	spu.response = x;
	spu.sync = 1;

	/* send response to ppu variable */
	uint64_t ea = spu_ea + ((uint32_t)&spu.response) - ((uint32_t)&spu);
	mfc_put(&spu.response,ea,4,TAG,0,0);

	/* send sync to ppu variable with fence (this ensures sync is written AFTER response) */
	ea = spu_ea + ((uint32_t)&spu.sync) - ((uint32_t)&spu);
	mfc_putf(&spu.sync, ea, 4, TAG, 0, 0);
}

int main(uint64_t arg0,uint64_t arg1,uint64_t arg2,uint64_t arg3)
{
	volatile vec_uint4 v = (vec_uint4){0};
	volatile vec_uint4 sig = (vec_uint4){0,0,0,1};

	/* get data structure */
	spu_ea = arg0;
	mfc_get(&spu,spu_ea,sizeof(spustr_t),TAG,0,0);
	wait_for_completion();

	/* blocking wait for signal notification */
	spu_read_signal1();

	/* If SPU rank == 0, get the vector from main storage.
	 * Otherwise it already contains the values we need.
	 */
	if(spu.rank==0) {
		mfc_get(&v, spu.array_ea, 16, TAG, 0, 0);
		wait_for_completion();
	}

	/* multiply all elements by 2 */
	v = v * spu_splats((uint32_t)2);

	if(spu.rank==(spu.count - 1)) {
		/* last spu, send back to PPU */
		mfc_put(&v, spu.array_ea, 16, TAG, 0, 0);
		send_response(1);
	} else {
		/* write the result to local store of next SPU */
		uint64_t ea = SPU_THREAD_BASE + ((uint32_t)&v)
					+ SPU_THREAD_OFFSET * (spu.rank+1);
		mfc_put(&v, ea, 16, TAG, 0, 0);

		/* send signal to next spu */
		ea = SPU_THREAD_BASE + SPU_THREAD_Sig_Notify_1 + SPU_THREAD_OFFSET * (spu.rank+1);
		mfc_putf(((uint32_t*)&sig)+3, ea, 4, TAG, 0, 0);

		/* enqueue a sync command to ensure everything is actually 
		   written to destination before the thread is exited */
		mfc_sync(TAG);
	}
	wait_for_completion();

	/* properly exit the thread */
	spu_thread_exit(0);
	return 0;
}
