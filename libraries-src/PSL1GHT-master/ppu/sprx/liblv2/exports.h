#ifndef __EXPORTS_H__
#define __EXPORTS_H__


/* system */
EXPORT(sysGetSystemTime, 0x8461e528);
EXPORT(sysGetSystemSwVersion, 0x620e35a7); /* sysPrxForUser */
EXPORT(sysGetTemperature, 0x3172759d); /* sysPrxForUser */
EXPORT(sysGetRandomNumber, 0x71a8472a); /* sysPrxForUser */
EXPORT(sysGetRtcStatus, 0x9f950780); /* sysPrxForUser */

/* board storage */
EXPORT(sysBoardStorageRead, 0xe76964f5); /* sysPrxForUser */
EXPORT(sysBoardStorageWrite, 0x8bb03ab8); /* sysPrxForUser */

/* processes */
EXPORT(sysProcessIsStack, 0x4f7172c9); /* sysPrxForUser */
EXPORT(sysProcessExit, 0xe6f2c1e7);
EXPORT(sysProcessExitspawn, 0xfc52a7a9); /* sysPrxForUser */
EXPORT(sysProcessExitSpawn2Ex, 0x67f9fedb);
EXPORT(sysProcessExitSpawnWithLevel, 0xa2c7ba64); /* sysPrxForUser */
EXPORT(sysProcessAtExitSpawn, 0x2c847572); /* sysPrxForUser */
EXPORT(sysProcess_At_ExitSpawn, 0x96328741); /* sysPrxForUser */

/* prx handling */
EXPORT(sysPrxRegisterLibrary, 0x42b23552); /* sysPrxForUser */
EXPORT(sysPrxUnregisterLibrary, 0xd0ea47a7); /* sysPrxForUser */
EXPORT(sysPrxStartModule, 0x9f18429d); /* sysPrxForUser */
EXPORT(sysPrxStopModule, 0x80fb0c19); /* sysPrxForUser */
EXPORT(sysPrxLoadModule, 0x26090058); /* sysPrxForUser */
EXPORT(sysPrxLoadModuleByFd, 0xef68c17c); /* sysPrxForUser */
EXPORT(sysPrxLoadModuleList, 0xb27c8ae7); /* sysPrxForUser */
EXPORT(sysPrxLoadModuleListOnMemcontainer, 0xe7ef3a80); /* sysPrxForUser */
EXPORT(sysPrxLoadModuleOnMemcontainer, 0xaa6d9bff); /* sysPrxForUser */
EXPORT(sysPrxLoadModuleOnMemcontainerByFd, 0xa330ad84); /* sysPrxForUser */
EXPORT(sysPrxGetModuleInfo, 0x84bb6774); /* sysPrxForUser */
EXPORT(sysPrxGetModuleList, 0xa5d06bf0); /* sysPrxForUser */
EXPORT(sysPrxGetModuleId, 0x74311398); /* sysPrxForUser */
EXPORT(sysPrxGetModuleIdByAddress, 0x0341bb97); /* sysPrxForUser */
EXPORT(sysPrxGetModuleIdByName, 0xe0998dbf); /* sysPrxForUser */
EXPORT(sysPrxUnloadModule, 0xf0aece0d); /* sysPrxForUser */
EXPORT(sysPrxExitSpawnWithLevel, 0xa2c7ba64); /* sysPrxForUser */

/* thread handling */
EXPORT(sysThreadCreateEx, 0x24a1ea07);
EXPORT(sysThreadExit, 0xaff080a4);
EXPORT(sysThreadGetId, 0x350d454e);
EXPORT(sysThreadOnce, 0xa3e3be68);
EXPORT(sysThreadInitialzeTLS, 0x744680a2);
EXPORT(sysThreadRegisterAtexit, 0x3dd4a957); /* sysPrxForUser */
EXPORT(sysThreadUnregisterAtexit, 0xac6fc404); /* sysPrxForUser */

/* thread interupt handling */
EXPORT(sysInterruptThreadDisestablish, 0x4a071d98);

/* mutex handling */
EXPORT(sysLwMutexCreate, 0x2f85c0ef);
EXPORT(sysLwMutexDestroy, 0xc3476d0c);
EXPORT(sysLwMutexLock, 0x1573dc3f);
EXPORT(sysLwMutexTryLock, 0xaeb78725);
EXPORT(sysLwMutexUnlock, 0x1bc200f4);

/* cond variable handling */
EXPORT(sysLwCondCreate, 0xda0eb71a);
EXPORT(sysLwCondWait, 0x2a6d9d51);
EXPORT(sysLwCondSignal, 0xef87a695);
EXPORT(sysLwCondSignalTo, 0x52aadadf);
EXPORT(sysLwCondSignalAll, 0xe9a1bd84);
EXPORT(sysLwCondDestroy, 0x1c9a942c);

/* spinlock handling */
EXPORT(sysSpinlockInitialize, 0x8c2bb498);
EXPORT(sysSpinlockLock, 0xa285139d);
EXPORT(sysSpinlockTryLock, 0x722a0254);
EXPORT(sysSpinlockUnlock, 0x5267cb35);

/* watchdog */
EXPORT(sysWatchdogClear, 0xacad8fb6); /* sysPrxForUser */
EXPORT(sysWatchdogStart, 0x9e0623b5); /* sysPrxForUser */
EXPORT(sysWatchdogStop, 0x6e05231d); /* sysPrxForUser */

