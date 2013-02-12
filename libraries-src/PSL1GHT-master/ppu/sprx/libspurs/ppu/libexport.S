	.file	"libexport.c"
	.section	".got","aw"
	.section	".text"
	.section	.data.sceFStub.cellSpurs,"aw",@progbits
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
	.string	"cellSpurs"
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
	.4byte	cellSpurs
	.4byte	scefstub
	.4byte	0
	.4byte	0
	.4byte	0
	.4byte	0
	.globl spursFinalize_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursFinalize_stub, @object
	.size	spursFinalize_stub, 4
spursFinalize_stub:
	.long	__spursFinalize
	.globl spursFinalize_fnid
	.section	.rodata.sceFNID,"a",@progbits
	.align 2
	.type	spursFinalize_fnid, @object
	.size	spursFinalize_fnid, 4
spursFinalize_fnid:
	.long	-900971008
	.globl spursAttributeSetNamePrefix_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursAttributeSetNamePrefix_stub, @object
	.size	spursAttributeSetNamePrefix_stub, 4
spursAttributeSetNamePrefix_stub:
	.long	__spursAttributeSetNamePrefix
	.globl spursAttributeSetNamePrefix_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursAttributeSetNamePrefix_fnid, @object
	.size	spursAttributeSetNamePrefix_fnid, 4
spursAttributeSetNamePrefix_fnid:
	.long	122851603
	.globl spursAttributeInitializeEx_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursAttributeInitializeEx_stub, @object
	.size	spursAttributeInitializeEx_stub, 4
spursAttributeInitializeEx_stub:
	.long	__spursAttributeInitializeEx
	.globl spursAttributeInitializeEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursAttributeInitializeEx_fnid, @object
	.size	spursAttributeInitializeEx_fnid, 4
spursAttributeInitializeEx_fnid:
	.long	-1793588688
	.globl spursInitializeWithAttribute_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursInitializeWithAttribute_stub, @object
	.size	spursInitializeWithAttribute_stub, 4
spursInitializeWithAttribute_stub:
	.long	__spursInitializeWithAttribute
	.globl spursInitializeWithAttribute_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursInitializeWithAttribute_fnid, @object
	.size	spursInitializeWithAttribute_fnid, 4
spursInitializeWithAttribute_fnid:
	.long	-1436391000
	.globl spursInitializeWithAttribute2_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursInitializeWithAttribute2_stub, @object
	.size	spursInitializeWithAttribute2_stub, 4
spursInitializeWithAttribute2_stub:
	.long	__spursInitializeWithAttribute2
	.globl spursInitializeWithAttribute2_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursInitializeWithAttribute2_fnid, @object
	.size	spursInitializeWithAttribute2_fnid, 4
spursInitializeWithAttribute2_fnid:
	.long	816486084
	.globl spursInitialize_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursInitialize_stub, @object
	.size	spursInitialize_stub, 4
spursInitialize_stub:
	.long	__spursInitialize
	.globl spursInitialize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursInitialize_fnid, @object
	.size	spursInitialize_fnid, 4
spursInitialize_fnid:
	.long	-1392734788
	.globl spursAttributeSetMemoryContainerForSpuThread_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursAttributeSetMemoryContainerForSpuThread_stub, @object
	.size	spursAttributeSetMemoryContainerForSpuThread_stub, 4
spursAttributeSetMemoryContainerForSpuThread_stub:
	.long	__spursAttributeSetMemoryContainerForSpuThread
	.globl spursAttributeSetMemoryContainerForSpuThread_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursAttributeSetMemoryContainerForSpuThread_fnid, @object
	.size	spursAttributeSetMemoryContainerForSpuThread_fnid, 4
spursAttributeSetMemoryContainerForSpuThread_fnid:
	.long	-2111349732
	.globl spursAttributeSetSpuThreadGroupType_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursAttributeSetSpuThreadGroupType_stub, @object
	.size	spursAttributeSetSpuThreadGroupType_stub, 4
spursAttributeSetSpuThreadGroupType_stub:
	.long	__spursAttributeSetSpuThreadGroupType
	.globl spursAttributeSetSpuThreadGroupType_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursAttributeSetSpuThreadGroupType_fnid, @object
	.size	spursAttributeSetSpuThreadGroupType_fnid, 4
spursAttributeSetSpuThreadGroupType_fnid:
	.long	-1472617255
	.globl spursAttributeEnableSpuPrintfIfAvailable_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursAttributeEnableSpuPrintfIfAvailable_stub, @object
	.size	spursAttributeEnableSpuPrintfIfAvailable_stub, 4
spursAttributeEnableSpuPrintfIfAvailable_stub:
	.long	__spursAttributeEnableSpuPrintfIfAvailable
	.globl spursAttributeEnableSpuPrintfIfAvailable_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursAttributeEnableSpuPrintfIfAvailable_fnid, @object
	.size	spursAttributeEnableSpuPrintfIfAvailable_fnid, 4
spursAttributeEnableSpuPrintfIfAvailable_fnid:
	.long	273797428
	.globl spursWakeUp_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursWakeUp_stub, @object
	.size	spursWakeUp_stub, 4
spursWakeUp_stub:
	.long	__spursWakeUp
	.globl spursWakeUp_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursWakeUp_fnid, @object
	.size	spursWakeUp_fnid, 4
spursWakeUp_fnid:
	.long	2119082019
	.globl spursGetNumSpuThread_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursGetNumSpuThread_stub, @object
	.size	spursGetNumSpuThread_stub, 4
spursGetNumSpuThread_stub:
	.long	__spursGetNumSpuThread
	.globl spursGetNumSpuThread_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursGetNumSpuThread_fnid, @object
	.size	spursGetNumSpuThread_fnid, 4
spursGetNumSpuThread_fnid:
	.long	-982650955
	.globl spursSetMaxContention_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursSetMaxContention_stub, @object
	.size	spursSetMaxContention_stub, 4
spursSetMaxContention_stub:
	.long	__spursSetMaxContention
	.globl spursSetMaxContention_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursSetMaxContention_fnid, @object
	.size	spursSetMaxContention_fnid, 4
spursSetMaxContention_fnid:
	.long	-2066549035
	.globl spursSetPriorities_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursSetPriorities_stub, @object
	.size	spursSetPriorities_stub, 4
spursSetPriorities_stub:
	.long	__spursSetPriorities
	.globl spursSetPriorities_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursSetPriorities_fnid, @object
	.size	spursSetPriorities_fnid, 4
spursSetPriorities_fnid:
	.long	-2136826329
	.globl spursGetSpuThreadId_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursGetSpuThreadId_stub, @object
	.size	spursGetSpuThreadId_stub, 4
spursGetSpuThreadId_stub:
	.long	__spursGetSpuThreadId
	.globl spursGetSpuThreadId_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursGetSpuThreadId_fnid, @object
	.size	spursGetSpuThreadId_fnid, 4
spursGetSpuThreadId_fnid:
	.long	1821773677
	.globl spursGetSpuThreadGroupId_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursGetSpuThreadGroupId_stub, @object
	.size	spursGetSpuThreadGroupId_stub, 4
spursGetSpuThreadGroupId_stub:
	.long	__spursGetSpuThreadGroupId
	.globl spursGetSpuThreadGroupId_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursGetSpuThreadGroupId_fnid, @object
	.size	spursGetSpuThreadGroupId_fnid, 4
spursGetSpuThreadGroupId_fnid:
	.long	968979451
	.globl spursGetInfo_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursGetInfo_stub, @object
	.size	spursGetInfo_stub, 4
spursGetInfo_stub:
	.long	__spursGetInfo
	.globl spursGetInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursGetInfo_fnid, @object
	.size	spursGetInfo_fnid, 4
spursGetInfo_fnid:
	.long	524300175
	.globl spursGetSpuGuid_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursGetSpuGuid_stub, @object
	.size	spursGetSpuGuid_stub, 4
