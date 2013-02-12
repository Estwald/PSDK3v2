	.file	"libexport.c"
	.section	".got","aw"
	.section	".text"
	.section	.data.sceFStub.cellNetCtl,"aw",@progbits
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
	.size	name, 11
name:
	.string	"cellNetCtl"
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
	.4byte	cellNetCtl
	.4byte	scefstub
	.4byte	0
	.4byte	0
	.4byte	0
	.4byte	0
	.globl netCtlInit_stub
	.section	.data.sceFStub.cellNetCtl
	.align 2
	.type	netCtlInit_stub, @object
	.size	netCtlInit_stub, 4
netCtlInit_stub:
	.long	__netCtlInit
	.globl netCtlInit_fnid
	.section	.rodata.sceFNID,"a",@progbits
	.align 2
	.type	netCtlInit_fnid, @object
	.size	netCtlInit_fnid, 4
netCtlInit_fnid:
	.long	-1118152196
	.globl netCtlTerm_stub
	.section	.data.sceFStub.cellNetCtl
	.align 2
	.type	netCtlTerm_stub, @object
	.size	netCtlTerm_stub, 4
netCtlTerm_stub:
	.long	__netCtlTerm
	.globl netCtlTerm_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netCtlTerm_fnid, @object
	.size	netCtlTerm_fnid, 4
netCtlTerm_fnid:
	.long	274653899
	.globl netCtlGetInfo_stub
	.section	.data.sceFStub.cellNetCtl
	.align 2
	.type	netCtlGetInfo_stub, @object
	.size	netCtlGetInfo_stub, 4
netCtlGetInfo_stub:
	.long	__netCtlGetInfo
	.globl netCtlGetInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netCtlGetInfo_fnid, @object
	.size	netCtlGetInfo_fnid, 4
netCtlGetInfo_fnid:
	.long	509107037
	.globl netCtlGetNatInfo_stub
	.section	.data.sceFStub.cellNetCtl
	.align 2
	.type	netCtlGetNatInfo_stub, @object
	.size	netCtlGetNatInfo_stub, 4
netCtlGetNatInfo_stub:
	.long	__netCtlGetNatInfo
	.globl netCtlGetNatInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netCtlGetNatInfo_fnid, @object
	.size	netCtlGetNatInfo_fnid, 4
netCtlGetNatInfo_fnid:
	.long	974292575
	.globl netCtlGetState_stub
	.section	.data.sceFStub.cellNetCtl
	.align 2
	.type	netCtlGetState_stub, @object
	.size	netCtlGetState_stub, 4
netCtlGetState_stub:
	.long	__netCtlGetState
	.globl netCtlGetState_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netCtlGetState_fnid, @object
	.size	netCtlGetState_fnid, 4
netCtlGetState_fnid:
	.long	-1958823319
	.globl netCtlAddHandler_stub
	.section	.data.sceFStub.cellNetCtl
	.align 2
	.type	netCtlAddHandler_stub, @object
	.size	netCtlAddHandler_stub, 4
netCtlAddHandler_stub:
	.long	__netCtlAddHandler
	.globl netCtlAddHandler_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netCtlAddHandler_fnid, @object
	.size	netCtlAddHandler_fnid, 4
netCtlAddHandler_fnid:
	.long	216087659
	.globl netCtlDelHandler_stub
	.section	.data.sceFStub.cellNetCtl
	.align 2
	.type	netCtlDelHandler_stub, @object
	.size	netCtlDelHandler_stub, 4
netCtlDelHandler_stub:
	.long	__netCtlDelHandler
	.globl netCtlDelHandler_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netCtlDelHandler_fnid, @object
	.size	netCtlDelHandler_fnid, 4
netCtlDelHandler_fnid:
	.long	-1877469757
	.globl netCtlNetStartDialogLoadAsync_stub
	.section	.data.sceFStub.cellNetCtl
	.align 2
	.type	netCtlNetStartDialogLoadAsync_stub, @object
	.size	netCtlNetStartDialogLoadAsync_stub, 4