/* memory handling */
EXPORT(sysMalloc, 0xbdb18f83); /* sysPrxForUser */
EXPORT(sysMemalign, 0x318f17e1); /* sysPrxForUser */
EXPORT(sysMemchr, 0x3bd53c7b); /* sysPrxForUser */
EXPORT(sysMemcmp, 0xfb5db080); /* sysPrxForUser */
EXPORT(sysMemcpy, 0x6bf66ea7); /* sysPrxForUser */
EXPORT(sysMemmove, 0x27427742); /* sysPrxForUser */
EXPORT(sysMemset, 0x68b9b011); /* sysPrxForUser */
EXPORT(sysFree, 0xf7f7fb20); /* sysPrxForUser */

/* heap handling */
EXPORT(sysHeapAllocHeapMemory, 0xb9bf1078); /* sysPrxForUser */
EXPORT(sysHeapCreateHeap, 0xb2fcf2c8); /* sysPrxForUser */
EXPORT(sysHeapDeleteHeap, 0xaede4b03); /* sysPrxForUser */
EXPORT(sysHeapFree, 0x8a561d92); /* sysPrxForUser */
EXPORT(sysHeapGetMallInfo, 0xd1ad4570); /* sysPrxForUser */
EXPORT(sysHeapGetTotalFreeSize, 0xb6369393); /* sysPrxForUser */
EXPORT(sysHeapMalloc, 0x35168520); /* sysPrxForUser */
EXPORT(sysHeapMemalign, 0x44265c08); /* sysPrxForUser */
EXPORT(sysHeapStats, 0x8985b5b6); /* sysPrxForUser */

/* quicksort */
EXPORT(sysQsort, 0xc4fd6121); /* sysPrxForUser */

/* memory pool */
EXPORT(sysMempoolCreate, 0xca9a60bf); /* sysPrxForUser */
EXPORT(sysMempoolDestroy, 0x9d3c0f81); /* sysPrxForUser */
EXPORT(sysMempoolGetCount, 0x25596f51); /* sysPrxForUser */
EXPORT(sysMempoolAllocateBlock, 0xa146a143); /* sysPrxForUser */
EXPORT(sysMempoolTryAllocateBlock, 0x05c65656); /* sysPrxForUser */
EXPORT(sysMempoolFreeBlock, 0x608212fc); /* sysPrxForUser */

/* memory management */
EXPORT(sysMMapperFreeMemory, 0x409ad939);
EXPORT(sysMMapperMapMemory, 0xdc578057);
EXPORT(sysMMapperUnmapMemory, 0x4643ba6e);
EXPORT(sysMMapperAllocateMemory, 0xb257540b);
EXPORT(sysMMapperAllocateMemoryFromContainer, 0x70258515);

/* strings */
EXPORT(sysStrlen, 0x2d36462b); /* sysPrxForUser */
EXPORT(sysStrcpy, 0x99c88692); /* sysPrxForUser */
EXPORT(sysStrncpy, 0xd3039d4d); /* sysPrxForUser */
EXPORT(sysStrcat, 0x052d29a6); /* sysPrxForUser */
EXPORT(sysStrncat, 0x996f7cf8); /* sysPrxForUser */
EXPORT(sysStrchr, 0x7498887b); /* sysPrxForUser */
EXPORT(sysStrrchr, 0x191f0c4a); /* sysPrxForUser */
EXPORT(sysStrcmp, 0x459b4393); /* sysPrxForUser */
EXPORT(sysStrncmp, 0x04e83d2c); /* sysPrxForUser */
EXPORT(sysStrncasecmp, 0x1ca525a2); /* sysPrxForUser */
EXPORT(sysToLower, 0x4b2f301a); /* sysPrxForUser */
EXPORT(sysToUpper, 0xeef75113); /* sysPrxForUser */

/* spu handling */
EXPORT(sysSpuElfGetSegments, 0xdb6b3250);
EXPORT(sysSpuElfGetInformation, 0x1ed454ce);
EXPORT(sysSpuRawLoad, 0x893305fa);
EXPORT(sysSpuRawImageLoad, 0xb995662e);
EXPORT(sysSpuImageClose, 0xe0da8efd);
EXPORT(sysSpuImageImport, 0xebe5f72f);
EXPORT(sysSpuPrintfAttachGroup, 0xdd0c1e09); /* sysPrxForUser */
EXPORT(sysSpuPrintfAttachThread, 0x1ae10b92); /* sysPrxForUser */
EXPORT(sysSpuPrintfDetachGroup, 0x5fdfb2fe); /* sysPrxForUser */
EXPORT(sysSpuPrintfDetach_Tread, 0xb3bbcf2a); /* sysPrxForUser */
EXPORT(sysSpuPrintfFinalize, 0xdd3b27ac); /* sysPrxForUser */
EXPORT(sysSpuPrintfInitialize, 0x45fe2fce); /* sysPrxForUser */

/* console */
EXPORT(sysConsoleGetc, 0x8a2f159b); /* sysPrxForUser */
EXPORT(sysConsolePutc, 0xe66bac36); /* sysPrxForUser */
EXPORT(sysConsoleWrite, 0xf57e1d6f); /* sysPrxForUser */
EXPORT(sysPrintf, 0x9f04f7af); /* sysPrxForUser */
EXPORT(sysSprintf, 0xa1f9eafe); /* sysPrxForUser */
EXPORT(sysSnprintf, 0x06574237); /* sysPrxForUser */
EXPORT(sysVprintf, 0xfa7f693d); /* sysPrxForUser */
EXPORT(sysVsprintf, 0x791b9219); /* sysPrxForUser */
EXPORT(sysVsnprintf, 0x0618936b); /* sysPrxForUser */


#endif
