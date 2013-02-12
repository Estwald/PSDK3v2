	.file	"libexport.c"
	.section	".got","aw"
	.section	".text"
	.section	.data.sceFStub.sysPrxForUser,"aw",@progbits
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
	.string	"sysPrxForUser"
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
	.4byte	sysPrxForUser
	.4byte	scefstub
	.4byte	0
	.4byte	0
	.4byte	0
	.4byte	0
	.globl sysGetSystemTime_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysGetSystemTime_stub, @object
	.size	sysGetSystemTime_stub, 4
sysGetSystemTime_stub:
	.long	__sysGetSystemTime
	.globl sysGetSystemTime_fnid
	.section	.rodata.sceFNID,"a",@progbits
	.align 2
	.type	sysGetSystemTime_fnid, @object
	.size	sysGetSystemTime_fnid, 4
sysGetSystemTime_fnid:
	.long	-2073959128
	.globl sysGetSystemSwVersion_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysGetSystemSwVersion_stub, @object
	.size	sysGetSystemSwVersion_stub, 4
sysGetSystemSwVersion_stub:
	.long	__sysGetSystemSwVersion
	.globl sysGetSystemSwVersion_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysGetSystemSwVersion_fnid, @object
	.size	sysGetSystemSwVersion_fnid, 4
sysGetSystemSwVersion_fnid:
	.long	1645098407
	.globl sysGetTemperature_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysGetTemperature_stub, @object
	.size	sysGetTemperature_stub, 4
sysGetTemperature_stub:
	.long	__sysGetTemperature
	.globl sysGetTemperature_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysGetTemperature_fnid, @object
	.size	sysGetTemperature_fnid, 4
sysGetTemperature_fnid:
	.long	829584797
	.globl sysGetRandomNumber_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysGetRandomNumber_stub, @object
	.size	sysGetRandomNumber_stub, 4
sysGetRandomNumber_stub:
	.long	__sysGetRandomNumber
	.globl sysGetRandomNumber_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysGetRandomNumber_fnid, @object
	.size	sysGetRandomNumber_fnid, 4
sysGetRandomNumber_fnid:
	.long	1906853674
	.globl sysGetRtcStatus_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysGetRtcStatus_stub, @object
	.size	sysGetRtcStatus_stub, 4
sysGetRtcStatus_stub:
	.long	__sysGetRtcStatus
	.globl sysGetRtcStatus_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysGetRtcStatus_fnid, @object
	.size	sysGetRtcStatus_fnid, 4
sysGetRtcStatus_fnid:
	.long	-1617623168
	.globl sysBoardStorageRead_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysBoardStorageRead_stub, @object
	.size	sysBoardStorageRead_stub, 4
sysBoardStorageRead_stub:
	.long	__sysBoardStorageRead
	.globl sysBoardStorageRead_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysBoardStorageRead_fnid, @object
	.size	sysBoardStorageRead_fnid, 4
sysBoardStorageRead_fnid:
	.long	-412523275
	.globl sysBoardStorageWrite_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysBoardStorageWrite_stub, @object
	.size	sysBoardStorageWrite_stub, 4
sysBoardStorageWrite_stub:
	.long	__sysBoardStorageWrite
	.globl sysBoardStorageWrite_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysBoardStorageWrite_fnid, @object
	.size	sysBoardStorageWrite_fnid, 4
sysBoardStorageWrite_fnid:
	.long	-1951384904
	.globl sysProcessIsStack_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysProcessIsStack_stub, @object
	.size	sysProcessIsStack_stub, 4
sysProcessIsStack_stub:
	.long	__sysProcessIsStack
	.globl sysProcessIsStack_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysProcessIsStack_fnid, @object
	.size	sysProcessIsStack_fnid, 4
sysProcessIsStack_fnid:
	.long	1332835017
	.globl sysProcessExit_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysProcessExit_stub, @object
	.size	sysProcessExit_stub, 4
sysProcessExit_stub:
	.long	__sysProcessExit
	.globl sysProcessExit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysProcessExit_fnid, @object
	.size	sysProcessExit_fnid, 4
sysProcessExit_fnid:
	.long	-420298265
	.globl sysProcessExitspawn_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysProcessExitspawn_stub, @object
	.size	sysProcessExitspawn_stub, 4
sysProcessExitspawn_stub:
	.long	__sysProcessExitspawn
	.globl sysProcessExitspawn_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysProcessExitspawn_fnid, @object
	.size	sysProcessExitspawn_fnid, 4
sysProcessExitspawn_fnid:
	.long	-61691991
	.globl sysProcessExitSpawn2Ex_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysProcessExitSpawn2Ex_stub, @object
	.size	sysProcessExitSpawn2Ex_stub, 4
sysProcessExitSpawn2Ex_stub:
	.long	__sysProcessExitSpawn2Ex
	.globl sysProcessExitSpawn2Ex_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysProcessExitSpawn2Ex_fnid, @object
	.size	sysProcessExitSpawn2Ex_fnid, 4
sysProcessExitSpawn2Ex_fnid:
	.long	1744436955
	.globl sysProcessExitSpawnWithLevel_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysProcessExitSpawnWithLevel_stub, @object
	.size	sysProcessExitSpawnWithLevel_stub, 4
sysProcessExitSpawnWithLevel_stub:
	.long	__sysProcessExitSpawnWithLevel
	.globl sysProcessExitSpawnWithLevel_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysProcessExitSpawnWithLevel_fnid, @object
	.size	sysProcessExitSpawnWithLevel_fnid, 4
sysProcessExitSpawnWithLevel_fnid:
	.long	-1563968924
	.globl sysProcessAtExitSpawn_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysProcessAtExitSpawn_stub, @object
	.size	sysProcessAtExitSpawn_stub, 4
sysProcessAtExitSpawn_stub:
	.long	__sysProcessAtExitSpawn
	.globl sysProcessAtExitSpawn_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysProcessAtExitSpawn_fnid, @object
	.size	sysProcessAtExitSpawn_fnid, 4
sysProcessAtExitSpawn_fnid:
	.long	746878322
	.globl sysProcess_At_ExitSpawn_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysProcess_At_ExitSpawn_stub, @object
	.size	sysProcess_At_ExitSpawn_stub, 4
