	.file	"libexport.c"
	.section	".got","aw"
	.section	".text"
	.section	.data.sceFStub.sys_fs,"aw",@progbits
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
	.size	name, 7
name:
	.string	"sys_fs"
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
	.4byte	sys_fs
	.4byte	scefstub
	.4byte	0
	.4byte	0
	.4byte	0
	.4byte	0
	.globl sysFsOpen_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsOpen_stub, @object
	.size	sysFsOpen_stub, 4
sysFsOpen_stub:
	.long	__sysFsOpen
	.globl sysFsOpen_fnid
	.section	.rodata.sceFNID,"a",@progbits
	.align 2
	.type	sysFsOpen_fnid, @object
	.size	sysFsOpen_fnid, 4
sysFsOpen_fnid:
	.long	1904997880
	.globl sysFsClose_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsClose_stub, @object
	.size	sysFsClose_stub, 4
sysFsClose_stub:
	.long	__sysFsClose
	.globl sysFsClose_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFsClose_fnid, @object
	.size	sysFsClose_fnid, 4
sysFsClose_fnid:
	.long	750067469
	.globl sysFsRead_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsRead_stub, @object
	.size	sysFsRead_stub, 4
sysFsRead_stub:
	.long	__sysFsRead
	.globl sysFsRead_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFsRead_fnid, @object
	.size	sysFsRead_fnid, 4
sysFsRead_fnid:
	.long	1298135266
	.globl sysFsWrite_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsWrite_stub, @object
	.size	sysFsWrite_stub, 4
sysFsWrite_stub:
	.long	__sysFsWrite
	.globl sysFsWrite_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFsWrite_fnid, @object
	.size	sysFsWrite_fnid, 4
sysFsWrite_fnid:
	.long	-321064277
	.globl sysFsLseek_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsLseek_stub, @object
	.size	sysFsLseek_stub, 4
sysFsLseek_stub:
	.long	__sysFsLseek
	.globl sysFsLseek_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFsLseek_fnid, @object
	.size	sysFsLseek_fnid, 4
sysFsLseek_fnid:
	.long	-1550331838
	.globl sysFsStat_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsStat_stub, @object
	.size	sysFsStat_stub, 4
sysFsStat_stub:
	.long	__sysFsStat
	.globl sysFsStat_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFsStat_fnid, @object
	.size	sysFsStat_fnid, 4
sysFsStat_fnid:
	.long	2112281837
	.globl sysFsFstat_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsFstat_stub, @object
	.size	sysFsFstat_stub, 4
sysFsFstat_stub:
	.long	__sysFsFstat
	.globl sysFsFstat_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFsFstat_fnid, @object
	.size	sysFsFstat_fnid, 4
sysFsFstat_fnid:
	.long	-281085388
	.globl sysFsChmod_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsChmod_stub, @object
	.size	sysFsChmod_stub, 4
sysFsChmod_stub:
	.long	__sysFsChmod
	.globl sysFsChmod_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFsChmod_fnid, @object
	.size	sysFsChmod_fnid, 4
sysFsChmod_fnid:
	.long	-1723831029
	.globl sysFsMkdir_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsMkdir_stub, @object
	.size	sysFsMkdir_stub, 4
sysFsMkdir_stub:
	.long	__sysFsMkdir
	.globl sysFsMkdir_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFsMkdir_fnid, @object
	.size	sysFsMkdir_fnid, 4
sysFsMkdir_fnid:
	.long	-1164959770
	.globl sysFsRmdir_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsRmdir_stub, @object
	.size	sysFsRmdir_stub, 4
sysFsRmdir_stub:
	.long	__sysFsRmdir
	.globl sysFsRmdir_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFsRmdir_fnid, @object
	.size	sysFsRmdir_fnid, 4
sysFsRmdir_fnid:
	.long	664206835
	.globl sysFsUnlink_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsUnlink_stub, @object
	.size	sysFsUnlink_stub, 4
sysFsUnlink_stub:
	.long	__sysFsUnlink
	.globl sysFsUnlink_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFsUnlink_fnid, @object
	.size	sysFsUnlink_fnid, 4
sysFsUnlink_fnid:
	.long	2135324584
	.globl sysFsOpendir_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsOpendir_stub, @object
	.size	sysFsOpendir_stub, 4
sysFsOpendir_stub:
	.long	__sysFsOpendir
	.globl sysFsOpendir_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFsOpendir_fnid, @object
	.size	sysFsOpendir_fnid, 4
sysFsOpendir_fnid:
	.long	1063330908
	.globl sysFsClosedir_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsClosedir_stub, @object
	.size	sysFsClosedir_stub, 4
