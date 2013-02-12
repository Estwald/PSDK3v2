	.file	"libexport.c"
	.section	".got","aw"
	.section	".text"
	.section	.data.sceFStub.cellUsbd,"aw",@progbits
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
	.string	"cellUsbd"
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
	.4byte	cellUsbd
	.4byte	scefstub
	.4byte	0
	.4byte	0
	.4byte	0
	.4byte	0
	.globl usbAllocateMemory_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbAllocateMemory_stub, @object
	.size	usbAllocateMemory_stub, 4
usbAllocateMemory_stub:
	.long	__usbAllocateMemory
	.globl usbAllocateMemory_fnid
	.section	.rodata.sceFNID,"a",@progbits
	.align 2
	.type	usbAllocateMemory_fnid, @object
	.size	usbAllocateMemory_fnid, 4
usbAllocateMemory_fnid:
	.long	122534713
	.globl usbInterruptTransferEx_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbInterruptTransferEx_stub, @object
	.size	usbInterruptTransferEx_stub, 4
usbInterruptTransferEx_stub:
	.long	__usbInterruptTransferEx
	.globl usbInterruptTransferEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbInterruptTransferEx_fnid, @object
	.size	usbInterruptTransferEx_fnid, 4
usbInterruptTransferEx_fnid:
	.long	255922786
	.globl usbUnknown1_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbUnknown1_stub, @object
	.size	usbUnknown1_stub, 4
usbUnknown1_stub:
	.long	__usbUnknown1
	.globl usbUnknown1_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbUnknown1_fnid, @object
	.size	usbUnknown1_fnid, 4
usbUnknown1_fnid:
	.long	296883546
	.globl usbUnknown2_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbUnknown2_stub, @object
	.size	usbUnknown2_stub, 4
usbUnknown2_stub:
	.long	__usbUnknown2
	.globl usbUnknown2_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbUnknown2_fnid, @object
	.size	usbUnknown2_fnid, 4
usbUnknown2_fnid:
	.long	307603719
	.globl usbUnknown3_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbUnknown3_stub, @object
	.size	usbUnknown3_stub, 4
usbUnknown3_stub:
	.long	__usbUnknown3
	.globl usbUnknown3_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbUnknown3_fnid, @object
	.size	usbUnknown3_fnid, 4
usbUnknown3_fnid:
	.long	623698511
	.globl usbOpenPipe_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbOpenPipe_stub, @object
	.size	usbOpenPipe_stub, 4
usbOpenPipe_stub:
	.long	__usbOpenPipe
	.globl usbOpenPipe_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbOpenPipe_fnid, @object
	.size	usbOpenPipe_fnid, 4
usbOpenPipe_fnid:
	.long	625117612
	.globl usbScanStaticDescriptor_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbScanStaticDescriptor_stub, @object
	.size	usbScanStaticDescriptor_stub, 4
usbScanStaticDescriptor_stub:
	.long	__usbScanStaticDescriptor
	.globl usbScanStaticDescriptor_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbScanStaticDescriptor_fnid, @object
	.size	usbScanStaticDescriptor_fnid, 4
usbScanStaticDescriptor_fnid:
	.long	800099870
	.globl usbRegisterLddEx_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbRegisterLddEx_stub, @object
	.size	usbRegisterLddEx_stub, 4
usbRegisterLddEx_stub:
	.long	__usbRegisterLddEx
	.globl usbRegisterLddEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbRegisterLddEx_fnid, @object
	.size	usbRegisterLddEx_fnid, 4
usbRegisterLddEx_fnid:
	.long	899411898
	.globl usbEnd_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbEnd_stub, @object
	.size	usbEnd_stub, 4
usbEnd_stub:
	.long	__usbEnd
	.globl usbEnd_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbEnd_fnid, @object
	.size	usbEnd_fnid, 4
usbEnd_fnid:
	.long	905063107
	.globl usbFreeMemory_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbFreeMemory_stub, @object
	.size	usbFreeMemory_stub, 4
usbFreeMemory_stub:
	.long	__usbFreeMemory
	.globl usbFreeMemory_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbFreeMemory_fnid, @object
	.size	usbFreeMemory_fnid, 4
usbFreeMemory_fnid:
	.long	1313173121
	.globl usbUnknown4_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbUnknown4_stub, @object
	.size	usbUnknown4_stub, 4
usbUnknown4_stub:
	.long	__usbUnknown4
	.globl usbUnknown4_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbUnknown4_fnid, @object
	.size	usbUnknown4_fnid, 4
usbUnknown4_fnid:
	.long	1521887993
	.globl usbSetThreadPriority2_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbSetThreadPriority2_stub, @object
	.size	usbSetThreadPriority2_stub, 4