sysProcess_At_ExitSpawn_stub:
	.long	__sysProcess_At_ExitSpawn
	.globl sysProcess_At_ExitSpawn_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysProcess_At_ExitSpawn_fnid, @object
	.size	sysProcess_At_ExitSpawn_fnid, 4
sysProcess_At_ExitSpawn_fnid:
	.long	-1775073471
	.globl sysPrxRegisterLibrary_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysPrxRegisterLibrary_stub, @object
	.size	sysPrxRegisterLibrary_stub, 4
sysPrxRegisterLibrary_stub:
	.long	__sysPrxRegisterLibrary
	.globl sysPrxRegisterLibrary_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysPrxRegisterLibrary_fnid, @object
	.size	sysPrxRegisterLibrary_fnid, 4
sysPrxRegisterLibrary_fnid:
	.long	1118975314
	.globl sysPrxUnregisterLibrary_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysPrxUnregisterLibrary_stub, @object
	.size	sysPrxUnregisterLibrary_stub, 4
sysPrxUnregisterLibrary_stub:
	.long	__sysPrxUnregisterLibrary
	.globl sysPrxUnregisterLibrary_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysPrxUnregisterLibrary_fnid, @object
	.size	sysPrxUnregisterLibrary_fnid, 4
sysPrxUnregisterLibrary_fnid:
	.long	-789952601
	.globl sysPrxStartModule_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysPrxStartModule_stub, @object
	.size	sysPrxStartModule_stub, 4
sysPrxStartModule_stub:
	.long	__sysPrxStartModule
	.globl sysPrxStartModule_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysPrxStartModule_fnid, @object
	.size	sysPrxStartModule_fnid, 4
sysPrxStartModule_fnid:
	.long	-1625800035
	.globl sysPrxStopModule_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysPrxStopModule_stub, @object
	.size	sysPrxStopModule_stub, 4
sysPrxStopModule_stub:
	.long	__sysPrxStopModule
	.globl sysPrxStopModule_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysPrxStopModule_fnid, @object
	.size	sysPrxStopModule_fnid, 4
sysPrxStopModule_fnid:
	.long	-2131031015
	.globl sysPrxLoadModule_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysPrxLoadModule_stub, @object
	.size	sysPrxLoadModule_stub, 4
sysPrxLoadModule_stub:
	.long	__sysPrxLoadModule
	.globl sysPrxLoadModule_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysPrxLoadModule_fnid, @object
	.size	sysPrxLoadModule_fnid, 4
sysPrxLoadModule_fnid:
	.long	638124120
	.globl sysPrxLoadModuleByFd_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysPrxLoadModuleByFd_stub, @object
	.size	sysPrxLoadModuleByFd_stub, 4
sysPrxLoadModuleByFd_stub:
	.long	__sysPrxLoadModuleByFd
	.globl sysPrxLoadModuleByFd_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysPrxLoadModuleByFd_fnid, @object
	.size	sysPrxLoadModuleByFd_fnid, 4
sysPrxLoadModuleByFd_fnid:
	.long	-278347396
	.globl sysPrxLoadModuleList_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysPrxLoadModuleList_stub, @object
	.size	sysPrxLoadModuleList_stub, 4
sysPrxLoadModuleList_stub:
	.long	__sysPrxLoadModuleList
	.globl sysPrxLoadModuleList_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysPrxLoadModuleList_fnid, @object
	.size	sysPrxLoadModuleList_fnid, 4
sysPrxLoadModuleList_fnid:
	.long	-1300460825
	.globl sysPrxLoadModuleListOnMemcontainer_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysPrxLoadModuleListOnMemcontainer_stub, @object
	.size	sysPrxLoadModuleListOnMemcontainer_stub, 4
sysPrxLoadModuleListOnMemcontainer_stub:
	.long	__sysPrxLoadModuleListOnMemcontainer
	.globl sysPrxLoadModuleListOnMemcontainer_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysPrxLoadModuleListOnMemcontainer_fnid, @object
	.size	sysPrxLoadModuleListOnMemcontainer_fnid, 4
sysPrxLoadModuleListOnMemcontainer_fnid:
	.long	-403752320
	.globl sysPrxLoadModuleOnMemcontainer_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysPrxLoadModuleOnMemcontainer_stub, @object
	.size	sysPrxLoadModuleOnMemcontainer_stub, 4
sysPrxLoadModuleOnMemcontainer_stub:
	.long	__sysPrxLoadModuleOnMemcontainer
	.globl sysPrxLoadModuleOnMemcontainer_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysPrxLoadModuleOnMemcontainer_fnid, @object
	.size	sysPrxLoadModuleOnMemcontainer_fnid, 4
sysPrxLoadModuleOnMemcontainer_fnid:
	.long	-1435657217
	.globl sysPrxLoadModuleOnMemcontainerByFd_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysPrxLoadModuleOnMemcontainerByFd_stub, @object
	.size	sysPrxLoadModuleOnMemcontainerByFd_stub, 4
sysPrxLoadModuleOnMemcontainerByFd_stub:
	.long	__sysPrxLoadModuleOnMemcontainerByFd
	.globl sysPrxLoadModuleOnMemcontainerByFd_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysPrxLoadModuleOnMemcontainerByFd_fnid, @object
	.size	sysPrxLoadModuleOnMemcontainerByFd_fnid, 4
sysPrxLoadModuleOnMemcontainerByFd_fnid:
	.long	-1557090940
	.globl sysPrxGetModuleInfo_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysPrxGetModuleInfo_stub, @object
	.size	sysPrxGetModuleInfo_stub, 4
sysPrxGetModuleInfo_stub:
	.long	__sysPrxGetModuleInfo
	.globl sysPrxGetModuleInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysPrxGetModuleInfo_fnid, @object
	.size	sysPrxGetModuleInfo_fnid, 4
sysPrxGetModuleInfo_fnid:
	.long	-2068093068
	.globl sysPrxGetModuleList_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysPrxGetModuleList_stub, @object
	.size	sysPrxGetModuleList_stub, 4
sysPrxGetModuleList_stub:
	.long	__sysPrxGetModuleList
	.globl sysPrxGetModuleList_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysPrxGetModuleList_fnid, @object
	.size	sysPrxGetModuleList_fnid, 4
sysPrxGetModuleList_fnid:
	.long	-1513067536
	.globl sysPrxGetModuleId_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysPrxGetModuleId_stub, @object
	.size	sysPrxGetModuleId_stub, 4
