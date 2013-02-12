	.file	"libexport.c"
	.section	".got","aw"
	.section	".text"
	.section	.data.sceFStub.cellSysutil,"aw",@progbits
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
	.size	name, 12
name:
	.string	"cellSysutil"
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
	.4byte	cellSysutil
	.4byte	scefstub
	.4byte	0
	.4byte	0
	.4byte	0
	.4byte	0
	.globl videoGetResolution_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	videoGetResolution_stub, @object
	.size	videoGetResolution_stub, 4
videoGetResolution_stub:
	.long	__videoGetResolution
	.globl videoGetResolution_fnid
	.section	.rodata.sceFNID,"a",@progbits
	.align 2
	.type	videoGetResolution_fnid, @object
	.size	videoGetResolution_fnid, 4
videoGetResolution_fnid:
	.long	-447187827
	.globl videoConfigure_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	videoConfigure_stub, @object
	.size	videoConfigure_stub, 4
videoConfigure_stub:
	.long	__videoConfigure
	.globl videoConfigure_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	videoConfigure_fnid, @object
	.size	videoConfigure_fnid, 4
videoConfigure_fnid:
	.long	195987314
	.globl videoGetState_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	videoGetState_stub, @object
	.size	videoGetState_stub, 4
videoGetState_stub:
	.long	__videoGetState
	.globl videoGetState_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	videoGetState_fnid, @object
	.size	videoGetState_fnid, 4
videoGetState_fnid:
	.long	-2005568811
	.globl videoGetDeviceInfo_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	videoGetDeviceInfo_stub, @object
	.size	videoGetDeviceInfo_stub, 4
videoGetDeviceInfo_stub:
	.long	__videoGetDeviceInfo
	.globl videoGetDeviceInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	videoGetDeviceInfo_fnid, @object
	.size	videoGetDeviceInfo_fnid, 4
videoGetDeviceInfo_fnid:
	.long	512954095
	.globl videoGetConfiguration_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	videoGetConfiguration_stub, @object
	.size	videoGetConfiguration_stub, 4
videoGetConfiguration_stub:
	.long	__videoGetConfiguration
	.globl videoGetConfiguration_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	videoGetConfiguration_fnid, @object
	.size	videoGetConfiguration_fnid, 4
videoGetConfiguration_fnid:
	.long	363901133
	.globl videoGetResolutionAvailability_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	videoGetResolutionAvailability_stub, @object
	.size	videoGetResolutionAvailability_stub, 4
videoGetResolutionAvailability_stub:
	.long	__videoGetResolutionAvailability
	.globl videoGetResolutionAvailability_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	videoGetResolutionAvailability_fnid, @object
	.size	videoGetResolutionAvailability_fnid, 4
videoGetResolutionAvailability_fnid:
	.long	-1557996683
	.globl videoDebugSetMonitorType_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	videoDebugSetMonitorType_stub, @object
	.size	videoDebugSetMonitorType_stub, 4
videoDebugSetMonitorType_stub:
	.long	__videoDebugSetMonitorType
	.globl videoDebugSetMonitorType_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	videoDebugSetMonitorType_fnid, @object
	.size	videoDebugSetMonitorType_fnid, 4
videoDebugSetMonitorType_fnid:
	.long	-807459653
	.globl videoRegisterCallbackEx_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	videoRegisterCallbackEx_stub, @object
	.size	videoRegisterCallbackEx_stub, 4
videoRegisterCallbackEx_stub:
	.long	__videoRegisterCallbackEx
	.globl videoRegisterCallbackEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	videoRegisterCallbackEx_fnid, @object
	.size	videoRegisterCallbackEx_fnid, 4
videoRegisterCallbackEx_fnid:
	.long	-1903442876
	.globl videoUnregisterCallback_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	videoUnregisterCallback_stub, @object
	.size	videoUnregisterCallback_stub, 4
videoUnregisterCallback_stub:
	.long	__videoUnregisterCallback
	.globl videoUnregisterCallback_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	videoUnregisterCallback_fnid, @object
	.size	videoUnregisterCallback_fnid, 4
videoUnregisterCallback_fnid:
	.long	2020720340
	.globl videoGetNumberOfDevice_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	videoGetNumberOfDevice_stub, @object
	.size	videoGetNumberOfDevice_stub, 4
videoGetNumberOfDevice_stub:
	.long	__videoGetNumberOfDevice
	.globl videoGetNumberOfDevice_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	videoGetNumberOfDevice_fnid, @object
	.size	videoGetNumberOfDevice_fnid, 4
videoGetNumberOfDevice_fnid:
	.long	1975236210
	.globl videoGetConvertCursorColorInfo_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	videoGetConvertCursorColorInfo_stub, @object
	.size	videoGetConvertCursorColorInfo_stub, 4
