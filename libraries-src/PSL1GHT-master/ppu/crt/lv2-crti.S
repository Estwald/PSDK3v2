#include <ppc-asm.h>

	.section ".opd","ax"
	.globl _init
_init:
	.quad ._init,.TOC.@tocbase,0
	
	.section ".init","ax"
	.globl ._init
._init:
	mflr	r0
	std		r0,16(r1)
	stdu	r1,-128(r1)
	
	.section ".opd","ax"
	.globl _fini
_fini:
	.quad ._fini,.TOC.@tocbase,0
	
	.section ".fini","ax"
	.globl ._fini
._fini:
	mflr	r0
	std		r0,16(r1)
	stdu	r1,-128(r1)
	