spursGetSpuGuid_stub:
	.long	__spursGetSpuGuid
	.globl spursGetSpuGuid_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursGetSpuGuid_fnid, @object
	.size	spursGetSpuGuid_fnid, 4
spursGetSpuGuid_fnid:
	.long	1875769059
	.globl spursJobGuardReset_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursJobGuardReset_stub, @object
	.size	spursJobGuardReset_stub, 4
spursJobGuardReset_stub:
	.long	__spursJobGuardReset
	.globl spursJobGuardReset_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursJobGuardReset_fnid, @object
	.size	spursJobGuardReset_fnid, 4
spursJobGuardReset_fnid:
	.long	11478297
	.globl spursLFQueueInitialize_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursLFQueueInitialize_stub, @object
	.size	spursLFQueueInitialize_stub, 4
spursLFQueueInitialize_stub:
	.long	__spursLFQueueInitialize
	.globl spursLFQueueInitialize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursLFQueueInitialize_fnid, @object
	.size	spursLFQueueInitialize_fnid, 4
spursLFQueueInitialize_fnid:
	.long	18801547
	.globl spursQueueDetachLv2EventQueue_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursQueueDetachLv2EventQueue_stub, @object
	.size	spursQueueDetachLv2EventQueue_stub, 4
spursQueueDetachLv2EventQueue_stub:
	.long	__spursQueueDetachLv2EventQueue
	.globl spursQueueDetachLv2EventQueue_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursQueueDetachLv2EventQueue_fnid, @object
	.size	spursQueueDetachLv2EventQueue_fnid, 4
spursQueueDetachLv2EventQueue_fnid:
	.long	60649655
	.globl spursQueueInitialize_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursQueueInitialize_stub, @object
	.size	spursQueueInitialize_stub, 4
spursQueueInitialize_stub:
	.long	__spursQueueInitialize
	.globl spursQueueInitialize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursQueueInitialize_fnid, @object
	.size	spursQueueInitialize_fnid, 4
spursQueueInitialize_fnid:
	.long	137100041
	.globl spursWorkloadAttributeSetShutdownCompletionEventHook_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursWorkloadAttributeSetShutdownCompletionEventHook_stub, @object
	.size	spursWorkloadAttributeSetShutdownCompletionEventHook_stub, 4
spursWorkloadAttributeSetShutdownCompletionEventHook_stub:
	.long	__spursWorkloadAttributeSetShutdownCompletionEventHook
	.globl spursWorkloadAttributeSetShutdownCompletionEventHook_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursWorkloadAttributeSetShutdownCompletionEventHook_fnid, @object
	.size	spursWorkloadAttributeSetShutdownCompletionEventHook_fnid, 4
spursWorkloadAttributeSetShutdownCompletionEventHook_fnid:
	.long	246725688
	.globl spursTaskExitCodeGet_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTaskExitCodeGet_stub, @object
	.size	spursTaskExitCodeGet_stub, 4
spursTaskExitCodeGet_stub:
	.long	__spursTaskExitCodeGet
	.globl spursTaskExitCodeGet_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTaskExitCodeGet_fnid, @object
	.size	spursTaskExitCodeGet_fnid, 4
spursTaskExitCodeGet_fnid:
	.long	330176755
	.globl spursJobChainGetError_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursJobChainGetError_stub, @object
	.size	spursJobChainGetError_stub, 4
spursJobChainGetError_stub:
	.long	__spursJobChainGetError
	.globl spursJobChainGetError_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursJobChainGetError_fnid, @object
	.size	spursJobChainGetError_fnid, 4
spursJobChainGetError_fnid:
	.long	371041959
	.globl spursTasksetAttributeInitialize_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTasksetAttributeInitialize_stub, @object
	.size	spursTasksetAttributeInitialize_stub, 4
spursTasksetAttributeInitialize_stub:
	.long	__spursTasksetAttributeInitialize
	.globl spursTasksetAttributeInitialize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTasksetAttributeInitialize_fnid, @object
	.size	spursTasksetAttributeInitialize_fnid, 4
spursTasksetAttributeInitialize_fnid:
	.long	372853326
	.globl spursLFQueueAttachLv2EventQueue_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursLFQueueAttachLv2EventQueue_stub, @object
	.size	spursLFQueueAttachLv2EventQueue_stub, 4
spursLFQueueAttachLv2EventQueue_stub:
	.long	__spursLFQueueAttachLv2EventQueue
	.globl spursLFQueueAttachLv2EventQueue_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursLFQueueAttachLv2EventQueue_fnid, @object
	.size	spursLFQueueAttachLv2EventQueue_fnid, 4
spursLFQueueAttachLv2EventQueue_fnid:
	.long	374789279
	.globl spursAddUrgentCommand_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursAddUrgentCommand_stub, @object
	.size	spursAddUrgentCommand_stub, 4
spursAddUrgentCommand_stub:
	.long	__spursAddUrgentCommand
	.globl spursAddUrgentCommand_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursAddUrgentCommand_fnid, @object
	.size	spursAddUrgentCommand_fnid, 4
spursAddUrgentCommand_fnid:
	.long	385880064
	.globl spursRequestIdleSpu_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursRequestIdleSpu_stub, @object
	.size	spursRequestIdleSpu_stub, 4
spursRequestIdleSpu_stub:
	.long	__spursRequestIdleSpu
	.globl spursRequestIdleSpu_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursRequestIdleSpu_fnid, @object
	.size	spursRequestIdleSpu_fnid, 4
spursRequestIdleSpu_fnid:
	.long	405641360
	.globl spursSendWorkloadSignal_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursSendWorkloadSignal_stub, @object
	.size	spursSendWorkloadSignal_stub, 4
spursSendWorkloadSignal_stub:
	.long	__spursSendWorkloadSignal
	.globl spursSendWorkloadSignal_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursSendWorkloadSignal_fnid, @object
	.size	spursSendWorkloadSignal_fnid, 4
spursSendWorkloadSignal_fnid:
	.long	489409099
	.globl spursTaskGetLoadableSegmentPattern_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTaskGetLoadableSegmentPattern_stub, @object
	.size	spursTaskGetLoadableSegmentPattern_stub, 4
spursTaskGetLoadableSegmentPattern_stub:
	.long	__spursTaskGetLoadableSegmentPattern
	.globl spursTaskGetLoadableSegmentPattern_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTaskGetLoadableSegmentPattern_fnid, @object
	.size	spursTaskGetLoadableSegmentPattern_fnid, 4
spursTaskGetLoadableSegmentPattern_fnid:
	.long	489964550
	.globl spursCreateTaskWithAttribute_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursCreateTaskWithAttribute_stub, @object
	.size	spursCreateTaskWithAttribute_stub, 4
spursCreateTaskWithAttribute_stub:
	.long	__spursCreateTaskWithAttribute
	.globl spursCreateTaskWithAttribute_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursCreateTaskWithAttribute_fnid, @object
	.size	spursCreateTaskWithAttribute_fnid, 4
spursCreateTaskWithAttribute_fnid:
	.long	491192031
	.globl spursDestroyTaskset2_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursDestroyTaskset2_stub, @object
	.size	spursDestroyTaskset2_stub, 4
spursDestroyTaskset2_stub:
	.long	__spursDestroyTaskset2
	.globl spursDestroyTaskset2_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursDestroyTaskset2_fnid, @object
	.size	spursDestroyTaskset2_fnid, 4
spursDestroyTaskset2_fnid:
	.long	515699801
	.globl spursQueueGetTasksetAddress_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursQueueGetTasksetAddress_stub, @object
	.size	spursQueueGetTasksetAddress_stub, 4
spursQueueGetTasksetAddress_stub:
	.long	__spursQueueGetTasksetAddress
	.globl spursQueueGetTasksetAddress_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursQueueGetTasksetAddress_fnid, @object
	.size	spursQueueGetTasksetAddress_fnid, 4
spursQueueGetTasksetAddress_fnid:
	.long	546514219
	.globl spursEventFlagDetachLv2EventQueue_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursEventFlagDetachLv2EventQueue_stub, @object
	.size	spursEventFlagDetachLv2EventQueue_stub, 4
