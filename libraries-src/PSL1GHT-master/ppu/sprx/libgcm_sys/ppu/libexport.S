	.file	"libexport.c"
	.section	".got","aw"
	.section	".text"
	.section	.data.sceFStub.cellGcmSys,"aw",@progbits
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
	.string	"cellGcmSys"
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
	.4byte	cellGcmSys
	.4byte	scefstub
	.4byte	0
	.4byte	0
	.4byte	0
	.4byte	0
	.globl gcmInitBody_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmInitBody_stub, @object
	.size	gcmInitBody_stub, 4
gcmInitBody_stub:
	.long	__gcmInitBody
	.globl gcmInitBody_fnid
	.section	.rodata.sceFNID,"a",@progbits
	.align 2
	.type	gcmInitBody_fnid, @object
	.size	gcmInitBody_fnid, 4
gcmInitBody_fnid:
	.long	364569707
	.globl gcmSetDisplayBuffer_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetDisplayBuffer_stub, @object
	.size	gcmSetDisplayBuffer_stub, 4
gcmSetDisplayBuffer_stub:
	.long	__gcmSetDisplayBuffer
	.globl gcmSetDisplayBuffer_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetDisplayBuffer_fnid, @object
	.size	gcmSetDisplayBuffer_fnid, 4
gcmSetDisplayBuffer_fnid:
	.long	-1522724178
	.globl gcmGetControlRegister_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetControlRegister_stub, @object
	.size	gcmGetControlRegister_stub, 4
gcmGetControlRegister_stub:
	.long	__gcmGetControlRegister
	.globl gcmGetControlRegister_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetControlRegister_fnid, @object
	.size	gcmGetControlRegister_fnid, 4
gcmGetControlRegister_fnid:
	.long	-1522029090
	.globl gcmAddressToOffset_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmAddressToOffset_stub, @object
	.size	gcmAddressToOffset_stub, 4
gcmAddressToOffset_stub:
	.long	__gcmAddressToOffset
	.globl gcmAddressToOffset_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmAddressToOffset_fnid, @object
	.size	gcmAddressToOffset_fnid, 4
gcmAddressToOffset_fnid:
	.long	564934295
	.globl gcmGetConfiguration_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetConfiguration_stub, @object
	.size	gcmGetConfiguration_stub, 4
gcmGetConfiguration_stub:
	.long	__gcmGetConfiguration
	.globl gcmGetConfiguration_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetConfiguration_fnid, @object
	.size	gcmGetConfiguration_fnid, 4
gcmGetConfiguration_fnid:
	.long	-485121870
	.globl gcmGetCurrentField_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetCurrentField_stub, @object
	.size	gcmGetCurrentField_stub, 4
gcmGetCurrentField_stub:
	.long	__gcmGetCurrentField
	.globl gcmGetCurrentField_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetCurrentField_fnid, @object
	.size	gcmGetCurrentField_fnid, 4
gcmGetCurrentField_fnid:
	.long	-923550455
	.globl gcmSetFlipMode_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetFlipMode_stub, @object
	.size	gcmSetFlipMode_stub, 4
gcmSetFlipMode_stub:
	.long	__gcmSetFlipMode
	.globl gcmSetFlipMode_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetFlipMode_fnid, @object
	.size	gcmSetFlipMode_fnid, 4
gcmSetFlipMode_fnid:
	.long	1256772117
	.globl gcmGetFlipStatus_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetFlipStatus_stub, @object
	.size	gcmGetFlipStatus_stub, 4
gcmGetFlipStatus_stub:
	.long	__gcmGetFlipStatus
	.globl gcmGetFlipStatus_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetFlipStatus_fnid, @object
	.size	gcmGetFlipStatus_fnid, 4
gcmGetFlipStatus_fnid:
	.long	1923446734
	.globl gcmGetLastFlipTime_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetLastFlipTime_stub, @object
	.size	gcmGetLastFlipTime_stub, 4
gcmGetLastFlipTime_stub:
	.long	__gcmGetLastFlipTime
	.globl gcmGetLastFlipTime_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetLastFlipTime_fnid, @object
	.size	gcmGetLastFlipTime_fnid, 4
gcmGetLastFlipTime_fnid:
	.long	1664643185
	.globl gcmGetVBlankCount_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetVBlankCount_stub, @object
	.size	gcmGetVBlankCount_stub, 4
gcmGetVBlankCount_stub:
	.long	__gcmGetVBlankCount
	.globl gcmGetVBlankCount_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetVBlankCount_fnid, @object
	.size	gcmGetVBlankCount_fnid, 4
gcmGetVBlankCount_fnid:
	.long	1916517502
	.globl gcmSetWaitFlip_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetWaitFlip_stub, @object
	.size	gcmSetWaitFlip_stub, 4
gcmSetWaitFlip_stub:
	.long	__gcmSetWaitFlip
	.globl gcmSetWaitFlip_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetWaitFlip_fnid, @object
	.size	gcmSetWaitFlip_fnid, 4
