	.file	"libexport.c"
	.section	".got","aw"
	.section	".text"
	.section	.data.sceFStub.cellCamera,"aw",@progbits
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
	.string	"cellCamera"
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
	.4byte	cellCamera
	.4byte	scefstub
	.4byte	0
	.4byte	0
	.4byte	0
	.4byte	0
	.globl cameraStop_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraStop_stub, @object
	.size	cameraStop_stub, 4
cameraStop_stub:
	.long	__cameraStop
	.globl cameraStop_fnid
	.section	.rodata.sceFNID,"a",@progbits
	.align 2
	.type	cameraStop_fnid, @object
	.size	cameraStop_fnid, 4
cameraStop_fnid:
	.long	49663696
	.globl cameraGetBufferInfoEx_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraGetBufferInfoEx_stub, @object
	.size	cameraGetBufferInfoEx_stub, 4
cameraGetBufferInfoEx_stub:
	.long	__cameraGetBufferInfoEx
	.globl cameraGetBufferInfoEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraGetBufferInfoEx_fnid, @object
	.size	cameraGetBufferInfoEx_fnid, 4
cameraGetBufferInfoEx_fnid:
	.long	241419332
	.globl cameraReadEx_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraReadEx_stub, @object
	.size	cameraReadEx_stub, 4
cameraReadEx_stub:
	.long	__cameraReadEx
	.globl cameraReadEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraReadEx_fnid, @object
	.size	cameraReadEx_fnid, 4
cameraReadEx_fnid:
	.long	570168607
	.globl cameraSetExtensionUnit_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraSetExtensionUnit_stub, @object
	.size	cameraSetExtensionUnit_stub, 4
cameraSetExtensionUnit_stub:
	.long	__cameraSetExtensionUnit
	.globl cameraSetExtensionUnit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraSetExtensionUnit_fnid, @object
	.size	cameraSetExtensionUnit_fnid, 4
cameraSetExtensionUnit_fnid:
	.long	770326171
	.globl cameraClose_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraClose_stub, @object
	.size	cameraClose_stub, 4
cameraClose_stub:
	.long	__cameraClose
	.globl cameraClose_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraClose_fnid, @object
	.size	cameraClose_fnid, 4
cameraClose_fnid:
	.long	932994518
	.globl cameraRead_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraRead_stub, @object
	.size	cameraRead_stub, 4
cameraRead_stub:
	.long	__cameraRead
	.globl cameraRead_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraRead_fnid, @object
	.size	cameraRead_fnid, 4
cameraRead_fnid:
	.long	944100251
	.globl cameraRemoveNotifyEventQueue2_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraRemoveNotifyEventQueue2_stub, @object
	.size	cameraRemoveNotifyEventQueue2_stub, 4
cameraRemoveNotifyEventQueue2_stub:
	.long	__cameraRemoveNotifyEventQueue2
	.globl cameraRemoveNotifyEventQueue2_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraRemoveNotifyEventQueue2_fnid, @object
	.size	cameraRemoveNotifyEventQueue2_fnid, 4
cameraRemoveNotifyEventQueue2_fnid:
	.long	1147617031
	.globl cameraStart_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraStart_stub, @object
	.size	cameraStart_stub, 4
cameraStart_stub:
	.long	__cameraStart
	.globl cameraStart_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraStart_fnid, @object
	.size	cameraStart_fnid, 4
cameraStart_fnid:
	.long	1164821674
	.globl cameraGetAttribute_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraGetAttribute_stub, @object
	.size	cameraGetAttribute_stub, 4
cameraGetAttribute_stub:
	.long	__cameraGetAttribute
	.globl cameraGetAttribute_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraGetAttribute_fnid, @object
	.size	cameraGetAttribute_fnid, 4
cameraGetAttribute_fnid:
	.long	1395362474
	.globl cameraGetType_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraGetType_stub, @object
	.size	cameraGetType_stub, 4
cameraGetType_stub:
	.long	__cameraGetType
	.globl cameraGetType_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraGetType_fnid, @object
	.size	cameraGetType_fnid, 4
cameraGetType_fnid:
	.long	1488738416
	.globl cameraEnd_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraEnd_stub, @object
	.size	cameraEnd_stub, 4
cameraEnd_stub:
	.long	__cameraEnd
	.globl cameraEnd_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraEnd_fnid, @object
	.size	cameraEnd_fnid, 4
cameraEnd_fnid:
	.long	1523869040
	.globl cameraOpenEx_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraOpenEx_stub, @object
	.size	cameraOpenEx_stub, 4
cameraOpenEx_stub:
	.long	__cameraOpenEx
	.globl cameraOpenEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraOpenEx_fnid, @object
	.size	cameraOpenEx_fnid, 4
cameraOpenEx_fnid:
	.long	1562769510
	.globl cameraIsStarted_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraIsStarted_stub, @object
	.size	cameraIsStarted_stub, 4
cameraIsStarted_stub:
	.long	__cameraIsStarted
	.globl cameraIsStarted_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraIsStarted_fnid, @object
	.size	cameraIsStarted_fnid, 4
cameraIsStarted_fnid:
	.long	1592521294
	.globl cameraGetDeviceGUID_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraGetDeviceGUID_stub, @object
	.size	cameraGetDeviceGUID_stub, 4
cameraGetDeviceGUID_stub:
	.long	__cameraGetDeviceGUID
	.globl cameraGetDeviceGUID_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraGetDeviceGUID_fnid, @object
	.size	cameraGetDeviceGUID_fnid, 4
cameraGetDeviceGUID_fnid:
	.long	1613635666
	.globl cameraPrepExtensionUnit_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraPrepExtensionUnit_stub, @object
	.size	cameraPrepExtensionUnit_stub, 4
