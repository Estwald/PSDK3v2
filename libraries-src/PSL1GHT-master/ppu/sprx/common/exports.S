#include "config.h"
#include <ppc-asm.h>

	.align 2
	.section ".rodata.sceFNID","a"
	.globl LIBRARY_SYMBOL
LIBRARY_SYMBOL:

#define EXPORT(name,fnid)				\
	.align 2;							\
	.section ".sceStub.text","ax";		\
	.globl __##name;					\
__##name:								\
	mflr	r0;							\
	std		r0,16(r1);					\
	stdu	r1,-128(r1);				\
	std		r2,112(r1);					\
	lis		r12,name##_stub@ha;			\
	lwz		r12,name##_stub@l(r12);		\
	lwz		r0,0(r12);					\
	lwz		r2,4(r12);					\
	mtctr	r0;							\
	bctrl;								\
	ld		r2,112(r1);					\
	addi	r1,r1,128;					\
	ld		r0,16(r1);					\
	mtlr	r0;							\
	blr;								\
	.align 3;							\
	.section ".opd","aw";				\
	.globl name;						\
name:									\
	.quad __##name,.TOC.@tocbase,0

#include "exports.h"
