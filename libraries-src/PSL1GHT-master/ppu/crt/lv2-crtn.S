#include <ppc-asm.h>

	.section ".init","ax"
	addi	r1,r1,128
	ld		r0,16(r1)
	mtlr	r0
	blr
	
	.section ".fini","ax"
	addi	r1,r1,128
	ld		r0,16(r1)
	mtlr	r0
	blr
	