gcmSetWaitFlip_fnid:
	.long	-1740654166
	.globl gcmSetFlipStatus_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetFlipStatus_stub, @object
	.size	gcmSetFlipStatus_stub, 4
gcmSetFlipStatus_stub:
	.long	__gcmSetFlipStatus
	.globl gcmSetFlipStatus_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetFlipStatus_fnid, @object
	.size	gcmSetFlipStatus_fnid, 4
gcmSetFlipStatus_fnid:
	.long	-1535374849
	.globl gcmResetFlipStatus_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmResetFlipStatus_stub, @object
	.size	gcmResetFlipStatus_stub, 4
gcmResetFlipStatus_stub:
	.long	__gcmResetFlipStatus
	.globl gcmResetFlipStatus_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmResetFlipStatus_fnid, @object
	.size	gcmResetFlipStatus_fnid, 4
gcmResetFlipStatus_fnid:
	.long	-1293458988
	.globl gcmSetFlip_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetFlip_stub, @object
	.size	gcmSetFlip_stub, 4
gcmSetFlip_stub:
	.long	__gcmSetFlip
	.globl gcmSetFlip_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetFlip_fnid, @object
	.size	gcmSetFlip_fnid, 4
gcmSetFlip_fnid:
	.long	-603376258
	.globl gcmSetFlipImmediate_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetFlipImmediate_stub, @object
	.size	gcmSetFlipImmediate_stub, 4
gcmSetFlipImmediate_stub:
	.long	__gcmSetFlipImmediate
	.globl gcmSetFlipImmediate_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetFlipImmediate_fnid, @object
	.size	gcmSetFlipImmediate_fnid, 4
gcmSetFlipImmediate_fnid:
	.long	-1393654462
	.globl gcmFunc15_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmFunc15_stub, @object
	.size	gcmFunc15_stub, 4
gcmFunc15_stub:
	.long	__gcmFunc15
	.globl gcmFunc15_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmFunc15_fnid, @object
	.size	gcmFunc15_fnid, 4
gcmFunc15_fnid:
	.long	976470525
	.globl gcmFunc3_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmFunc3_stub, @object
	.size	gcmFunc3_stub, 4
gcmFunc3_stub:
	.long	__gcmFunc3
	.globl gcmFunc3_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmFunc3_fnid, @object
	.size	gcmFunc3_fnid, 4
gcmFunc3_fnid:
	.long	467022840
	.globl gcmFunc1_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmFunc1_stub, @object
	.size	gcmFunc1_stub, 4
gcmFunc1_stub:
	.long	__gcmFunc1
	.globl gcmFunc1_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmFunc1_fnid, @object
	.size	gcmFunc1_fnid, 4
gcmFunc1_fnid:
	.long	1603312407
	.globl gcmFunc2_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmFunc2_stub, @object
	.size	gcmFunc2_stub, 4
gcmFunc2_stub:
	.long	__gcmFunc2
	.globl gcmFunc2_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmFunc2_fnid, @object
	.size	gcmFunc2_fnid, 4
gcmFunc2_fnid:
	.long	-1895843843
	.globl gcmFunc4_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmFunc4_stub, @object
	.size	gcmFunc4_stub, 4
gcmFunc4_stub:
	.long	__gcmFunc4
	.globl gcmFunc4_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmFunc4_fnid, @object
	.size	gcmFunc4_fnid, 4
gcmFunc4_fnid:
	.long	2143302844
	.globl gcmFunc12_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmFunc12_stub, @object
	.size	gcmFunc12_stub, 4
gcmFunc12_stub:
	.long	__gcmFunc12
	.globl gcmFunc12_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmFunc12_fnid, @object
	.size	gcmFunc12_fnid, 4
gcmFunc12_fnid:
	.long	1713365606
	.globl gcmFunc13_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmFunc13_stub, @object
	.size	gcmFunc13_stub, 4
gcmFunc13_stub:
	.long	__gcmFunc13
	.globl gcmFunc13_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmFunc13_fnid, @object
	.size	gcmFunc13_fnid, 4
gcmFunc13_fnid:
	.long	-1153259043
	.globl gcmGetReport_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetReport_stub, @object
	.size	gcmGetReport_stub, 4
gcmGetReport_stub:
	.long	__gcmGetReport
	.globl gcmGetReport_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetReport_fnid, @object
	.size	gcmGetReport_fnid, 4
gcmGetReport_fnid:
	.long	-1714186324
	.globl gcmSetTile_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetTile_stub, @object
	.size	gcmSetTile_stub, 4
gcmSetTile_stub:
	.long	__gcmSetTile
	.globl gcmSetTile_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetTile_fnid, @object
	.size	gcmSetTile_fnid, 4
gcmSetTile_fnid:
	.long	-793652855
	.globl gcmBindTile_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmBindTile_stub, @object
	.size	gcmBindTile_stub, 4
gcmBindTile_stub:
	.long	__gcmBindTile
	.globl gcmBindTile_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmBindTile_fnid, @object
	.size	gcmBindTile_fnid, 4
