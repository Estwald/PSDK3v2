	.file	"libexport.c"
	.section	".got","aw"
	.section	".text"
	.section	.data.sceFStub.cellResc,"aw",@progbits
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
	.size	name, 9
name:
	.string	"cellResc"
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
	.4byte	cellResc
	.4byte	scefstub
	.4byte	0
	.4byte	0
	.4byte	0
	.4byte	0
	.globl rescGcmSurface2RescSrc_stub
	.section	.data.sceFStub.cellResc
	.align 2
	.type	rescGcmSurface2RescSrc_stub, @object
	.size	rescGcmSurface2RescSrc_stub, 4
rescGcmSurface2RescSrc_stub:
	.long	__rescGcmSurface2RescSrc
	.globl rescGcmSurface2RescSrc_fnid
	.section	.rodata.sceFNID,"a",@progbits
	.align 2
	.type	rescGcmSurface2RescSrc_fnid, @object
	.size	rescGcmSurface2RescSrc_fnid, 4
rescGcmSurface2RescSrc_fnid:
	.long	19005988
	.globl rescGetNumColorBuffers_stub
	.section	.data.sceFStub.cellResc
	.align 2
	.type	rescGetNumColorBuffers_stub, @object
	.size	rescGetNumColorBuffers_stub, 4
rescGetNumColorBuffers_stub:
	.long	__rescGetNumColorBuffers
	.globl rescGetNumColorBuffers_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	rescGetNumColorBuffers_fnid, @object
	.size	rescGetNumColorBuffers_fnid, 4
rescGetNumColorBuffers_fnid:
	.long	169896391
	.globl rescSetWaitFlip_stub
	.section	.data.sceFStub.cellResc
	.align 2
	.type	rescSetWaitFlip_stub, @object
	.size	rescSetWaitFlip_stub, 4
rescSetWaitFlip_stub:
	.long	__rescSetWaitFlip
	.globl rescSetWaitFlip_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	rescSetWaitFlip_fnid, @object
	.size	rescSetWaitFlip_fnid, 4
rescSetWaitFlip_fnid:
	.long	222044878
	.globl rescSetDsts_stub
	.section	.data.sceFStub.cellResc
	.align 2
	.type	rescSetDsts_stub, @object
	.size	rescSetDsts_stub, 4
rescSetDsts_stub:
	.long	__rescSetDsts
	.globl rescSetDsts_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	rescSetDsts_fnid, @object
	.size	rescSetDsts_fnid, 4
rescSetDsts_fnid:
	.long	282811162
	.globl rescResetFlipStatus_stub
	.section	.data.sceFStub.cellResc
	.align 2
	.type	rescResetFlipStatus_stub, @object
	.size	rescResetFlipStatus_stub, 4
rescResetFlipStatus_stub:
	.long	__rescResetFlipStatus
	.globl rescResetFlipStatus_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	rescResetFlipStatus_fnid, @object
	.size	rescResetFlipStatus_fnid, 4
rescResetFlipStatus_fnid:
	.long	312025760
	.globl rescSetPalInterpolateDropFlexRatio_stub
	.section	.data.sceFStub.cellResc
	.align 2
	.type	rescSetPalInterpolateDropFlexRatio_stub, @object
	.size	rescSetPalInterpolateDropFlexRatio_stub, 4
rescSetPalInterpolateDropFlexRatio_stub:
	.long	__rescSetPalInterpolateDropFlexRatio
	.globl rescSetPalInterpolateDropFlexRatio_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	rescSetPalInterpolateDropFlexRatio_fnid, @object
	.size	rescSetPalInterpolateDropFlexRatio_fnid, 4
rescSetPalInterpolateDropFlexRatio_fnid:
	.long	430090599
	.globl rescGetRegisterCount_stub
	.section	.data.sceFStub.cellResc
	.align 2
	.type	rescGetRegisterCount_stub, @object
	.size	rescGetRegisterCount_stub, 4