videoGetConvertCursorColorInfo_stub:
	.long	__videoGetConvertCursorColorInfo
	.globl videoGetConvertCursorColorInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	videoGetConvertCursorColorInfo_fnid, @object
	.size	videoGetConvertCursorColorInfo_fnid, 4
videoGetConvertCursorColorInfo_fnid:
	.long	1441015235
	.globl msgDialogClose_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	msgDialogClose_stub, @object
	.size	msgDialogClose_stub, 4
msgDialogClose_stub:
	.long	__msgDialogClose
	.globl msgDialogClose_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	msgDialogClose_fnid, @object
	.size	msgDialogClose_fnid, 4
msgDialogClose_fnid:
	.long	542390064
	.globl msgDialogOpenErrorCodeEx_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	msgDialogOpenErrorCodeEx_stub, @object
	.size	msgDialogOpenErrorCodeEx_stub, 4
msgDialogOpenErrorCodeEx_stub:
	.long	__msgDialogOpenErrorCodeEx
	.globl msgDialogOpenErrorCodeEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	msgDialogOpenErrorCodeEx_fnid, @object
	.size	msgDialogOpenErrorCodeEx_fnid, 4
msgDialogOpenErrorCodeEx_fnid:
	.long	1042467659
	.globl msgDialogOpenEx_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	msgDialogOpenEx_stub, @object
	.size	msgDialogOpenEx_stub, 4
msgDialogOpenEx_stub:
	.long	__msgDialogOpenEx
	.globl msgDialogOpenEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	msgDialogOpenEx_fnid, @object
	.size	msgDialogOpenEx_fnid, 4
msgDialogOpenEx_fnid:
	.long	-132199899
	.globl msgDialogProgressBarInc_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	msgDialogProgressBarInc_stub, @object
	.size	msgDialogProgressBarInc_stub, 4
msgDialogProgressBarInc_stub:
	.long	__msgDialogProgressBarInc
	.globl msgDialogProgressBarInc_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	msgDialogProgressBarInc_fnid, @object
	.size	msgDialogProgressBarInc_fnid, 4
msgDialogProgressBarInc_fnid:
	.long	-1803147518
	.globl msgDialogAbort_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	msgDialogAbort_stub, @object
	.size	msgDialogAbort_stub, 4
msgDialogAbort_stub:
	.long	__msgDialogAbort
	.globl msgDialogAbort_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	msgDialogAbort_fnid, @object
	.size	msgDialogAbort_fnid, 4
msgDialogAbort_fnid:
	.long	1655764995
	.globl msgDialogOpen2Ex_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	msgDialogOpen2Ex_stub, @object
	.size	msgDialogOpen2Ex_stub, 4
msgDialogOpen2Ex_stub:
	.long	__msgDialogOpen2Ex
	.globl msgDialogOpen2Ex_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	msgDialogOpen2Ex_fnid, @object
	.size	msgDialogOpen2Ex_fnid, 4
msgDialogOpen2Ex_fnid:
	.long	1979962331
	.globl msgDialogProgressBarReset_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	msgDialogProgressBarReset_stub, @object
	.size	msgDialogProgressBarReset_stub, 4
msgDialogProgressBarReset_stub:
	.long	__msgDialogProgressBarReset
	.globl msgDialogProgressBarReset_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	msgDialogProgressBarReset_fnid, @object
	.size	msgDialogProgressBarReset_fnid, 4
msgDialogProgressBarReset_fnid:
	.long	2076362920
	.globl msgDialogProgressBarSetMsg_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	msgDialogProgressBarSetMsg_stub, @object
	.size	msgDialogProgressBarSetMsg_stub, 4
msgDialogProgressBarSetMsg_stub:
	.long	__msgDialogProgressBarSetMsg
	.globl msgDialogProgressBarSetMsg_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	msgDialogProgressBarSetMsg_fnid, @object
	.size	msgDialogProgressBarSetMsg_fnid, 4
msgDialogProgressBarSetMsg_fnid:
	.long	-1653934294
	.globl oskGetInputText_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	oskGetInputText_stub, @object
	.size	oskGetInputText_stub, 4
oskGetInputText_stub:
	.long	__oskGetInputText
	.globl oskGetInputText_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	oskGetInputText_fnid, @object
	.size	oskGetInputText_fnid, 4
oskGetInputText_fnid:
	.long	496616430
	.globl oskSetInitialInputDevice_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	oskSetInitialInputDevice_stub, @object
	.size	oskSetInitialInputDevice_stub, 4