sysPrxGetModuleId_stub:
	.long	__sysPrxGetModuleId
	.globl sysPrxGetModuleId_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysPrxGetModuleId_fnid, @object
	.size	sysPrxGetModuleId_fnid, 4
sysPrxGetModuleId_fnid:
	.long	1949373336
	.globl sysPrxGetModuleIdByAddress_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysPrxGetModuleIdByAddress_stub, @object
	.size	sysPrxGetModuleIdByAddress_stub, 4
sysPrxGetModuleIdByAddress_stub:
	.long	__sysPrxGetModuleIdByAddress
	.globl sysPrxGetModuleIdByAddress_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysPrxGetModuleIdByAddress_fnid, @object
	.size	sysPrxGetModuleIdByAddress_fnid, 4
sysPrxGetModuleIdByAddress_fnid:
	.long	54639511
	.globl sysPrxGetModuleIdByName_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysPrxGetModuleIdByName_stub, @object
	.size	sysPrxGetModuleIdByName_stub, 4
sysPrxGetModuleIdByName_stub:
	.long	__sysPrxGetModuleIdByName
	.globl sysPrxGetModuleIdByName_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysPrxGetModuleIdByName_fnid, @object
	.size	sysPrxGetModuleIdByName_fnid, 4
sysPrxGetModuleIdByName_fnid:
	.long	-526807617
	.globl sysPrxUnloadModule_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysPrxUnloadModule_stub, @object
	.size	sysPrxUnloadModule_stub, 4
sysPrxUnloadModule_stub:
	.long	__sysPrxUnloadModule
	.globl sysPrxUnloadModule_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysPrxUnloadModule_fnid, @object
	.size	sysPrxUnloadModule_fnid, 4
sysPrxUnloadModule_fnid:
	.long	-256979443
	.globl sysPrxExitSpawnWithLevel_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysPrxExitSpawnWithLevel_stub, @object
	.size	sysPrxExitSpawnWithLevel_stub, 4
sysPrxExitSpawnWithLevel_stub:
	.long	__sysPrxExitSpawnWithLevel
	.globl sysPrxExitSpawnWithLevel_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysPrxExitSpawnWithLevel_fnid, @object
	.size	sysPrxExitSpawnWithLevel_fnid, 4
sysPrxExitSpawnWithLevel_fnid:
	.long	-1563968924
	.globl sysThreadCreateEx_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysThreadCreateEx_stub, @object
	.size	sysThreadCreateEx_stub, 4
sysThreadCreateEx_stub:
	.long	__sysThreadCreateEx
	.globl sysThreadCreateEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysThreadCreateEx_fnid, @object
	.size	sysThreadCreateEx_fnid, 4
sysThreadCreateEx_fnid:
	.long	614590983
	.globl sysThreadExit_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysThreadExit_stub, @object
	.size	sysThreadExit_stub, 4
sysThreadExit_stub:
	.long	__sysThreadExit
	.globl sysThreadExit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysThreadExit_fnid, @object
	.size	sysThreadExit_fnid, 4
sysThreadExit_fnid:
	.long	-1343192924
	.globl sysThreadGetId_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysThreadGetId_stub, @object
	.size	sysThreadGetId_stub, 4
sysThreadGetId_stub:
	.long	__sysThreadGetId
	.globl sysThreadGetId_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysThreadGetId_fnid, @object
	.size	sysThreadGetId_fnid, 4
sysThreadGetId_fnid:
	.long	890062158
	.globl sysThreadOnce_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysThreadOnce_stub, @object
	.size	sysThreadOnce_stub, 4
sysThreadOnce_stub:
	.long	__sysThreadOnce
	.globl sysThreadOnce_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysThreadOnce_fnid, @object
	.size	sysThreadOnce_fnid, 4
sysThreadOnce_fnid:
	.long	-1545355672
	.globl sysThreadInitialzeTLS_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysThreadInitialzeTLS_stub, @object
	.size	sysThreadInitialzeTLS_stub, 4
sysThreadInitialzeTLS_stub:
	.long	__sysThreadInitialzeTLS
	.globl sysThreadInitialzeTLS_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysThreadInitialzeTLS_fnid, @object
	.size	sysThreadInitialzeTLS_fnid, 4
sysThreadInitialzeTLS_fnid:
	.long	1950777506
	.globl sysThreadRegisterAtexit_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysThreadRegisterAtexit_stub, @object
	.size	sysThreadRegisterAtexit_stub, 4
sysThreadRegisterAtexit_stub:
	.long	__sysThreadRegisterAtexit
	.globl sysThreadRegisterAtexit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysThreadRegisterAtexit_fnid, @object
	.size	sysThreadRegisterAtexit_fnid, 4
sysThreadRegisterAtexit_fnid:
	.long	1037347159
	.globl sysThreadUnregisterAtexit_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysThreadUnregisterAtexit_stub, @object
	.size	sysThreadUnregisterAtexit_stub, 4
sysThreadUnregisterAtexit_stub:
	.long	__sysThreadUnregisterAtexit
	.globl sysThreadUnregisterAtexit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysThreadUnregisterAtexit_fnid, @object
	.size	sysThreadUnregisterAtexit_fnid, 4
sysThreadUnregisterAtexit_fnid:
	.long	-1401961468
	.globl sysInterruptThreadDisestablish_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysInterruptThreadDisestablish_stub, @object
	.size	sysInterruptThreadDisestablish_stub, 4
sysInterruptThreadDisestablish_stub:
	.long	__sysInterruptThreadDisestablish
	.globl sysInterruptThreadDisestablish_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysInterruptThreadDisestablish_fnid, @object
	.size	sysInterruptThreadDisestablish_fnid, 4
sysInterruptThreadDisestablish_fnid:
	.long	1241980312
	.globl sysLwMutexCreate_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysLwMutexCreate_stub, @object
	.size	sysLwMutexCreate_stub, 4
sysLwMutexCreate_stub:
	.long	__sysLwMutexCreate
	.globl sysLwMutexCreate_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysLwMutexCreate_fnid, @object
	.size	sysLwMutexCreate_fnid, 4
sysLwMutexCreate_fnid:
	.long	797294831
	.globl sysLwMutexDestroy_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysLwMutexDestroy_stub, @object
	.size	sysLwMutexDestroy_stub, 4
