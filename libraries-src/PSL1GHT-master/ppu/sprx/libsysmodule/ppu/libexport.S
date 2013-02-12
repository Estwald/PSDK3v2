	.file	"libexport.c"
	.section	".got","aw"
	.section	".text"
	.section	.data.sceFStub.cellSysmodule,"aw",@progbits
	.align 2
	.type	scefstub, @object
	.size	scefstub, 0
scefstub:
	.section	.rodata.sceResident,"a",@progbits
	.align 2
	.type	version, @object
	.size	version, 4
version:
	.zero	4
	.align 2
	.type	name, @object
	.size	name, 14
name:
	.string	"cellSysmodule"
	.section	.lib.stub,"aw",@progbits
	.type	header, @object
	.size	header, 44
header:
	.4byte	738197505
	.2byte	9
	.2byte	0
	.4byte	0
	.4byte	0
	.4byte	name
	.4byte	cellSysmodule
	.4byte	scefstub
	.4byte	0
	.4byte	0
	.4byte	0
	.4byte	0
	.globl sysModuleInitialize_stub
	.section	.data.sceFStub.cellSysmodule
	.align 2
	.type	sysModuleInitialize_stub, @object
	.size	sysModuleInitialize_stub, 4
sysModuleInitialize_stub:
	.long	__sysModuleInitialize
	.globl sysModuleInitialize_fnid
	.section	.rodata.sceFNID,"a",@progbits
	.align 2
	.type	sysModuleInitialize_fnid, @object
	.size	sysModuleInitialize_fnid, 4
sysModuleInitialize_fnid:
	.long	1677684729
	.globl sysModuleFinalize_stub
	.section	.data.sceFStub.cellSysmodule
	.align 2
	.type	sysModuleFinalize_stub, @object
	.size	sysModuleFinalize_stub, 4
sysModuleFinalize_stub:
	.long	__sysModuleFinalize
	.globl sysModuleFinalize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysModuleFinalize_fnid, @object
	.size	sysModuleFinalize_fnid, 4
sysModuleFinalize_fnid:
	.long	-1765770529
	.globl sysModuleLoad_stub
	.section	.data.sceFStub.cellSysmodule
	.align 2
	.type	sysModuleLoad_stub, @object
	.size	sysModuleLoad_stub, 4
sysModuleLoad_stub:
	.long	__sysModuleLoad
	.globl sysModuleLoad_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysModuleLoad_fnid, @object
	.size	sysModuleLoad_fnid, 4
sysModuleLoad_fnid:
	.long	841382449
	.globl sysModuleUnload_stub
	.section	.data.sceFStub.cellSysmodule
	.align 2
	.type	sysModuleUnload_stub, @object
	.size	sysModuleUnload_stub, 4
sysModuleUnload_stub:
	.long	__sysModuleUnload
	.globl sysModuleUnload_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysModuleUnload_fnid, @object
	.size	sysModuleUnload_fnid, 4
sysModuleUnload_fnid:
	.long	287989481
	.globl sysModuleIsLoaded_stub
	.section	.data.sceFStub.cellSysmodule
	.align 2
	.type	sysModuleIsLoaded_stub, @object
	.size	sysModuleIsLoaded_stub, 4
sysModuleIsLoaded_stub:
	.long	__sysModuleIsLoaded
	.globl sysModuleIsLoaded_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysModuleIsLoaded_fnid, @object
	.size	sysModuleIsLoaded_fnid, 4
sysModuleIsLoaded_fnid:
	.long	1515840088
	.globl sysModuleGetImagesize_stub
	.section	.data.sceFStub.cellSysmodule
	.align 2
	.type	sysModuleGetImagesize_stub, @object
	.size	sysModuleGetImagesize_stub, 4
sysModuleGetImagesize_stub:
	.long	__sysModuleGetImagesize
	.globl sysModuleGetImagesize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysModuleGetImagesize_fnid, @object
	.size	sysModuleGetImagesize_fnid, 4
sysModuleGetImagesize_fnid:
	.long	519116271
	.globl sysModuleFetchImage_stub
	.section	.data.sceFStub.cellSysmodule
	.align 2
	.type	sysModuleFetchImage_stub, @object
	.size	sysModuleFetchImage_stub, 4
sysModuleFetchImage_stub:
	.long	__sysModuleFetchImage
	.globl sysModuleFetchImage_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysModuleFetchImage_fnid, @object
	.size	sysModuleFetchImage_fnid, 4
sysModuleFetchImage_fnid:
	.long	1016249865
	.globl sysModuleSetMemcontainer_stub
	.section	.data.sceFStub.cellSysmodule
	.align 2
	.type	sysModuleSetMemcontainer_stub, @object
	.size	sysModuleSetMemcontainer_stub, 4
sysModuleSetMemcontainer_stub:
	.long	__sysModuleSetMemcontainer
	.globl sysModuleSetMemcontainer_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysModuleSetMemcontainer_fnid, @object
	.size	sysModuleSetMemcontainer_fnid, 4
sysModuleSetMemcontainer_fnid:
	.long	-1584196548
	.ident	"GCC: (GNU) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