oskSetInitialInputDevice_stub:
	.long	__oskSetInitialInputDevice
	.globl oskSetInitialInputDevice_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	oskSetInitialInputDevice_fnid, @object
	.size	oskSetInitialInputDevice_fnid, 4
oskSetInitialInputDevice_fnid:
	.long	-206261186
	.globl oskGetSize_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	oskGetSize_stub, @object
	.size	oskGetSize_stub, 4
oskGetSize_stub:
	.long	__oskGetSize
	.globl oskGetSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	oskGetSize_fnid, @object
	.size	oskGetSize_fnid, 4
oskGetSize_fnid:
	.long	901688800
	.globl oskUnloadAsync_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	oskUnloadAsync_stub, @object
	.size	oskUnloadAsync_stub, 4
oskUnloadAsync_stub:
	.long	__oskUnloadAsync
	.globl oskUnloadAsync_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	oskUnloadAsync_fnid, @object
	.size	oskUnloadAsync_fnid, 4
oskUnloadAsync_fnid:
	.long	1025382705
	.globl oskDisableDimmer_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	oskDisableDimmer_stub, @object
	.size	oskDisableDimmer_stub, 4
oskDisableDimmer_stub:
	.long	__oskDisableDimmer
	.globl oskDisableDimmer_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	oskDisableDimmer_fnid, @object
	.size	oskDisableDimmer_fnid, 4
oskDisableDimmer_fnid:
	.long	1106380840
	.globl oskSetKeyLayoutOption_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	oskSetKeyLayoutOption_stub, @object
	.size	oskSetKeyLayoutOption_stub, 4
oskSetKeyLayoutOption_stub:
	.long	__oskSetKeyLayoutOption
	.globl oskSetKeyLayoutOption_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	oskSetKeyLayoutOption_fnid, @object
	.size	oskSetKeyLayoutOption_fnid, 4
oskSetKeyLayoutOption_fnid:
	.long	-1254337286
	.globl oskAbort_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	oskAbort_stub, @object
	.size	oskAbort_stub, 4
oskAbort_stub:
	.long	__oskAbort
	.globl oskAbort_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	oskAbort_fnid, @object
	.size	oskAbort_fnid, 4
oskAbort_fnid:
	.long	-1227340506
	.globl oskSetDeviceMask_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	oskSetDeviceMask_stub, @object
	.size	oskSetDeviceMask_stub, 4
oskSetDeviceMask_stub:
	.long	__oskSetDeviceMask
	.globl oskSetDeviceMask_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	oskSetDeviceMask_fnid, @object
	.size	oskSetDeviceMask_fnid, 4
oskSetDeviceMask_fnid:
	.long	-747042170
	.globl oskSetSeparateWindowOption_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	oskSetSeparateWindowOption_stub, @object
	.size	oskSetSeparateWindowOption_stub, 4
oskSetSeparateWindowOption_stub:
	.long	__oskSetSeparateWindowOption
	.globl oskSetSeparateWindowOption_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	oskSetSeparateWindowOption_fnid, @object
	.size	oskSetSeparateWindowOption_fnid, 4
oskSetSeparateWindowOption_fnid:
	.long	1407426035
	.globl oskAddSupportLanguage_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	oskAddSupportLanguage_stub, @object
	.size	oskAddSupportLanguage_stub, 4
oskAddSupportLanguage_stub:
	.long	__oskAddSupportLanguage
	.globl oskAddSupportLanguage_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	oskAddSupportLanguage_fnid, @object
	.size	oskAddSupportLanguage_fnid, 4
oskAddSupportLanguage_fnid:
	.long	2132920600
	.globl oskLoadAsync_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	oskLoadAsync_stub, @object
	.size	oskLoadAsync_stub, 4
oskLoadAsync_stub:
	.long	__oskLoadAsync
	.globl oskLoadAsync_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	oskLoadAsync_fnid, @object
	.size	oskLoadAsync_fnid, 4
oskLoadAsync_fnid:
	.long	2144323861
	.globl oskSetInitialKeyLayout_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	oskSetInitialKeyLayout_stub, @object
	.size	oskSetInitialKeyLayout_stub, 4
oskSetInitialKeyLayout_stub:
	.long	__oskSetInitialKeyLayout
	.globl oskSetInitialKeyLayout_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	oskSetInitialKeyLayout_fnid, @object
	.size	oskSetInitialKeyLayout_fnid, 4
oskSetInitialKeyLayout_fnid:
	.long	-1004041972
	.globl oskSetLayoutMode_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	oskSetLayoutMode_stub, @object
	.size	oskSetLayoutMode_stub, 4
oskSetLayoutMode_stub:
	.long	__oskSetLayoutMode
	.globl oskSetLayoutMode_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	oskSetLayoutMode_fnid, @object
	.size	oskSetLayoutMode_fnid, 4
