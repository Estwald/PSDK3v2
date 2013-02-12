#ifndef __EXPORTS_H__
#define __EXPORTS_H__

EXPORT(audioInit, 0x0b168f92);
EXPORT(audioPortClose, 0x4129fe2d);
EXPORT(audioPortStop, 0x5b1e2c73);
EXPORT(audioGetPortConfig, 0x74a66af0);
EXPORT(audioPortStart, 0x89be28f2);
EXPORT(audioQuit, 0xca5ac370);
EXPORT(audioPortOpen, 0xcd7bc431);
EXPORT(audioSetPortLevel, 0x56dfe179);
EXPORT(audioCreateNotifyEventQueue, 0x04af134e);
EXPORT(audioMiscSetAccessoryVolume, 0x31211f6b);
EXPORT(audioSetNotifyEventQueue, 0x377e0cd9);
EXPORT(audioGetPortTimestamp, 0x4109d08c);
EXPORT(audioAdd2chData, 0x9e4b1db8);
EXPORT(audioAddData, 0xdab029aa);
EXPORT(audioGetPortBlockTag, 0xe4046afe);
EXPORT(audioRemoveNotifyEventQueue, 0xff3626fd);

#endif
