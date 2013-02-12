#ifndef __EXPORTS_H__
#define __EXPORTS_H__

/* video support */
EXPORT(videoGetResolution, 0xe558748d);
EXPORT(videoConfigure, 0x0bae8772);
EXPORT(videoGetState, 0x887572d5);
EXPORT(videoGetDeviceInfo, 0x1e930eef);
EXPORT(videoGetConfiguration, 0x15b0b0cd);
EXPORT(videoGetResolutionAvailability, 0xa322db75);
EXPORT(videoDebugSetMonitorType, 0xcfdf24bb);
EXPORT(videoRegisterCallbackEx, 0x8e8bc444);
EXPORT(videoUnregisterCallback, 0x7871bed4);
EXPORT(videoGetNumberOfDevice, 0x75bbb672);
EXPORT(videoGetConvertCursorColorInfo, 0x55e425c3);

/* message dialog support */
EXPORT(msgDialogClose, 0x20543730);
EXPORT(msgDialogOpenErrorCodeEx, 0x3e22cb4b);
EXPORT(msgDialogOpenEx, 0xf81eca25);
EXPORT(msgDialogProgressBarInc, 0x94862702);
EXPORT(msgDialogAbort, 0x62b0f803);
EXPORT(msgDialogOpen2Ex, 0x7603d3db);
EXPORT(msgDialogProgressBarReset, 0x7bc2c8a8);
EXPORT(msgDialogProgressBarSetMsg, 0x9d6af72a);

/* on-screen-keyboard support */
EXPORT(oskGetInputText, 0x1d99c3ee);
EXPORT(oskSetInitialInputDevice, 0xf3b4b43e);
EXPORT(oskGetSize, 0x35beade0);
EXPORT(oskUnloadAsync, 0x3d1e1931);
EXPORT(oskDisableDimmer, 0x41f20828);
EXPORT(oskSetKeyLayoutOption, 0xb53c54fa);
EXPORT(oskAbort, 0xb6d84526);
EXPORT(oskSetDeviceMask, 0xd3790a86);
EXPORT(oskSetSeparateWindowOption, 0x53e39df3);
EXPORT(oskAddSupportLanguage, 0x7f21c918);
EXPORT(oskLoadAsync, 0x7fcfc915);
EXPORT(oskSetInitialKeyLayout, 0xc427890c);
EXPORT(oskSetLayoutMode, 0xf0ec3ccc);

/* system utility support */
EXPORT(sysUtilRegisterCallbackEx, 0x9d98afa0);
EXPORT(sysUtilCheckCallback, 0x189a74da);
EXPORT(sysUtilUnregisterCallback, 0x02ff3c1b);

/* Save utility support */
EXPORT(sysSaveListLoad2Ex, 0x1dfbfdd6);
EXPORT(sysSaveListSave2Ex, 0x2de0d663);
EXPORT(sysSaveListAutoLoadEx, 0x21425307);
EXPORT(sysSaveListAutoSaveEx, 0x4dd03a4e);
EXPORT(sysSaveFixedLoad2Ex, 0x2a8eada2);
EXPORT(sysSaveFixedSave2Ex, 0x2aae9ef5);
EXPORT(sysSaveAutoLoad2Ex, 0xfbd5c856);
EXPORT(sysSaveAutoSave2Ex, 0x8b7ed64b);
EXPORT(sysSaveDelete2, 0xedadd797);

/* Game Content utility support */
EXPORT(sysGameDataCheck, 0xdb9819f3);
EXPORT(sysGameBootCheck, 0xf52639ea);
EXPORT(sysGamePatchCheck, 0xce4374f6);
EXPORT(sysGameCreateGameData, 0x42a2e133);
EXPORT(sysGameGetParamInt, 0xb7a45caf);
EXPORT(sysGameGetParamString, 0x3a5d726a);
EXPORT(sysGameGetSizeKB, 0xef9d42d5);
EXPORT(sysGameSetParamString, 0xdaa5cd20);
EXPORT(sysGameGetDiscContentInfoUpdatePath, 0x2a8e6b92);
EXPORT(sysGameContentPermit, 0x70acec67);
EXPORT(sysGameContentErrorDialog, 0xb0a1f8c6);
EXPORT(sysGameThemeInstall, 0xd24e3928);
EXPORT(sysGameThemeInstallFromBufferEx, 0x87406734);
EXPORT(sysGameGetLocalWebContentPath, 0xa80bf223);
EXPORT(sysGameDeleteGameData, 0xb367c6e3);
EXPORT(sysGameRegisterDiscChangeCallbackEx, 0xf8115d69);
EXPORT(sysGameUnregisterDiscChangeCallback, 0x21fc0c71);

/* Disc utility support */
EXPORT(sysDiscRegisterDiscChangeCallbackEx, 0xdfdd302e);
EXPORT(sysDiscUnregisterDiscChangeCallback, 0xedc34e1a);

/* trophy utility support */
EXPORT(sysTrophyInit, 0x39567781);
EXPORT(sysTrophyAbortHandle, 0x48bd97c7);
EXPORT(sysTrophyCreateContext, 0xe3bf9a28);
EXPORT(sysTrophyCreateHandle, 0x1c25470d);
EXPORT(sysTrophyDestroyContext, 0x3741ecc7);
EXPORT(sysTrophyDestroyHandle, 0x623cd2dc);
EXPORT(sysTrophyGetGameIcon, 0xff299e03);
EXPORT(sysTrophyGetGameInfo, 0x49d18217);
EXPORT(sysTrophyGetGameProgress, 0x079f0e87);
EXPORT(sysTrophyGetRequiredDiskSpace, 0x370136fe);
EXPORT(sysTrophyGetTrophyIcon, 0xbaedf689);
EXPORT(sysTrophyGetTrophyInfo, 0xfce6d30a);
EXPORT(sysTrophyGetTrophyUnlockState, 0xb3ac3478);
EXPORT(sysTrophyRegisterContextEx, 0x1197b52c);
EXPORT(sysTrophySetSoundLevel, 0x27deda93);
EXPORT(sysTrophyTerm, 0xa7fabf4d);
EXPORT(sysTrophyUnlockTrophy, 0x8ceedd21);

#endif
