	.file	"libexport.c"
	.section	".got","aw"
	.section	".text"
	.section	.data.sceFStub.cellSsl,"aw",@progbits
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
	.size	name, 8
name:
	.string	"cellSsl"
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
	.4byte	cellSsl
	.4byte	scefstub
	.4byte	0
	.4byte	0
	.4byte	0
	.4byte	0
	.globl sslInit_stub
	.section	.data.sceFStub.cellSsl
	.align 2
	.type	sslInit_stub, @object
	.size	sslInit_stub, 4
sslInit_stub:
	.long	__sslInit
	.globl sslInit_fnid
	.section	.rodata.sceFNID,"a",@progbits
	.align 2
	.type	sslInit_fnid, @object
	.size	sslInit_fnid, 4
sslInit_fnid:
	.long	-83703342
	.globl sslEnd_stub
	.section	.data.sceFStub.cellSsl
	.align 2
	.type	sslEnd_stub, @object
	.size	sslEnd_stub, 4
sslEnd_stub:
	.long	__sslEnd
	.globl sslEnd_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sslEnd_fnid, @object
	.size	sslEnd_fnid, 4
sslEnd_fnid:
	.long	374386340
	.globl sslCertificateLoader_stub
	.section	.data.sceFStub.cellSsl
	.align 2
	.type	sslCertificateLoader_stub, @object
	.size	sslCertificateLoader_stub, 4
sslCertificateLoader_stub:
	.long	__sslCertificateLoader
	.globl sslCertificateLoader_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sslCertificateLoader_fnid, @object
	.size	sslCertificateLoader_fnid, 4
sslCertificateLoader_fnid:
	.long	1461385930
	.globl sslCertGetSerialNumber_stub
	.section	.data.sceFStub.cellSsl
	.align 2
	.type	sslCertGetSerialNumber_stub, @object
	.size	sslCertGetSerialNumber_stub, 4
sslCertGetSerialNumber_stub:
	.long	__sslCertGetSerialNumber
	.globl sslCertGetSerialNumber_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sslCertGetSerialNumber_fnid, @object
	.size	sslCertGetSerialNumber_fnid, 4
sslCertGetSerialNumber_fnid:
	.long	2070453948
	.globl sslCertGetPublicKey_stub
	.section	.data.sceFStub.cellSsl
	.align 2
	.type	sslCertGetPublicKey_stub, @object
	.size	sslCertGetPublicKey_stub, 4
sslCertGetPublicKey_stub:
	.long	__sslCertGetPublicKey
	.globl sslCertGetPublicKey_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sslCertGetPublicKey_fnid, @object
	.size	sslCertGetPublicKey_fnid, 4
sslCertGetPublicKey_fnid:
	.long	-132094830
	.globl sslCertGetRsaPublicKeyExponent_stub
	.section	.data.sceFStub.cellSsl
	.align 2
	.type	sslCertGetRsaPublicKeyExponent_stub, @object
	.size	sslCertGetRsaPublicKeyExponent_stub, 4
sslCertGetRsaPublicKeyExponent_stub:
	.long	__sslCertGetRsaPublicKeyExponent
	.globl sslCertGetRsaPublicKeyExponent_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sslCertGetRsaPublicKeyExponent_fnid, @object
	.size	sslCertGetRsaPublicKeyExponent_fnid, 4
sslCertGetRsaPublicKeyExponent_fnid:
	.long	54282501
	.globl sslCertGetRsaPublicKeyModulus_stub
	.section	.data.sceFStub.cellSsl
	.align 2
	.type	sslCertGetRsaPublicKeyModulus_stub, @object
	.size	sslCertGetRsaPublicKeyModulus_stub, 4
sslCertGetRsaPublicKeyModulus_stub:
	.long	__sslCertGetRsaPublicKeyModulus
	.globl sslCertGetRsaPublicKeyModulus_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sslCertGetRsaPublicKeyModulus_fnid, @object
	.size	sslCertGetRsaPublicKeyModulus_fnid, 4
