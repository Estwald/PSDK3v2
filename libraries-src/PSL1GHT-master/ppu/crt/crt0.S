#include <ppc-asm.h>

#define LOAD_DWORD(reg, sym)		\
	li		reg,(sym)@higher;		\
	oris	reg,reg,(sym)@highest;	\
	sldi	reg,reg,32;				\
	oris	reg,reg,(sym)@h;		\
	ori		reg,reg,(sym)@l
	
	.globl ._start
._start:
	LOAD_DWORD(r2,__libc_stack_end)
	std		r1,0(r2)
	mflr	r0
	stdu	r1,-128(r1)
	std		r0,112(r1)
	li		r2,0
	std		r2,0(r1)
	LOAD_DWORD(r2,__start)
	ld		r2,8(r2)
	bl		_initialize
	ld		r0,112(r1)
	addi	r1,r1,128
	mtlr	r0
	blr
	
	.section ".bss","aw"
	.globl __libc_stack_end
__libc_stack_end:
	.quad	0
	
	.section ".rodata","a"
	.globl _start
_start:
	.long ._start
	.long ._start
	.quad 0,0
	
	.section ".opd","aw"
__start:
	.quad ._start
	.quad .TOC.@tocbase
	.quad 0
