	.file	"libexport.c"
	.section	".got","aw"
	.section	".text"
	.section	.data.sceFStub.sys_io,"aw",@progbits
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
	.string	"sys_io"
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
	.4byte	sys_io
	.4byte	scefstub
	.4byte	0
	.4byte	0
	.4byte	0
	.4byte	0
	.globl sys_config_start_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	sys_config_start_stub, @object
	.size	sys_config_start_stub, 4
sys_config_start_stub:
	.long	__sys_config_start
	.globl sys_config_start_fnid
	.section	.rodata.sceFNID,"a",@progbits
	.align 2
	.type	sys_config_start_fnid, @object
	.size	sys_config_start_fnid, 4
sys_config_start_fnid:
	.long	110087110
	.globl sys_config_stop_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	sys_config_stop_stub, @object
	.size	sys_config_stop_stub, 4
sys_config_stop_stub:
	.long	__sys_config_stop
	.globl sys_config_stop_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sys_config_stop_fnid, @object
	.size	sys_config_stop_fnid, 4
sys_config_stop_fnid:
	.long	1832286547
	.globl sys_config_add_service_listener_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	sys_config_add_service_listener_stub, @object
	.size	sys_config_add_service_listener_stub, 4
sys_config_add_service_listener_stub:
	.long	__sys_config_add_service_listener
	.globl sys_config_add_service_listener_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sys_config_add_service_listener_fnid, @object
	.size	sys_config_add_service_listener_fnid, 4
sys_config_add_service_listener_fnid:
	.long	1793131926
	.globl sys_config_remove_service_listener_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	sys_config_remove_service_listener_stub, @object
	.size	sys_config_remove_service_listener_stub, 4
sys_config_remove_service_listener_stub:
	.long	__sys_config_remove_service_listener
	.globl sys_config_remove_service_listener_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sys_config_remove_service_listener_fnid, @object
	.size	sys_config_remove_service_listener_fnid, 4
sys_config_remove_service_listener_fnid:
	.long	-170273423
	.globl sys_config_register_service_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	sys_config_register_service_stub, @object
	.size	sys_config_register_service_stub, 4
sys_config_register_service_stub:
	.long	__sys_config_register_service
	.globl sys_config_register_service_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sys_config_register_service_fnid, @object
	.size	sys_config_register_service_fnid, 4
sys_config_register_service_fnid:
	.long	2029017250
	.globl sys_config_unregister_service_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	sys_config_unregister_service_stub, @object
	.size	sys_config_unregister_service_stub, 4
sys_config_unregister_service_stub:
	.long	__sys_config_unregister_service
	.globl sys_config_unregister_service_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sys_config_unregister_service_fnid, @object
	.size	sys_config_unregister_service_fnid, 4
sys_config_unregister_service_fnid:
	.long	1602326540
	.globl ioPadInit_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioPadInit_stub, @object
	.size	ioPadInit_stub, 4
ioPadInit_stub:
	.long	__ioPadInit
	.globl ioPadInit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioPadInit_fnid, @object
	.size	ioPadInit_fnid, 4
ioPadInit_fnid:
	.long	486115328
	.globl ioPadEnd_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioPadEnd_stub, @object
	.size	ioPadEnd_stub, 4
ioPadEnd_stub:
	.long	__ioPadEnd
	.globl ioPadEnd_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioPadEnd_fnid, @object
	.size	ioPadEnd_fnid, 4
ioPadEnd_fnid:
	.long	1302033877
	.globl ioPadClearBuf_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioPadClearBuf_stub, @object
	.size	ioPadClearBuf_stub, 4
ioPadClearBuf_stub:
	.long	__ioPadClearBuf
	.globl ioPadClearBuf_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioPadClearBuf_fnid, @object
	.size	ioPadClearBuf_fnid, 4
ioPadClearBuf_fnid:
	.long	224341012
	.globl ioPadInfoPressMode_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioPadInfoPressMode_stub, @object
	.size	ioPadInfoPressMode_stub, 4
