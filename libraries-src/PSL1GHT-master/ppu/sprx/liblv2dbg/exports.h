#ifndef __EXPORTS_H__
#define __EXPORTS_H__

/* debugging */
EXPORT(sysDbgSetStacksizePPUExceptionHandler, 0x06a840f5);
EXPORT(sysDbgGetSPUThreadGroupIds, 0x08ef08a9);
EXPORT(sysDbgGetPPUThreadIds, 0x113b0bea);
EXPORT(sysDbgGetSPUThreadIds, 0x1860f909);
EXPORT(sysDbgRegisterPPUExceptionHandler, 0x22916f45);
EXPORT(sysDbgGetEventQueueInformation, 0x381ae33e);
EXPORT(sysDbgGetSPUThreadName, 0x3e5eed36);
EXPORT(sysDbgGetPPUThreadName, 0x4b55f456);
EXPORT(sysDbgGetMutexInformation, 0x50453aa8);
EXPORT(sysDbgGetCondInformation, 0x63bd413e);
EXPORT(sysDbgGetPPUThreadStatus, 0x6b413178);
EXPORT(sysDbgGetRWLockInformation, 0x9794bb53);
EXPORT(sysDbgGetGetSPUThreadGroupStatus, 0x9ddb9dc3);
EXPORT(sysDbgGetSemaphoreInformation, 0xa2d6cbd2);
EXPORT(sysDbgGetSPUThreadGroupName, 0xbd69e584);
EXPORT(sysDbgFinalizePPUExceptionHandler, 0xc0eb9266);
EXPORT(sysDbgReadSPUThreadContext, 0xc21ee635);
EXPORT(sysDbgInitializePPUExceptionHandler, 0xc353353a);
EXPORT(sysDbgReadPPUThreadContext, 0xc5eef17f);
EXPORT(sysDbgUnregisterPPUExceptionHandler, 0xc6d7ec13);
EXPORT(sysDbgGetLwMutexInformation, 0xcb377e36);

#endif