oskSetLayoutMode_fnid:
	.long	-252953396
	.globl sysUtilRegisterCallbackEx_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysUtilRegisterCallbackEx_stub, @object
	.size	sysUtilRegisterCallbackEx_stub, 4
sysUtilRegisterCallbackEx_stub:
	.long	__sysUtilRegisterCallbackEx
	.globl sysUtilRegisterCallbackEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysUtilRegisterCallbackEx_fnid, @object
	.size	sysUtilRegisterCallbackEx_fnid, 4
sysUtilRegisterCallbackEx_fnid:
	.long	-1650937952
	.globl sysUtilCheckCallback_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysUtilCheckCallback_stub, @object
	.size	sysUtilCheckCallback_stub, 4
sysUtilCheckCallback_stub:
	.long	__sysUtilCheckCallback
	.globl sysUtilCheckCallback_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysUtilCheckCallback_fnid, @object
	.size	sysUtilCheckCallback_fnid, 4
sysUtilCheckCallback_fnid:
	.long	412775642
	.globl sysUtilUnregisterCallback_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysUtilUnregisterCallback_stub, @object
	.size	sysUtilUnregisterCallback_stub, 4
sysUtilUnregisterCallback_stub:
	.long	__sysUtilUnregisterCallback
	.globl sysUtilUnregisterCallback_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysUtilUnregisterCallback_fnid, @object
	.size	sysUtilUnregisterCallback_fnid, 4
sysUtilUnregisterCallback_fnid:
	.long	50281499
	.globl sysSaveListLoad2Ex_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysSaveListLoad2Ex_stub, @object
	.size	sysSaveListLoad2Ex_stub, 4
sysSaveListLoad2Ex_stub:
	.long	__sysSaveListLoad2Ex
	.globl sysSaveListLoad2Ex_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSaveListLoad2Ex_fnid, @object
	.size	sysSaveListLoad2Ex_fnid, 4
sysSaveListLoad2Ex_fnid:
	.long	503053782
	.globl sysSaveListSave2Ex_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysSaveListSave2Ex_stub, @object
	.size	sysSaveListSave2Ex_stub, 4
sysSaveListSave2Ex_stub:
	.long	__sysSaveListSave2Ex
	.globl sysSaveListSave2Ex_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSaveListSave2Ex_fnid, @object
	.size	sysSaveListSave2Ex_fnid, 4
sysSaveListSave2Ex_fnid:
	.long	769709667
	.globl sysSaveListAutoLoadEx_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysSaveListAutoLoadEx_stub, @object
	.size	sysSaveListAutoLoadEx_stub, 4
sysSaveListAutoLoadEx_stub:
	.long	__sysSaveListAutoLoadEx
	.globl sysSaveListAutoLoadEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSaveListAutoLoadEx_fnid, @object
	.size	sysSaveListAutoLoadEx_fnid, 4
sysSaveListAutoLoadEx_fnid:
	.long	557994759
	.globl sysSaveListAutoSaveEx_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysSaveListAutoSaveEx_stub, @object
	.size	sysSaveListAutoSaveEx_stub, 4
sysSaveListAutoSaveEx_stub:
	.long	__sysSaveListAutoSaveEx
	.globl sysSaveListAutoSaveEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSaveListAutoSaveEx_fnid, @object
	.size	sysSaveListAutoSaveEx_fnid, 4
sysSaveListAutoSaveEx_fnid:
	.long	1305492046
	.globl sysSaveFixedLoad2Ex_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysSaveFixedLoad2Ex_stub, @object
	.size	sysSaveFixedLoad2Ex_stub, 4
sysSaveFixedLoad2Ex_stub:
	.long	__sysSaveFixedLoad2Ex
	.globl sysSaveFixedLoad2Ex_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSaveFixedLoad2Ex_fnid, @object
	.size	sysSaveFixedLoad2Ex_fnid, 4
sysSaveFixedLoad2Ex_fnid:
	.long	713993634
	.globl sysSaveFixedSave2Ex_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysSaveFixedSave2Ex_stub, @object
	.size	sysSaveFixedSave2Ex_stub, 4
sysSaveFixedSave2Ex_stub:
	.long	__sysSaveFixedSave2Ex
	.globl sysSaveFixedSave2Ex_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSaveFixedSave2Ex_fnid, @object
	.size	sysSaveFixedSave2Ex_fnid, 4
sysSaveFixedSave2Ex_fnid:
	.long	716087029
	.globl sysSaveAutoLoad2Ex_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysSaveAutoLoad2Ex_stub, @object
	.size	sysSaveAutoLoad2Ex_stub, 4