ioPadInfoPressMode_stub:
	.long	__ioPadInfoPressMode
	.globl ioPadInfoPressMode_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioPadInfoPressMode_fnid, @object
	.size	ioPadInfoPressMode_fnid, 4
ioPadInfoPressMode_fnid:
	.long	237894317
	.globl ioPadLddRegisterController_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioPadLddRegisterController_stub, @object
	.size	ioPadLddRegisterController_stub, 4
ioPadLddRegisterController_stub:
	.long	__ioPadLddRegisterController
	.globl ioPadLddRegisterController_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioPadLddRegisterController_fnid, @object
	.size	ioPadLddRegisterController_fnid, 4
ioPadLddRegisterController_fnid:
	.long	547978146
	.globl ioPadGetInfo_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioPadGetInfo_stub, @object
	.size	ioPadGetInfo_stub, 4
ioPadGetInfo_stub:
	.long	__ioPadGetInfo
	.globl ioPadGetInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioPadGetInfo_fnid, @object
	.size	ioPadGetInfo_fnid, 4
ioPadGetInfo_fnid:
	.long	984274020
	.globl ioPadGetRawData_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioPadGetRawData_stub, @object
	.size	ioPadGetRawData_stub, 4
ioPadGetRawData_stub:
	.long	__ioPadGetRawData
	.globl ioPadGetRawData_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioPadGetRawData_fnid, @object
	.size	ioPadGetRawData_fnid, 4
ioPadGetRawData_fnid:
	.long	1064926719
	.globl ioPadGetDataExtra_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioPadGetDataExtra_stub, @object
	.size	ioPadGetDataExtra_stub, 4
ioPadGetDataExtra_stub:
	.long	__ioPadGetDataExtra
	.globl ioPadGetDataExtra_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioPadGetDataExtra_fnid, @object
	.size	ioPadGetDataExtra_fnid, 4
ioPadGetDataExtra_fnid:
	.long	1807785057
	.globl ioPadInfoSensorMode_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioPadInfoSensorMode_stub, @object
	.size	ioPadInfoSensorMode_stub, 4
ioPadInfoSensorMode_stub:
	.long	__ioPadInfoSensorMode
	.globl ioPadInfoSensorMode_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioPadInfoSensorMode_fnid, @object
	.size	ioPadInfoSensorMode_fnid, 4
ioPadInfoSensorMode_fnid:
	.long	2015364441
	.globl ioPadGetData_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioPadGetData_stub, @object
	.size	ioPadGetData_stub, 4
ioPadGetData_stub:
	.long	__ioPadGetData
	.globl ioPadGetData_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioPadGetData_fnid, @object
	.size	ioPadGetData_fnid, 4
ioPadGetData_fnid:
	.long	-1955410527
	.globl ioPadLddGetPortNo_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioPadLddGetPortNo_stub, @object
	.size	ioPadLddGetPortNo_stub, 4
ioPadLddGetPortNo_stub:
	.long	__ioPadLddGetPortNo
	.globl ioPadLddGetPortNo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioPadLddGetPortNo_fnid, @object
	.size	ioPadLddGetPortNo_fnid, 4
ioPadLddGetPortNo_fnid:
	.long	-1954401819
	.globl ioPadLddDataInsert_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioPadLddDataInsert_stub, @object
	.size	ioPadLddDataInsert_stub, 4
ioPadLddDataInsert_stub:
	.long	__ioPadLddDataInsert
	.globl ioPadLddDataInsert_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioPadLddDataInsert_fnid, @object
	.size	ioPadLddDataInsert_fnid, 4
ioPadLddDataInsert_fnid:
	.long	-1157798903
	.globl ioPadSetSensorMode_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioPadSetSensorMode_stub, @object
	.size	ioPadSetSensorMode_stub, 4
ioPadSetSensorMode_stub:
	.long	__ioPadSetSensorMode
	.globl ioPadSetSensorMode_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioPadSetSensorMode_fnid, @object
	.size	ioPadSetSensorMode_fnid, 4
