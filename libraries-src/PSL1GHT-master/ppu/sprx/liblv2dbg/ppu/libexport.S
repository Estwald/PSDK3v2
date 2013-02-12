	.file	"libexport.c"
	.section	".got","aw"
	.section	".text"
	.section	.data.sceFStub.sys_lv2dbg,"aw",@progbits
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
	.string	"sys_lv2dbg"
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
	.4byte	sys_lv2dbg
	.4byte	scefstub
	.4byte	0
	.4byte	0
	.4byte	0
	.4byte	0
	.globl sysDbgSetStacksizePPUExceptionHandler_stub
	.section	.data.sceFStub.sys_lv2dbg
	.align 2
	.type	sysDbgSetStacksizePPUExceptionHandler_stub, @object
	.size	sysDbgSetStacksizePPUExceptionHandler_stub, 4
sysDbgSetStacksizePPUExceptionHandler_stub:
	.long	__sysDbgSetStacksizePPUExceptionHandler
	.globl sysDbgSetStacksizePPUExceptionHandler_fnid
	.section	.rodata.sceFNID,"a",@progbits
	.align 2
	.type	sysDbgSetStacksizePPUExceptionHandler_fnid, @object
	.size	sysDbgSetStacksizePPUExceptionHandler_fnid, 4
sysDbgSetStacksizePPUExceptionHandler_fnid:
	.long	111689973
	.globl sysDbgGetSPUThreadGroupIds_stub
	.section	.data.sceFStub.sys_lv2dbg
	.align 2
	.type	sysDbgGetSPUThreadGroupIds_stub, @object
	.size	sysDbgGetSPUThreadGroupIds_stub, 4
sysDbgGetSPUThreadGroupIds_stub:
	.long	__sysDbgGetSPUThreadGroupIds
	.globl sysDbgGetSPUThreadGroupIds_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysDbgGetSPUThreadGroupIds_fnid, @object
	.size	sysDbgGetSPUThreadGroupIds_fnid, 4
sysDbgGetSPUThreadGroupIds_fnid:
	.long	149883049
	.globl sysDbgGetPPUThreadIds_stub
	.section	.data.sceFStub.sys_lv2dbg
	.align 2
	.type	sysDbgGetPPUThreadIds_stub, @object
	.size	sysDbgGetPPUThreadIds_stub, 4
sysDbgGetPPUThreadIds_stub:
	.long	__sysDbgGetPPUThreadIds
	.globl sysDbgGetPPUThreadIds_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysDbgGetPPUThreadIds_fnid, @object
	.size	sysDbgGetPPUThreadIds_fnid, 4
sysDbgGetPPUThreadIds_fnid:
	.long	289082346
	.globl sysDbgGetSPUThreadIds_stub
	.section	.data.sceFStub.sys_lv2dbg
	.align 2
	.type	sysDbgGetSPUThreadIds_stub, @object
	.size	sysDbgGetSPUThreadIds_stub, 4
sysDbgGetSPUThreadIds_stub:
	.long	__sysDbgGetSPUThreadIds
	.globl sysDbgGetSPUThreadIds_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysDbgGetSPUThreadIds_fnid, @object
	.size	sysDbgGetSPUThreadIds_fnid, 4
sysDbgGetSPUThreadIds_fnid:
	.long	409008393
	.globl sysDbgRegisterPPUExceptionHandler_stub
	.section	.data.sceFStub.sys_lv2dbg
	.align 2
	.type	sysDbgRegisterPPUExceptionHandler_stub, @object
	.size	sysDbgRegisterPPUExceptionHandler_stub, 4
sysDbgRegisterPPUExceptionHandler_stub:
	.long	__sysDbgRegisterPPUExceptionHandler
	.globl sysDbgRegisterPPUExceptionHandler_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysDbgRegisterPPUExceptionHandler_fnid, @object
	.size	sysDbgRegisterPPUExceptionHandler_fnid, 4
sysDbgRegisterPPUExceptionHandler_fnid:
	.long	579956549
	.globl sysDbgGetEventQueueInformation_stub
	.section	.data.sceFStub.sys_lv2dbg
	.align 2
	.type	sysDbgGetEventQueueInformation_stub, @object
	.size	sysDbgGetEventQueueInformation_stub, 4
sysDbgGetEventQueueInformation_stub:
	.long	__sysDbgGetEventQueueInformation
	.globl sysDbgGetEventQueueInformation_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysDbgGetEventQueueInformation_fnid, @object
	.size	sysDbgGetEventQueueInformation_fnid, 4
sysDbgGetEventQueueInformation_fnid:
	.long	941286206
	.globl sysDbgGetSPUThreadName_stub
	.section	.data.sceFStub.sys_lv2dbg
	.align 2
	.type	sysDbgGetSPUThreadName_stub, @object
	.size	sysDbgGetSPUThreadName_stub, 4