usbSetThreadPriority2_stub:
	.long	__usbSetThreadPriority2
	.globl usbSetThreadPriority2_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbSetThreadPriority2_fnid, @object
	.size	usbSetThreadPriority2_fnid, 4
usbSetThreadPriority2_fnid:
	.long	1552100311
	.globl usbGetPrivateData_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbGetPrivateData_stub, @object
	.size	usbGetPrivateData_stub, 4
usbGetPrivateData_stub:
	.long	__usbGetPrivateData
	.globl usbGetPrivateData_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbGetPrivateData_fnid, @object
	.size	usbGetPrivateData_fnid, 4
usbGetPrivateData_fnid:
	.long	1575202614
	.globl usbSetPrivateData_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbSetPrivateData_stub, @object
	.size	usbSetPrivateData_stub, 4
usbSetPrivateData_stub:
	.long	__usbSetPrivateData
	.globl usbSetPrivateData_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbSetPrivateData_fnid, @object
	.size	usbSetPrivateData_fnid, 4
usbSetPrivateData_fnid:
	.long	1673517975
	.globl usbUnregisterLddEx_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbUnregisterLddEx_stub, @object
	.size	usbUnregisterLddEx_stub, 4
usbUnregisterLddEx_stub:
	.long	__usbUnregisterLddEx
	.globl usbUnregisterLddEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbUnregisterLddEx_fnid, @object
	.size	usbUnregisterLddEx_fnid, 4
usbUnregisterLddEx_fnid:
	.long	1687493319
	.globl usbHSIsochronousTransferEx_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbHSIsochronousTransferEx_stub, @object
	.size	usbHSIsochronousTransferEx_stub, 4
usbHSIsochronousTransferEx_stub:
	.long	__usbHSIsochronousTransferEx
	.globl usbHSIsochronousTransferEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbHSIsochronousTransferEx_fnid, @object
	.size	usbHSIsochronousTransferEx_fnid, 4
usbHSIsochronousTransferEx_fnid:
	.long	2048618155
	.globl usbUnknown5_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbUnknown5_stub, @object
	.size	usbUnknown5_stub, 4
usbUnknown5_stub:
	.long	__usbUnknown5
	.globl usbUnknown5_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbUnknown5_fnid, @object
	.size	usbUnknown5_fnid, 4
usbUnknown5_fnid:
	.long	2099381657
	.globl usbRegisterExtraLddEx_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbRegisterExtraLddEx_stub, @object
	.size	usbRegisterExtraLddEx_stub, 4
usbRegisterExtraLddEx_stub:
	.long	__usbRegisterExtraLddEx
	.globl usbRegisterExtraLddEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbRegisterExtraLddEx_fnid, @object
	.size	usbRegisterExtraLddEx_fnid, 4
usbRegisterExtraLddEx_fnid:
	.long	2145987668
	.globl usbUnknown6_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbUnknown6_stub, @object
	.size	usbUnknown6_stub, 4
usbUnknown6_stub:
	.long	__usbUnknown6
	.globl usbUnknown6_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbUnknown6_fnid, @object
	.size	usbUnknown6_fnid, 4
usbUnknown6_fnid:
	.long	-2062739475
	.globl usbUnregisterExtraLddEx_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbUnregisterExtraLddEx_stub, @object
	.size	usbUnregisterExtraLddEx_stub, 4
usbUnregisterExtraLddEx_stub:
	.long	__usbUnregisterExtraLddEx
	.globl usbUnregisterExtraLddEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbUnregisterExtraLddEx_fnid, @object
	.size	usbUnregisterExtraLddEx_fnid, 4
usbUnregisterExtraLddEx_fnid:
	.long	-1874460543
	.globl usbClosePipe_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbClosePipe_stub, @object
	.size	usbClosePipe_stub, 4
usbClosePipe_stub:
	.long	__usbClosePipe
	.globl usbClosePipe_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbClosePipe_fnid, @object
	.size	usbClosePipe_fnid, 4
usbClosePipe_fnid:
	.long	-1755059870
	.globl usbControlTransferEx_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbControlTransferEx_stub, @object
	.size	usbControlTransferEx_stub, 4
usbControlTransferEx_stub:
	.long	__usbControlTransferEx
	.globl usbControlTransferEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbControlTransferEx_fnid, @object
	.size	usbControlTransferEx_fnid, 4
usbControlTransferEx_fnid:
	.long	-1748036978
	.globl usbUnknown7_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbUnknown7_stub, @object
	.size	usbUnknown7_stub, 4
usbUnknown7_stub:
	.long	__usbUnknown7
	.globl usbUnknown7_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbUnknown7_fnid, @object
	.size	usbUnknown7_fnid, 4
usbUnknown7_fnid:
	.long	-1542946439
	.globl usbBulkTransferEx_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbBulkTransferEx_stub, @object
	.size	usbBulkTransferEx_stub, 4