ioPadSetSensorMode_fnid:
	.long	-1101274182
	.globl ioPadGetCapabilityInfo_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioPadGetCapabilityInfo_stub, @object
	.size	ioPadGetCapabilityInfo_stub, 4
ioPadGetCapabilityInfo_stub:
	.long	__ioPadGetCapabilityInfo
	.globl ioPadGetCapabilityInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioPadGetCapabilityInfo_fnid, @object
	.size	ioPadGetCapabilityInfo_fnid, 4
ioPadGetCapabilityInfo_fnid:
	.long	-604715620
	.globl ioPadLddUnregisterController_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioPadLddUnregisterController_stub, @object
	.size	ioPadLddUnregisterController_stub, 4
ioPadLddUnregisterController_stub:
	.long	__ioPadLddUnregisterController
	.globl ioPadLddUnregisterController_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioPadLddUnregisterController_fnid, @object
	.size	ioPadLddUnregisterController_fnid, 4
ioPadLddUnregisterController_fnid:
	.long	-465372504
	.globl ioPadSetActDirect_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioPadSetActDirect_stub, @object
	.size	ioPadSetActDirect_stub, 4
ioPadSetActDirect_stub:
	.long	__ioPadSetActDirect
	.globl ioPadSetActDirect_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioPadSetActDirect_fnid, @object
	.size	ioPadSetActDirect_fnid, 4
ioPadSetActDirect_fnid:
	.long	-162183954
	.globl ioPadSetPressMode_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioPadSetPressMode_stub, @object
	.size	ioPadSetPressMode_stub, 4
ioPadSetPressMode_stub:
	.long	__ioPadSetPressMode
	.globl ioPadSetPressMode_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioPadSetPressMode_fnid, @object
	.size	ioPadSetPressMode_fnid, 4
ioPadSetPressMode_fnid:
	.long	-130055806
	.globl ioPadPeriphGetInfo_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioPadPeriphGetInfo_stub, @object
	.size	ioPadPeriphGetInfo_stub, 4
ioPadPeriphGetInfo_stub:
	.long	__ioPadPeriphGetInfo
	.globl ioPadPeriphGetInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioPadPeriphGetInfo_fnid, @object
	.size	ioPadPeriphGetInfo_fnid, 4
ioPadPeriphGetInfo_fnid:
	.long	1288287885
	.globl ioPadSetPortSetting_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioPadSetPortSetting_stub, @object
	.size	ioPadSetPortSetting_stub, 4
ioPadSetPortSetting_stub:
	.long	__ioPadSetPortSetting
	.globl ioPadSetPortSetting_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioPadSetPortSetting_fnid, @object
	.size	ioPadSetPortSetting_fnid, 4
ioPadSetPortSetting_fnid:
	.long	1468939416
	.globl ioPadPeriphGetData_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioPadPeriphGetData_stub, @object
	.size	ioPadPeriphGetData_stub, 4
ioPadPeriphGetData_stub:
	.long	__ioPadPeriphGetData
	.globl ioPadPeriphGetData_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioPadPeriphGetData_fnid, @object
	.size	ioPadPeriphGetData_fnid, 4
ioPadPeriphGetData_fnid:
	.long	-1979649436
	.globl ioPadGetInfo2_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioPadGetInfo2_stub, @object
	.size	ioPadGetInfo2_stub, 4
ioPadGetInfo2_stub:
	.long	__ioPadGetInfo2
	.globl ioPadGetInfo2_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioPadGetInfo2_fnid, @object
	.size	ioPadGetInfo2_fnid, 4
ioPadGetInfo2_fnid:
	.long	-1492933347
	.globl ioMouseInit_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioMouseInit_stub, @object
	.size	ioMouseInit_stub, 4
ioMouseInit_stub:
	.long	__ioMouseInit
	.globl ioMouseInit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioMouseInit_fnid, @object
	.size	ioMouseInit_fnid, 4