sysSaveAutoLoad2Ex_stub:
	.long	__sysSaveAutoLoad2Ex
	.globl sysSaveAutoLoad2Ex_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSaveAutoLoad2Ex_fnid, @object
	.size	sysSaveAutoLoad2Ex_fnid, 4
sysSaveAutoLoad2Ex_fnid:
	.long	-69875626
	.globl sysSaveAutoSave2Ex_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysSaveAutoSave2Ex_stub, @object
	.size	sysSaveAutoSave2Ex_stub, 4
sysSaveAutoSave2Ex_stub:
	.long	__sysSaveAutoSave2Ex
	.globl sysSaveAutoSave2Ex_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSaveAutoSave2Ex_fnid, @object
	.size	sysSaveAutoSave2Ex_fnid, 4
sysSaveAutoSave2Ex_fnid:
	.long	-1954621877
	.globl sysSaveDelete2_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysSaveDelete2_stub, @object
	.size	sysSaveDelete2_stub, 4
sysSaveDelete2_stub:
	.long	__sysSaveDelete2
	.globl sysSaveDelete2_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSaveDelete2_fnid, @object
	.size	sysSaveDelete2_fnid, 4
sysSaveDelete2_fnid:
	.long	-307374185
	.globl sysGameDataCheck_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysGameDataCheck_stub, @object
	.size	sysGameDataCheck_stub, 4
sysGameDataCheck_stub:
	.long	__sysGameDataCheck
	.globl sysGameDataCheck_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysGameDataCheck_fnid, @object
	.size	sysGameDataCheck_fnid, 4
sysGameDataCheck_fnid:
	.long	-610788877
	.globl sysGameBootCheck_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysGameBootCheck_stub, @object
	.size	sysGameBootCheck_stub, 4
sysGameBootCheck_stub:
	.long	__sysGameBootCheck
	.globl sysGameBootCheck_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysGameBootCheck_fnid, @object
	.size	sysGameBootCheck_fnid, 4
sysGameBootCheck_fnid:
	.long	-182044182
	.globl sysGamePatchCheck_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysGamePatchCheck_stub, @object
	.size	sysGamePatchCheck_stub, 4
sysGamePatchCheck_stub:
	.long	__sysGamePatchCheck
	.globl sysGamePatchCheck_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysGamePatchCheck_fnid, @object
	.size	sysGamePatchCheck_fnid, 4
sysGamePatchCheck_fnid:
	.long	-834439946
	.globl sysGameCreateGameData_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysGameCreateGameData_stub, @object
	.size	sysGameCreateGameData_stub, 4
sysGameCreateGameData_stub:
	.long	__sysGameCreateGameData
	.globl sysGameCreateGameData_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysGameCreateGameData_fnid, @object
	.size	sysGameCreateGameData_fnid, 4
sysGameCreateGameData_fnid:
	.long	1117970739
	.globl sysGameGetParamInt_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysGameGetParamInt_stub, @object
	.size	sysGameGetParamInt_stub, 4
sysGameGetParamInt_stub:
	.long	__sysGameGetParamInt
	.globl sysGameGetParamInt_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysGameGetParamInt_fnid, @object
	.size	sysGameGetParamInt_fnid, 4
sysGameGetParamInt_fnid:
	.long	-1213965137
	.globl sysGameGetParamString_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysGameGetParamString_stub, @object
	.size	sysGameGetParamString_stub, 4
sysGameGetParamString_stub:
	.long	__sysGameGetParamString
	.globl sysGameGetParamString_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysGameGetParamString_fnid, @object
	.size	sysGameGetParamString_fnid, 4
sysGameGetParamString_fnid:
	.long	979202666
	.globl sysGameGetSizeKB_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysGameGetSizeKB_stub, @object
	.size	sysGameGetSizeKB_stub, 4
sysGameGetSizeKB_stub:
	.long	__sysGameGetSizeKB
	.globl sysGameGetSizeKB_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysGameGetSizeKB_fnid, @object
	.size	sysGameGetSizeKB_fnid, 4
sysGameGetSizeKB_fnid:
	.long	-274906411
	.globl sysGameSetParamString_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysGameSetParamString_stub, @object
	.size	sysGameSetParamString_stub, 4
sysGameSetParamString_stub:
	.long	__sysGameSetParamString
	.globl sysGameSetParamString_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysGameSetParamString_fnid, @object
	.size	sysGameSetParamString_fnid, 4
sysGameSetParamString_fnid:
	.long	-626668256
	.globl sysGameGetDiscContentInfoUpdatePath_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysGameGetDiscContentInfoUpdatePath_stub, @object
	.size	sysGameGetDiscContentInfoUpdatePath_stub, 4