gcmBindTile_fnid:
	.long	1160039629
	.globl gcmUnbindTile_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmUnbindTile_stub, @object
	.size	gcmUnbindTile_stub, 4
gcmUnbindTile_stub:
	.long	__gcmUnbindTile
	.globl gcmUnbindTile_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmUnbindTile_fnid, @object
	.size	gcmUnbindTile_fnid, 4
gcmUnbindTile_fnid:
	.long	-642292418
	.globl gcmSetZcull_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetZcull_stub, @object
	.size	gcmSetZcull_stub, 4
gcmSetZcull_stub:
	.long	__gcmSetZcull
	.globl gcmSetZcull_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetZcull_fnid, @object
	.size	gcmSetZcull_fnid, 4
gcmSetZcull_fnid:
	.long	-750108147
	.globl gcmBindZcull_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmBindZcull_stub, @object
	.size	gcmBindZcull_stub, 4
gcmBindZcull_stub:
	.long	__gcmBindZcull
	.globl gcmBindZcull_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmBindZcull_fnid, @object
	.size	gcmBindZcull_fnid, 4
gcmBindZcull_fnid:
	.long	-1648344010
	.globl gcmUnbindZcull_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmUnbindZcull_stub, @object
	.size	gcmUnbindZcull_stub, 4
gcmUnbindZcull_stub:
	.long	__gcmUnbindZcull
	.globl gcmUnbindZcull_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmUnbindZcull_fnid, @object
	.size	gcmUnbindZcull_fnid, 4
gcmUnbindZcull_fnid:
	.long	-1487519512
	.globl gcmGetTimeStamp_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetTimeStamp_stub, @object
	.size	gcmGetTimeStamp_stub, 4
gcmGetTimeStamp_stub:
	.long	__gcmGetTimeStamp
	.globl gcmGetTimeStamp_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetTimeStamp_fnid, @object
	.size	gcmGetTimeStamp_fnid, 4
gcmGetTimeStamp_fnid:
	.long	1514258703
	.globl gcmSetVBlankFrequency_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetVBlankFrequency_stub, @object
	.size	gcmSetVBlankFrequency_stub, 4
gcmSetVBlankFrequency_stub:
	.long	__gcmSetVBlankFrequency
	.globl gcmSetVBlankFrequency_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetVBlankFrequency_fnid, @object
	.size	gcmSetVBlankFrequency_fnid, 4
gcmSetVBlankFrequency_fnid:
	.long	-2091506
	.globl gcmSetSecondVFrequency_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetSecondVFrequency_stub, @object
	.size	gcmSetSecondVFrequency_stub, 4
gcmSetSecondVFrequency_stub:
	.long	__gcmSetSecondVFrequency
	.globl gcmSetSecondVFrequency_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetSecondVFrequency_fnid, @object
	.size	gcmSetSecondVFrequency_fnid, 4
gcmSetSecondVFrequency_fnid:
	.long	1300031891
	.globl gcmSetDebugOutputLevel_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetDebugOutputLevel_stub, @object
	.size	gcmSetDebugOutputLevel_stub, 4
gcmSetDebugOutputLevel_stub:
	.long	__gcmSetDebugOutputLevel
	.globl gcmSetDebugOutputLevel_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetDebugOutputLevel_fnid, @object
	.size	gcmSetDebugOutputLevel_fnid, 4
gcmSetDebugOutputLevel_fnid:
	.long	1372182059
	.globl gcmGetLabelAddress_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetLabelAddress_stub, @object
	.size	gcmGetLabelAddress_stub, 4
gcmGetLabelAddress_stub:
	.long	__gcmGetLabelAddress
	.globl gcmGetLabelAddress_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetLabelAddress_fnid, @object
	.size	gcmGetLabelAddress_fnid, 4
gcmGetLabelAddress_fnid:
	.long	-134113599
	.globl gcmSetVBlankHandlerEx_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetVBlankHandlerEx_stub, @object
	.size	gcmSetVBlankHandlerEx_stub, 4
gcmSetVBlankHandlerEx_stub:
	.long	__gcmSetVBlankHandlerEx
	.globl gcmSetVBlankHandlerEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetVBlankHandlerEx_fnid, @object
	.size	gcmSetVBlankHandlerEx_fnid, 4
gcmSetVBlankHandlerEx_fnid:
	.long	-1457847294
	.globl gcmSetFlipHandlerEx_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetFlipHandlerEx_stub, @object
	.size	gcmSetFlipHandlerEx_stub, 4
gcmSetFlipHandlerEx_stub:
	.long	__gcmSetFlipHandlerEx
	.globl gcmSetFlipHandlerEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetFlipHandlerEx_fnid, @object
	.size	gcmSetFlipHandlerEx_fnid, 4
gcmSetFlipHandlerEx_fnid:
	.long	-1541474328
	.globl gcmSetSecondVHandlerEx_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetSecondVHandlerEx_stub, @object
	.size	gcmSetSecondVHandlerEx_stub, 4