spursEventFlagDetachLv2EventQueue_stub:
	.long	__spursEventFlagDetachLv2EventQueue
	.globl spursEventFlagDetachLv2EventQueue_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursEventFlagDetachLv2EventQueue_fnid, @object
	.size	spursEventFlagDetachLv2EventQueue_fnid, 4
spursEventFlagDetachLv2EventQueue_fnid:
	.long	581612317
	.globl spursQueueClear_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursQueueClear_stub, @object
	.size	spursQueueClear_stub, 4
spursQueueClear_stub:
	.long	__spursQueueClear
	.globl spursQueueClear_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursQueueClear_fnid, @object
	.size	spursQueueClear_fnid, 4
spursQueueClear_fnid:
	.long	611587280
	.globl spursJobChainAttributeSetJobTypeMemoryCheck_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursJobChainAttributeSetJobTypeMemoryCheck_stub, @object
	.size	spursJobChainAttributeSetJobTypeMemoryCheck_stub, 4
spursJobChainAttributeSetJobTypeMemoryCheck_stub:
	.long	__spursJobChainAttributeSetJobTypeMemoryCheck
	.globl spursJobChainAttributeSetJobTypeMemoryCheck_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursJobChainAttributeSetJobTypeMemoryCheck_fnid, @object
	.size	spursJobChainAttributeSetJobTypeMemoryCheck_fnid, 4
spursJobChainAttributeSetJobTypeMemoryCheck_fnid:
	.long	754764697
	.globl spursWorkloadFlagReceiver2_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursWorkloadFlagReceiver2_stub, @object
	.size	spursWorkloadFlagReceiver2_stub, 4
spursWorkloadFlagReceiver2_stub:
	.long	__spursWorkloadFlagReceiver2
	.globl spursWorkloadFlagReceiver2_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursWorkloadFlagReceiver2_fnid, @object
	.size	spursWorkloadFlagReceiver2_fnid, 4
spursWorkloadFlagReceiver2_fnid:
	.long	769379338
	.globl spursTasksetSetExceptionEventHandler_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTasksetSetExceptionEventHandler_stub, @object
	.size	spursTasksetSetExceptionEventHandler_stub, 4
spursTasksetSetExceptionEventHandler_stub:
	.long	__spursTasksetSetExceptionEventHandler
	.globl spursTasksetSetExceptionEventHandler_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTasksetSetExceptionEventHandler_fnid, @object
	.size	spursTasksetSetExceptionEventHandler_fnid, 4
spursTasksetSetExceptionEventHandler_fnid:
	.long	786235282
	.globl spursCreateJobChainWithAttribute_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursCreateJobChainWithAttribute_stub, @object
	.size	spursCreateJobChainWithAttribute_stub, 4
spursCreateJobChainWithAttribute_stub:
	.long	__spursCreateJobChainWithAttribute
	.globl spursCreateJobChainWithAttribute_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursCreateJobChainWithAttribute_fnid, @object
	.size	spursCreateJobChainWithAttribute_fnid, 4
spursCreateJobChainWithAttribute_fnid:
	.long	809245133
	.globl spursEnableExceptionEventHandler_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursEnableExceptionEventHandler_stub, @object
	.size	spursEnableExceptionEventHandler_stub, 4
spursEnableExceptionEventHandler_stub:
	.long	__spursEnableExceptionEventHandler
	.globl spursEnableExceptionEventHandler_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursEnableExceptionEventHandler_fnid, @object
	.size	spursEnableExceptionEventHandler_fnid, 4
spursEnableExceptionEventHandler_fnid:
	.long	851004125
	.globl spursTaskExitCodeInitialize_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTaskExitCodeInitialize_stub, @object
	.size	spursTaskExitCodeInitialize_stub, 4
spursTaskExitCodeInitialize_stub:
	.long	__spursTaskExitCodeInitialize
	.globl spursTaskExitCodeInitialize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTaskExitCodeInitialize_fnid, @object
	.size	spursTaskExitCodeInitialize_fnid, 4
spursTaskExitCodeInitialize_fnid:
	.long	877997990
	.globl spursJobChainAttributeInitialize_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursJobChainAttributeInitialize_stub, @object
	.size	spursJobChainAttributeInitialize_stub, 4
spursJobChainAttributeInitialize_stub:
	.long	__spursJobChainAttributeInitialize
	.globl spursJobChainAttributeInitialize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursJobChainAttributeInitialize_fnid, @object
	.size	spursJobChainAttributeInitialize_fnid, 4
spursJobChainAttributeInitialize_fnid:
	.long	893973635
	.globl spursLFQueuePopBody_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursLFQueuePopBody_stub, @object
	.size	spursLFQueuePopBody_stub, 4
spursLFQueuePopBody_stub:
	.long	__spursLFQueuePopBody
	.globl spursLFQueuePopBody_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursLFQueuePopBody_fnid, @object
	.size	spursLFQueuePopBody_fnid, 4
spursLFQueuePopBody_fnid:
	.long	903537195
	.globl spursQueueDepth_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursQueueDepth_stub, @object
	.size	spursQueueDepth_stub, 4
spursQueueDepth_stub:
	.long	__spursQueueDepth
	.globl spursQueueDepth_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursQueueDepth_fnid, @object
	.size	spursQueueDepth_fnid, 4
spursQueueDepth_fnid:
	.long	904929927
	.globl spursQueueGetEntrySize_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursQueueGetEntrySize_stub, @object
	.size	spursQueueGetEntrySize_stub, 4
spursQueueGetEntrySize_stub:
	.long	__spursQueueGetEntrySize
	.globl spursQueueGetEntrySize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursQueueGetEntrySize_fnid, @object
	.size	spursQueueGetEntrySize_fnid, 4
spursQueueGetEntrySize_fnid:
	.long	916447293
	.globl spursEventFlagWait_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursEventFlagWait_stub, @object
	.size	spursEventFlagWait_stub, 4
spursEventFlagWait_stub:
	.long	__spursEventFlagWait
	.globl spursEventFlagWait_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursEventFlagWait_fnid, @object
	.size	spursEventFlagWait_fnid, 4
spursEventFlagWait_fnid:
	.long	926229460
	.globl spursJobChainGetSpursAddress_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursJobChainGetSpursAddress_stub, @object
	.size	spursJobChainGetSpursAddress_stub, 4
spursJobChainGetSpursAddress_stub:
	.long	__spursJobChainGetSpursAddress
	.globl spursJobChainGetSpursAddress_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursJobChainGetSpursAddress_fnid, @object
	.size	spursJobChainGetSpursAddress_fnid, 4
spursJobChainGetSpursAddress_fnid:
	.long	1229329351
	.globl spursReadyCountSwap_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursReadyCountSwap_stub, @object
	.size	spursReadyCountSwap_stub, 4
spursReadyCountSwap_stub:
	.long	__spursReadyCountSwap
	.globl spursReadyCountSwap_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursReadyCountSwap_fnid, @object
	.size	spursReadyCountSwap_fnid, 4
spursReadyCountSwap_fnid:
	.long	1235436141
	.globl spursWorkloadAttributeSetName_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursWorkloadAttributeSetName_stub, @object
	.size	spursWorkloadAttributeSetName_stub, 4
spursWorkloadAttributeSetName_stub:
	.long	__spursWorkloadAttributeSetName
	.globl spursWorkloadAttributeSetName_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursWorkloadAttributeSetName_fnid, @object
	.size	spursWorkloadAttributeSetName_fnid, 4
spursWorkloadAttributeSetName_fnid:
	.long	1247718243
	.globl spursCreateTaskset2_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursCreateTaskset2_stub, @object
	.size	spursCreateTaskset2_stub, 4
spursCreateTaskset2_stub:
	.long	__spursCreateTaskset2
	.globl spursCreateTaskset2_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursCreateTaskset2_fnid, @object
	.size	spursCreateTaskset2_fnid, 4
