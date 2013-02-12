#ifndef __EXPORTS_H__
#define __EXPORTS_H__

EXPORT(sys_config_start, 0x068fcbc6);
EXPORT(sys_config_stop, 0x6d367953);
EXPORT(sys_config_add_service_listener, 0x6ae10596);
EXPORT(sys_config_remove_service_listener, 0xf5d9d571);
EXPORT(sys_config_register_service, 0x78f058a2);
EXPORT(sys_config_unregister_service, 0x5f81900c);

/* Pad */
EXPORT(ioPadInit, 0x1cf98800);
EXPORT(ioPadEnd, 0x4d9b75d5);
EXPORT(ioPadClearBuf, 0x0d5f2c14);
EXPORT(ioPadInfoPressMode, 0x0e2dfaad);
EXPORT(ioPadLddRegisterController, 0x20a97ba2);
EXPORT(ioPadGetInfo, 0x3aaad464);
EXPORT(ioPadGetRawData, 0x3f797dff);
EXPORT(ioPadGetDataExtra, 0x6bc09c61);
EXPORT(ioPadInfoSensorMode, 0x78200559);
EXPORT(ioPadGetData, 0x8b72cda1);
EXPORT(ioPadLddGetPortNo, 0x8b8231e5);
EXPORT(ioPadLddDataInsert, 0xbafd6409);
EXPORT(ioPadSetSensorMode, 0xbe5be3ba);
EXPORT(ioPadGetCapabilityInfo, 0xdbf4c59c);
EXPORT(ioPadLddUnregisterController, 0xe442faa8);
EXPORT(ioPadSetActDirect, 0xf65544ee);
EXPORT(ioPadSetPressMode, 0xf83f8182);

EXPORT(ioPadPeriphGetInfo, 0x4cc9b68d);
EXPORT(ioPadSetPortSetting, 0x578e3c98);
EXPORT(ioPadPeriphGetData, 0x8a00f264);
EXPORT(ioPadGetInfo2, 0xa703a51d);

/* Mouse */
EXPORT(ioMouseInit, 0xc9030138);
EXPORT(ioMouseEnd, 0xe10183ce);
EXPORT(ioMouseClearBuf, 0x3ef66b95);
EXPORT(ioMouseGetInfo, 0x5baf30fb);
EXPORT(ioMouseGetTabletDataList, 0x21a62e9b);
EXPORT(ioMouseSetTabletMode, 0x2d16da4f);
EXPORT(ioMouseGetData, 0x3138e632);
EXPORT(ioMouseInfoTabletMode, 0x4d0b3b1f);
EXPORT(ioMouseGetRawData, 0xa328cc35);
EXPORT(ioMouseGetDataList, 0x6bd131f0);

/* Keyboard */
EXPORT(ioKbInit, 0x433f6ec0);
EXPORT(ioKbEnd, 0xbfce3285);
EXPORT(ioKbRead, 0xff0a21b7);
EXPORT(ioKbSetReadMode, 0xdeefdfa7);
EXPORT(ioKbSetCodeType, 0xa5f85e4d);
EXPORT(ioKbCnvRawCode, 0x4ab1fa77);
EXPORT(ioKbSetLEDStatus, 0x3f72c56e);
EXPORT(ioKbGetInfo, 0x2f1774d5);
EXPORT(ioKbGetConfiguration, 0x1f71ecbe);
EXPORT(ioKbClearBuf, 0x2073b7f6);

#endif