gcmSetSecondVHandlerEx_stub:
	.long	__gcmSetSecondVHandlerEx
	.globl gcmSetSecondVHandlerEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetSecondVHandlerEx_fnid, @object
	.size	gcmSetSecondVHandlerEx_fnid, 4
gcmSetSecondVHandlerEx_fnid:
	.long	-599178192
	.globl gcmSetGraphicsHandlerEx_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetGraphicsHandlerEx_stub, @object
	.size	gcmSetGraphicsHandlerEx_stub, 4
gcmSetGraphicsHandlerEx_stub:
	.long	__gcmSetGraphicsHandlerEx
	.globl gcmSetGraphicsHandlerEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetGraphicsHandlerEx_fnid, @object
	.size	gcmSetGraphicsHandlerEx_fnid, 4
gcmSetGraphicsHandlerEx_fnid:
	.long	-803514611
	.globl gcmTerminate_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmTerminate_stub, @object
	.size	gcmTerminate_stub, 4
gcmTerminate_stub:
	.long	__gcmTerminate
	.globl gcmTerminate_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmTerminate_fnid, @object
	.size	gcmTerminate_fnid, 4
gcmTerminate_fnid:
	.long	1383883833
	.globl gcmMapMainMemory_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmMapMainMemory_stub, @object
	.size	gcmMapMainMemory_stub, 4
gcmMapMainMemory_stub:
	.long	__gcmMapMainMemory
	.globl gcmMapMainMemory_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmMapMainMemory_fnid, @object
	.size	gcmMapMainMemory_fnid, 4
gcmMapMainMemory_fnid:
	.long	-1592464281
	.globl gcmMapEaIoAddress_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmMapEaIoAddress_stub, @object
	.size	gcmMapEaIoAddress_stub, 4
gcmMapEaIoAddress_stub:
	.long	__gcmMapEaIoAddress
	.globl gcmMapEaIoAddress_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmMapEaIoAddress_fnid, @object
	.size	gcmMapEaIoAddress_fnid, 4
gcmMapEaIoAddress_fnid:
	.long	1665408180
	.globl gcmUnmapEaIoAddress_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmUnmapEaIoAddress_stub, @object
	.size	gcmUnmapEaIoAddress_stub, 4
gcmUnmapEaIoAddress_stub:
	.long	__gcmUnmapEaIoAddress
	.globl gcmUnmapEaIoAddress_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmUnmapEaIoAddress_fnid, @object
	.size	gcmUnmapEaIoAddress_fnid, 4
gcmUnmapEaIoAddress_fnid:
	.long	-271577260
	.globl gcmUnmapIoAddress_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmUnmapIoAddress_stub, @object
	.size	gcmUnmapIoAddress_stub, 4
gcmUnmapIoAddress_stub:
	.long	__gcmUnmapIoAddress
	.globl gcmUnmapIoAddress_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmUnmapIoAddress_fnid, @object
	.size	gcmUnmapIoAddress_fnid, 4
gcmUnmapIoAddress_fnid:
	.long	-618403737
	.globl gcmIoOffsetToAddress_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmIoOffsetToAddress_stub, @object
	.size	gcmIoOffsetToAddress_stub, 4
gcmIoOffsetToAddress_stub:
	.long	__gcmIoOffsetToAddress
	.globl gcmIoOffsetToAddress_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmIoOffsetToAddress_fnid, @object
	.size	gcmIoOffsetToAddress_fnid, 4
gcmIoOffsetToAddress_fnid:
	.long	711965340
	.globl gcmSetDefaultCommandBuffer_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetDefaultCommandBuffer_stub, @object
	.size	gcmSetDefaultCommandBuffer_stub, 4
gcmSetDefaultCommandBuffer_stub:
	.long	__gcmSetDefaultCommandBuffer
	.globl gcmSetDefaultCommandBuffer_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetDefaultCommandBuffer_fnid, @object
	.size	gcmSetDefaultCommandBuffer_fnid, 4
gcmSetDefaultCommandBuffer_fnid:
	.long	-1130878650
	.globl gcmSetTileInfo_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetTileInfo_stub, @object
	.size	gcmSetTileInfo_stub, 4
gcmSetTileInfo_stub:
	.long	__gcmSetTileInfo
	.globl gcmSetTileInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetTileInfo_fnid, @object
	.size	gcmSetTileInfo_fnid, 4
gcmSetTileInfo_fnid:
	.long	-1123021380
	.globl gcmGetTiledPitchSize_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetTiledPitchSize_stub, @object
	.size	gcmGetTiledPitchSize_stub, 4
gcmGetTiledPitchSize_stub:
	.long	__gcmGetTiledPitchSize
	.globl gcmGetTiledPitchSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetTiledPitchSize_fnid, @object
	.size	gcmGetTiledPitchSize_fnid, 4
gcmGetTiledPitchSize_fnid:
	.long	89904973
	.globl gcmSetInvalidateTile_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetInvalidateTile_stub, @object
	.size	gcmSetInvalidateTile_stub, 4