spursCreateTaskset2_fnid:
	.long	1248093667
	.globl spursEventFlagClear_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursEventFlagClear_stub, @object
	.size	spursEventFlagClear_stub, 4
spursEventFlagClear_stub:
	.long	__spursEventFlagClear
	.globl spursEventFlagClear_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursEventFlagClear_fnid, @object
	.size	spursEventFlagClear_fnid, 4
spursEventFlagClear_fnid:
	.long	1254603492
	.globl spursUnsetExceptionEventHandler_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursUnsetExceptionEventHandler_stub, @object
	.size	spursUnsetExceptionEventHandler_stub, 4
spursUnsetExceptionEventHandler_stub:
	.long	__spursUnsetExceptionEventHandler
	.globl spursUnsetExceptionEventHandler_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursUnsetExceptionEventHandler_fnid, @object
	.size	spursUnsetExceptionEventHandler_fnid, 4
spursUnsetExceptionEventHandler_fnid:
	.long	1282793144
	.globl spursLookUpTasksetAddress_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursLookUpTasksetAddress_stub, @object
	.size	spursLookUpTasksetAddress_stub, 4
spursLookUpTasksetAddress_stub:
	.long	__spursLookUpTasksetAddress
	.globl spursLookUpTasksetAddress_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursLookUpTasksetAddress_fnid, @object
	.size	spursLookUpTasksetAddress_fnid, 4
spursLookUpTasksetAddress_fnid:
	.long	1288603817
	.globl spursGetJobChainInfo_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursGetJobChainInfo_stub, @object
	.size	spursGetJobChainInfo_stub, 4
spursGetJobChainInfo_stub:
	.long	__spursGetJobChainInfo
	.globl spursGetJobChainInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursGetJobChainInfo_fnid, @object
	.size	spursGetJobChainInfo_fnid, 4
spursGetJobChainInfo_fnid:
	.long	1290507924
	.globl spursEventFlagGetClearMode_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursEventFlagGetClearMode_stub, @object
	.size	spursEventFlagGetClearMode_stub, 4
spursEventFlagGetClearMode_stub:
	.long	__spursEventFlagGetClearMode
	.globl spursEventFlagGetClearMode_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursEventFlagGetClearMode_fnid, @object
	.size	spursEventFlagGetClearMode_fnid, 4
spursEventFlagGetClearMode_fnid:
	.long	1293849459
	.globl spursSetPreemptionVictimHints_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursSetPreemptionVictimHints_stub, @object
	.size	spursSetPreemptionVictimHints_stub, 4
spursSetPreemptionVictimHints_stub:
	.long	__spursSetPreemptionVictimHints
	.globl spursSetPreemptionVictimHints_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursSetPreemptionVictimHints_fnid, @object
	.size	spursSetPreemptionVictimHints_fnid, 4
spursSetPreemptionVictimHints_fnid:
	.long	1306657762
	.globl spursGetWorkloadInfo_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursGetWorkloadInfo_stub, @object
	.size	spursGetWorkloadInfo_stub, 4
spursGetWorkloadInfo_stub:
	.long	__spursGetWorkloadInfo
	.globl spursGetWorkloadInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursGetWorkloadInfo_fnid, @object
	.size	spursGetWorkloadInfo_fnid, 4
spursGetWorkloadInfo_fnid:
	.long	1310015038
	.globl spursDetachLv2EventQueue_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursDetachLv2EventQueue_stub, @object
	.size	spursDetachLv2EventQueue_stub, 4
spursDetachLv2EventQueue_stub:
	.long	__spursDetachLv2EventQueue
	.globl spursDetachLv2EventQueue_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursDetachLv2EventQueue_fnid, @object
	.size	spursDetachLv2EventQueue_fnid, 4
spursDetachLv2EventQueue_fnid:
	.long	1315361923
	.globl spursJobChainSetExceptionEventHandler_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursJobChainSetExceptionEventHandler_stub, @object
	.size	spursJobChainSetExceptionEventHandler_stub, 4
spursJobChainSetExceptionEventHandler_stub:
	.long	__spursJobChainSetExceptionEventHandler
	.globl spursJobChainSetExceptionEventHandler_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursJobChainSetExceptionEventHandler_fnid, @object
	.size	spursJobChainSetExceptionEventHandler_fnid, 4
spursJobChainSetExceptionEventHandler_fnid:
	.long	1375921467
	.globl spursCreateTaskset_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursCreateTaskset_stub, @object
	.size	spursCreateTaskset_stub, 4
spursCreateTaskset_stub:
	.long	__spursCreateTaskset
	.globl spursCreateTaskset_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursCreateTaskset_fnid, @object
	.size	spursCreateTaskset_fnid, 4
spursCreateTaskset_fnid:
	.long	1389128834
	.globl spursQueueSize_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursQueueSize_stub, @object
	.size	spursQueueSize_stub, 4
spursQueueSize_stub:
	.long	__spursQueueSize
	.globl spursQueueSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursQueueSize_fnid, @object
	.size	spursQueueSize_fnid, 4
spursQueueSize_fnid:
	.long	1418159619
	.globl spursSemaphoreGetTasksetAddress_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursSemaphoreGetTasksetAddress_stub, @object
	.size	spursSemaphoreGetTasksetAddress_stub, 4
spursSemaphoreGetTasksetAddress_stub:
	.long	__spursSemaphoreGetTasksetAddress
	.globl spursSemaphoreGetTasksetAddress_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursSemaphoreGetTasksetAddress_fnid, @object
	.size	spursSemaphoreGetTasksetAddress_fnid, 4
spursSemaphoreGetTasksetAddress_fnid:
	.long	1451959122
	.globl spursTraceInitialize_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTraceInitialize_stub, @object
	.size	spursTraceInitialize_stub, 4
spursTraceInitialize_stub:
	.long	__spursTraceInitialize
	.globl spursTraceInitialize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTraceInitialize_fnid, @object
	.size	spursTraceInitialize_fnid, 4
spursTraceInitialize_fnid:
	.long	1452700899
	.globl spursRemoveWorkload_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursRemoveWorkload_stub, @object
	.size	spursRemoveWorkload_stub, 4
spursRemoveWorkload_stub:
	.long	__spursRemoveWorkload
	.globl spursRemoveWorkload_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursRemoveWorkload_fnid, @object
	.size	spursRemoveWorkload_fnid, 4
spursRemoveWorkload_fnid:
	.long	1474617027
	.globl spursTasksetGetSpursAddress_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTasksetGetSpursAddress_stub, @object
	.size	spursTasksetGetSpursAddress_stub, 4
spursTasksetGetSpursAddress_stub:
	.long	__spursTasksetGetSpursAddress
	.globl spursTasksetGetSpursAddress_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTasksetGetSpursAddress_fnid, @object
	.size	spursTasksetGetSpursAddress_fnid, 4
spursTasksetGetSpursAddress_fnid:
	.long	1490390991
	.globl spursEventFlagInitialize_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursEventFlagInitialize_stub, @object
	.size	spursEventFlagInitialize_stub, 4
spursEventFlagInitialize_stub:
	.long	__spursEventFlagInitialize
	.globl spursEventFlagInitialize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursEventFlagInitialize_fnid, @object
	.size	spursEventFlagInitialize_fnid, 4
spursEventFlagInitialize_fnid:
	.long	1593402469
	.globl spursWaitForWorkloadShutdown_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursWaitForWorkloadShutdown_stub, @object
	.size	spursWaitForWorkloadShutdown_stub, 4
spursWaitForWorkloadShutdown_stub:
	.long	__spursWaitForWorkloadShutdown
	.globl spursWaitForWorkloadShutdown_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursWaitForWorkloadShutdown_fnid, @object
	.size	spursWaitForWorkloadShutdown_fnid, 4
spursWaitForWorkloadShutdown_fnid:
	.long	1607745508
	.globl spursTasksetAttributeSetName_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTasksetAttributeSetName_stub, @object
	.size	spursTasksetAttributeSetName_stub, 4
