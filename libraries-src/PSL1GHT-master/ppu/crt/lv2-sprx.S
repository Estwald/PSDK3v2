	.align 2
	.section ".lib.ent","a"
	
	.align 2
	.section ".lib.stub","a"
	
	.align 2
	.section ".sys_proc_prx_param","a"
	.long 0x28
	.long 0x1b434cec
	.long 2
	.long 0
	.long __libentstart
	.long __libentend
	.long __libstubstart
	.long __libstubend
	.short 0x0101
	.short 0
	.long 0
	