gcmSetInvalidateTile_stub:
	.long	__gcmSetInvalidateTile
	.globl gcmSetInvalidateTile_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetInvalidateTile_fnid, @object
	.size	gcmSetInvalidateTile_fnid, 4
gcmSetInvalidateTile_fnid:
	.long	-1116905255
	.globl gcmSetUserCommandEx_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetUserCommandEx_stub, @object
	.size	gcmSetUserCommandEx_stub, 4
gcmSetUserCommandEx_stub:
	.long	__gcmSetUserCommandEx
	.globl gcmSetUserCommandEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetUserCommandEx_fnid, @object
	.size	gcmSetUserCommandEx_fnid, 4
gcmSetUserCommandEx_fnid:
	.long	-1948361025
	.globl gcmSetUserHandlerEx_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetUserHandlerEx_stub, @object
	.size	gcmSetUserHandlerEx_stub, 4
gcmSetUserHandlerEx_stub:
	.long	__gcmSetUserHandlerEx
	.globl gcmSetUserHandlerEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetUserHandlerEx_fnid, @object
	.size	gcmSetUserHandlerEx_fnid, 4
gcmSetUserHandlerEx_fnid:
	.long	116255390
	.globl gcmSetQueueHandlerEx_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetQueueHandlerEx_stub, @object
	.size	gcmSetQueueHandlerEx_stub, 4
gcmSetQueueHandlerEx_stub:
	.long	__gcmSetQueueHandlerEx
	.globl gcmSetQueueHandlerEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetQueueHandlerEx_fnid, @object
	.size	gcmSetQueueHandlerEx_fnid, 4
gcmSetQueueHandlerEx_fnid:
	.long	176564082
	.globl gcmSetPrepareFlip_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetPrepareFlip_stub, @object
	.size	gcmSetPrepareFlip_stub, 4
gcmSetPrepareFlip_stub:
	.long	__gcmSetPrepareFlip
	.globl gcmSetPrepareFlip_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetPrepareFlip_fnid, @object
	.size	gcmSetPrepareFlip_fnid, 4
gcmSetPrepareFlip_fnid:
	.long	189489877
	.globl gcmGetOffsetTable_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetOffsetTable_stub, @object
	.size	gcmGetOffsetTable_stub, 4
gcmGetOffsetTable_stub:
	.long	__gcmGetOffsetTable
	.globl gcmGetOffsetTable_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetOffsetTable_fnid, @object
	.size	gcmGetOffsetTable_fnid, 4
gcmGetOffsetTable_fnid:
	.long	690138832
	.globl gcmGetLastSecondVTime_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetLastSecondVTime_stub, @object
	.size	gcmGetLastSecondVTime_stub, 4
gcmGetLastSecondVTime_stub:
	.long	__gcmGetLastSecondVTime
	.globl gcmGetLastSecondVTime_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetLastSecondVTime_fnid, @object
	.size	gcmGetLastSecondVTime_fnid, 4
gcmGetLastSecondVTime_fnid:
	.long	598627747
	.globl gcmSortRemapEaIoAddress_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSortRemapEaIoAddress_stub, @object
	.size	gcmSortRemapEaIoAddress_stub, 4
gcmSortRemapEaIoAddress_stub:
	.long	__gcmSortRemapEaIoAddress
	.globl gcmSortRemapEaIoAddress_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSortRemapEaIoAddress_fnid, @object
	.size	gcmSortRemapEaIoAddress_fnid, 4
gcmSortRemapEaIoAddress_fnid:
	.long	632556212
	.globl gcmGetDisplayBufferByFlipIndex_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetDisplayBufferByFlipIndex_stub, @object
	.size	gcmGetDisplayBufferByFlipIndex_stub, 4
gcmGetDisplayBufferByFlipIndex_stub:
	.long	__gcmGetDisplayBufferByFlipIndex
	.globl gcmGetDisplayBufferByFlipIndex_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetDisplayBufferByFlipIndex_fnid, @object
	.size	gcmGetDisplayBufferByFlipIndex_fnid, 4
gcmGetDisplayBufferByFlipIndex_fnid:
	.long	924218575
	.globl gcmGcmGetDefaultCommandWordSize_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGcmGetDefaultCommandWordSize_stub, @object
	.size	gcmGcmGetDefaultCommandWordSize_stub, 4
gcmGcmGetDefaultCommandWordSize_stub:
	.long	__gcmGcmGetDefaultCommandWordSize
	.globl gcmGcmGetDefaultCommandWordSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGcmGetDefaultCommandWordSize_fnid, @object
	.size	gcmGcmGetDefaultCommandWordSize_fnid, 4
gcmGcmGetDefaultCommandWordSize_fnid:
	.long	1580130544
	.globl gcmGcmGetDefaultSegmentWordSize_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGcmGetDefaultSegmentWordSize_stub, @object
	.size	gcmGcmGetDefaultSegmentWordSize_stub, 4