netCtlNetStartDialogLoadAsync_stub:
	.long	__netCtlNetStartDialogLoadAsync
	.globl netCtlNetStartDialogLoadAsync_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netCtlNetStartDialogLoadAsync_fnid, @object
	.size	netCtlNetStartDialogLoadAsync_fnid, 4
netCtlNetStartDialogLoadAsync_fnid:
	.long	71668272
	.globl netCtlNetStartDialogUnloadAsync_stub
	.section	.data.sceFStub.cellNetCtl
	.align 2
	.type	netCtlNetStartDialogUnloadAsync_stub, @object
	.size	netCtlNetStartDialogUnloadAsync_stub, 4
netCtlNetStartDialogUnloadAsync_stub:
	.long	__netCtlNetStartDialogUnloadAsync
	.globl netCtlNetStartDialogUnloadAsync_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netCtlNetStartDialogUnloadAsync_fnid, @object
	.size	netCtlNetStartDialogUnloadAsync_fnid, 4
netCtlNetStartDialogUnloadAsync_fnid:
	.long	253694931
	.globl netCtlNetStartDialogAbortAsync_stub
	.section	.data.sceFStub.cellNetCtl
	.align 2
	.type	netCtlNetStartDialogAbortAsync_stub, @object
	.size	netCtlNetStartDialogAbortAsync_stub, 4
netCtlNetStartDialogAbortAsync_stub:
	.long	__netCtlNetStartDialogAbortAsync
	.globl netCtlNetStartDialogAbortAsync_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netCtlNetStartDialogAbortAsync_fnid, @object
	.size	netCtlNetStartDialogAbortAsync_fnid, 4
netCtlNetStartDialogAbortAsync_fnid:
	.long	1909797392
	.globl netCtlGameUpdateInit_stub
	.section	.data.sceFStub.cellNetCtl
	.align 2
	.type	netCtlGameUpdateInit_stub, @object
	.size	netCtlGameUpdateInit_stub, 4
netCtlGameUpdateInit_stub:
	.long	__netCtlGameUpdateInit
	.globl netCtlGameUpdateInit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netCtlGameUpdateInit_fnid, @object
	.size	netCtlGameUpdateInit_fnid, 4
netCtlGameUpdateInit_fnid:
	.long	-1716839898
	.globl netCtlGameUpdateTerm_stub
	.section	.data.sceFStub.cellNetCtl
	.align 2
	.type	netCtlGameUpdateTerm_stub, @object
	.size	netCtlGameUpdateTerm_stub, 4
netCtlGameUpdateTerm_stub:
	.long	__netCtlGameUpdateTerm
	.globl netCtlGameUpdateTerm_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netCtlGameUpdateTerm_fnid, @object
	.size	netCtlGameUpdateTerm_fnid, 4
netCtlGameUpdateTerm_fnid:
	.long	282781037
	.globl netCtlGameUpdateCheckAbort_stub
	.section	.data.sceFStub.cellNetCtl
	.align 2
	.type	netCtlGameUpdateCheckAbort_stub, @object
	.size	netCtlGameUpdateCheckAbort_stub, 4
netCtlGameUpdateCheckAbort_stub:
	.long	__netCtlGameUpdateCheckAbort
	.globl netCtlGameUpdateCheckAbort_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netCtlGameUpdateCheckAbort_fnid, @object
	.size	netCtlGameUpdateCheckAbort_fnid, 4
netCtlGameUpdateCheckAbort_fnid:
	.long	1043700406
	.globl netCtlGameUpdateCheckStartAsync_stub
	.section	.data.sceFStub.cellNetCtl
	.align 2
	.type	netCtlGameUpdateCheckStartAsync_stub, @object
	.size	netCtlGameUpdateCheckStartAsync_stub, 4
netCtlGameUpdateCheckStartAsync_stub:
	.long	__netCtlGameUpdateCheckStartAsync
	.globl netCtlGameUpdateCheckStartAsync_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netCtlGameUpdateCheckStartAsync_fnid, @object
	.size	netCtlGameUpdateCheckStartAsync_fnid, 4