sysFsClosedir_stub:
	.long	__sysFsClosedir
	.globl sysFsClosedir_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFsClosedir_fnid, @object
	.size	sysFsClosedir_fnid, 4
sysFsClosedir_fnid:
	.long	-12395325
	.globl sysFsReaddir_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsReaddir_stub, @object
	.size	sysFsReaddir_stub, 4
sysFsReaddir_stub:
	.long	__sysFsReaddir
	.globl sysFsReaddir_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFsReaddir_fnid, @object
	.size	sysFsReaddir_fnid, 4
sysFsReaddir_fnid:
	.long	1551142973
	.globl sysFsAioInit_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsAioInit_stub, @object
	.size	sysFsAioInit_stub, 4
sysFsAioInit_stub:
	.long	__sysFsAioInit
	.globl sysFsAioInit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFsAioInit_fnid, @object
	.size	sysFsAioInit_fnid, 4
sysFsAioInit_fnid:
	.long	-611934432
	.globl sysFsAioReadEx_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsAioReadEx_stub, @object
	.size	sysFsAioReadEx_stub, 4
sysFsAioReadEx_stub:
	.long	__sysFsAioReadEx
	.globl sysFsAioReadEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFsAioReadEx_fnid, @object
	.size	sysFsAioReadEx_fnid, 4
sysFsAioReadEx_fnid:
	.long	-1044051993
	.globl sysFsAioWriteEx_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsAioWriteEx_stub, @object
	.size	sysFsAioWriteEx_stub, 4
sysFsAioWriteEx_stub:
	.long	__sysFsAioWriteEx
	.globl sysFsAioWriteEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFsAioWriteEx_fnid, @object
	.size	sysFsAioWriteEx_fnid, 4
sysFsAioWriteEx_fnid:
	.long	1290744878
	.globl sysFsAioCancel_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsAioCancel_stub, @object
	.size	sysFsAioCancel_stub, 4
sysFsAioCancel_stub:
	.long	__sysFsAioCancel
	.globl sysFsAioCancel_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFsAioCancel_fnid, @object
	.size	sysFsAioCancel_fnid, 4
sysFsAioCancel_fnid:
	.long	2132016268
	.globl sysFsAioFinish_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsAioFinish_stub, @object
	.size	sysFsAioFinish_stub, 4
sysFsAioFinish_stub:
	.long	__sysFsAioFinish
	.globl sysFsAioFinish_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFsAioFinish_fnid, @object
	.size	sysFsAioFinish_fnid, 4
sysFsAioFinish_fnid:
	.long	-1617618928
	.globl sysFsGetFreeSize_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsGetFreeSize_stub, @object
	.size	sysFsGetFreeSize_stub, 4
sysFsGetFreeSize_stub:
	.long	__sysFsGetFreeSize
	.globl sysFsGetFreeSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFsGetFreeSize_fnid, @object
	.size	sysFsGetFreeSize_fnid, 4
sysFsGetFreeSize_fnid:
	.long	-1438954547
	.globl sysFsSetIoBuffer_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsSetIoBuffer_stub, @object
	.size	sysFsSetIoBuffer_stub, 4
sysFsSetIoBuffer_stub:
	.long	__sysFsSetIoBuffer
	.globl sysFsSetIoBuffer_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFsSetIoBuffer_fnid, @object
	.size	sysFsSetIoBuffer_fnid, 4
sysFsSetIoBuffer_fnid:
	.long	826341089
	.globl sysFsSetDefaultContainer_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsSetDefaultContainer_stub, @object
	.size	sysFsSetDefaultContainer_stub, 4
sysFsSetDefaultContainer_stub:
	.long	__sysFsSetDefaultContainer
	.globl sysFsSetDefaultContainer_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFsSetDefaultContainer_fnid, @object
	.size	sysFsSetDefaultContainer_fnid, 4
sysFsSetDefaultContainer_fnid:
	.long	40309520
	.globl sysFsSetIoBufferFromDefaultContainer_stub
	.section	.data.sceFStub.sys_fs
	.align 2
	.type	sysFsSetIoBufferFromDefaultContainer_stub, @object
	.size	sysFsSetIoBufferFromDefaultContainer_stub, 4
sysFsSetIoBufferFromDefaultContainer_stub:
	.long	__sysFsSetIoBufferFromDefaultContainer
	.globl sysFsSetIoBufferFromDefaultContainer_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFsSetIoBufferFromDefaultContainer_fnid, @object
	.size	sysFsSetIoBufferFromDefaultContainer_fnid, 4
sysFsSetIoBufferFromDefaultContainer_fnid:
	.long	1978756549
	.ident	"GCC: (GNU) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