gcmGcmGetDefaultSegmentWordSize_stub:
	.long	__gcmGcmGetDefaultSegmentWordSize
	.globl gcmGcmGetDefaultSegmentWordSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGcmGetDefaultSegmentWordSize_fnid, @object
	.size	gcmGcmGetDefaultSegmentWordSize_fnid, 4
gcmGcmGetDefaultSegmentWordSize_fnid:
	.long	-1931506576
	.globl gcmSetDefaultCommandBufferAndSegmentWordSize_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetDefaultCommandBufferAndSegmentWordSize_stub, @object
	.size	gcmSetDefaultCommandBufferAndSegmentWordSize_stub, 4
gcmSetDefaultCommandBufferAndSegmentWordSize_stub:
	.long	__gcmSetDefaultCommandBufferAndSegmentWordSize
	.globl gcmSetDefaultCommandBufferAndSegmentWordSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetDefaultCommandBufferAndSegmentWordSize_fnid, @object
	.size	gcmSetDefaultCommandBufferAndSegmentWordSize_fnid, 4
gcmSetDefaultCommandBufferAndSegmentWordSize_fnid:
	.long	388772247
	.globl gcmGetDisplayInfo_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetDisplayInfo_stub, @object
	.size	gcmGetDisplayInfo_stub, 4
gcmGetDisplayInfo_stub:
	.long	__gcmGetDisplayInfo
	.globl gcmGetDisplayInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetDisplayInfo_fnid, @object
	.size	gcmGetDisplayInfo_fnid, 4
gcmGetDisplayInfo_fnid:
	.long	241896878
	.globl gcmDumpGraphicsError_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmDumpGraphicsError_stub, @object
	.size	gcmDumpGraphicsError_stub, 4
gcmDumpGraphicsError_stub:
	.long	__gcmDumpGraphicsError
	.globl gcmDumpGraphicsError_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmDumpGraphicsError_fnid, @object
	.size	gcmDumpGraphicsError_fnid, 4
gcmDumpGraphicsError_fnid:
	.long	526496767
	.globl gcmFunc38_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmFunc38_stub, @object
	.size	gcmFunc38_stub, 4
gcmFunc38_stub:
	.long	__gcmFunc38
	.globl gcmFunc38_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmFunc38_fnid, @object
	.size	gcmFunc38_fnid, 4
gcmFunc38_fnid:
	.long	1753975497
	.globl gcmGetCurrentDisplayBufferId_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetCurrentDisplayBufferId_stub, @object
	.size	gcmGetCurrentDisplayBufferId_stub, 4
gcmGetCurrentDisplayBufferId_stub:
	.long	__gcmGetCurrentDisplayBufferId
	.globl gcmGetCurrentDisplayBufferId_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetCurrentDisplayBufferId_fnid, @object
	.size	gcmGetCurrentDisplayBufferId_fnid, 4
gcmGetCurrentDisplayBufferId_fnid:
	.long	-1820302043
	.globl gcmGetDefaultCommandWordSize_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetDefaultCommandWordSize_stub, @object
	.size	gcmGetDefaultCommandWordSize_stub, 4
gcmGetDefaultCommandWordSize_stub:
	.long	__gcmGetDefaultCommandWordSize
	.globl gcmGetDefaultCommandWordSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetDefaultCommandWordSize_fnid, @object
	.size	gcmGetDefaultCommandWordSize_fnid, 4
gcmGetDefaultCommandWordSize_fnid:
	.long	1580130544
	.globl gcmGetDefaultSegmentWordSize_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetDefaultSegmentWordSize_stub, @object
	.size	gcmGetDefaultSegmentWordSize_stub, 4
gcmGetDefaultSegmentWordSize_stub:
	.long	__gcmGetDefaultSegmentWordSize
	.globl gcmGetDefaultSegmentWordSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetDefaultSegmentWordSize_fnid, @object
	.size	gcmGetDefaultSegmentWordSize_fnid, 4
gcmGetDefaultSegmentWordSize_fnid:
	.long	-1931506576
	.globl gcmGetMaxIoMapSize_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetMaxIoMapSize_stub, @object
	.size	gcmGetMaxIoMapSize_stub, 4
gcmGetMaxIoMapSize_stub:
	.long	__gcmGetMaxIoMapSize
	.globl gcmGetMaxIoMapSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetMaxIoMapSize_fnid, @object
	.size	gcmGetMaxIoMapSize_fnid, 4
gcmGetMaxIoMapSize_fnid:
	.long	-75382722
	.globl gcmGetNotifyDataAddress_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetNotifyDataAddress_stub, @object
	.size	gcmGetNotifyDataAddress_stub, 4
gcmGetNotifyDataAddress_stub:
	.long	__gcmGetNotifyDataAddress
	.globl gcmGetNotifyDataAddress_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetNotifyDataAddress_fnid, @object
	.size	gcmGetNotifyDataAddress_fnid, 4
gcmGetNotifyDataAddress_fnid:
	.long	567205941
	.globl gcmGetReportDataAddress_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetReportDataAddress_stub, @object
	.size	gcmGetReportDataAddress_stub, 4