ioMouseInit_fnid:
	.long	-922549960
	.globl ioMouseEnd_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioMouseEnd_stub, @object
	.size	ioMouseEnd_stub, 4
ioMouseEnd_stub:
	.long	__ioMouseEnd
	.globl ioMouseEnd_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioMouseEnd_fnid, @object
	.size	ioMouseEnd_fnid, 4
ioMouseEnd_fnid:
	.long	-519994418
	.globl ioMouseClearBuf_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioMouseClearBuf_stub, @object
	.size	ioMouseClearBuf_stub, 4
ioMouseClearBuf_stub:
	.long	__ioMouseClearBuf
	.globl ioMouseClearBuf_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioMouseClearBuf_fnid, @object
	.size	ioMouseClearBuf_fnid, 4
ioMouseClearBuf_fnid:
	.long	1056336789
	.globl ioMouseGetInfo_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioMouseGetInfo_stub, @object
	.size	ioMouseGetInfo_stub, 4
ioMouseGetInfo_stub:
	.long	__ioMouseGetInfo
	.globl ioMouseGetInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioMouseGetInfo_fnid, @object
	.size	ioMouseGetInfo_fnid, 4
ioMouseGetInfo_fnid:
	.long	1538207995
	.globl ioMouseGetTabletDataList_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioMouseGetTabletDataList_stub, @object
	.size	ioMouseGetTabletDataList_stub, 4
ioMouseGetTabletDataList_stub:
	.long	__ioMouseGetTabletDataList
	.globl ioMouseGetTabletDataList_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioMouseGetTabletDataList_fnid, @object
	.size	ioMouseGetTabletDataList_fnid, 4
ioMouseGetTabletDataList_fnid:
	.long	564539035
	.globl ioMouseSetTabletMode_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioMouseSetTabletMode_stub, @object
	.size	ioMouseSetTabletMode_stub, 4
ioMouseSetTabletMode_stub:
	.long	__ioMouseSetTabletMode
	.globl ioMouseSetTabletMode_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioMouseSetTabletMode_fnid, @object
	.size	ioMouseSetTabletMode_fnid, 4
ioMouseSetTabletMode_fnid:
	.long	756472399
	.globl ioMouseGetData_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioMouseGetData_stub, @object
	.size	ioMouseGetData_stub, 4
ioMouseGetData_stub:
	.long	__ioMouseGetData
	.globl ioMouseGetData_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioMouseGetData_fnid, @object
	.size	ioMouseGetData_fnid, 4
ioMouseGetData_fnid:
	.long	825812530
	.globl ioMouseInfoTabletMode_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioMouseInfoTabletMode_stub, @object
	.size	ioMouseInfoTabletMode_stub, 4
ioMouseInfoTabletMode_stub:
	.long	__ioMouseInfoTabletMode
	.globl ioMouseInfoTabletMode_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioMouseInfoTabletMode_fnid, @object
	.size	ioMouseInfoTabletMode_fnid, 4
ioMouseInfoTabletMode_fnid:
	.long	1292581663
	.globl ioMouseGetRawData_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioMouseGetRawData_stub, @object
	.size	ioMouseGetRawData_stub, 4
ioMouseGetRawData_stub:
	.long	__ioMouseGetRawData
	.globl ioMouseGetRawData_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioMouseGetRawData_fnid, @object
	.size	ioMouseGetRawData_fnid, 4
ioMouseGetRawData_fnid:
	.long	-1557607371
	.globl ioMouseGetDataList_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioMouseGetDataList_stub, @object
	.size	ioMouseGetDataList_stub, 4
ioMouseGetDataList_stub:
	.long	__ioMouseGetDataList
	.globl ioMouseGetDataList_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioMouseGetDataList_fnid, @object
	.size	ioMouseGetDataList_fnid, 4
ioMouseGetDataList_fnid:
	.long	1808871920
	.globl ioKbInit_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioKbInit_stub, @object
	.size	ioKbInit_stub, 4