spursTasksetAttributeSetName_stub:
	.long	__spursTasksetAttributeSetName
	.globl spursTasksetAttributeSetName_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTasksetAttributeSetName_fnid, @object
	.size	spursTasksetAttributeSetName_fnid, 4
spursTasksetAttributeSetName_fnid:
	.long	1697345762
	.globl spursJobGuardInitialize_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursJobGuardInitialize_stub, @object
	.size	spursJobGuardInitialize_stub, 4
spursJobGuardInitialize_stub:
	.long	__spursJobGuardInitialize
	.globl spursJobGuardInitialize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursJobGuardInitialize_fnid, @object
	.size	spursJobGuardInitialize_fnid, 4
spursJobGuardInitialize_fnid:
	.long	1756031913
	.globl spursAddWorkload_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursAddWorkload_stub, @object
	.size	spursAddWorkload_stub, 4
spursAddWorkload_stub:
	.long	__spursAddWorkload
	.globl spursAddWorkload_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursAddWorkload_fnid, @object
	.size	spursAddWorkload_fnid, 4
spursAddWorkload_fnid:
	.long	1769106082
	.globl spursJobChainUnsetExceptionEventHandler_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursJobChainUnsetExceptionEventHandler_stub, @object
	.size	spursJobChainUnsetExceptionEventHandler_stub, 4
spursJobChainUnsetExceptionEventHandler_stub:
	.long	__spursJobChainUnsetExceptionEventHandler
	.globl spursJobChainUnsetExceptionEventHandler_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursJobChainUnsetExceptionEventHandler_fnid, @object
	.size	spursJobChainUnsetExceptionEventHandler_fnid, 4
spursJobChainUnsetExceptionEventHandler_fnid:
	.long	1789356441
	.globl spursEventFlagTryWait_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursEventFlagTryWait_stub, @object
	.size	spursEventFlagTryWait_stub, 4
spursEventFlagTryWait_stub:
	.long	__spursEventFlagTryWait
	.globl spursEventFlagTryWait_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursEventFlagTryWait_fnid, @object
	.size	spursEventFlagTryWait_fnid, 4
spursEventFlagTryWait_fnid:
	.long	1831703353
	.globl spursShutdownJobChain_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursShutdownJobChain_stub, @object
	.size	spursShutdownJobChain_stub, 4
spursShutdownJobChain_stub:
	.long	__spursShutdownJobChain
	.globl spursShutdownJobChain_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursShutdownJobChain_fnid, @object
	.size	spursShutdownJobChain_fnid, 4
spursShutdownJobChain_fnid:
	.long	1938702566
	.globl spursLFQueueDetachLv2EventQueue_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursLFQueueDetachLv2EventQueue_stub, @object
	.size	spursLFQueueDetachLv2EventQueue_stub, 4
spursLFQueueDetachLv2EventQueue_stub:
	.long	__spursLFQueueDetachLv2EventQueue
	.globl spursLFQueueDetachLv2EventQueue_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursLFQueueDetachLv2EventQueue_fnid, @object
	.size	spursLFQueueDetachLv2EventQueue_fnid, 4
spursLFQueueDetachLv2EventQueue_fnid:
	.long	1944088465
	.globl spursSetGlobalExceptionEventHandler_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursSetGlobalExceptionEventHandler_stub, @object
	.size	spursSetGlobalExceptionEventHandler_stub, 4
spursSetGlobalExceptionEventHandler_stub:
	.long	__spursSetGlobalExceptionEventHandler
	.globl spursSetGlobalExceptionEventHandler_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursSetGlobalExceptionEventHandler_fnid, @object
	.size	spursSetGlobalExceptionEventHandler_fnid, 4
spursSetGlobalExceptionEventHandler_fnid:
	.long	1964470858
	.globl spursReadyCountAdd_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursReadyCountAdd_stub, @object
	.size	spursReadyCountAdd_stub, 4
spursReadyCountAdd_stub:
	.long	__spursReadyCountAdd
	.globl spursReadyCountAdd_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursReadyCountAdd_fnid, @object
	.size	spursReadyCountAdd_fnid, 4
spursReadyCountAdd_fnid:
	.long	1965101462
	.globl spursSemaphoreInitialize_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursSemaphoreInitialize_stub, @object
	.size	spursSemaphoreInitialize_stub, 4
spursSemaphoreInitialize_stub:
	.long	__spursSemaphoreInitialize
	.globl spursSemaphoreInitialize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursSemaphoreInitialize_fnid, @object
	.size	spursSemaphoreInitialize_fnid, 4
spursSemaphoreInitialize_fnid:
	.long	2009967628
	.globl spursTraceFinalize_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTraceFinalize_stub, @object
	.size	spursTraceFinalize_stub, 4
spursTraceFinalize_stub:
	.long	__spursTraceFinalize
	.globl spursTraceFinalize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTraceFinalize_fnid, @object
	.size	spursTraceFinalize_fnid, 4
spursTraceFinalize_fnid:
	.long	2073869172
	.globl spursTaskGetReadOnlyAreaPattern_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTaskGetReadOnlyAreaPattern_stub, @object
	.size	spursTaskGetReadOnlyAreaPattern_stub, 4
spursTaskGetReadOnlyAreaPattern_stub:
	.long	__spursTaskGetReadOnlyAreaPattern
	.globl spursTaskGetReadOnlyAreaPattern_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTaskGetReadOnlyAreaPattern_fnid, @object
	.size	spursTaskGetReadOnlyAreaPattern_fnid, 4
spursTaskGetReadOnlyAreaPattern_fnid:
	.long	2092121134
	.globl spursBarrierInitialize_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursBarrierInitialize_stub, @object
	.size	spursBarrierInitialize_stub, 4
spursBarrierInitialize_stub:
	.long	__spursBarrierInitialize
	.globl spursBarrierInitialize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursBarrierInitialize_fnid, @object
	.size	spursBarrierInitialize_fnid, 4
spursBarrierInitialize_fnid:
	.long	2145341423
	.globl spursTryJoinTask2_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTryJoinTask2_stub, @object
	.size	spursTryJoinTask2_stub, 4
spursTryJoinTask2_stub:
	.long	__spursTryJoinTask2
	.globl spursTryJoinTask2_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTryJoinTask2_fnid, @object
	.size	spursTryJoinTask2_fnid, 4
spursTryJoinTask2_fnid:
	.long	-2087738128
	.globl spursUnsetGlobalExceptionEventHandler_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursUnsetGlobalExceptionEventHandler_stub, @object
	.size	spursUnsetGlobalExceptionEventHandler_stub, 4
spursUnsetGlobalExceptionEventHandler_stub:
	.long	__spursUnsetGlobalExceptionEventHandler
	.globl spursUnsetGlobalExceptionEventHandler_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursUnsetGlobalExceptionEventHandler_fnid, @object
	.size	spursUnsetGlobalExceptionEventHandler_fnid, 4
spursUnsetGlobalExceptionEventHandler_fnid:
	.long	-2045626376
	.globl spursGetJobChainId_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursGetJobChainId_stub, @object
	.size	spursGetJobChainId_stub, 4
spursGetJobChainId_stub:
	.long	__spursGetJobChainId
	.globl spursGetJobChainId_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursGetJobChainId_fnid, @object
	.size	spursGetJobChainId_fnid, 4
spursGetJobChainId_fnid:
	.long	-2033687390
	.globl spursEventFlagAttachLv2EventQueue_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursEventFlagAttachLv2EventQueue_stub, @object
	.size	spursEventFlagAttachLv2EventQueue_stub, 4
spursEventFlagAttachLv2EventQueue_stub:
	.long	__spursEventFlagAttachLv2EventQueue
	.globl spursEventFlagAttachLv2EventQueue_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursEventFlagAttachLv2EventQueue_fnid, @object
	.size	spursEventFlagAttachLv2EventQueue_fnid, 4
spursEventFlagAttachLv2EventQueue_fnid:
	.long	-2023552650
	.globl spursEventFlagGetDirection_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursEventFlagGetDirection_stub, @object
	.size	spursEventFlagGetDirection_stub, 4