gcmGetReportDataAddress_stub:
	.long	__gcmGetReportDataAddress
	.globl gcmGetReportDataAddress_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetReportDataAddress_fnid, @object
	.size	gcmGetReportDataAddress_fnid, 4
gcmGetReportDataAddress_fnid:
	.long	-1711187537
	.globl gcmGetReportDataAddressLocation_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetReportDataAddressLocation_stub, @object
	.size	gcmGetReportDataAddressLocation_stub, 4
gcmGetReportDataAddressLocation_stub:
	.long	__gcmGetReportDataAddressLocation
	.globl gcmGetReportDataAddressLocation_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetReportDataAddressLocation_fnid, @object
	.size	gcmGetReportDataAddressLocation_fnid, 4
gcmGetReportDataAddressLocation_fnid:
	.long	-2056078110
	.globl gcmGetReportDataLocation_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetReportDataLocation_stub, @object
	.size	gcmGetReportDataLocation_stub, 4
gcmGetReportDataLocation_stub:
	.long	__gcmGetReportDataLocation
	.globl gcmGetReportDataLocation_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetReportDataLocation_fnid, @object
	.size	gcmGetReportDataLocation_fnid, 4
gcmGetReportDataLocation_fnid:
	.long	-1498316628
	.globl gcmGetTileInfo_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetTileInfo_stub, @object
	.size	gcmGetTileInfo_stub, 4
gcmGetTileInfo_stub:
	.long	__gcmGetTileInfo
	.globl gcmGetTileInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetTileInfo_fnid, @object
	.size	gcmGetTileInfo_fnid, 4
gcmGetTileInfo_fnid:
	.long	1702195703
	.globl gcmGetTimeStampLocation_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetTimeStampLocation_stub, @object
	.size	gcmGetTimeStampLocation_stub, 4
gcmGetTimeStampLocation_stub:
	.long	__gcmGetTimeStampLocation
	.globl gcmGetTimeStampLocation_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetTimeStampLocation_fnid, @object
	.size	gcmGetTimeStampLocation_fnid, 4
gcmGetTimeStampLocation_fnid:
	.long	718574875
	.globl gcmGetZcullInfo_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmGetZcullInfo_stub, @object
	.size	gcmGetZcullInfo_stub, 4
gcmGetZcullInfo_stub:
	.long	__gcmGetZcullInfo
	.globl gcmGetZcullInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmGetZcullInfo_fnid, @object
	.size	gcmGetZcullInfo_fnid, 4
gcmGetZcullInfo_fnid:
	.long	-643782535
	.globl gcmInitCursor_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmInitCursor_stub, @object
	.size	gcmInitCursor_stub, 4
gcmInitCursor_stub:
	.long	__gcmInitCursor
	.globl gcmInitCursor_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmInitCursor_fnid, @object
	.size	gcmInitCursor_fnid, 4
gcmInitCursor_fnid:
	.long	276558753
	.globl gcmInitDefaultFifoMode_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmInitDefaultFifoMode_stub, @object
	.size	gcmInitDefaultFifoMode_stub, 4
gcmInitDefaultFifoMode_stub:
	.long	__gcmInitDefaultFifoMode
	.globl gcmInitDefaultFifoMode_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmInitDefaultFifoMode_fnid, @object
	.size	gcmInitDefaultFifoMode_fnid, 4
gcmInitDefaultFifoMode_fnid:
	.long	-894707310
	.globl gcmInitSystemMode_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmInitSystemMode_stub, @object
	.size	gcmInitSystemMode_stub, 4
gcmInitSystemMode_stub:
	.long	__gcmInitSystemMode
	.globl gcmInitSystemMode_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmInitSystemMode_fnid, @object
	.size	gcmInitSystemMode_fnid, 4
gcmInitSystemMode_fnid:
	.long	-51779740
	.globl gcmMapEaIoAddressWithFlags_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmMapEaIoAddressWithFlags_stub, @object
	.size	gcmMapEaIoAddressWithFlags_stub, 4
gcmMapEaIoAddressWithFlags_stub:
	.long	__gcmMapEaIoAddressWithFlags
	.globl gcmMapEaIoAddressWithFlags_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmMapEaIoAddressWithFlags_fnid, @object
	.size	gcmMapEaIoAddressWithFlags_fnid, 4
gcmMapEaIoAddressWithFlags_fnid:
	.long	1651410200
	.globl gcmMapLocalMemory_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmMapLocalMemory_stub, @object
	.size	gcmMapLocalMemory_stub, 4
gcmMapLocalMemory_stub:
	.long	__gcmMapLocalMemory
	.globl gcmMapLocalMemory_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmMapLocalMemory_fnid, @object
	.size	gcmMapLocalMemory_fnid, 4
gcmMapLocalMemory_fnid:
	.long	-612984014
	.globl gcmReserveIoMapSize_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmReserveIoMapSize_stub, @object
	.size	gcmReserveIoMapSize_stub, 4