ioKbInit_stub:
	.long	__ioKbInit
	.globl ioKbInit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioKbInit_fnid, @object
	.size	ioKbInit_fnid, 4
ioKbInit_fnid:
	.long	1128230592
	.globl ioKbEnd_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioKbEnd_stub, @object
	.size	ioKbEnd_stub, 4
ioKbEnd_stub:
	.long	__ioKbEnd
	.globl ioKbEnd_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioKbEnd_fnid, @object
	.size	ioKbEnd_fnid, 4
ioKbEnd_fnid:
	.long	-1077005691
	.globl ioKbRead_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioKbRead_stub, @object
	.size	ioKbRead_stub, 4
ioKbRead_stub:
	.long	__ioKbRead
	.globl ioKbRead_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioKbRead_fnid, @object
	.size	ioKbRead_fnid, 4
ioKbRead_fnid:
	.long	-16113225
	.globl ioKbSetReadMode_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioKbSetReadMode_stub, @object
	.size	ioKbSetReadMode_stub, 4
ioKbSetReadMode_stub:
	.long	__ioKbSetReadMode
	.globl ioKbSetReadMode_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioKbSetReadMode_fnid, @object
	.size	ioKbSetReadMode_fnid, 4
ioKbSetReadMode_fnid:
	.long	-554704985
	.globl ioKbSetCodeType_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioKbSetCodeType_stub, @object
	.size	ioKbSetCodeType_stub, 4
ioKbSetCodeType_stub:
	.long	__ioKbSetCodeType
	.globl ioKbSetCodeType_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioKbSetCodeType_fnid, @object
	.size	ioKbSetCodeType_fnid, 4
ioKbSetCodeType_fnid:
	.long	-1510449587
	.globl ioKbCnvRawCode_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioKbCnvRawCode_stub, @object
	.size	ioKbCnvRawCode_stub, 4
ioKbCnvRawCode_stub:
	.long	__ioKbCnvRawCode
	.globl ioKbCnvRawCode_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioKbCnvRawCode_fnid, @object
	.size	ioKbCnvRawCode_fnid, 4
ioKbCnvRawCode_fnid:
	.long	1253177975
	.globl ioKbSetLEDStatus_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioKbSetLEDStatus_stub, @object
	.size	ioKbSetLEDStatus_stub, 4
ioKbSetLEDStatus_stub:
	.long	__ioKbSetLEDStatus
	.globl ioKbSetLEDStatus_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioKbSetLEDStatus_fnid, @object
	.size	ioKbSetLEDStatus_fnid, 4
ioKbSetLEDStatus_fnid:
	.long	1064486254
	.globl ioKbGetInfo_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioKbGetInfo_stub, @object
	.size	ioKbGetInfo_stub, 4
ioKbGetInfo_stub:
	.long	__ioKbGetInfo
	.globl ioKbGetInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioKbGetInfo_fnid, @object
	.size	ioKbGetInfo_fnid, 4
ioKbGetInfo_fnid:
	.long	790066389
	.globl ioKbGetConfiguration_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioKbGetConfiguration_stub, @object
	.size	ioKbGetConfiguration_stub, 4
ioKbGetConfiguration_stub:
	.long	__ioKbGetConfiguration
	.globl ioKbGetConfiguration_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioKbGetConfiguration_fnid, @object
	.size	ioKbGetConfiguration_fnid, 4
ioKbGetConfiguration_fnid:
	.long	527559870
	.globl ioKbClearBuf_stub
	.section	.data.sceFStub.sys_io
	.align 2
	.type	ioKbClearBuf_stub, @object
	.size	ioKbClearBuf_stub, 4
ioKbClearBuf_stub:
	.long	__ioKbClearBuf
	.globl ioKbClearBuf_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	ioKbClearBuf_fnid, @object
	.size	ioKbClearBuf_fnid, 4
ioKbClearBuf_fnid:
	.long	544454646
	.ident	"GCC: (GNU) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
