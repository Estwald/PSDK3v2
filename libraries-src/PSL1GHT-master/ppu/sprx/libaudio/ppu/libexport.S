	.file	"libexport.c"
	.section	".got","aw"
	.section	".text"
	.section	.data.sceFStub.cellAudio,"aw",@progbits
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
	.size	name, 10
name:
	.string	"cellAudio"
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
	.4byte	cellAudio
	.4byte	scefstub
	.4byte	0
	.4byte	0
	.4byte	0
	.4byte	0
	.globl audioInit_stub
	.section	.data.sceFStub.cellAudio
	.align 2
	.type	audioInit_stub, @object
	.size	audioInit_stub, 4
audioInit_stub:
	.long	__audioInit
	.globl audioInit_fnid
	.section	.rodata.sceFNID,"a",@progbits
	.align 2
	.type	audioInit_fnid, @object
	.size	audioInit_fnid, 4
audioInit_fnid:
	.long	186027922
	.globl audioPortClose_stub
	.section	.data.sceFStub.cellAudio
	.align 2
	.type	audioPortClose_stub, @object
	.size	audioPortClose_stub, 4
audioPortClose_stub:
	.long	__audioPortClose
	.globl audioPortClose_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	audioPortClose_fnid, @object
	.size	audioPortClose_fnid, 4
audioPortClose_fnid:
	.long	1093271085
	.globl audioPortStop_stub
	.section	.data.sceFStub.cellAudio
	.align 2
	.type	audioPortStop_stub, @object
	.size	audioPortStop_stub, 4
audioPortStop_stub:
	.long	__audioPortStop
	.globl audioPortStop_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	audioPortStop_fnid, @object
	.size	audioPortStop_fnid, 4
audioPortStop_fnid:
	.long	1528704115
	.globl audioGetPortConfig_stub
	.section	.data.sceFStub.cellAudio
	.align 2
	.type	audioGetPortConfig_stub, @object
	.size	audioGetPortConfig_stub, 4
audioGetPortConfig_stub:
	.long	__audioGetPortConfig
	.globl audioGetPortConfig_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	audioGetPortConfig_fnid, @object
	.size	audioGetPortConfig_fnid, 4
audioGetPortConfig_fnid:
	.long	1957063408
	.globl audioPortStart_stub
	.section	.data.sceFStub.cellAudio
	.align 2
	.type	audioPortStart_stub, @object
	.size	audioPortStart_stub, 4
audioPortStart_stub:
	.long	__audioPortStart
	.globl audioPortStart_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	audioPortStart_fnid, @object
	.size	audioPortStart_fnid, 4
audioPortStart_fnid:
	.long	-1984026382
	.globl audioQuit_stub
	.section	.data.sceFStub.cellAudio
	.align 2
	.type	audioQuit_stub, @object
	.size	audioQuit_stub, 4
audioQuit_stub:
	.long	__audioQuit
	.globl audioQuit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	audioQuit_fnid, @object
	.size	audioQuit_fnid, 4
audioQuit_fnid:
	.long	-900021392
	.globl audioPortOpen_stub
	.section	.data.sceFStub.cellAudio
	.align 2
	.type	audioPortOpen_stub, @object
	.size	audioPortOpen_stub, 4
audioPortOpen_stub:
	.long	__audioPortOpen
	.globl audioPortOpen_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	audioPortOpen_fnid, @object
	.size	audioPortOpen_fnid, 4
audioPortOpen_fnid:
	.long	-847526863
	.globl audioSetPortLevel_stub
	.section	.data.sceFStub.cellAudio
	.align 2
	.type	audioSetPortLevel_stub, @object
	.size	audioSetPortLevel_stub, 4
audioSetPortLevel_stub:
	.long	__audioSetPortLevel
	.globl audioSetPortLevel_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	audioSetPortLevel_fnid, @object
	.size	audioSetPortLevel_fnid, 4
audioSetPortLevel_fnid:
	.long	1457512825
	.globl audioCreateNotifyEventQueue_stub
	.section	.data.sceFStub.cellAudio
	.align 2
	.type	audioCreateNotifyEventQueue_stub, @object
	.size	audioCreateNotifyEventQueue_stub, 4