gcmReserveIoMapSize_stub:
	.long	__gcmReserveIoMapSize
	.globl gcmReserveIoMapSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmReserveIoMapSize_fnid, @object
	.size	gcmReserveIoMapSize_fnid, 4
gcmReserveIoMapSize_fnid:
	.long	-1477582232
	.globl gcmSetCursorDisable_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetCursorDisable_stub, @object
	.size	gcmSetCursorDisable_stub, 4
gcmSetCursorDisable_stub:
	.long	__gcmSetCursorDisable
	.globl gcmSetCursorDisable_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetCursorDisable_fnid, @object
	.size	gcmSetCursorDisable_fnid, 4
gcmSetCursorDisable_fnid:
	.long	1774636162
	.globl gcmSetCursorEnable_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetCursorEnable_stub, @object
	.size	gcmSetCursorEnable_stub, 4
gcmSetCursorEnable_stub:
	.long	__gcmSetCursorEnable
	.globl gcmSetCursorEnable_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetCursorEnable_fnid, @object
	.size	gcmSetCursorEnable_fnid, 4
gcmSetCursorEnable_fnid:
	.long	-998438894
	.globl gcmSetCursorImageOffset_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetCursorImageOffset_stub, @object
	.size	gcmSetCursorImageOffset_stub, 4
gcmSetCursorImageOffset_stub:
	.long	__gcmSetCursorImageOffset
	.globl gcmSetCursorImageOffset_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetCursorImageOffset_fnid, @object
	.size	gcmSetCursorImageOffset_fnid, 4
gcmSetCursorImageOffset_fnid:
	.long	-104866702
	.globl gcmSetCursorPosition_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetCursorPosition_stub, @object
	.size	gcmSetCursorPosition_stub, 4
gcmSetCursorPosition_stub:
	.long	__gcmSetCursorPosition
	.globl gcmSetCursorPosition_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetCursorPosition_fnid, @object
	.size	gcmSetCursorPosition_fnid, 4
gcmSetCursorPosition_fnid:
	.long	437118288
	.globl gcmSetDefaultFifoSize_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetDefaultFifoSize_stub, @object
	.size	gcmSetDefaultFifoSize_stub, 4
gcmSetDefaultFifoSize_stub:
	.long	__gcmSetDefaultFifoSize
	.globl gcmSetDefaultFifoSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetDefaultFifoSize_fnid, @object
	.size	gcmSetDefaultFifoSize_fnid, 4
gcmSetDefaultFifoSize_fnid:
	.long	-1683729948
	.globl gcmSetFlipCommand_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetFlipCommand_stub, @object
	.size	gcmSetFlipCommand_stub, 4
gcmSetFlipCommand_stub:
	.long	__gcmSetFlipCommand
	.globl gcmSetFlipCommand_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetFlipCommand_fnid, @object
	.size	gcmSetFlipCommand_fnid, 4
gcmSetFlipCommand_fnid:
	.long	557414424
	.globl gcmSetFlipCommandWithWaitLabel_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSetFlipCommandWithWaitLabel_stub, @object
	.size	gcmSetFlipCommandWithWaitLabel_stub, 4
gcmSetFlipCommandWithWaitLabel_stub:
	.long	__gcmSetFlipCommandWithWaitLabel
	.globl gcmSetFlipCommandWithWaitLabel_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSetFlipCommandWithWaitLabel_fnid, @object
	.size	gcmSetFlipCommandWithWaitLabel_fnid, 4
gcmSetFlipCommandWithWaitLabel_fnid:
	.long	-654799334
	.globl gcmSysGetLastVBlankTime_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmSysGetLastVBlankTime_stub, @object
	.size	gcmSysGetLastVBlankTime_stub, 4
gcmSysGetLastVBlankTime_stub:
	.long	__gcmSysGetLastVBlankTime
	.globl gcmSysGetLastVBlankTime_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmSysGetLastVBlankTime_fnid, @object
	.size	gcmSysGetLastVBlankTime_fnid, 4
gcmSysGetLastVBlankTime_fnid:
	.long	-465013517
	.globl gcmUnreserveIoMapSize_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmUnreserveIoMapSize_stub, @object
	.size	gcmUnreserveIoMapSize_stub, 4
gcmUnreserveIoMapSize_stub:
	.long	__gcmUnreserveIoMapSize
	.globl gcmUnreserveIoMapSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmUnreserveIoMapSize_fnid, @object
	.size	gcmUnreserveIoMapSize_fnid, 4
gcmUnreserveIoMapSize_fnid:
	.long	1000068541
	.globl gcmUpdateCursor_stub
	.section	.data.sceFStub.cellGcmSys
	.align 2
	.type	gcmUpdateCursor_stub, @object
	.size	gcmUpdateCursor_stub, 4
gcmUpdateCursor_stub:
	.long	__gcmUpdateCursor
	.globl gcmUpdateCursor_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gcmUpdateCursor_fnid, @object
	.size	gcmUpdateCursor_fnid, 4
gcmUpdateCursor_fnid:
	.long	-1120952153
	.ident	"GCC: (GNU) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