sysDbgGetSPUThreadName_stub:
	.long	__sysDbgGetSPUThreadName
	.globl sysDbgGetSPUThreadName_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysDbgGetSPUThreadName_fnid, @object
	.size	sysDbgGetSPUThreadName_fnid, 4
sysDbgGetSPUThreadName_fnid:
	.long	1046408502
	.globl sysDbgGetPPUThreadName_stub
	.section	.data.sceFStub.sys_lv2dbg
	.align 2
	.type	sysDbgGetPPUThreadName_stub, @object
	.size	sysDbgGetPPUThreadName_stub, 4
sysDbgGetPPUThreadName_stub:
	.long	__sysDbgGetPPUThreadName
	.globl sysDbgGetPPUThreadName_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysDbgGetPPUThreadName_fnid, @object
	.size	sysDbgGetPPUThreadName_fnid, 4
sysDbgGetPPUThreadName_fnid:
	.long	1263924310
	.globl sysDbgGetMutexInformation_stub
	.section	.data.sceFStub.sys_lv2dbg
	.align 2
	.type	sysDbgGetMutexInformation_stub, @object
	.size	sysDbgGetMutexInformation_stub, 4
sysDbgGetMutexInformation_stub:
	.long	__sysDbgGetMutexInformation
	.globl sysDbgGetMutexInformation_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysDbgGetMutexInformation_fnid, @object
	.size	sysDbgGetMutexInformation_fnid, 4
sysDbgGetMutexInformation_fnid:
	.long	1346714280
	.globl sysDbgGetCondInformation_stub
	.section	.data.sceFStub.sys_lv2dbg
	.align 2
	.type	sysDbgGetCondInformation_stub, @object
	.size	sysDbgGetCondInformation_stub, 4
sysDbgGetCondInformation_stub:
	.long	__sysDbgGetCondInformation
	.globl sysDbgGetCondInformation_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysDbgGetCondInformation_fnid, @object
	.size	sysDbgGetCondInformation_fnid, 4
sysDbgGetCondInformation_fnid:
	.long	1673347390
	.globl sysDbgGetPPUThreadStatus_stub
	.section	.data.sceFStub.sys_lv2dbg
	.align 2
	.type	sysDbgGetPPUThreadStatus_stub, @object
	.size	sysDbgGetPPUThreadStatus_stub, 4
sysDbgGetPPUThreadStatus_stub:
	.long	__sysDbgGetPPUThreadStatus
	.globl sysDbgGetPPUThreadStatus_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysDbgGetPPUThreadStatus_fnid, @object
	.size	sysDbgGetPPUThreadStatus_fnid, 4
sysDbgGetPPUThreadStatus_fnid:
	.long	1799434616
	.globl sysDbgGetRWLockInformation_stub
	.section	.data.sceFStub.sys_lv2dbg
	.align 2
	.type	sysDbgGetRWLockInformation_stub, @object
	.size	sysDbgGetRWLockInformation_stub, 4
sysDbgGetRWLockInformation_stub:
	.long	__sysDbgGetRWLockInformation
	.globl sysDbgGetRWLockInformation_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysDbgGetRWLockInformation_fnid, @object
	.size	sysDbgGetRWLockInformation_fnid, 4
sysDbgGetRWLockInformation_fnid:
	.long	-1751860397
	.globl sysDbgGetGetSPUThreadGroupStatus_stub
	.section	.data.sceFStub.sys_lv2dbg
	.align 2
	.type	sysDbgGetGetSPUThreadGroupStatus_stub, @object
	.size	sysDbgGetGetSPUThreadGroupStatus_stub, 4
sysDbgGetGetSPUThreadGroupStatus_stub:
	.long	__sysDbgGetGetSPUThreadGroupStatus
	.globl sysDbgGetGetSPUThreadGroupStatus_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysDbgGetGetSPUThreadGroupStatus_fnid, @object
	.size	sysDbgGetGetSPUThreadGroupStatus_fnid, 4
sysDbgGetGetSPUThreadGroupStatus_fnid:
	.long	-1646551613
	.globl sysDbgGetSemaphoreInformation_stub
	.section	.data.sceFStub.sys_lv2dbg
	.align 2
	.type	sysDbgGetSemaphoreInformation_stub, @object
	.size	sysDbgGetSemaphoreInformation_stub, 4
sysDbgGetSemaphoreInformation_stub:
	.long	__sysDbgGetSemaphoreInformation
	.globl sysDbgGetSemaphoreInformation_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysDbgGetSemaphoreInformation_fnid, @object
	.size	sysDbgGetSemaphoreInformation_fnid, 4