sysLwMutexDestroy_stub:
	.long	__sysLwMutexDestroy
	.globl sysLwMutexDestroy_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysLwMutexDestroy_fnid, @object
	.size	sysLwMutexDestroy_fnid, 4
sysLwMutexDestroy_fnid:
	.long	-1018729204
	.globl sysLwMutexLock_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysLwMutexLock_stub, @object
	.size	sysLwMutexLock_stub, 4
sysLwMutexLock_stub:
	.long	__sysLwMutexLock
	.globl sysLwMutexLock_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysLwMutexLock_fnid, @object
	.size	sysLwMutexLock_fnid, 4
sysLwMutexLock_fnid:
	.long	359914559
	.globl sysLwMutexTryLock_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysLwMutexTryLock_stub, @object
	.size	sysLwMutexTryLock_stub, 4
sysLwMutexTryLock_stub:
	.long	__sysLwMutexTryLock
	.globl sysLwMutexTryLock_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysLwMutexTryLock_fnid, @object
	.size	sysLwMutexTryLock_fnid, 4
sysLwMutexTryLock_fnid:
	.long	-1363704027
	.globl sysLwMutexUnlock_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysLwMutexUnlock_stub, @object
	.size	sysLwMutexUnlock_stub, 4
sysLwMutexUnlock_stub:
	.long	__sysLwMutexUnlock
	.globl sysLwMutexUnlock_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysLwMutexUnlock_fnid, @object
	.size	sysLwMutexUnlock_fnid, 4
sysLwMutexUnlock_fnid:
	.long	465699060
	.globl sysLwCondCreate_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysLwCondCreate_stub, @object
	.size	sysLwCondCreate_stub, 4
sysLwCondCreate_stub:
	.long	__sysLwCondCreate
	.globl sysLwCondCreate_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysLwCondCreate_fnid, @object
	.size	sysLwCondCreate_fnid, 4
sysLwCondCreate_fnid:
	.long	-636569830
	.globl sysLwCondWait_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysLwCondWait_stub, @object
	.size	sysLwCondWait_stub, 4
sysLwCondWait_stub:
	.long	__sysLwCondWait
	.globl sysLwCondWait_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysLwCondWait_fnid, @object
	.size	sysLwCondWait_fnid, 4
sysLwCondWait_fnid:
	.long	711826769
	.globl sysLwCondSignal_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysLwCondSignal_stub, @object
	.size	sysLwCondSignal_stub, 4
sysLwCondSignal_stub:
	.long	__sysLwCondSignal
	.globl sysLwCondSignal_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysLwCondSignal_fnid, @object
	.size	sysLwCondSignal_fnid, 4
sysLwCondSignal_fnid:
	.long	-276322667
	.globl sysLwCondSignalTo_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysLwCondSignalTo_stub, @object
	.size	sysLwCondSignalTo_stub, 4
sysLwCondSignalTo_stub:
	.long	__sysLwCondSignalTo
	.globl sysLwCondSignalTo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysLwCondSignalTo_fnid, @object
	.size	sysLwCondSignalTo_fnid, 4
sysLwCondSignalTo_fnid:
	.long	1386928863
	.globl sysLwCondSignalAll_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysLwCondSignalAll_stub, @object
	.size	sysLwCondSignalAll_stub, 4
sysLwCondSignalAll_stub:
	.long	__sysLwCondSignalAll
	.globl sysLwCondSignalAll_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysLwCondSignalAll_fnid, @object
	.size	sysLwCondSignalAll_fnid, 4
sysLwCondSignalAll_fnid:
	.long	-375276156
	.globl sysLwCondDestroy_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysLwCondDestroy_stub, @object
	.size	sysLwCondDestroy_stub, 4
sysLwCondDestroy_stub:
	.long	__sysLwCondDestroy
	.globl sysLwCondDestroy_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysLwCondDestroy_fnid, @object
	.size	sysLwCondDestroy_fnid, 4
sysLwCondDestroy_fnid:
	.long	479892524
	.globl sysSpinlockInitialize_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysSpinlockInitialize_stub, @object
	.size	sysSpinlockInitialize_stub, 4
sysSpinlockInitialize_stub:
	.long	__sysSpinlockInitialize
	.globl sysSpinlockInitialize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSpinlockInitialize_fnid, @object
	.size	sysSpinlockInitialize_fnid, 4
sysSpinlockInitialize_fnid:
	.long	-1943292776
	.globl sysSpinlockLock_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysSpinlockLock_stub, @object
	.size	sysSpinlockLock_stub, 4
sysSpinlockLock_stub:
	.long	__sysSpinlockLock
	.globl sysSpinlockLock_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSpinlockLock_fnid, @object
	.size	sysSpinlockLock_fnid, 4
sysSpinlockLock_fnid:
	.long	-1568336995
	.globl sysSpinlockTryLock_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysSpinlockTryLock_stub, @object
	.size	sysSpinlockTryLock_stub, 4
sysSpinlockTryLock_stub:
	.long	__sysSpinlockTryLock
	.globl sysSpinlockTryLock_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSpinlockTryLock_fnid, @object
	.size	sysSpinlockTryLock_fnid, 4
sysSpinlockTryLock_fnid:
	.long	1915355732
	.globl sysSpinlockUnlock_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysSpinlockUnlock_stub, @object
	.size	sysSpinlockUnlock_stub, 4
sysSpinlockUnlock_stub:
	.long	__sysSpinlockUnlock
	.globl sysSpinlockUnlock_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSpinlockUnlock_fnid, @object
	.size	sysSpinlockUnlock_fnid, 4
sysSpinlockUnlock_fnid:
	.long	1382533941
	.globl sysWatchdogClear_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysWatchdogClear_stub, @object
	.size	sysWatchdogClear_stub, 4
sysWatchdogClear_stub:
	.long	__sysWatchdogClear
	.globl sysWatchdogClear_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysWatchdogClear_fnid, @object
	.size	sysWatchdogClear_fnid, 4
sysWatchdogClear_fnid:
	.long	-1397911626
	.globl sysWatchdogStart_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysWatchdogStart_stub, @object
	.size	sysWatchdogStart_stub, 4