sslCertGetRsaPublicKeyModulus_fnid:
	.long	-1907338891
	.globl sslCertGetNotAfter_stub
	.section	.data.sceFStub.cellSsl
	.align 2
	.type	sslCertGetNotAfter_stub, @object
	.size	sslCertGetNotAfter_stub, 4
sslCertGetNotAfter_stub:
	.long	__sslCertGetNotAfter
	.globl sslCertGetNotAfter_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sslCertGetNotAfter_fnid, @object
	.size	sslCertGetNotAfter_fnid, 4
sslCertGetNotAfter_fnid:
	.long	562783450
	.globl sslCertGetNotBefore_stub
	.section	.data.sceFStub.cellSsl
	.align 2
	.type	sslCertGetNotBefore_stub, @object
	.size	sslCertGetNotBefore_stub, 4
sslCertGetNotBefore_stub:
	.long	__sslCertGetNotBefore
	.globl sslCertGetNotBefore_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sslCertGetNotBefore_fnid, @object
	.size	sslCertGetNotBefore_fnid, 4
sslCertGetNotBefore_fnid:
	.long	836352653
	.globl sslCertGetSubjectName_stub
	.section	.data.sceFStub.cellSsl
	.align 2
	.type	sslCertGetSubjectName_stub, @object
	.size	sslCertGetSubjectName_stub, 4
sslCertGetSubjectName_stub:
	.long	__sslCertGetSubjectName
	.globl sslCertGetSubjectName_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sslCertGetSubjectName_fnid, @object
	.size	sslCertGetSubjectName_fnid, 4
sslCertGetSubjectName_fnid:
	.long	851844063
	.globl sslCertGetIssuerName_stub
	.section	.data.sceFStub.cellSsl
	.align 2
	.type	sslCertGetIssuerName_stub, @object
	.size	sslCertGetIssuerName_stub, 4
sslCertGetIssuerName_stub:
	.long	__sslCertGetIssuerName
	.globl sslCertGetIssuerName_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sslCertGetIssuerName_fnid, @object
	.size	sslCertGetIssuerName_fnid, 4
sslCertGetIssuerName_fnid:
	.long	-1368476527
	.globl sslCertGetNameEntryCount_stub
	.section	.data.sceFStub.cellSsl
	.align 2
	.type	sslCertGetNameEntryCount_stub, @object
	.size	sslCertGetNameEntryCount_stub, 4
sslCertGetNameEntryCount_stub:
	.long	__sslCertGetNameEntryCount
	.globl sslCertGetNameEntryCount_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sslCertGetNameEntryCount_fnid, @object
	.size	sslCertGetNameEntryCount_fnid, 4
sslCertGetNameEntryCount_fnid:
	.long	1986870433
	.globl sslCertGetNameEntryInfo_stub
	.section	.data.sceFStub.cellSsl
	.align 2
	.type	sslCertGetNameEntryInfo_stub, @object
	.size	sslCertGetNameEntryInfo_stub, 4
sslCertGetNameEntryInfo_stub:
	.long	__sslCertGetNameEntryInfo
	.globl sslCertGetNameEntryInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sslCertGetNameEntryInfo_fnid, @object
	.size	sslCertGetNameEntryInfo_fnid, 4
sslCertGetNameEntryInfo_fnid:
	.long	7096576
	.globl sslCertGetMd5Fingerprint_stub
	.section	.data.sceFStub.cellSsl
	.align 2
	.type	sslCertGetMd5Fingerprint_stub, @object
	.size	sslCertGetMd5Fingerprint_stub, 4
sslCertGetMd5Fingerprint_stub:
	.long	__sslCertGetMd5Fingerprint
	.globl sslCertGetMd5Fingerprint_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	sslCertGetMd5Fingerprint_fnid, @object
	.size	sslCertGetMd5Fingerprint_fnid, 4
sslCertGetMd5Fingerprint_fnid:
	.long	1586648010
	.ident	"GCC: (GNU) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
