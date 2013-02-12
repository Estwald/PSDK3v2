#ifndef __MEMORY_H__
#define __MEMORY_H__

#include <ppu-types.h>

void init_memory(void *addr,u32 size);
void* mem_alloc(u32 size);
void* mem_align(u32 alignment,u32 size);
void mem_free(void *ptr);

#endif