sysWatchdogStart_stub:
	.long	__sysWatchdogStart
	.globl sysWatchdogStart_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysWatchdogStart_fnid, @object
	.size	sysWatchdogStart_fnid, 4
sysWatchdogStart_fnid:
	.long	-1643764811
	.globl sysWatchdogStop_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysWatchdogStop_stub, @object
	.size	sysWatchdogStop_stub, 4
sysWatchdogStop_stub:
	.long	__sysWatchdogStop
	.globl sysWatchdogStop_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysWatchdogStop_fnid, @object
	.size	sysWatchdogStop_fnid, 4
sysWatchdogStop_fnid:
	.long	1845830429
	.globl sysMalloc_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysMalloc_stub, @object
	.size	sysMalloc_stub, 4
sysMalloc_stub:
	.long	__sysMalloc
	.globl sysMalloc_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysMalloc_fnid, @object
	.size	sysMalloc_fnid, 4
sysMalloc_fnid:
	.long	-1112436861
	.globl sysMemalign_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysMemalign_stub, @object
	.size	sysMemalign_stub, 4
sysMemalign_stub:
	.long	__sysMemalign
	.globl sysMemalign_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysMemalign_fnid, @object
	.size	sysMemalign_fnid, 4
sysMemalign_fnid:
	.long	831461345
	.globl sysMemchr_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysMemchr_stub, @object
	.size	sysMemchr_stub, 4
sysMemchr_stub:
	.long	__sysMemchr
	.globl sysMemchr_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysMemchr_fnid, @object
	.size	sysMemchr_fnid, 4
sysMemchr_fnid:
	.long	1003830395
	.globl sysMemcmp_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysMemcmp_stub, @object
	.size	sysMemcmp_stub, 4
sysMemcmp_stub:
	.long	__sysMemcmp
	.globl sysMemcmp_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysMemcmp_fnid, @object
	.size	sysMemcmp_fnid, 4
sysMemcmp_fnid:
	.long	-77746048
	.globl sysMemcpy_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysMemcpy_stub, @object
	.size	sysMemcpy_stub, 4
sysMemcpy_stub:
	.long	__sysMemcpy
	.globl sysMemcpy_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysMemcpy_fnid, @object
	.size	sysMemcpy_fnid, 4
sysMemcpy_fnid:
	.long	1811312295
	.globl sysMemmove_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysMemmove_stub, @object
	.size	sysMemmove_stub, 4
sysMemmove_stub:
	.long	__sysMemmove
	.globl sysMemmove_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysMemmove_fnid, @object
	.size	sysMemmove_fnid, 4
sysMemmove_fnid:
	.long	658667330
	.globl sysMemset_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysMemset_stub, @object
	.size	sysMemset_stub, 4
sysMemset_stub:
	.long	__sysMemset
	.globl sysMemset_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysMemset_fnid, @object
	.size	sysMemset_fnid, 4
sysMemset_fnid:
	.long	1756999697
	.globl sysFree_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysFree_stub, @object
	.size	sysFree_stub, 4
sysFree_stub:
	.long	__sysFree
	.globl sysFree_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysFree_fnid, @object
	.size	sysFree_fnid, 4
sysFree_fnid:
	.long	-134743264
	.globl sysHeapAllocHeapMemory_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysHeapAllocHeapMemory_stub, @object
	.size	sysHeapAllocHeapMemory_stub, 4
sysHeapAllocHeapMemory_stub:
	.long	__sysHeapAllocHeapMemory
	.globl sysHeapAllocHeapMemory_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysHeapAllocHeapMemory_fnid, @object
	.size	sysHeapAllocHeapMemory_fnid, 4
sysHeapAllocHeapMemory_fnid:
	.long	-1178660744
	.globl sysHeapCreateHeap_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysHeapCreateHeap_stub, @object
	.size	sysHeapCreateHeap_stub, 4
sysHeapCreateHeap_stub:
	.long	__sysHeapCreateHeap
	.globl sysHeapCreateHeap_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysHeapCreateHeap_fnid, @object
	.size	sysHeapCreateHeap_fnid, 4
sysHeapCreateHeap_fnid:
	.long	-1292045624
	.globl sysHeapDeleteHeap_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysHeapDeleteHeap_stub, @object
	.size	sysHeapDeleteHeap_stub, 4
sysHeapDeleteHeap_stub:
	.long	__sysHeapDeleteHeap
	.globl sysHeapDeleteHeap_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysHeapDeleteHeap_fnid, @object
	.size	sysHeapDeleteHeap_fnid, 4
sysHeapDeleteHeap_fnid:
	.long	-1361163517
	.globl sysHeapFree_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysHeapFree_stub, @object
	.size	sysHeapFree_stub, 4
sysHeapFree_stub:
	.long	__sysHeapFree
	.globl sysHeapFree_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysHeapFree_fnid, @object
	.size	sysHeapFree_fnid, 4
sysHeapFree_fnid:
	.long	-1974067822
	.globl sysHeapGetMallInfo_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysHeapGetMallInfo_stub, @object
	.size	sysHeapGetMallInfo_stub, 4
sysHeapGetMallInfo_stub:
	.long	__sysHeapGetMallInfo
	.globl sysHeapGetMallInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysHeapGetMallInfo_fnid, @object
	.size	sysHeapGetMallInfo_fnid, 4
sysHeapGetMallInfo_fnid:
	.long	-777173648
	.globl sysHeapGetTotalFreeSize_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysHeapGetTotalFreeSize_stub, @object
	.size	sysHeapGetTotalFreeSize_stub, 4
sysHeapGetTotalFreeSize_stub:
	.long	__sysHeapGetTotalFreeSize
	.globl sysHeapGetTotalFreeSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysHeapGetTotalFreeSize_fnid, @object
	.size	sysHeapGetTotalFreeSize_fnid, 4
sysHeapGetTotalFreeSize_fnid:
	.long	-1237937261
	.globl sysHeapMalloc_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysHeapMalloc_stub, @object
	.size	sysHeapMalloc_stub, 4
sysHeapMalloc_stub:
	.long	__sysHeapMalloc
	.globl sysHeapMalloc_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysHeapMalloc_fnid, @object
	.size	sysHeapMalloc_fnid, 4
sysHeapMalloc_fnid:
	.long	890668320
	.globl sysHeapMemalign_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysHeapMemalign_stub, @object
	.size	sysHeapMemalign_stub, 4
