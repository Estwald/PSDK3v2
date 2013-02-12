#ifndef __EXPORTS_H__
#define __EXPORTS_H__


EXPORT(sslInit, 0xfb02c9d2);
EXPORT(sslEnd, 0x1650aea4);
EXPORT(sslCertificateLoader, 0x571afaca);
EXPORT(sslCertGetSerialNumber, 0x7b689ebc);
EXPORT(sslCertGetPublicKey, 0xf8206492);
EXPORT(sslCertGetRsaPublicKeyExponent, 0x033c4905);
EXPORT(sslCertGetRsaPublicKeyModulus, 0x8e505175);

EXPORT(sslCertGetNotAfter, 0x218b64da);
EXPORT(sslCertGetNotBefore, 0x31d9ba8d);
EXPORT(sslCertGetSubjectName, 0x32c61bdf);
EXPORT(sslCertGetIssuerName, 0xae6eb491);
EXPORT(sslCertGetNameEntryCount, 0x766d3ca1);
EXPORT(sslCertGetNameEntryInfo, 0x006c4900);
EXPORT(sslCertGetMd5Fingerprint, 0x5e9253ca);


#endif