spursEventFlagGetDirection_stub:
	.long	__spursEventFlagGetDirection
	.globl spursEventFlagGetDirection_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursEventFlagGetDirection_fnid, @object
	.size	spursEventFlagGetDirection_fnid, 4
spursEventFlagGetDirection_fnid:
	.long	-1995465126
	.globl spursLFQueuePushBody_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursLFQueuePushBody_stub, @object
	.size	spursLFQueuePushBody_stub, 4
spursLFQueuePushBody_stub:
	.long	__spursLFQueuePushBody
	.globl spursLFQueuePushBody_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursLFQueuePushBody_fnid, @object
	.size	spursLFQueuePushBody_fnid, 4
spursLFQueuePushBody_fnid:
	.long	-1970968755
	.globl spursTaskAttribute2Initialize_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTaskAttribute2Initialize_stub, @object
	.size	spursTaskAttribute2Initialize_stub, 4
spursTaskAttribute2Initialize_stub:
	.long	__spursTaskAttribute2Initialize
	.globl spursTaskAttribute2Initialize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTaskAttribute2Initialize_fnid, @object
	.size	spursTaskAttribute2Initialize_fnid, 4
spursTaskAttribute2Initialize_fnid:
	.long	-1965367451
	.globl spursTasksetAttributeSetTasksetSize_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTasksetAttributeSetTasksetSize_stub, @object
	.size	spursTasksetAttributeSetTasksetSize_stub, 4
spursTasksetAttributeSetTasksetSize_stub:
	.long	__spursTasksetAttributeSetTasksetSize
	.globl spursTasksetAttributeSetTasksetSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTasksetAttributeSetTasksetSize_fnid, @object
	.size	spursTasksetAttributeSetTasksetSize_fnid, 4
spursTasksetAttributeSetTasksetSize_fnid:
	.long	-1894633736
	.globl spursAddUrgentCall_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursAddUrgentCall_stub, @object
	.size	spursAddUrgentCall_stub, 4
spursAddUrgentCall_stub:
	.long	__spursAddUrgentCall
	.globl spursAddUrgentCall_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursAddUrgentCall_fnid, @object
	.size	spursAddUrgentCall_fnid, 4
spursAddUrgentCall_fnid:
	.long	-1881190222
	.globl spursTaskGetContextSaveAreaSize_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTaskGetContextSaveAreaSize_stub, @object
	.size	spursTaskGetContextSaveAreaSize_stub, 4
spursTaskGetContextSaveAreaSize_stub:
	.long	__spursTaskGetContextSaveAreaSize
	.globl spursTaskGetContextSaveAreaSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTaskGetContextSaveAreaSize_fnid, @object
	.size	spursTaskGetContextSaveAreaSize_fnid, 4
spursTaskGetContextSaveAreaSize_fnid:
	.long	-1875581640
	.globl spursQueuePopBody_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursQueuePopBody_stub, @object
	.size	spursQueuePopBody_stub, 4
spursQueuePopBody_stub:
	.long	__spursQueuePopBody
	.globl spursQueuePopBody_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursQueuePopBody_fnid, @object
	.size	spursQueuePopBody_fnid, 4
spursQueuePopBody_fnid:
	.long	-1861851545
	.globl spursTaskGenerateLsPattern_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTaskGenerateLsPattern_stub, @object
	.size	spursTaskGenerateLsPattern_stub, 4
spursTaskGenerateLsPattern_stub:
	.long	__spursTaskGenerateLsPattern
	.globl spursTaskGenerateLsPattern_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTaskGenerateLsPattern_fnid, @object
	.size	spursTaskGenerateLsPattern_fnid, 4
spursTaskGenerateLsPattern_fnid:
	.long	-1852337825
	.globl spursQueuePushBody_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursQueuePushBody_stub, @object
	.size	spursQueuePushBody_stub, 4
spursQueuePushBody_stub:
	.long	__spursQueuePushBody
	.globl spursQueuePushBody_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursQueuePushBody_fnid, @object
	.size	spursQueuePushBody_fnid, 4
spursQueuePushBody_fnid:
	.long	-1831864595
	.globl spursTasksetUnsetExceptionEventHandler_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTasksetUnsetExceptionEventHandler_stub, @object
	.size	spursTasksetUnsetExceptionEventHandler_stub, 4
spursTasksetUnsetExceptionEventHandler_stub:
	.long	__spursTasksetUnsetExceptionEventHandler
	.globl spursTasksetUnsetExceptionEventHandler_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTasksetUnsetExceptionEventHandler_fnid, @object
	.size	spursTasksetUnsetExceptionEventHandler_fnid, 4
spursTasksetUnsetExceptionEventHandler_fnid:
	.long	-1811723115
	.globl spursEventFlagGetTasksetAddress_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursEventFlagGetTasksetAddress_stub, @object
	.size	spursEventFlagGetTasksetAddress_stub, 4
spursEventFlagGetTasksetAddress_stub:
	.long	__spursEventFlagGetTasksetAddress
	.globl spursEventFlagGetTasksetAddress_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursEventFlagGetTasksetAddress_fnid, @object
	.size	spursEventFlagGetTasksetAddress_fnid, 4
spursEventFlagGetTasksetAddress_fnid:
	.long	-1803617525
	.globl spursJobHeaderSetJobbin2Param_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursJobHeaderSetJobbin2Param_stub, @object
	.size	spursJobHeaderSetJobbin2Param_stub, 4
spursJobHeaderSetJobbin2Param_stub:
	.long	__spursJobHeaderSetJobbin2Param
	.globl spursJobHeaderSetJobbin2Param_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursJobHeaderSetJobbin2Param_fnid, @object
	.size	spursJobHeaderSetJobbin2Param_fnid, 4
spursJobHeaderSetJobbin2Param_fnid:
	.long	-1750927672
	.globl spursShutdownWorkload_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursShutdownWorkload_stub, @object
	.size	spursShutdownWorkload_stub, 4
spursShutdownWorkload_stub:
	.long	__spursShutdownWorkload
	.globl spursShutdownWorkload_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursShutdownWorkload_fnid, @object
	.size	spursShutdownWorkload_fnid, 4
spursShutdownWorkload_fnid:
	.long	-1730825405
	.globl spursBarrierGetTasksetAddress_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursBarrierGetTasksetAddress_stub, @object
	.size	spursBarrierGetTasksetAddress_stub, 4
spursBarrierGetTasksetAddress_stub:
	.long	__spursBarrierGetTasksetAddress
	.globl spursBarrierGetTasksetAddress_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursBarrierGetTasksetAddress_fnid, @object
	.size	spursBarrierGetTasksetAddress_fnid, 4
spursBarrierGetTasksetAddress_fnid:
	.long	-1695853518
	.globl spursAttributeEnableSystemWorkload_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursAttributeEnableSystemWorkload_stub, @object
	.size	spursAttributeEnableSystemWorkload_stub, 4
spursAttributeEnableSystemWorkload_stub:
	.long	__spursAttributeEnableSystemWorkload
	.globl spursAttributeEnableSystemWorkload_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursAttributeEnableSystemWorkload_fnid, @object
	.size	spursAttributeEnableSystemWorkload_fnid, 4
spursAttributeEnableSystemWorkload_fnid:
	.long	-1647588515
	.globl spursJoinTaskset_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursJoinTaskset_stub, @object
	.size	spursJoinTaskset_stub, 4
spursJoinTaskset_stub:
	.long	__spursJoinTaskset
	.globl spursJoinTaskset_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursJoinTaskset_fnid, @object
	.size	spursJoinTaskset_fnid, 4
spursJoinTaskset_fnid:
	.long	-1619874349
	.globl spursGetTasksetInfo_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursGetTasksetInfo_stub, @object
	.size	spursGetTasksetInfo_stub, 4
spursGetTasksetInfo_stub:
	.long	__spursGetTasksetInfo
	.globl spursGetTasksetInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursGetTasksetInfo_fnid, @object
	.size	spursGetTasksetInfo_fnid, 4