sysHeapMemalign_stub:
	.long	__sysHeapMemalign
	.globl sysHeapMemalign_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysHeapMemalign_fnid, @object
	.size	sysHeapMemalign_fnid, 4
sysHeapMemalign_fnid:
	.long	1143364616
	.globl sysHeapStats_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysHeapStats_stub, @object
	.size	sysHeapStats_stub, 4
sysHeapStats_stub:
	.long	__sysHeapStats
	.globl sysHeapStats_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysHeapStats_fnid, @object
	.size	sysHeapStats_fnid, 4
sysHeapStats_fnid:
	.long	-1987725898
	.globl sysQsort_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysQsort_stub, @object
	.size	sysQsort_stub, 4
sysQsort_stub:
	.long	__sysQsort
	.globl sysQsort_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysQsort_fnid, @object
	.size	sysQsort_fnid, 4
sysQsort_fnid:
	.long	-990027487
	.globl sysMempoolCreate_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysMempoolCreate_stub, @object
	.size	sysMempoolCreate_stub, 4
sysMempoolCreate_stub:
	.long	__sysMempoolCreate
	.globl sysMempoolCreate_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysMempoolCreate_fnid, @object
	.size	sysMempoolCreate_fnid, 4
sysMempoolCreate_fnid:
	.long	-895852353
	.globl sysMempoolDestroy_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysMempoolDestroy_stub, @object
	.size	sysMempoolDestroy_stub, 4
sysMempoolDestroy_stub:
	.long	__sysMempoolDestroy
	.globl sysMempoolDestroy_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysMempoolDestroy_fnid, @object
	.size	sysMempoolDestroy_fnid, 4
sysMempoolDestroy_fnid:
	.long	-1657008255
	.globl sysMempoolGetCount_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysMempoolGetCount_stub, @object
	.size	sysMempoolGetCount_stub, 4
sysMempoolGetCount_stub:
	.long	__sysMempoolGetCount
	.globl sysMempoolGetCount_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysMempoolGetCount_fnid, @object
	.size	sysMempoolGetCount_fnid, 4
sysMempoolGetCount_fnid:
	.long	626618193
	.globl sysMempoolAllocateBlock_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysMempoolAllocateBlock_stub, @object
	.size	sysMempoolAllocateBlock_stub, 4
sysMempoolAllocateBlock_stub:
	.long	__sysMempoolAllocateBlock
	.globl sysMempoolAllocateBlock_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysMempoolAllocateBlock_fnid, @object
	.size	sysMempoolAllocateBlock_fnid, 4
sysMempoolAllocateBlock_fnid:
	.long	-1589206717
	.globl sysMempoolTryAllocateBlock_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysMempoolTryAllocateBlock_stub, @object
	.size	sysMempoolTryAllocateBlock_stub, 4
sysMempoolTryAllocateBlock_stub:
	.long	__sysMempoolTryAllocateBlock
	.globl sysMempoolTryAllocateBlock_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysMempoolTryAllocateBlock_fnid, @object
	.size	sysMempoolTryAllocateBlock_fnid, 4
sysMempoolTryAllocateBlock_fnid:
	.long	96884310
	.globl sysMempoolFreeBlock_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysMempoolFreeBlock_stub, @object
	.size	sysMempoolFreeBlock_stub, 4
sysMempoolFreeBlock_stub:
	.long	__sysMempoolFreeBlock
	.globl sysMempoolFreeBlock_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysMempoolFreeBlock_fnid, @object
	.size	sysMempoolFreeBlock_fnid, 4
sysMempoolFreeBlock_fnid:
	.long	1619137276
	.globl sysMMapperFreeMemory_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysMMapperFreeMemory_stub, @object
	.size	sysMMapperFreeMemory_stub, 4
sysMMapperFreeMemory_stub:
	.long	__sysMMapperFreeMemory
	.globl sysMMapperFreeMemory_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysMMapperFreeMemory_fnid, @object
	.size	sysMMapperFreeMemory_fnid, 4
sysMMapperFreeMemory_fnid:
	.long	1083889977
	.globl sysMMapperMapMemory_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysMMapperMapMemory_stub, @object
	.size	sysMMapperMapMemory_stub, 4
sysMMapperMapMemory_stub:
	.long	__sysMMapperMapMemory
	.globl sysMMapperMapMemory_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysMMapperMapMemory_fnid, @object
	.size	sysMMapperMapMemory_fnid, 4
sysMMapperMapMemory_fnid:
	.long	-598245289
	.globl sysMMapperUnmapMemory_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysMMapperUnmapMemory_stub, @object
	.size	sysMMapperUnmapMemory_stub, 4
sysMMapperUnmapMemory_stub:
	.long	__sysMMapperUnmapMemory
	.globl sysMMapperUnmapMemory_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysMMapperUnmapMemory_fnid, @object
	.size	sysMMapperUnmapMemory_fnid, 4
sysMMapperUnmapMemory_fnid:
	.long	1178843758
	.globl sysMMapperAllocateMemory_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysMMapperAllocateMemory_stub, @object
	.size	sysMMapperAllocateMemory_stub, 4
sysMMapperAllocateMemory_stub:
	.long	__sysMMapperAllocateMemory
	.globl sysMMapperAllocateMemory_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysMMapperAllocateMemory_fnid, @object
	.size	sysMMapperAllocateMemory_fnid, 4
sysMMapperAllocateMemory_fnid:
	.long	-1302899701
	.globl sysMMapperAllocateMemoryFromContainer_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysMMapperAllocateMemoryFromContainer_stub, @object
	.size	sysMMapperAllocateMemoryFromContainer_stub, 4
sysMMapperAllocateMemoryFromContainer_stub:
	.long	__sysMMapperAllocateMemoryFromContainer
	.globl sysMMapperAllocateMemoryFromContainer_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysMMapperAllocateMemoryFromContainer_fnid, @object
	.size	sysMMapperAllocateMemoryFromContainer_fnid, 4
sysMMapperAllocateMemoryFromContainer_fnid:
	.long	1881507093
	.globl sysStrlen_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysStrlen_stub, @object
	.size	sysStrlen_stub, 4
sysStrlen_stub:
	.long	__sysStrlen
	.globl sysStrlen_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysStrlen_fnid, @object
	.size	sysStrlen_fnid, 4