usbBulkTransferEx_stub:
	.long	__usbBulkTransferEx
	.globl usbBulkTransferEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbBulkTransferEx_fnid, @object
	.size	usbBulkTransferEx_fnid, 4
usbBulkTransferEx_fnid:
	.long	-1401427080
	.globl usbRegisterExtraLdd2Ex_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbRegisterExtraLdd2Ex_stub, @object
	.size	usbRegisterExtraLdd2Ex_stub, 4
usbRegisterExtraLdd2Ex_stub:
	.long	__usbRegisterExtraLdd2Ex
	.globl usbRegisterExtraLdd2Ex_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbRegisterExtraLdd2Ex_fnid, @object
	.size	usbRegisterExtraLdd2Ex_fnid, 4
usbRegisterExtraLdd2Ex_fnid:
	.long	-1118483509
	.globl usbGetDeviceSpeed_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbGetDeviceSpeed_stub, @object
	.size	usbGetDeviceSpeed_stub, 4
usbGetDeviceSpeed_stub:
	.long	__usbGetDeviceSpeed
	.globl usbGetDeviceSpeed_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbGetDeviceSpeed_fnid, @object
	.size	usbGetDeviceSpeed_fnid, 4
usbGetDeviceSpeed_fnid:
	.long	-1111677912
	.globl usbSetThreadPriority_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbSetThreadPriority_stub, @object
	.size	usbSetThreadPriority_stub, 4
usbSetThreadPriority_stub:
	.long	__usbSetThreadPriority
	.globl usbSetThreadPriority_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbSetThreadPriority_fnid, @object
	.size	usbSetThreadPriority_fnid, 4
usbSetThreadPriority_fnid:
	.long	-1035275817
	.globl usbUnknown8_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbUnknown8_stub, @object
	.size	usbUnknown8_stub, 4
usbUnknown8_stub:
	.long	__usbUnknown8
	.globl usbUnknown8_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbUnknown8_fnid, @object
	.size	usbUnknown8_fnid, 4
usbUnknown8_fnid:
	.long	-905983916
	.globl usbUnknown9_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbUnknown9_stub, @object
	.size	usbUnknown9_stub, 4
usbUnknown9_stub:
	.long	__usbUnknown9
	.globl usbUnknown9_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbUnknown9_fnid, @object
	.size	usbUnknown9_fnid, 4
usbUnknown9_fnid:
	.long	-838372401
	.globl usbInit_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbInit_stub, @object
	.size	usbInit_stub, 4
usbInit_stub:
	.long	__usbInit
	.globl usbInit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbInit_fnid, @object
	.size	usbInit_fnid, 4
usbInit_fnid:
	.long	-790141186
	.globl usbGetThreadPriority_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbGetThreadPriority_stub, @object
	.size	usbGetThreadPriority_stub, 4
usbGetThreadPriority_stub:
	.long	__usbGetThreadPriority
	.globl usbGetThreadPriority_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbGetThreadPriority_fnid, @object
	.size	usbGetThreadPriority_fnid, 4
usbGetThreadPriority_fnid:
	.long	-718914070
	.globl usbUnknown10_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbUnknown10_stub, @object
	.size	usbUnknown10_stub, 4
usbUnknown10_stub:
	.long	__usbUnknown10
	.globl usbUnknown10_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbUnknown10_fnid, @object
	.size	usbUnknown10_fnid, 4
usbUnknown10_fnid:
	.long	-662857939
	.globl usbUnknown11_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbUnknown11_stub, @object
	.size	usbUnknown11_stub, 4
usbUnknown11_stub:
	.long	__usbUnknown11
	.globl usbUnknown11_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbUnknown11_fnid, @object
	.size	usbUnknown11_fnid, 4
usbUnknown11_fnid:
	.long	-655124691
	.globl usbGetDeviceLocation_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbGetDeviceLocation_stub, @object
	.size	usbGetDeviceLocation_stub, 4
usbGetDeviceLocation_stub:
	.long	__usbGetDeviceLocation
	.globl usbGetDeviceLocation_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbGetDeviceLocation_fnid, @object
	.size	usbGetDeviceLocation_fnid, 4
usbGetDeviceLocation_fnid:
	.long	-612262397
	.globl usbIsochronousTransferEx_stub
	.section	.data.sceFStub.cellUsbd
	.align 2
	.type	usbIsochronousTransferEx_stub, @object
	.size	usbIsochronousTransferEx_stub, 4
usbIsochronousTransferEx_stub:
	.long	__usbIsochronousTransferEx
	.globl usbIsochronousTransferEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	usbIsochronousTransferEx_fnid, @object
	.size	usbIsochronousTransferEx_fnid, 4
usbIsochronousTransferEx_fnid:
	.long	-564607806
	.ident	"GCC: (GNU) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