netCtlGameUpdateCheckStartAsync_fnid:
	.long	-794437849
	.globl netCtlGameUpdateCheckStartAsyncEx_stub
	.section	.data.sceFStub.cellNetCtl
	.align 2
	.type	netCtlGameUpdateCheckStartAsyncEx_stub, @object
	.size	netCtlGameUpdateCheckStartAsyncEx_stub, 4
netCtlGameUpdateCheckStartAsyncEx_stub:
	.long	__netCtlGameUpdateCheckStartAsyncEx
	.globl netCtlGameUpdateCheckStartAsyncEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netCtlGameUpdateCheckStartAsyncEx_fnid, @object
	.size	netCtlGameUpdateCheckStartAsyncEx_fnid, 4
netCtlGameUpdateCheckStartAsyncEx_fnid:
	.long	126943583
	.globl netCtlGameUpdateCheckStartWithoutDialogAsync_stub
	.section	.data.sceFStub.cellNetCtl
	.align 2
	.type	netCtlGameUpdateCheckStartWithoutDialogAsync_stub, @object
	.size	netCtlGameUpdateCheckStartWithoutDialogAsync_stub, 4
netCtlGameUpdateCheckStartWithoutDialogAsync_stub:
	.long	__netCtlGameUpdateCheckStartWithoutDialogAsync
	.globl netCtlGameUpdateCheckStartWithoutDialogAsync_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netCtlGameUpdateCheckStartWithoutDialogAsync_fnid, @object
	.size	netCtlGameUpdateCheckStartWithoutDialogAsync_fnid, 4
netCtlGameUpdateCheckStartWithoutDialogAsync_fnid:
	.long	-1511916960
	.globl netCtlGameUpdateCheckStartWithoutDialogAsyncEx_stub
	.section	.data.sceFStub.cellNetCtl
	.align 2
	.type	netCtlGameUpdateCheckStartWithoutDialogAsyncEx_stub, @object
	.size	netCtlGameUpdateCheckStartWithoutDialogAsyncEx_stub, 4
netCtlGameUpdateCheckStartWithoutDialogAsyncEx_stub:
	.long	__netCtlGameUpdateCheckStartWithoutDialogAsyncEx
	.globl netCtlGameUpdateCheckStartWithoutDialogAsyncEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netCtlGameUpdateCheckStartWithoutDialogAsyncEx_fnid, @object
	.size	netCtlGameUpdateCheckStartWithoutDialogAsyncEx_fnid, 4
netCtlGameUpdateCheckStartWithoutDialogAsyncEx_fnid:
	.long	1434910966
	.globl netCtlGameUpdateCheckFinishAsync_stub
	.section	.data.sceFStub.cellNetCtl
	.align 2
	.type	netCtlGameUpdateCheckFinishAsync_stub, @object
	.size	netCtlGameUpdateCheckFinishAsync_stub, 4
netCtlGameUpdateCheckFinishAsync_stub:
	.long	__netCtlGameUpdateCheckFinishAsync
	.globl netCtlGameUpdateCheckFinishAsync_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netCtlGameUpdateCheckFinishAsync_fnid, @object
	.size	netCtlGameUpdateCheckFinishAsync_fnid, 4
netCtlGameUpdateCheckFinishAsync_fnid:
	.long	-6039663
	.globl netCtlGameUpdateCheckFinishAsyncEx_stub
	.section	.data.sceFStub.cellNetCtl
	.align 2
	.type	netCtlGameUpdateCheckFinishAsyncEx_stub, @object
	.size	netCtlGameUpdateCheckFinishAsyncEx_stub, 4
netCtlGameUpdateCheckFinishAsyncEx_stub:
	.long	__netCtlGameUpdateCheckFinishAsyncEx
	.globl netCtlGameUpdateCheckFinishAsyncEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netCtlGameUpdateCheckFinishAsyncEx_fnid, @object
	.size	netCtlGameUpdateCheckFinishAsyncEx_fnid, 4
netCtlGameUpdateCheckFinishAsyncEx_fnid:
	.long	-194799588
	.ident	"GCC: (GNU) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