sysStrlen_fnid:
	.long	758531627
	.globl sysStrcpy_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysStrcpy_stub, @object
	.size	sysStrcpy_stub, 4
sysStrcpy_stub:
	.long	__sysStrcpy
	.globl sysStrcpy_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysStrcpy_fnid, @object
	.size	sysStrcpy_fnid, 4
sysStrcpy_fnid:
	.long	-1714911598
	.globl sysStrncpy_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysStrncpy_stub, @object
	.size	sysStrncpy_stub, 4
sysStrncpy_stub:
	.long	__sysStrncpy
	.globl sysStrncpy_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysStrncpy_fnid, @object
	.size	sysStrncpy_fnid, 4
sysStrncpy_fnid:
	.long	-754737843
	.globl sysStrcat_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysStrcat_stub, @object
	.size	sysStrcat_stub, 4
sysStrcat_stub:
	.long	__sysStrcat
	.globl sysStrcat_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysStrcat_fnid, @object
	.size	sysStrcat_fnid, 4
sysStrcat_fnid:
	.long	86845862
	.globl sysStrncat_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysStrncat_stub, @object
	.size	sysStrncat_stub, 4
sysStrncat_stub:
	.long	__sysStrncat
	.globl sysStrncat_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysStrncat_fnid, @object
	.size	sysStrncat_fnid, 4
sysStrncat_fnid:
	.long	-1720746760
	.globl sysStrchr_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysStrchr_stub, @object
	.size	sysStrchr_stub, 4
sysStrchr_stub:
	.long	__sysStrchr
	.globl sysStrchr_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysStrchr_fnid, @object
	.size	sysStrchr_fnid, 4
sysStrchr_fnid:
	.long	1956153467
	.globl sysStrrchr_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysStrrchr_stub, @object
	.size	sysStrrchr_stub, 4
sysStrrchr_stub:
	.long	__sysStrrchr
	.globl sysStrrchr_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysStrrchr_fnid, @object
	.size	sysStrrchr_fnid, 4
sysStrrchr_fnid:
	.long	421465162
	.globl sysStrcmp_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysStrcmp_stub, @object
	.size	sysStrcmp_stub, 4
sysStrcmp_stub:
	.long	__sysStrcmp
	.globl sysStrcmp_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysStrcmp_fnid, @object
	.size	sysStrcmp_fnid, 4
sysStrcmp_fnid:
	.long	1167803283
	.globl sysStrncmp_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysStrncmp_stub, @object
	.size	sysStrncmp_stub, 4
sysStrncmp_stub:
	.long	__sysStrncmp
	.globl sysStrncmp_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysStrncmp_fnid, @object
	.size	sysStrncmp_fnid, 4
sysStrncmp_fnid:
	.long	82328876
	.globl sysStrncasecmp_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysStrncasecmp_stub, @object
	.size	sysStrncasecmp_stub, 4
sysStrncasecmp_stub:
	.long	__sysStrncasecmp
	.globl sysStrncasecmp_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysStrncasecmp_fnid, @object
	.size	sysStrncasecmp_fnid, 4
sysStrncasecmp_fnid:
	.long	480585122
	.globl sysToLower_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysToLower_stub, @object
	.size	sysToLower_stub, 4
sysToLower_stub:
	.long	__sysToLower
	.globl sysToLower_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysToLower_fnid, @object
	.size	sysToLower_fnid, 4
sysToLower_fnid:
	.long	1261383706
	.globl sysToUpper_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysToUpper_stub, @object
	.size	sysToUpper_stub, 4
sysToUpper_stub:
	.long	__sysToUpper
	.globl sysToUpper_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysToUpper_fnid, @object
	.size	sysToUpper_fnid, 4
sysToUpper_fnid:
	.long	-285781741
	.globl sysSpuElfGetSegments_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysSpuElfGetSegments_stub, @object
	.size	sysSpuElfGetSegments_stub, 4
sysSpuElfGetSegments_stub:
	.long	__sysSpuElfGetSegments
	.globl sysSpuElfGetSegments_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSpuElfGetSegments_fnid, @object
	.size	sysSpuElfGetSegments_fnid, 4
sysSpuElfGetSegments_fnid:
	.long	-613731760
	.globl sysSpuElfGetInformation_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysSpuElfGetInformation_stub, @object
	.size	sysSpuElfGetInformation_stub, 4
sysSpuElfGetInformation_stub:
	.long	__sysSpuElfGetInformation
	.globl sysSpuElfGetInformation_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSpuElfGetInformation_fnid, @object
	.size	sysSpuElfGetInformation_fnid, 4
sysSpuElfGetInformation_fnid:
	.long	517231822
	.globl sysSpuRawLoad_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysSpuRawLoad_stub, @object
	.size	sysSpuRawLoad_stub, 4
sysSpuRawLoad_stub:
	.long	__sysSpuRawLoad
	.globl sysSpuRawLoad_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSpuRawLoad_fnid, @object
	.size	sysSpuRawLoad_fnid, 4
sysSpuRawLoad_fnid:
	.long	-1993144838
	.globl sysSpuRawImageLoad_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysSpuRawImageLoad_stub, @object
	.size	sysSpuRawImageLoad_stub, 4
sysSpuRawImageLoad_stub:
	.long	__sysSpuRawImageLoad
	.globl sysSpuRawImageLoad_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSpuRawImageLoad_fnid, @object
	.size	sysSpuRawImageLoad_fnid, 4
sysSpuRawImageLoad_fnid:
	.long	-1181391314
	.globl sysSpuImageClose_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysSpuImageClose_stub, @object
	.size	sysSpuImageClose_stub, 4
sysSpuImageClose_stub:
	.long	__sysSpuImageClose
	.globl sysSpuImageClose_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSpuImageClose_fnid, @object
	.size	sysSpuImageClose_fnid, 4
sysSpuImageClose_fnid:
	.long	-522547459
	.globl sysSpuImageImport_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysSpuImageImport_stub, @object
	.size	sysSpuImageImport_stub, 4
sysSpuImageImport_stub:
	.long	__sysSpuImageImport
	.globl sysSpuImageImport_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSpuImageImport_fnid, @object
	.size	sysSpuImageImport_fnid, 4