sysGameGetDiscContentInfoUpdatePath_stub:
	.long	__sysGameGetDiscContentInfoUpdatePath
	.globl sysGameGetDiscContentInfoUpdatePath_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysGameGetDiscContentInfoUpdatePath_fnid, @object
	.size	sysGameGetDiscContentInfoUpdatePath_fnid, 4
sysGameGetDiscContentInfoUpdatePath_fnid:
	.long	713976722
	.globl sysGameContentPermit_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysGameContentPermit_stub, @object
	.size	sysGameContentPermit_stub, 4
sysGameContentPermit_stub:
	.long	__sysGameContentPermit
	.globl sysGameContentPermit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysGameContentPermit_fnid, @object
	.size	sysGameContentPermit_fnid, 4
sysGameContentPermit_fnid:
	.long	1890380903
	.globl sysGameContentErrorDialog_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysGameContentErrorDialog_stub, @object
	.size	sysGameContentErrorDialog_stub, 4
sysGameContentErrorDialog_stub:
	.long	__sysGameContentErrorDialog
	.globl sysGameContentErrorDialog_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysGameContentErrorDialog_fnid, @object
	.size	sysGameContentErrorDialog_fnid, 4
sysGameContentErrorDialog_fnid:
	.long	-1331562298
	.globl sysGameThemeInstall_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysGameThemeInstall_stub, @object
	.size	sysGameThemeInstall_stub, 4
sysGameThemeInstall_stub:
	.long	__sysGameThemeInstall
	.globl sysGameThemeInstall_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysGameThemeInstall_fnid, @object
	.size	sysGameThemeInstall_fnid, 4
sysGameThemeInstall_fnid:
	.long	-766625496
	.globl sysGameThemeInstallFromBufferEx_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysGameThemeInstallFromBufferEx_stub, @object
	.size	sysGameThemeInstallFromBufferEx_stub, 4
sysGameThemeInstallFromBufferEx_stub:
	.long	__sysGameThemeInstallFromBufferEx
	.globl sysGameThemeInstallFromBufferEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysGameThemeInstallFromBufferEx_fnid, @object
	.size	sysGameThemeInstallFromBufferEx_fnid, 4
sysGameThemeInstallFromBufferEx_fnid:
	.long	-2025822412
	.globl sysGameGetLocalWebContentPath_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysGameGetLocalWebContentPath_stub, @object
	.size	sysGameGetLocalWebContentPath_stub, 4
sysGameGetLocalWebContentPath_stub:
	.long	__sysGameGetLocalWebContentPath
	.globl sysGameGetLocalWebContentPath_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysGameGetLocalWebContentPath_fnid, @object
	.size	sysGameGetLocalWebContentPath_fnid, 4
sysGameGetLocalWebContentPath_fnid:
	.long	-1475612125
	.globl sysGameDeleteGameData_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysGameDeleteGameData_stub, @object
	.size	sysGameDeleteGameData_stub, 4
sysGameDeleteGameData_stub:
	.long	__sysGameDeleteGameData
	.globl sysGameDeleteGameData_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysGameDeleteGameData_fnid, @object
	.size	sysGameDeleteGameData_fnid, 4
sysGameDeleteGameData_fnid:
	.long	-1285044509
	.globl sysGameRegisterDiscChangeCallbackEx_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysGameRegisterDiscChangeCallbackEx_stub, @object
	.size	sysGameRegisterDiscChangeCallbackEx_stub, 4
sysGameRegisterDiscChangeCallbackEx_stub:
	.long	__sysGameRegisterDiscChangeCallbackEx
	.globl sysGameRegisterDiscChangeCallbackEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysGameRegisterDiscChangeCallbackEx_fnid, @object
	.size	sysGameRegisterDiscChangeCallbackEx_fnid, 4
sysGameRegisterDiscChangeCallbackEx_fnid:
	.long	-133079703
	.globl sysGameUnregisterDiscChangeCallback_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysGameUnregisterDiscChangeCallback_stub, @object
	.size	sysGameUnregisterDiscChangeCallback_stub, 4
sysGameUnregisterDiscChangeCallback_stub:
	.long	__sysGameUnregisterDiscChangeCallback
	.globl sysGameUnregisterDiscChangeCallback_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysGameUnregisterDiscChangeCallback_fnid, @object
	.size	sysGameUnregisterDiscChangeCallback_fnid, 4
sysGameUnregisterDiscChangeCallback_fnid:
	.long	570166385
	.globl sysDiscRegisterDiscChangeCallbackEx_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysDiscRegisterDiscChangeCallbackEx_stub, @object
	.size	sysDiscRegisterDiscChangeCallbackEx_stub, 4