spursGetTasksetInfo_fnid:
	.long	-1614064005
	.globl spursJobChainAttributeSetName_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursJobChainAttributeSetName_stub, @object
	.size	spursJobChainAttributeSetName_stub, 4
spursJobChainAttributeSetName_stub:
	.long	__spursJobChainAttributeSetName
	.globl spursJobChainAttributeSetName_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursJobChainAttributeSetName_fnid, @object
	.size	spursJobChainAttributeSetName_fnid, 4
spursJobChainAttributeSetName_fnid:
	.long	-1611697982
	.globl spursTaskAttributeSetExitCodeContainer_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTaskAttributeSetExitCodeContainer_stub, @object
	.size	spursTaskAttributeSetExitCodeContainer_stub, 4
spursTaskAttributeSetExitCodeContainer_stub:
	.long	__spursTaskAttributeSetExitCodeContainer
	.globl spursTaskAttributeSetExitCodeContainer_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTaskAttributeSetExitCodeContainer_fnid, @object
	.size	spursTaskAttributeSetExitCodeContainer_fnid, 4
spursTaskAttributeSetExitCodeContainer_fnid:
	.long	-1591631324
	.globl spursWorkloadFlagReceiver_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursWorkloadFlagReceiver_stub, @object
	.size	spursWorkloadFlagReceiver_stub, 4
spursWorkloadFlagReceiver_stub:
	.long	__spursWorkloadFlagReceiver
	.globl spursWorkloadFlagReceiver_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursWorkloadFlagReceiver_fnid, @object
	.size	spursWorkloadFlagReceiver_fnid, 4
spursWorkloadFlagReceiver_fnid:
	.long	-1489243010
	.globl spursShutdownTaskset_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursShutdownTaskset_stub, @object
	.size	spursShutdownTaskset_stub, 4
spursShutdownTaskset_stub:
	.long	__spursShutdownTaskset
	.globl spursShutdownTaskset_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursShutdownTaskset_fnid, @object
	.size	spursShutdownTaskset_fnid, 4
spursShutdownTaskset_fnid:
	.long	-1484134863
	.globl spursJoinTask2_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursJoinTask2_stub, @object
	.size	spursJoinTask2_stub, 4
spursJoinTask2_stub:
	.long	__spursJoinTask2
	.globl spursJoinTask2_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursJoinTask2_fnid, @object
	.size	spursJoinTask2_fnid, 4
spursJoinTask2_fnid:
	.long	-1482078062
	.globl spursJoinJobChain_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursJoinJobChain_stub, @object
	.size	spursJoinJobChain_stub, 4
spursJoinJobChain_stub:
	.long	__spursJoinJobChain
	.globl spursJoinJobChain_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursJoinJobChain_fnid, @object
	.size	spursJoinJobChain_fnid, 4
spursJoinJobChain_fnid:
	.long	-1480562978
	.globl spursGetWorkloadData_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursGetWorkloadData_stub, @object
	.size	spursGetWorkloadData_stub, 4
spursGetWorkloadData_stub:
	.long	__spursGetWorkloadData
	.globl spursGetWorkloadData_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursGetWorkloadData_fnid, @object
	.size	spursGetWorkloadData_fnid, 4
spursGetWorkloadData_fnid:
	.long	-1476794602
	.globl spursLFQueueGetTasksetAddress_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursLFQueueGetTasksetAddress_stub, @object
	.size	spursLFQueueGetTasksetAddress_stub, 4
spursLFQueueGetTasksetAddress_stub:
	.long	__spursLFQueueGetTasksetAddress
	.globl spursLFQueueGetTasksetAddress_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursLFQueueGetTasksetAddress_fnid, @object
	.size	spursLFQueueGetTasksetAddress_fnid, 4
spursLFQueueGetTasksetAddress_fnid:
	.long	-1215116774
	.globl spursTaskAttributeInitialize_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTaskAttributeInitialize_stub, @object
	.size	spursTaskAttributeInitialize_stub, 4
spursTaskAttributeInitialize_stub:
	.long	__spursTaskAttributeInitialize
	.globl spursTaskAttributeInitialize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTaskAttributeInitialize_fnid, @object
	.size	spursTaskAttributeInitialize_fnid, 4
spursTaskAttributeInitialize_fnid:
	.long	-1203286273
	.globl spursAttachLv2EventQueue_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursAttachLv2EventQueue_stub, @object
	.size	spursAttachLv2EventQueue_stub, 4
spursAttachLv2EventQueue_stub:
	.long	__spursAttachLv2EventQueue
	.globl spursAttachLv2EventQueue_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursAttachLv2EventQueue_fnid, @object
	.size	spursAttachLv2EventQueue_fnid, 4
spursAttachLv2EventQueue_fnid:
	.long	-1178836473
	.globl spursJobChainAttributeSetHaltOnError_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursJobChainAttributeSetHaltOnError_stub, @object
	.size	spursJobChainAttributeSetHaltOnError_stub, 4
spursJobChainAttributeSetHaltOnError_stub:
	.long	__spursJobChainAttributeSetHaltOnError
	.globl spursJobChainAttributeSetHaltOnError_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursJobChainAttributeSetHaltOnError_fnid, @object
	.size	spursJobChainAttributeSetHaltOnError_fnid, 4
spursJobChainAttributeSetHaltOnError_fnid:
	.long	-1150757010
	.globl spursCreateTask_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursCreateTask_stub, @object
	.size	spursCreateTask_stub, 4
spursCreateTask_stub:
	.long	__spursCreateTask
	.globl spursCreateTask_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursCreateTask_fnid, @object
	.size	spursCreateTask_fnid, 4
spursCreateTask_fnid:
	.long	-1095368532
	.globl spursAddWorkloadWithAttribute_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursAddWorkloadWithAttribute_stub, @object
	.size	spursAddWorkloadWithAttribute_stub, 4
spursAddWorkloadWithAttribute_stub:
	.long	__spursAddWorkloadWithAttribute
	.globl spursAddWorkloadWithAttribute_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursAddWorkloadWithAttribute_fnid, @object
	.size	spursAddWorkloadWithAttribute_fnid, 4
spursAddWorkloadWithAttribute_fnid:
	.long	-1072329333
	.globl spursCreateTasksetWithAttribute_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursCreateTasksetWithAttribute_stub, @object
	.size	spursCreateTasksetWithAttribute_stub, 4
spursCreateTasksetWithAttribute_stub:
	.long	__spursCreateTasksetWithAttribute
	.globl spursCreateTasksetWithAttribute_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursCreateTasksetWithAttribute_fnid, @object
	.size	spursCreateTasksetWithAttribute_fnid, 4
spursCreateTasksetWithAttribute_fnid:
	.long	-1056362037
	.globl spursTasksetAttribute2Initialize_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTasksetAttribute2Initialize_stub, @object
	.size	spursTasksetAttribute2Initialize_stub, 4
spursTasksetAttribute2Initialize_stub:
	.long	__spursTasksetAttribute2Initialize
	.globl spursTasksetAttribute2Initialize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTasksetAttribute2Initialize_fnid, @object
	.size	spursTasksetAttribute2Initialize_fnid, 4
spursTasksetAttribute2Initialize_fnid:
	.long	-1028858045
	.globl spursGetWorkloadFlag_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursGetWorkloadFlag_stub, @object
	.size	spursGetWorkloadFlag_stub, 4
spursGetWorkloadFlag_stub:
	.long	__spursGetWorkloadFlag
	.globl spursGetWorkloadFlag_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursGetWorkloadFlag_fnid, @object
	.size	spursGetWorkloadFlag_fnid, 4
spursGetWorkloadFlag_fnid:
	.long	-949634667
	.globl spursTraceStart_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTraceStart_stub, @object
	.size	spursTraceStart_stub, 4
spursTraceStart_stub:
	.long	__spursTraceStart
	.globl spursTraceStart_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTraceStart_fnid, @object
	.size	spursTraceStart_fnid, 4
spursTraceStart_fnid:
	.long	-830128193
	.globl spursSetExceptionEventHandler_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursSetExceptionEventHandler_stub, @object
	.size	spursSetExceptionEventHandler_stub, 4