audioCreateNotifyEventQueue_stub:
	.long	__audioCreateNotifyEventQueue
	.globl audioCreateNotifyEventQueue_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	audioCreateNotifyEventQueue_fnid, @object
	.size	audioCreateNotifyEventQueue_fnid, 4
audioCreateNotifyEventQueue_fnid:
	.long	78582606
	.globl audioMiscSetAccessoryVolume_stub
	.section	.data.sceFStub.cellAudio
	.align 2
	.type	audioMiscSetAccessoryVolume_stub, @object
	.size	audioMiscSetAccessoryVolume_stub, 4
audioMiscSetAccessoryVolume_stub:
	.long	__audioMiscSetAccessoryVolume
	.globl audioMiscSetAccessoryVolume_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	audioMiscSetAccessoryVolume_fnid, @object
	.size	audioMiscSetAccessoryVolume_fnid, 4
audioMiscSetAccessoryVolume_fnid:
	.long	824254315
	.globl audioSetNotifyEventQueue_stub
	.section	.data.sceFStub.cellAudio
	.align 2
	.type	audioSetNotifyEventQueue_stub, @object
	.size	audioSetNotifyEventQueue_stub, 4
audioSetNotifyEventQueue_stub:
	.long	__audioSetNotifyEventQueue
	.globl audioSetNotifyEventQueue_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	audioSetNotifyEventQueue_fnid, @object
	.size	audioSetNotifyEventQueue_fnid, 4
audioSetNotifyEventQueue_fnid:
	.long	931007705
	.globl audioGetPortTimestamp_stub
	.section	.data.sceFStub.cellAudio
	.align 2
	.type	audioGetPortTimestamp_stub, @object
	.size	audioGetPortTimestamp_stub, 4
audioGetPortTimestamp_stub:
	.long	__audioGetPortTimestamp
	.globl audioGetPortTimestamp_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	audioGetPortTimestamp_fnid, @object
	.size	audioGetPortTimestamp_fnid, 4
audioGetPortTimestamp_fnid:
	.long	1091162252
	.globl audioAdd2chData_stub
	.section	.data.sceFStub.cellAudio
	.align 2
	.type	audioAdd2chData_stub, @object
	.size	audioAdd2chData_stub, 4
audioAdd2chData_stub:
	.long	__audioAdd2chData
	.globl audioAdd2chData_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	audioAdd2chData_fnid, @object
	.size	audioAdd2chData_fnid, 4
audioAdd2chData_fnid:
	.long	-1639244360
	.globl audioAddData_stub
	.section	.data.sceFStub.cellAudio
	.align 2
	.type	audioAddData_stub, @object
	.size	audioAddData_stub, 4
audioAddData_stub:
	.long	__audioAddData
	.globl audioAddData_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	audioAddData_fnid, @object
	.size	audioAddData_fnid, 4
audioAddData_fnid:
	.long	-625989206
	.globl audioGetPortBlockTag_stub
	.section	.data.sceFStub.cellAudio
	.align 2
	.type	audioGetPortBlockTag_stub, @object
	.size	audioGetPortBlockTag_stub, 4
audioGetPortBlockTag_stub:
	.long	__audioGetPortBlockTag
	.globl audioGetPortBlockTag_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	audioGetPortBlockTag_fnid, @object
	.size	audioGetPortBlockTag_fnid, 4
audioGetPortBlockTag_fnid:
	.long	-469472514
	.globl audioRemoveNotifyEventQueue_stub
	.section	.data.sceFStub.cellAudio
	.align 2
	.type	audioRemoveNotifyEventQueue_stub, @object
	.size	audioRemoveNotifyEventQueue_stub, 4
audioRemoveNotifyEventQueue_stub:
	.long	__audioRemoveNotifyEventQueue
	.globl audioRemoveNotifyEventQueue_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	audioRemoveNotifyEventQueue_fnid, @object
	.size	audioRemoveNotifyEventQueue_fnid, 4
audioRemoveNotifyEventQueue_fnid:
	.long	-13228291
	.ident	"GCC: (GNU) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