rescGetRegisterCount_stub:
	.long	__rescGetRegisterCount
	.globl rescGetRegisterCount_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	rescGetRegisterCount_fnid, @object
	.size	rescGetRegisterCount_fnid, 4
rescGetRegisterCount_fnid:
	.long	500417741
	.globl rescAdjustAspectRatio_stub
	.section	.data.sceFStub.cellResc
	.align 2
	.type	rescAdjustAspectRatio_stub, @object
	.size	rescAdjustAspectRatio_stub, 4
rescAdjustAspectRatio_stub:
	.long	__rescAdjustAspectRatio
	.globl rescAdjustAspectRatio_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	rescAdjustAspectRatio_fnid, @object
	.size	rescAdjustAspectRatio_fnid, 4
rescAdjustAspectRatio_fnid:
	.long	581830360
	.globl rescSetDisplayMode_stub
	.section	.data.sceFStub.cellResc
	.align 2
	.type	rescSetDisplayMode_stub, @object
	.size	rescSetDisplayMode_stub, 4
rescSetDisplayMode_stub:
	.long	__rescSetDisplayMode
	.globl rescSetDisplayMode_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	rescSetDisplayMode_fnid, @object
	.size	rescSetDisplayMode_fnid, 4
rescSetDisplayMode_fnid:
	.long	588465936
	.globl rescSetConvertAndFlip_stub
	.section	.data.sceFStub.cellResc
	.align 2
	.type	rescSetConvertAndFlip_stub, @object
	.size	rescSetConvertAndFlip_stub, 4
rescSetConvertAndFlip_stub:
	.long	__rescSetConvertAndFlip
	.globl rescSetConvertAndFlip_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	rescSetConvertAndFlip_fnid, @object
	.size	rescSetConvertAndFlip_fnid, 4
rescSetConvertAndFlip_fnid:
	.long	633407462
	.globl rescExit_stub
	.section	.data.sceFStub.cellResc
	.align 2
	.type	rescExit_stub, @object
	.size	rescExit_stub, 4
rescExit_stub:
	.long	__rescExit
	.globl rescExit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	rescExit_fnid, @object
	.size	rescExit_fnid, 4
rescExit_fnid:
	.long	782435870
	.globl rescSetFlipHandlerEx_stub
	.section	.data.sceFStub.cellResc
	.align 2
	.type	rescSetFlipHandlerEx_stub, @object
	.size	rescSetFlipHandlerEx_stub, 4
rescSetFlipHandlerEx_stub:
	.long	__rescSetFlipHandlerEx
	.globl rescSetFlipHandlerEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	rescSetFlipHandlerEx_fnid, @object
	.size	rescSetFlipHandlerEx_fnid, 4
rescSetFlipHandlerEx_fnid:
	.long	782845537
	.globl rescInit_stub
	.section	.data.sceFStub.cellResc
	.align 2
	.type	rescInit_stub, @object
	.size	rescInit_stub, 4
rescInit_stub:
	.long	__rescInit
	.globl rescInit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	rescInit_fnid, @object
	.size	rescInit_fnid, 4
rescInit_fnid:
	.long	1366223006
	.globl rescGetBufferSize_stub
	.section	.data.sceFStub.cellResc
	.align 2
	.type	rescGetBufferSize_stub, @object
	.size	rescGetBufferSize_stub, 4
rescGetBufferSize_stub:
	.long	__rescGetBufferSize
	.globl rescGetBufferSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	rescGetBufferSize_fnid, @object
	.size	rescGetBufferSize_fnid, 4
rescGetBufferSize_fnid:
	.long	1513327835
	.globl rescGetLastFlipTime_stub
	.section	.data.sceFStub.cellResc
	.align 2
	.type	rescGetLastFlipTime_stub, @object
	.size	rescGetLastFlipTime_stub, 4
