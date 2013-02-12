	.file	"libexport.c"
	.section	".got","aw"
	.section	".text"
	.section	.data.sceFStub.cellJpgDec,"aw",@progbits
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
	.size	name, 11
name:
	.string	"cellJpgDec"
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
	.4byte	cellJpgDec
	.4byte	scefstub
	.4byte	0
	.4byte	0
	.4byte	0
	.4byte	0
	.globl jpgDecCreate_stub
	.section	.data.sceFStub.cellJpgDec
	.align 2
	.type	jpgDecCreate_stub, @object
	.size	jpgDecCreate_stub, 4
jpgDecCreate_stub:
	.long	__jpgDecCreate
	.globl jpgDecCreate_fnid
	.section	.rodata.sceFNID,"a",@progbits
	.align 2
	.type	jpgDecCreate_fnid, @object
	.size	jpgDecCreate_fnid, 4
jpgDecCreate_fnid:
	.long	-1483239591
	.globl jpgDecDestroy_stub
	.section	.data.sceFStub.cellJpgDec
	.align 2
	.type	jpgDecDestroy_stub, @object
	.size	jpgDecDestroy_stub, 4
jpgDecDestroy_stub:
	.long	__jpgDecDestroy
	.globl jpgDecDestroy_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	jpgDecDestroy_fnid, @object
	.size	jpgDecDestroy_fnid, 4
jpgDecDestroy_fnid:
	.long	-655715848
	.globl jpgDecOpen_stub
	.section	.data.sceFStub.cellJpgDec
	.align 2
	.type	jpgDecOpen_stub, @object
	.size	jpgDecOpen_stub, 4
jpgDecOpen_stub:
	.long	__jpgDecOpen
	.globl jpgDecOpen_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	jpgDecOpen_fnid, @object
	.size	jpgDecOpen_fnid, 4
jpgDecOpen_fnid:
	.long	-1754487358
	.globl jpgDecClose_stub
	.section	.data.sceFStub.cellJpgDec
	.align 2
	.type	jpgDecClose_stub, @object
	.size	jpgDecClose_stub, 4
jpgDecClose_stub:
	.long	__jpgDecClose
	.globl jpgDecClose_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	jpgDecClose_fnid, @object
	.size	jpgDecClose_fnid, 4
jpgDecClose_fnid:
	.long	-1825005446
	.globl jpgDecReadHeader_stub
	.section	.data.sceFStub.cellJpgDec
	.align 2
	.type	jpgDecReadHeader_stub, @object
	.size	jpgDecReadHeader_stub, 4
jpgDecReadHeader_stub:
	.long	__jpgDecReadHeader
	.globl jpgDecReadHeader_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	jpgDecReadHeader_fnid, @object
	.size	jpgDecReadHeader_fnid, 4
jpgDecReadHeader_fnid:
	.long	1839119567
	.globl jpgDecDecodeData_stub
	.section	.data.sceFStub.cellJpgDec
	.align 2
	.type	jpgDecDecodeData_stub, @object
	.size	jpgDecDecodeData_stub, 4
jpgDecDecodeData_stub:
	.long	__jpgDecDecodeData
	.globl jpgDecDecodeData_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	jpgDecDecodeData_fnid, @object
	.size	jpgDecDecodeData_fnid, 4
jpgDecDecodeData_fnid:
	.long	-1349799918
	.globl jpgDecSetParameter_stub
	.section	.data.sceFStub.cellJpgDec
	.align 2
	.type	jpgDecSetParameter_stub, @object
	.size	jpgDecSetParameter_stub, 4
jpgDecSetParameter_stub:
	.long	__jpgDecSetParameter
	.globl jpgDecSetParameter_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	jpgDecSetParameter_fnid, @object
	.size	jpgDecSetParameter_fnid, 4
jpgDecSetParameter_fnid:
	.long	-527484656
	.ident	"GCC: (GNU) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