sysDbgGetSemaphoreInformation_fnid:
	.long	-1562981422
	.globl sysDbgGetSPUThreadGroupName_stub
	.section	.data.sceFStub.sys_lv2dbg
	.align 2
	.type	sysDbgGetSPUThreadGroupName_stub, @object
	.size	sysDbgGetSPUThreadGroupName_stub, 4
sysDbgGetSPUThreadGroupName_stub:
	.long	__sysDbgGetSPUThreadGroupName
	.globl sysDbgGetSPUThreadGroupName_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysDbgGetSPUThreadGroupName_fnid, @object
	.size	sysDbgGetSPUThreadGroupName_fnid, 4
sysDbgGetSPUThreadGroupName_fnid:
	.long	-1117133436
	.globl sysDbgFinalizePPUExceptionHandler_stub
	.section	.data.sceFStub.sys_lv2dbg
	.align 2
	.type	sysDbgFinalizePPUExceptionHandler_stub, @object
	.size	sysDbgFinalizePPUExceptionHandler_stub, 4
sysDbgFinalizePPUExceptionHandler_stub:
	.long	__sysDbgFinalizePPUExceptionHandler
	.globl sysDbgFinalizePPUExceptionHandler_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysDbgFinalizePPUExceptionHandler_fnid, @object
	.size	sysDbgFinalizePPUExceptionHandler_fnid, 4
sysDbgFinalizePPUExceptionHandler_fnid:
	.long	-1058303386
	.globl sysDbgReadSPUThreadContext_stub
	.section	.data.sceFStub.sys_lv2dbg
	.align 2
	.type	sysDbgReadSPUThreadContext_stub, @object
	.size	sysDbgReadSPUThreadContext_stub, 4
sysDbgReadSPUThreadContext_stub:
	.long	__sysDbgReadSPUThreadContext
	.globl sysDbgReadSPUThreadContext_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysDbgReadSPUThreadContext_fnid, @object
	.size	sysDbgReadSPUThreadContext_fnid, 4
sysDbgReadSPUThreadContext_fnid:
	.long	-1038162379
	.globl sysDbgInitializePPUExceptionHandler_stub
	.section	.data.sceFStub.sys_lv2dbg
	.align 2
	.type	sysDbgInitializePPUExceptionHandler_stub, @object
	.size	sysDbgInitializePPUExceptionHandler_stub, 4
sysDbgInitializePPUExceptionHandler_stub:
	.long	__sysDbgInitializePPUExceptionHandler
	.globl sysDbgInitializePPUExceptionHandler_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysDbgInitializePPUExceptionHandler_fnid, @object
	.size	sysDbgInitializePPUExceptionHandler_fnid, 4
sysDbgInitializePPUExceptionHandler_fnid:
	.long	-1017957062
	.globl sysDbgReadPPUThreadContext_stub
	.section	.data.sceFStub.sys_lv2dbg
	.align 2
	.type	sysDbgReadPPUThreadContext_stub, @object
	.size	sysDbgReadPPUThreadContext_stub, 4
sysDbgReadPPUThreadContext_stub:
	.long	__sysDbgReadPPUThreadContext
	.globl sysDbgReadPPUThreadContext_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysDbgReadPPUThreadContext_fnid, @object
	.size	sysDbgReadPPUThreadContext_fnid, 4
sysDbgReadPPUThreadContext_fnid:
	.long	-974196353
	.globl sysDbgUnregisterPPUExceptionHandler_stub
	.section	.data.sceFStub.sys_lv2dbg
	.align 2
	.type	sysDbgUnregisterPPUExceptionHandler_stub, @object
	.size	sysDbgUnregisterPPUExceptionHandler_stub, 4
sysDbgUnregisterPPUExceptionHandler_stub:
	.long	__sysDbgUnregisterPPUExceptionHandler
	.globl sysDbgUnregisterPPUExceptionHandler_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysDbgUnregisterPPUExceptionHandler_fnid, @object
	.size	sysDbgUnregisterPPUExceptionHandler_fnid, 4
sysDbgUnregisterPPUExceptionHandler_fnid:
	.long	-958927853
	.globl sysDbgGetLwMutexInformation_stub
	.section	.data.sceFStub.sys_lv2dbg
	.align 2
	.type	sysDbgGetLwMutexInformation_stub, @object
	.size	sysDbgGetLwMutexInformation_stub, 4
sysDbgGetLwMutexInformation_stub:
	.long	__sysDbgGetLwMutexInformation
	.globl sysDbgGetLwMutexInformation_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sysDbgGetLwMutexInformation_fnid, @object
	.size	sysDbgGetLwMutexInformation_fnid, 4
sysDbgGetLwMutexInformation_fnid:
	.long	-885555658
	.ident	"GCC: (GNU) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
