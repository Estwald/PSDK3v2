#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>

#include <sys/spu.h>

#include "spu_bin.h"

#define ptr2ea(x)			((u64)((void*)(x)))

static vu32 spu_result __attribute__((aligned(128))) = 0;
static char spu_text[] __attribute__((aligned(128))) = "abCdefGhIJklMnOP";

int main(int argc,char *argv[])
{
	u32 cause,status;
	sysSpuImage image;
	u32 thread_id,group_id;
	sysSpuThreadArgument arg = { 0, 0, 0, 0 };
	sysSpuThreadGroupAttribute grpattr = { 7+1, ptr2ea("mygroup"), 0, 0 };
	sysSpuThreadAttribute attr = { ptr2ea("mythread"), 8+1, SPU_THREAD_ATTR_NONE };

	printf("spudma starting....\n");

	sysSpuInitialize(6,0);
	sysSpuImageImport(&image,spu_bin,0);
	sysSpuThreadGroupCreate(&group_id,1,100,&grpattr);

	printf("input text: %s\n",spu_text);

	arg.arg0 = ptr2ea(spu_text);
	arg.arg1 = ptr2ea(&spu_result);
	sysSpuThreadInitialize(&thread_id,group_id,0,&image,&attr,&arg);


	printf("Starting SPU thread group....\n");
	sysSpuThreadGroupStart(group_id);

	printf("Waiting for SPU to return....\n");
	while(spu_result==0);

	sysSpuThreadGroupJoin(group_id,&cause,&status);
	sysSpuImageClose(&image);

	printf("output text: %s\n",spu_text);

	return 0;
}