cameraPrepExtensionUnit_stub:
	.long	__cameraPrepExtensionUnit
	.globl cameraPrepExtensionUnit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraPrepExtensionUnit_fnid, @object
	.size	cameraPrepExtensionUnit_fnid, 4
cameraPrepExtensionUnit_fnid:
	.long	1642053251
	.globl cameraGetBufferSize_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraGetBufferSize_stub, @object
	.size	cameraGetBufferSize_stub, 4
cameraGetBufferSize_stub:
	.long	__cameraGetBufferSize
	.globl cameraGetBufferSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraGetBufferSize_fnid, @object
	.size	cameraGetBufferSize_fnid, 4
cameraGetBufferSize_fnid:
	.long	2108445196
	.globl cameraIsAttached_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraIsAttached_stub, @object
	.size	cameraIsAttached_stub, 4
cameraIsAttached_stub:
	.long	__cameraIsAttached
	.globl cameraIsAttached_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraIsAttached_fnid, @object
	.size	cameraIsAttached_fnid, 4
cameraIsAttached_fnid:
	.long	2114337724
	.globl cameraReset_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraReset_stub, @object
	.size	cameraReset_stub, 4
cameraReset_stub:
	.long	__cameraReset
	.globl cameraReset_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraReset_fnid, @object
	.size	cameraReset_fnid, 4
cameraReset_fnid:
	.long	-2114437703
	.globl cameraIsAvailable_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraIsAvailable_stub, @object
	.size	cameraIsAvailable_stub, 4
cameraIsAvailable_stub:
	.long	__cameraIsAvailable
	.globl cameraIsAvailable_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraIsAvailable_fnid, @object
	.size	cameraIsAvailable_fnid, 4
cameraIsAvailable_fnid:
	.long	-1935327778
	.globl cameraSetAttribute_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraSetAttribute_stub, @object
	.size	cameraSetAttribute_stub, 4
cameraSetAttribute_stub:
	.long	__cameraSetAttribute
	.globl cameraSetAttribute_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraSetAttribute_fnid, @object
	.size	cameraSetAttribute_fnid, 4
cameraSetAttribute_fnid:
	.long	-1932169490
	.globl cameraRemoveNotifyEventQueue_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraRemoveNotifyEventQueue_stub, @object
	.size	cameraRemoveNotifyEventQueue_stub, 4
cameraRemoveNotifyEventQueue_stub:
	.long	__cameraRemoveNotifyEventQueue
	.globl cameraRemoveNotifyEventQueue_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraRemoveNotifyEventQueue_fnid, @object
	.size	cameraRemoveNotifyEventQueue_fnid, 4
cameraRemoveNotifyEventQueue_fnid:
	.long	-1684483496
	.globl cameraSetNotifyEventQueue2_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraSetNotifyEventQueue2_stub, @object
	.size	cameraSetNotifyEventQueue2_stub, 4
cameraSetNotifyEventQueue2_stub:
	.long	__cameraSetNotifyEventQueue2
	.globl cameraSetNotifyEventQueue2_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraSetNotifyEventQueue2_fnid, @object
	.size	cameraSetNotifyEventQueue2_fnid, 4
cameraSetNotifyEventQueue2_fnid:
	.long	-1476579493
	.globl cameraSetNotifyEventQueue_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraSetNotifyEventQueue_stub, @object
	.size	cameraSetNotifyEventQueue_stub, 4
cameraSetNotifyEventQueue_stub:
	.long	__cameraSetNotifyEventQueue
	.globl cameraSetNotifyEventQueue_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraSetNotifyEventQueue_fnid, @object
	.size	cameraSetNotifyEventQueue_fnid, 4
cameraSetNotifyEventQueue_fnid:
	.long	-1335591334
	.globl cameraGetExtensionUnit_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraGetExtensionUnit_stub, @object
	.size	cameraGetExtensionUnit_stub, 4
cameraGetExtensionUnit_stub:
	.long	__cameraGetExtensionUnit
	.globl cameraGetExtensionUnit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraGetExtensionUnit_fnid, @object
	.size	cameraGetExtensionUnit_fnid, 4
cameraGetExtensionUnit_fnid:
	.long	-1241324760
	.globl cameraInit_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraInit_stub, @object
	.size	cameraInit_stub, 4
cameraInit_stub:
	.long	__cameraInit
	.globl cameraInit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraInit_fnid, @object
	.size	cameraInit_fnid, 4
cameraInit_fnid:
	.long	-1085815331
	.globl cameraReadComplete_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraReadComplete_stub, @object
	.size	cameraReadComplete_stub, 4
cameraReadComplete_stub:
	.long	__cameraReadComplete
	.globl cameraReadComplete_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraReadComplete_fnid, @object
	.size	cameraReadComplete_fnid, 4
cameraReadComplete_fnid:
	.long	-494198677
	.globl cameraCtrlExtensionUnit_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraCtrlExtensionUnit_stub, @object
	.size	cameraCtrlExtensionUnit_stub, 4
cameraCtrlExtensionUnit_stub:
	.long	__cameraCtrlExtensionUnit
	.globl cameraCtrlExtensionUnit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraCtrlExtensionUnit_fnid, @object
	.size	cameraCtrlExtensionUnit_fnid, 4
cameraCtrlExtensionUnit_fnid:
	.long	-345008645
	.globl cameraIsOpen_stub
	.section	.data.sceFStub.cellCamera
	.align 2
	.type	cameraIsOpen_stub, @object
	.size	cameraIsOpen_stub, 4
cameraIsOpen_stub:
	.long	__cameraIsOpen
	.globl cameraIsOpen_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	cameraIsOpen_fnid, @object
	.size	cameraIsOpen_fnid, 4
cameraIsOpen_fnid:
	.long	-99217628
	.ident	"GCC: (GNU) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