sysDiscRegisterDiscChangeCallbackEx_stub:
	.long	__sysDiscRegisterDiscChangeCallbackEx
	.globl sysDiscRegisterDiscChangeCallbackEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysDiscRegisterDiscChangeCallbackEx_fnid, @object
	.size	sysDiscRegisterDiscChangeCallbackEx_fnid, 4
sysDiscRegisterDiscChangeCallbackEx_fnid:
	.long	-539152338
	.globl sysDiscUnregisterDiscChangeCallback_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysDiscUnregisterDiscChangeCallback_stub, @object
	.size	sysDiscUnregisterDiscChangeCallback_stub, 4
sysDiscUnregisterDiscChangeCallback_stub:
	.long	__sysDiscUnregisterDiscChangeCallback
	.globl sysDiscUnregisterDiscChangeCallback_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysDiscUnregisterDiscChangeCallback_fnid, @object
	.size	sysDiscUnregisterDiscChangeCallback_fnid, 4
sysDiscUnregisterDiscChangeCallback_fnid:
	.long	-305967590
	.globl sysTrophyInit_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysTrophyInit_stub, @object
	.size	sysTrophyInit_stub, 4
sysTrophyInit_stub:
	.long	__sysTrophyInit
	.globl sysTrophyInit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysTrophyInit_fnid, @object
	.size	sysTrophyInit_fnid, 4
sysTrophyInit_fnid:
	.long	961968001
	.globl sysTrophyAbortHandle_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysTrophyAbortHandle_stub, @object
	.size	sysTrophyAbortHandle_stub, 4
sysTrophyAbortHandle_stub:
	.long	__sysTrophyAbortHandle
	.globl sysTrophyAbortHandle_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysTrophyAbortHandle_fnid, @object
	.size	sysTrophyAbortHandle_fnid, 4
sysTrophyAbortHandle_fnid:
	.long	1220384711
	.globl sysTrophyCreateContext_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysTrophyCreateContext_stub, @object
	.size	sysTrophyCreateContext_stub, 4
sysTrophyCreateContext_stub:
	.long	__sysTrophyCreateContext
	.globl sysTrophyCreateContext_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysTrophyCreateContext_fnid, @object
	.size	sysTrophyCreateContext_fnid, 4
sysTrophyCreateContext_fnid:
	.long	-473982424
	.globl sysTrophyCreateHandle_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysTrophyCreateHandle_stub, @object
	.size	sysTrophyCreateHandle_stub, 4
sysTrophyCreateHandle_stub:
	.long	__sysTrophyCreateHandle
	.globl sysTrophyCreateHandle_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysTrophyCreateHandle_fnid, @object
	.size	sysTrophyCreateHandle_fnid, 4
sysTrophyCreateHandle_fnid:
	.long	472205069
	.globl sysTrophyDestroyContext_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysTrophyDestroyContext_stub, @object
	.size	sysTrophyDestroyContext_stub, 4
sysTrophyDestroyContext_stub:
	.long	__sysTrophyDestroyContext
	.globl sysTrophyDestroyContext_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysTrophyDestroyContext_fnid, @object
	.size	sysTrophyDestroyContext_fnid, 4
sysTrophyDestroyContext_fnid:
	.long	927067335
	.globl sysTrophyDestroyHandle_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysTrophyDestroyHandle_stub, @object
	.size	sysTrophyDestroyHandle_stub, 4
sysTrophyDestroyHandle_stub:
	.long	__sysTrophyDestroyHandle
	.globl sysTrophyDestroyHandle_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysTrophyDestroyHandle_fnid, @object
	.size	sysTrophyDestroyHandle_fnid, 4
sysTrophyDestroyHandle_fnid:
	.long	1648153308
	.globl sysTrophyGetGameIcon_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysTrophyGetGameIcon_stub, @object
	.size	sysTrophyGetGameIcon_stub, 4
sysTrophyGetGameIcon_stub:
	.long	__sysTrophyGetGameIcon
	.globl sysTrophyGetGameIcon_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysTrophyGetGameIcon_fnid, @object
	.size	sysTrophyGetGameIcon_fnid, 4
sysTrophyGetGameIcon_fnid:
	.long	-14049789
	.globl sysTrophyGetGameInfo_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysTrophyGetGameInfo_stub, @object
	.size	sysTrophyGetGameInfo_stub, 4
sysTrophyGetGameInfo_stub:
	.long	__sysTrophyGetGameInfo
	.globl sysTrophyGetGameInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysTrophyGetGameInfo_fnid, @object
	.size	sysTrophyGetGameInfo_fnid, 4