spursSetExceptionEventHandler_stub:
	.long	__spursSetExceptionEventHandler
	.globl spursSetExceptionEventHandler_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursSetExceptionEventHandler_fnid, @object
	.size	spursSetExceptionEventHandler_fnid, 4
spursSetExceptionEventHandler_fnid:
	.long	-756924503
	.globl spursJobGuardNotify_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursJobGuardNotify_stub, @object
	.size	spursJobGuardNotify_stub, 4
spursJobGuardNotify_stub:
	.long	__spursJobGuardNotify
	.globl spursJobGuardNotify_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursJobGuardNotify_fnid, @object
	.size	spursJobGuardNotify_fnid, 4
spursJobGuardNotify_fnid:
	.long	-707743146
	.globl spursGetJobPipelineInfo_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursGetJobPipelineInfo_stub, @object
	.size	spursGetJobPipelineInfo_stub, 4
spursGetJobPipelineInfo_stub:
	.long	__spursGetJobPipelineInfo
	.globl spursGetJobPipelineInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursGetJobPipelineInfo_fnid, @object
	.size	spursGetJobPipelineInfo_fnid, 4
spursGetJobPipelineInfo_fnid:
	.long	-664567592
	.globl spursTasksetAttributeEnableClearLS_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTasksetAttributeEnableClearLS_stub, @object
	.size	spursTasksetAttributeEnableClearLS_stub, 4
spursTasksetAttributeEnableClearLS_stub:
	.long	__spursTasksetAttributeEnableClearLS
	.globl spursTasksetAttributeEnableClearLS_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTasksetAttributeEnableClearLS_fnid, @object
	.size	spursTasksetAttributeEnableClearLS_fnid, 4
spursTasksetAttributeEnableClearLS_fnid:
	.long	-593414765
	.globl spursTraceStop_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTraceStop_stub, @object
	.size	spursTraceStop_stub, 4
spursTraceStop_stub:
	.long	__spursTraceStop
	.globl spursTraceStop_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTraceStop_fnid, @object
	.size	spursTraceStop_fnid, 4
spursTraceStop_fnid:
	.long	-574088358
	.globl spursSendSignal_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursSendSignal_stub, @object
	.size	spursSendSignal_stub, 4
spursSendSignal_stub:
	.long	__spursSendSignal
	.globl spursSendSignal_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursSendSignal_fnid, @object
	.size	spursSendSignal_fnid, 4
spursSendSignal_fnid:
	.long	-525935644
	.globl spursCreateTask2_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursCreateTask2_stub, @object
	.size	spursCreateTask2_stub, 4
spursCreateTask2_stub:
	.long	__spursCreateTask2
	.globl spursCreateTask2_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursCreateTask2_fnid, @object
	.size	spursCreateTask2_fnid, 4
spursCreateTask2_fnid:
	.long	-515070419
	.globl spursCreateTask2WithBinInfo_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursCreateTask2WithBinInfo_stub, @object
	.size	spursCreateTask2WithBinInfo_stub, 4
spursCreateTask2WithBinInfo_stub:
	.long	__spursCreateTask2WithBinInfo
	.globl spursCreateTask2WithBinInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursCreateTask2WithBinInfo_fnid, @object
	.size	spursCreateTask2WithBinInfo_fnid, 4
spursCreateTask2WithBinInfo_fnid:
	.long	-460043748
	.globl spursQueueAttachLv2EventQueue_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursQueueAttachLv2EventQueue_stub, @object
	.size	spursQueueAttachLv2EventQueue_stub, 4
spursQueueAttachLv2EventQueue_stub:
	.long	__spursQueueAttachLv2EventQueue
	.globl spursQueueAttachLv2EventQueue_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursQueueAttachLv2EventQueue_fnid, @object
	.size	spursQueueAttachLv2EventQueue_fnid, 4
spursQueueAttachLv2EventQueue_fnid:
	.long	-448513049
	.globl spursTaskExitCodeTryGet_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursTaskExitCodeTryGet_stub, @object
	.size	spursTaskExitCodeTryGet_stub, 4
spursTaskExitCodeTryGet_stub:
	.long	__spursTaskExitCodeTryGet
	.globl spursTaskExitCodeTryGet_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursTaskExitCodeTryGet_fnid, @object
	.size	spursTaskExitCodeTryGet_fnid, 4
spursTaskExitCodeTryGet_fnid:
	.long	-417878925
	.globl spursJobSetMaxGrab_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursJobSetMaxGrab_stub, @object
	.size	spursJobSetMaxGrab_stub, 4
spursJobSetMaxGrab_stub:
	.long	__spursJobSetMaxGrab
	.globl spursJobSetMaxGrab_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursJobSetMaxGrab_fnid, @object
	.size	spursJobSetMaxGrab_fnid, 4
spursJobSetMaxGrab_fnid:
	.long	-407837030
	.globl spursGetTasksetId_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursGetTasksetId_stub, @object
	.size	spursGetTasksetId_stub, 4
spursGetTasksetId_stub:
	.long	__spursGetTasksetId
	.globl spursGetTasksetId_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursGetTasksetId_fnid, @object
	.size	spursGetTasksetId_fnid, 4
spursGetTasksetId_fnid:
	.long	-404912159
	.globl spursQueueGetDirection_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursQueueGetDirection_stub, @object
	.size	spursQueueGetDirection_stub, 4
spursQueueGetDirection_stub:
	.long	__spursQueueGetDirection
	.globl spursQueueGetDirection_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursQueueGetDirection_fnid, @object
	.size	spursQueueGetDirection_fnid, 4
spursQueueGetDirection_fnid:
	.long	-328711124
	.globl spursWorkloadAttributeInitialize_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursWorkloadAttributeInitialize_stub, @object
	.size	spursWorkloadAttributeInitialize_stub, 4
spursWorkloadAttributeInitialize_stub:
	.long	__spursWorkloadAttributeInitialize
	.globl spursWorkloadAttributeInitialize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursWorkloadAttributeInitialize_fnid, @object
	.size	spursWorkloadAttributeInitialize_fnid, 4
spursWorkloadAttributeInitialize_fnid:
	.long	-269801863
	.globl spursReadyCountCompareAndSwap_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursReadyCountCompareAndSwap_stub, @object
	.size	spursReadyCountCompareAndSwap_stub, 4
spursReadyCountCompareAndSwap_stub:
	.long	__spursReadyCountCompareAndSwap
	.globl spursReadyCountCompareAndSwap_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursReadyCountCompareAndSwap_fnid, @object
	.size	spursReadyCountCompareAndSwap_fnid, 4
spursReadyCountCompareAndSwap_fnid:
	.long	-237808339
	.globl spursRunJobChain_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursRunJobChain_stub, @object
	.size	spursRunJobChain_stub, 4
spursRunJobChain_stub:
	.long	__spursRunJobChain
	.globl spursRunJobChain_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursRunJobChain_fnid, @object
	.size	spursRunJobChain_fnid, 4
spursRunJobChain_fnid:
	.long	-216583749
	.globl spursEventFlagSet_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursEventFlagSet_stub, @object
	.size	spursEventFlagSet_stub, 4
spursEventFlagSet_stub:
	.long	__spursEventFlagSet
	.globl spursEventFlagSet_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursEventFlagSet_fnid, @object
	.size	spursEventFlagSet_fnid, 4
spursEventFlagSet_fnid:
	.long	-179275991
	.globl spursReadyCountStore_stub
	.section	.data.sceFStub.cellSpurs
	.align 2
	.type	spursReadyCountStore_stub, @object
	.size	spursReadyCountStore_stub, 4
spursReadyCountStore_stub:
	.long	__spursReadyCountStore
	.globl spursReadyCountStore_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	spursReadyCountStore_fnid, @object
	.size	spursReadyCountStore_fnid, 4
spursReadyCountStore_fnid:
	.long	-129793651
	.ident	"GCC: (GNU) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
