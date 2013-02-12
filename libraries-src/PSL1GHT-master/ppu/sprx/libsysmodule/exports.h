#ifndef __EXPORTS_H__
#define __EXPORTS_H__


EXPORT(sysModuleInitialize, 0x63ff6ff9);
EXPORT(sysModuleFinalize, 0x96c07adf);

EXPORT(sysModuleLoad, 0x32267A31);
EXPORT(sysModuleUnload, 0x112A5EE9);
EXPORT(sysModuleIsLoaded, 0x5a59e258);

EXPORT(sysModuleGetImagesize, 0x1ef115ef);
EXPORT(sysModuleFetchImage, 0x3c92be09);
EXPORT(sysModuleSetMemcontainer, 0xa193143c);


#endif
