#ifndef __EXPORTS_H__
#define __EXPORTS_H__

EXPORT(netCtlInit, 0xbd5a59fc);
EXPORT(netCtlTerm, 0x105ee2cb);
EXPORT(netCtlGetInfo, 0x1e585b5d);
EXPORT(netCtlGetNatInfo, 0x3a12865f);
EXPORT(netCtlGetState, 0x8b3eba69);
EXPORT(netCtlAddHandler, 0x0ce13c6b);
EXPORT(netCtlDelHandler, 0x901815c3);

EXPORT(netCtlNetStartDialogLoadAsync, 0x04459230);
EXPORT(netCtlNetStartDialogUnloadAsync, 0x0f1f13d3);
EXPORT(netCtlNetStartDialogAbortAsync, 0x71d53210);

EXPORT(netCtlGameUpdateInit, 0x99ab1a26);
EXPORT(netCtlGameUpdateTerm, 0x10dae56d);
EXPORT(netCtlGameUpdateCheckAbort, 0x3e359ab6);
EXPORT(netCtlGameUpdateCheckStartAsync, 0xd0a5d727);
EXPORT(netCtlGameUpdateCheckStartAsyncEx, 0x0791015f);
EXPORT(netCtlGameUpdateCheckStartWithoutDialogAsync, 0xa5e1fa60);
EXPORT(netCtlGameUpdateCheckStartWithoutDialogAsyncEx, 0x558700f6);
EXPORT(netCtlGameUpdateCheckFinishAsync, 0xffa3d791);
EXPORT(netCtlGameUpdateCheckFinishAsyncEx, 0xf463981c);

#endif
