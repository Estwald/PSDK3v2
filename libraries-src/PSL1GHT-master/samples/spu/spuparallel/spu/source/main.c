#include <spu_intrinsics.h>
#include <spu_mfcio.h>

#define TAG 1

#include "spustr.h"

extern void spu_thread_exit(uint32_t);

/* The effective address of the input structure */
uint64_t spu_ea;
/* A copy of the structure sent by ppu */
spustr_t spu __attribute__((aligned(16)));

/* wait for dma transfer to be finished */
static void wait_for_completion(void) {
	mfc_write_tag_mask(1<<TAG);
	spu_mfcstat(MFC_TAG_UPDATE_ALL);
}

static void send_response(uint32_t x) {
	spu.response = x;
	spu.sync = 1;
	/* send response to ppu variable */
	uint64_t ea = spu_ea + ((uint32_t)&spu.response) - ((uint32_t)&spu);
	mfc_put(&spu.response, ea, 4, TAG, 0, 0);
	/* send sync to ppu variable with fence (this ensures sync is written AFTER response) */
	ea = spu_ea + ((uint32_t)&spu.sync) - ((uint32_t)&spu);
	mfc_putf(&spu.sync, ea, 4, TAG, 0, 0);
}

int main(uint64_t arg1, uint64_t arg2, uint64_t arg3, uint64_t arg4) {
	/* get data structure */
	spu_ea = arg1;
	mfc_get(&spu, spu_ea, sizeof(spustr_t), TAG, 0, 0);
	wait_for_completion();

	/* blocking wait for signal notification */
	spu_read_signal1();

	/* read 4 integers, depending on spu rank */
	uint64_t ea = spu.array_ea + spu.rank*16;
	vec_uint4 v;
	mfc_get(&v, ea, 16, TAG, 0, 0);
	wait_for_completion();

	/* multiply all elements by 2 */
	v = v * spu_splats((uint32_t)2);

	/* write the result back */
	mfc_put(&v, ea, 16, TAG, 0, 0);
	/* no wait for completion here, as it's done after response message,
	  and the sync element is send with a fence so we're sure our array
	  share is written back before sync */

	/* send the response message */
	send_response(1);
	wait_for_completion();

	/* properly exit the thread */
	spu_thread_exit(0);
	return 0;
}
