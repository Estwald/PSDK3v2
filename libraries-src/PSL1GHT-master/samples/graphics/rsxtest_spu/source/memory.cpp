#include <stdlib.h>
#include <ppu-types.h>

#include <sys/heap.h>

#include "memory.h"

static u32 heap_init = 0;
static heap_cntrl __main_heap;

void init_memory(void *addr,u32 size)
{
	if(!heap_init) {
		heapInit(&__main_heap,addr,size);
		heap_init = 1;
	}
}

void* mem_alloc(u32 size)
{
	if(!heap_init) return NULL;
	return heapAllocate(&__main_heap,size);
}

void* mem_align(u32 alignment,u32 size)
{
	if(!heap_init) return NULL;
	return heapAllocateAligned(&__main_heap,size,alignment);
}

void mem_free(void *ptr)
{
	if(!heap_init) return;
	heapFree(&__main_heap,ptr);
}
