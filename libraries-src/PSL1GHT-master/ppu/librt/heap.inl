#ifndef __HEAP_INL__
#define __HEAP_INL__

static __inline__ heap_block* __heap_head(heap_cntrl *theheap)
{
	return &theheap->free_list;
}

static __inline__ heap_block* __heap_tail(heap_cntrl *theheap)
{
	return &theheap->free_list;
}

static __inline__ heap_block* __heap_first(heap_cntrl *theheap)
{
	return __heap_head(theheap)->next;
}

static __inline__ heap_block* __heap_last(heap_cntrl *theheap)
{
	return __heap_tail(theheap)->prev;
}

static __inline__ void __heap_block_remove(heap_block *theblock)
{
	heap_block *block = theblock;
	heap_block *next = block->next;
	heap_block *prev = block->prev;
	prev->next = next;
	next->prev = prev;
}

static __inline__ void __heap_block_replace(heap_block *old_block,heap_block *new_block)
{
	heap_block *block = old_block;
	heap_block *next = block->next;
	heap_block *prev = block->prev;

	block = new_block;
	block->next = next;
	block->prev = prev;
	next->prev = prev->next = block;
}

static __inline__ void __heap_block_insert_after(heap_block *prev_block,heap_block *theblock)
{
	heap_block *prev = prev_block;
	heap_block *block = theblock;
	heap_block *next = prev->next;

	block->next = next;
	block->prev = prev;
	next->prev = prev->next = block;
}

static __inline__ void __heap_align_up_ptr(u64 *value,u32 alignment)
{
	u64 v = *value;
	u32 a = alignment;
	u32 r = v%a;
	*value = r ? (v - r + a) : v;
}

static __inline__ void __heap_align_up(u32 *value,u32 alignment)
{
	u32 v = *value;
	u32 a = alignment;
	u32 r = v%a;
	*value = r ? (v - r + a) : v;
}

static __inline__ void __heap_align_down_ptr(u64 *value,u32 alignment)
{
	u64 v = *value;
	*value = v - (v%alignment);
}

static __inline__ void __heap_align_down(u32 *value,u32 alignment)
{
	u32 v = *value;
	*value = v - (v%alignment);
}

static __inline__ heap_block* __heap_block_at(heap_block *block,u32 offset)
{
	return (heap_block*)((u64)block + offset);
}

static __inline__ void* __heap_block_user(heap_block *block)
{
	return (void*)((u64)block + HEAP_BLOCK_USER_OFFSET);
}

static __inline__ void __heap_block_start(heap_cntrl *theheap,void *base,heap_block **block)
{
	u64 addr = (u64)base;
	
	__heap_align_down_ptr(&addr,theheap->page_size);
	*block = (heap_block*)(addr - HEAP_BLOCK_USER_OFFSET);
}

static __inline__ bool __heap_prev_used(heap_block *block)
{
	return (block->size&HEAP_PREV_USED);
}

static __inline__ u32 __heap_block_size(heap_block *block)
{
	return (block->size&~HEAP_PREV_USED);
}

static __inline__ bool __heap_block_in(heap_cntrl *theheap,heap_block *block)
{
	return ((u64)block>=(u64)theheap->start && (u64)block<=(u64)theheap->final);
}



#endif