rescGetLastFlipTime_stub:
	.long	__rescGetLastFlipTime
	.globl rescGetLastFlipTime_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	rescGetLastFlipTime_fnid, @object
	.size	rescGetLastFlipTime_fnid, 4
rescGetLastFlipTime_fnid:
	.long	1727390600
	.globl rescSetSrc_stub
	.section	.data.sceFStub.cellResc
	.align 2
	.type	rescSetSrc_stub, @object
	.size	rescSetSrc_stub, 4
rescSetSrc_stub:
	.long	__rescSetSrc
	.globl rescSetSrc_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	rescSetSrc_fnid, @object
	.size	rescSetSrc_fnid, 4
rescSetSrc_fnid:
	.long	1825634655
	.globl rescSetRegisterCount_stub
	.section	.data.sceFStub.cellResc
	.align 2
	.type	rescSetRegisterCount_stub, @object
	.size	rescSetRegisterCount_stub, 4
rescSetRegisterCount_stub:
	.long	__rescSetRegisterCount
	.globl rescSetRegisterCount_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	rescSetRegisterCount_fnid, @object
	.size	rescSetRegisterCount_fnid, 4
rescSetRegisterCount_fnid:
	.long	2063115135
	.globl rescSetBufferAddress_stub
	.section	.data.sceFStub.cellResc
	.align 2
	.type	rescSetBufferAddress_stub, @object
	.size	rescSetBufferAddress_stub, 4
rescSetBufferAddress_stub:
	.long	__rescSetBufferAddress
	.globl rescSetBufferAddress_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	rescSetBufferAddress_fnid, @object
	.size	rescSetBufferAddress_fnid, 4
rescSetBufferAddress_fnid:
	.long	-2130237572
	.globl rescGetFlipStatus_stub
	.section	.data.sceFStub.cellResc
	.align 2
	.type	rescGetFlipStatus_stub, @object
	.size	rescGetFlipStatus_stub, 4
rescGetFlipStatus_stub:
	.long	__rescGetFlipStatus
	.globl rescGetFlipStatus_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	rescGetFlipStatus_fnid, @object
	.size	rescGetFlipStatus_fnid, 4
rescGetFlipStatus_fnid:
	.long	-998482910
	.globl rescVideoResolution2RescBufferMode_stub
	.section	.data.sceFStub.cellResc
	.align 2
	.type	rescVideoResolution2RescBufferMode_stub, @object
	.size	rescVideoResolution2RescBufferMode_stub, 4
rescVideoResolution2RescBufferMode_stub:
	.long	__rescVideoResolution2RescBufferMode
	.globl rescVideoResolution2RescBufferMode_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	rescVideoResolution2RescBufferMode_fnid, @object
	.size	rescVideoResolution2RescBufferMode_fnid, 4
rescVideoResolution2RescBufferMode_fnid:
	.long	-775289597
	.globl rescSetVBlankHandlerEx_stub
	.section	.data.sceFStub.cellResc
	.align 2
	.type	rescSetVBlankHandlerEx_stub, @object
	.size	rescSetVBlankHandlerEx_stub, 4
rescSetVBlankHandlerEx_stub:
	.long	__rescSetVBlankHandlerEx
	.globl rescSetVBlankHandlerEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	rescSetVBlankHandlerEx_fnid, @object
	.size	rescSetVBlankHandlerEx_fnid, 4
rescSetVBlankHandlerEx_fnid:
	.long	-747272635
	.globl rescCreateInterlaceTable_stub
	.section	.data.sceFStub.cellResc
	.align 2
	.type	rescCreateInterlaceTable_stub, @object
	.size	rescCreateInterlaceTable_stub, 4
rescCreateInterlaceTable_stub:
	.long	__rescCreateInterlaceTable
	.globl rescCreateInterlaceTable_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	rescCreateInterlaceTable_fnid, @object
	.size	rescCreateInterlaceTable_fnid, 4
rescCreateInterlaceTable_fnid:
	.long	-523307106
	.ident	"GCC: (GNU) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