sysSpuImageImport_fnid:
	.long	-337250513
	.globl sysSpuPrintfAttachGroup_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysSpuPrintfAttachGroup_stub, @object
	.size	sysSpuPrintfAttachGroup_stub, 4
sysSpuPrintfAttachGroup_stub:
	.long	__sysSpuPrintfAttachGroup
	.globl sysSpuPrintfAttachGroup_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSpuPrintfAttachGroup_fnid, @object
	.size	sysSpuPrintfAttachGroup_fnid, 4
sysSpuPrintfAttachGroup_fnid:
	.long	-586408439
	.globl sysSpuPrintfAttachThread_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysSpuPrintfAttachThread_stub, @object
	.size	sysSpuPrintfAttachThread_stub, 4
sysSpuPrintfAttachThread_stub:
	.long	__sysSpuPrintfAttachThread
	.globl sysSpuPrintfAttachThread_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSpuPrintfAttachThread_fnid, @object
	.size	sysSpuPrintfAttachThread_fnid, 4
sysSpuPrintfAttachThread_fnid:
	.long	450956178
	.globl sysSpuPrintfDetachGroup_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysSpuPrintfDetachGroup_stub, @object
	.size	sysSpuPrintfDetachGroup_stub, 4
sysSpuPrintfDetachGroup_stub:
	.long	__sysSpuPrintfDetachGroup
	.globl sysSpuPrintfDetachGroup_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSpuPrintfDetachGroup_fnid, @object
	.size	sysSpuPrintfDetachGroup_fnid, 4
sysSpuPrintfDetachGroup_fnid:
	.long	1608495870
	.globl sysSpuPrintfDetach_Tread_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysSpuPrintfDetach_Tread_stub, @object
	.size	sysSpuPrintfDetach_Tread_stub, 4
sysSpuPrintfDetach_Tread_stub:
	.long	__sysSpuPrintfDetach_Tread
	.globl sysSpuPrintfDetach_Tread_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSpuPrintfDetach_Tread_fnid, @object
	.size	sysSpuPrintfDetach_Tread_fnid, 4
sysSpuPrintfDetach_Tread_fnid:
	.long	-1279537366
	.globl sysSpuPrintfFinalize_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysSpuPrintfFinalize_stub, @object
	.size	sysSpuPrintfFinalize_stub, 4
sysSpuPrintfFinalize_stub:
	.long	__sysSpuPrintfFinalize
	.globl sysSpuPrintfFinalize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSpuPrintfFinalize_fnid, @object
	.size	sysSpuPrintfFinalize_fnid, 4
sysSpuPrintfFinalize_fnid:
	.long	-583325780
	.globl sysSpuPrintfInitialize_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysSpuPrintfInitialize_stub, @object
	.size	sysSpuPrintfInitialize_stub, 4
sysSpuPrintfInitialize_stub:
	.long	__sysSpuPrintfInitialize
	.globl sysSpuPrintfInitialize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSpuPrintfInitialize_fnid, @object
	.size	sysSpuPrintfInitialize_fnid, 4
sysSpuPrintfInitialize_fnid:
	.long	1174286286
	.globl sysConsoleGetc_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysConsoleGetc_stub, @object
	.size	sysConsoleGetc_stub, 4
sysConsoleGetc_stub:
	.long	__sysConsoleGetc
	.globl sysConsoleGetc_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysConsoleGetc_fnid, @object
	.size	sysConsoleGetc_fnid, 4
sysConsoleGetc_fnid:
	.long	-1976625765
	.globl sysConsolePutc_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysConsolePutc_stub, @object
	.size	sysConsolePutc_stub, 4
sysConsolePutc_stub:
	.long	__sysConsolePutc
	.globl sysConsolePutc_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysConsolePutc_fnid, @object
	.size	sysConsolePutc_fnid, 4
sysConsolePutc_fnid:
	.long	-429151178
	.globl sysConsoleWrite_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysConsoleWrite_stub, @object
	.size	sysConsoleWrite_stub, 4
sysConsoleWrite_stub:
	.long	__sysConsoleWrite
	.globl sysConsoleWrite_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysConsoleWrite_fnid, @object
	.size	sysConsoleWrite_fnid, 4
sysConsoleWrite_fnid:
	.long	-176284305
	.globl sysPrintf_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysPrintf_stub, @object
	.size	sysPrintf_stub, 4
sysPrintf_stub:
	.long	__sysPrintf
	.globl sysPrintf_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysPrintf_fnid, @object
	.size	sysPrintf_fnid, 4
sysPrintf_fnid:
	.long	-1627064401
	.globl sysSprintf_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysSprintf_stub, @object
	.size	sysSprintf_stub, 4
sysSprintf_stub:
	.long	__sysSprintf
	.globl sysSprintf_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSprintf_fnid, @object
	.size	sysSprintf_fnid, 4
sysSprintf_fnid:
	.long	-1577456898
	.globl sysSnprintf_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysSnprintf_stub, @object
	.size	sysSnprintf_stub, 4
sysSnprintf_stub:
	.long	__sysSnprintf
	.globl sysSnprintf_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysSnprintf_fnid, @object
	.size	sysSnprintf_fnid, 4
sysSnprintf_fnid:
	.long	106381879
	.globl sysVprintf_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysVprintf_stub, @object
	.size	sysVprintf_stub, 4
sysVprintf_stub:
	.long	__sysVprintf
	.globl sysVprintf_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysVprintf_fnid, @object
	.size	sysVprintf_fnid, 4
sysVprintf_fnid:
	.long	-92313283
	.globl sysVsprintf_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysVsprintf_stub, @object
	.size	sysVsprintf_stub, 4
sysVsprintf_stub:
	.long	__sysVsprintf
	.globl sysVsprintf_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysVsprintf_fnid, @object
	.size	sysVsprintf_fnid, 4
sysVsprintf_fnid:
	.long	2031850009
	.globl sysVsnprintf_stub
	.section	.data.sceFStub.sysPrxForUser
	.align 2
	.type	sysVsnprintf_stub, @object
	.size	sysVsnprintf_stub, 4
sysVsnprintf_stub:
	.long	__sysVsnprintf
	.globl sysVsnprintf_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysVsnprintf_fnid, @object
	.size	sysVsnprintf_fnid, 4
sysVsnprintf_fnid:
	.long	102273899
	.ident	"GCC: (GNU) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
