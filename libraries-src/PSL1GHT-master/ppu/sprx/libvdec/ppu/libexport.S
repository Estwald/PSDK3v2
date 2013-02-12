	.file	"libexport.c"
	.section	".got","aw"
	.section	".text"
	.section	.data.sceFStub.libvdec,"aw",@progbits
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
	.string	"libvdec"
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
	.4byte	libvdec
	.4byte	scefstub
	.4byte	0
	.4byte	0
	.4byte	0
	.4byte	0
	.globl vdecClose_stub
	.section	.data.sceFStub.libvdec
	.align 2
	.type	vdecClose_stub, @object
	.size	vdecClose_stub, 4
vdecClose_stub:
	.long	__vdecClose
	.globl vdecClose_fnid
	.section	.rodata.sceFNID,"a",@progbits
	.align 2
	.type	vdecClose_fnid, @object
	.size	vdecClose_fnid, 4
vdecClose_fnid:
	.long	376016515
	.globl vdecGetPicItem_stub
	.section	.data.sceFStub.libvdec
	.align 2
	.type	vdecGetPicItem_stub, @object
	.size	vdecGetPicItem_stub, 4
vdecGetPicItem_stub:
	.long	__vdecGetPicItem
	.globl vdecGetPicItem_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	vdecGetPicItem_fnid, @object
	.size	vdecGetPicItem_fnid, 4
vdecGetPicItem_fnid:
	.long	398918329
	.globl vdecDecodeAu_stub
	.section	.data.sceFStub.libvdec
	.align 2
	.type	vdecDecodeAu_stub, @object
	.size	vdecDecodeAu_stub, 4
vdecDecodeAu_stub:
	.long	__vdecDecodeAu
	.globl vdecDecodeAu_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	vdecDecodeAu_fnid, @object
	.size	vdecDecodeAu_fnid, 4
vdecDecodeAu_fnid:
	.long	737467858
	.globl vdecGetPicture_stub
	.section	.data.sceFStub.libvdec
	.align 2
	.type	vdecGetPicture_stub, @object
	.size	vdecGetPicture_stub, 4
vdecGetPicture_stub:
	.long	__vdecGetPicture
	.globl vdecGetPicture_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	vdecGetPicture_fnid, @object
	.size	vdecGetPicture_fnid, 4
vdecGetPicture_fnid:
	.long	-2139322854
	.globl vdecEndSequence_stub
	.section	.data.sceFStub.libvdec
	.align 2
	.type	vdecEndSequence_stub, @object
	.size	vdecEndSequence_stub, 4
vdecEndSequence_stub:
	.long	__vdecEndSequence
	.globl vdecEndSequence_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	vdecEndSequence_fnid, @object
	.size	vdecEndSequence_fnid, 4
vdecEndSequence_fnid:
	.long	-2109459472
	.globl vdecOpen_stub
	.section	.data.sceFStub.libvdec
	.align 2
	.type	vdecOpen_stub, @object
	.size	vdecOpen_stub, 4
vdecOpen_stub:
	.long	__vdecOpen
	.globl vdecOpen_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	vdecOpen_fnid, @object
	.size	vdecOpen_fnid, 4
vdecOpen_fnid:
	.long	-1229206179
	.globl vdecStartSequence_stub
	.section	.data.sceFStub.libvdec
	.align 2
	.type	vdecStartSequence_stub, @object
	.size	vdecStartSequence_stub, 4
vdecStartSequence_stub:
	.long	__vdecStartSequence
	.globl vdecStartSequence_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	vdecStartSequence_fnid, @object
	.size	vdecStartSequence_fnid, 4
vdecStartSequence_fnid:
	.long	-950549846
	.globl vdecQueryAttr_stub
	.section	.data.sceFStub.libvdec
	.align 2
	.type	vdecQueryAttr_stub, @object
	.size	vdecQueryAttr_stub, 4
vdecQueryAttr_stub:
	.long	__vdecQueryAttr
	.globl vdecQueryAttr_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	vdecQueryAttr_fnid, @object
	.size	vdecQueryAttr_fnid, 4
vdecQueryAttr_fnid:
	.long	-9474370
	.ident	"GCC: (GNU) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