sysTrophyGetGameInfo_fnid:
	.long	1238467095
	.globl sysTrophyGetGameProgress_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysTrophyGetGameProgress_stub, @object
	.size	sysTrophyGetGameProgress_stub, 4
sysTrophyGetGameProgress_stub:
	.long	__sysTrophyGetGameProgress
	.globl sysTrophyGetGameProgress_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysTrophyGetGameProgress_fnid, @object
	.size	sysTrophyGetGameProgress_fnid, 4
sysTrophyGetGameProgress_fnid:
	.long	127864455
	.globl sysTrophyGetRequiredDiskSpace_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysTrophyGetRequiredDiskSpace_stub, @object
	.size	sysTrophyGetRequiredDiskSpace_stub, 4
sysTrophyGetRequiredDiskSpace_stub:
	.long	__sysTrophyGetRequiredDiskSpace
	.globl sysTrophyGetRequiredDiskSpace_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysTrophyGetRequiredDiskSpace_fnid, @object
	.size	sysTrophyGetRequiredDiskSpace_fnid, 4
sysTrophyGetRequiredDiskSpace_fnid:
	.long	922826494
	.globl sysTrophyGetTrophyIcon_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysTrophyGetTrophyIcon_stub, @object
	.size	sysTrophyGetTrophyIcon_stub, 4
sysTrophyGetTrophyIcon_stub:
	.long	__sysTrophyGetTrophyIcon
	.globl sysTrophyGetTrophyIcon_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysTrophyGetTrophyIcon_fnid, @object
	.size	sysTrophyGetTrophyIcon_fnid, 4
sysTrophyGetTrophyIcon_fnid:
	.long	-1158809975
	.globl sysTrophyGetTrophyInfo_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysTrophyGetTrophyInfo_stub, @object
	.size	sysTrophyGetTrophyInfo_stub, 4
sysTrophyGetTrophyInfo_stub:
	.long	__sysTrophyGetTrophyInfo
	.globl sysTrophyGetTrophyInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysTrophyGetTrophyInfo_fnid, @object
	.size	sysTrophyGetTrophyInfo_fnid, 4
sysTrophyGetTrophyInfo_fnid:
	.long	-51981558
	.globl sysTrophyGetTrophyUnlockState_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysTrophyGetTrophyUnlockState_stub, @object
	.size	sysTrophyGetTrophyUnlockState_stub, 4
sysTrophyGetTrophyUnlockState_stub:
	.long	__sysTrophyGetTrophyUnlockState
	.globl sysTrophyGetTrophyUnlockState_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysTrophyGetTrophyUnlockState_fnid, @object
	.size	sysTrophyGetTrophyUnlockState_fnid, 4
sysTrophyGetTrophyUnlockState_fnid:
	.long	-1280560008
	.globl sysTrophyRegisterContextEx_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysTrophyRegisterContextEx_stub, @object
	.size	sysTrophyRegisterContextEx_stub, 4
sysTrophyRegisterContextEx_stub:
	.long	__sysTrophyRegisterContextEx
	.globl sysTrophyRegisterContextEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysTrophyRegisterContextEx_fnid, @object
	.size	sysTrophyRegisterContextEx_fnid, 4
sysTrophyRegisterContextEx_fnid:
	.long	295154988
	.globl sysTrophySetSoundLevel_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysTrophySetSoundLevel_stub, @object
	.size	sysTrophySetSoundLevel_stub, 4
sysTrophySetSoundLevel_stub:
	.long	__sysTrophySetSoundLevel
	.globl sysTrophySetSoundLevel_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysTrophySetSoundLevel_fnid, @object
	.size	sysTrophySetSoundLevel_fnid, 4
sysTrophySetSoundLevel_fnid:
	.long	668916371
	.globl sysTrophyTerm_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysTrophyTerm_stub, @object
	.size	sysTrophyTerm_stub, 4
sysTrophyTerm_stub:
	.long	__sysTrophyTerm
	.globl sysTrophyTerm_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysTrophyTerm_fnid, @object
	.size	sysTrophyTerm_fnid, 4
sysTrophyTerm_fnid:
	.long	-1476739251
	.globl sysTrophyUnlockTrophy_stub
	.section	.data.sceFStub.cellSysutil
	.align 2
	.type	sysTrophyUnlockTrophy_stub, @object
	.size	sysTrophyUnlockTrophy_stub, 4
sysTrophyUnlockTrophy_stub:
	.long	__sysTrophyUnlockTrophy
	.globl sysTrophyUnlockTrophy_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysTrophyUnlockTrophy_fnid, @object
	.size	sysTrophyUnlockTrophy_fnid, 4
sysTrophyUnlockTrophy_fnid:
	.long	-1930502879
	.ident	"GCC: (GNU) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
