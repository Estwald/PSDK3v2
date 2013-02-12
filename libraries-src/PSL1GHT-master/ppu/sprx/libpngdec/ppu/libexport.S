	.file	"libexport.c"
	.section	".got","aw"
	.section	".text"
	.section	.data.sceFStub.cellPngDec,"aw",@progbits
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
	.string	"cellPngDec"
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
	.4byte	cellPngDec
	.4byte	scefstub
	.4byte	0
	.4byte	0
	.4byte	0
	.4byte	0
	.globl pngDecCreate_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecCreate_stub, @object
	.size	pngDecCreate_stub, 4
pngDecCreate_stub:
	.long	__pngDecCreate
	.globl pngDecCreate_fnid
	.section	.rodata.sceFNID,"a",@progbits
	.align 2
	.type	pngDecCreate_fnid, @object
	.size	pngDecCreate_fnid, 4
pngDecCreate_fnid:
	.long	360526021
	.globl pngDecDestroy_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecDestroy_stub, @object
	.size	pngDecDestroy_stub, 4
pngDecDestroy_stub:
	.long	__pngDecDestroy
	.globl pngDecDestroy_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecDestroy_fnid, @object
	.size	pngDecDestroy_fnid, 4
pngDecDestroy_fnid:
	.long	-2113032678
	.globl pngDecOpen_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecOpen_stub, @object
	.size	pngDecOpen_stub, 4
pngDecOpen_stub:
	.long	__pngDecOpen
	.globl pngDecOpen_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecOpen_fnid, @object
	.size	pngDecOpen_fnid, 4
pngDecOpen_fnid:
	.long	-759407619
	.globl pngDecClose_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecClose_stub, @object
	.size	pngDecClose_stub, 4
pngDecClose_stub:
	.long	__pngDecClose
	.globl pngDecClose_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecClose_fnid, @object
	.size	pngDecClose_fnid, 4
pngDecClose_fnid:
	.long	1530732529
	.globl pngDecReadHeader_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecReadHeader_stub, @object
	.size	pngDecReadHeader_stub, 4
pngDecReadHeader_stub:
	.long	__pngDecReadHeader
	.globl pngDecReadHeader_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecReadHeader_fnid, @object
	.size	pngDecReadHeader_fnid, 4
pngDecReadHeader_fnid:
	.long	-1664234347
	.globl pngDecDecodeData_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecDecodeData_stub, @object
	.size	pngDecDecodeData_stub, 4
pngDecDecodeData_stub:
	.long	__pngDecDecodeData
	.globl pngDecDecodeData_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecDecodeData_fnid, @object
	.size	pngDecDecodeData_fnid, 4
pngDecDecodeData_fnid:
	.long	588312917
	.globl pngDecSetParameter_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecSetParameter_stub, @object
	.size	pngDecSetParameter_stub, 4
pngDecSetParameter_stub:
	.long	__pngDecSetParameter
	.globl pngDecSetParameter_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecSetParameter_fnid, @object
	.size	pngDecSetParameter_fnid, 4
pngDecSetParameter_fnid:
	.long	-377709612
	.globl pngDecExtCreate_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecExtCreate_stub, @object
	.size	pngDecExtCreate_stub, 4
pngDecExtCreate_stub:
	.long	__pngDecExtCreate
	.globl pngDecExtCreate_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecExtCreate_fnid, @object
	.size	pngDecExtCreate_fnid, 4
pngDecExtCreate_fnid:
	.long	1212377901
	.globl pngDecExtOpen_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecExtOpen_stub, @object
	.size	pngDecExtOpen_stub, 4
pngDecExtOpen_stub:
	.long	__pngDecExtOpen
	.globl pngDecExtOpen_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecExtOpen_fnid, @object
	.size	pngDecExtOpen_fnid, 4
pngDecExtOpen_fnid:
	.long	206656258
	.globl pngDecExtReadHeader_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecExtReadHeader_stub, @object
	.size	pngDecExtReadHeader_stub, 4
pngDecExtReadHeader_stub:
	.long	__pngDecExtReadHeader
	.globl pngDecExtReadHeader_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecExtReadHeader_fnid, @object
	.size	pngDecExtReadHeader_fnid, 4
pngDecExtReadHeader_fnid:
	.long	-1959528349
	.globl pngDecExtDecodeData_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecExtDecodeData_stub, @object
	.size	pngDecExtDecodeData_stub, 4
pngDecExtDecodeData_stub:
	.long	__pngDecExtDecodeData
	.globl pngDecExtDecodeData_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecExtDecodeData_fnid, @object
	.size	pngDecExtDecodeData_fnid, 4
pngDecExtDecodeData_fnid:
	.long	1919926736
	.globl pngDecExtSetParameter_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecExtSetParameter_stub, @object
	.size	pngDecExtSetParameter_stub, 4
pngDecExtSetParameter_stub:
	.long	__pngDecExtSetParameter
	.globl pngDecExtSetParameter_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecExtSetParameter_fnid, @object
	.size	pngDecExtSetParameter_fnid, 4
pngDecExtSetParameter_fnid:
	.long	-1633845950
	.globl pngDecGetbKGD_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecGetbKGD_stub, @object
	.size	pngDecGetbKGD_stub, 4
pngDecGetbKGD_stub:
	.long	__pngDecGetbKGD
	.globl pngDecGetbKGD_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecGetbKGD_fnid, @object
	.size	pngDecGetbKGD_fnid, 4
pngDecGetbKGD_fnid:
	.long	1971692149
	.globl pngDecGetcHRM_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecGetcHRM_stub, @object
	.size	pngDecGetcHRM_stub, 4
pngDecGetcHRM_stub:
	.long	__pngDecGetcHRM
	.globl pngDecGetcHRM_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecGetcHRM_fnid, @object
	.size	pngDecGetcHRM_fnid, 4
pngDecGetcHRM_fnid:
	.long	2047225126
	.globl pngDecGetgAMA_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecGetgAMA_stub, @object
	.size	pngDecGetgAMA_stub, 4
pngDecGetgAMA_stub:
	.long	__pngDecGetgAMA
	.globl pngDecGetgAMA_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecGetgAMA_fnid, @object
	.size	pngDecGetgAMA_fnid, 4
pngDecGetgAMA_fnid:
	.long	-1319935332
	.globl pngDecGethIST_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecGethIST_stub, @object
	.size	pngDecGethIST_stub, 4
pngDecGethIST_stub:
	.long	__pngDecGethIST
	.globl pngDecGethIST_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecGethIST_fnid, @object
	.size	pngDecGethIST_fnid, 4
pngDecGethIST_fnid:
	.long	-1190794313
	.globl pngDecGetiCCP_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecGetiCCP_stub, @object
	.size	pngDecGetiCCP_stub, 4
pngDecGetiCCP_stub:
	.long	__pngDecGetiCCP
	.globl pngDecGetiCCP_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecGetiCCP_fnid, @object
	.size	pngDecGetiCCP_fnid, 4
pngDecGetiCCP_fnid:
	.long	-196383696
	.globl pngDecGetoFFs_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecGetoFFs_stub, @object
	.size	pngDecGetoFFs_stub, 4
pngDecGetoFFs_stub:
	.long	__pngDecGetoFFs
	.globl pngDecGetoFFs_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecGetoFFs_fnid, @object
	.size	pngDecGetoFFs_fnid, 4
pngDecGetoFFs_fnid:
	.long	667492789
	.globl pngDecGetpCAL_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecGetpCAL_stub, @object
	.size	pngDecGetpCAL_stub, 4
pngDecGetpCAL_stub:
	.long	__pngDecGetpCAL
	.globl pngDecGetpCAL_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecGetpCAL_fnid, @object
	.size	pngDecGetpCAL_fnid, 4
pngDecGetpCAL_fnid:
	.long	-1258392095
	.globl pngDecGetpHYs_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecGetpHYs_stub, @object
	.size	pngDecGetpHYs_stub, 4
pngDecGetpHYs_stub:
	.long	__pngDecGetpHYs
	.globl pngDecGetpHYs_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecGetpHYs_fnid, @object
	.size	pngDecGetpHYs_fnid, 4
pngDecGetpHYs_fnid:
	.long	1028653418
	.globl pngDecGetsBIT_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecGetsBIT_stub, @object
	.size	pngDecGetsBIT_stub, 4
pngDecGetsBIT_stub:
	.long	__pngDecGetsBIT
	.globl pngDecGetsBIT_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecGetsBIT_fnid, @object
	.size	pngDecGetsBIT_fnid, 4
pngDecGetsBIT_fnid:
	.long	818623306
	.globl pngDecGetsCAL_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecGetsCAL_stub, @object
	.size	pngDecGetsCAL_stub, 4
pngDecGetsCAL_stub:
	.long	__pngDecGetsCAL
	.globl pngDecGetsCAL_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecGetsCAL_fnid, @object
	.size	pngDecGetsCAL_fnid, 4
pngDecGetsCAL_fnid:
	.long	-1004662376
	.globl pngDecGetsPLT_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecGetsPLT_stub, @object
	.size	pngDecGetsPLT_stub, 4
pngDecGetsPLT_stub:
	.long	__pngDecGetsPLT
	.globl pngDecGetsPLT_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecGetsPLT_fnid, @object
	.size	pngDecGetsPLT_fnid, 4
pngDecGetsPLT_fnid:
	.long	-1513228930
	.globl pngDecGetsRGB_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecGetsRGB_stub, @object
	.size	pngDecGetsRGB_stub, 4
pngDecGetsRGB_stub:
	.long	__pngDecGetsRGB
	.globl pngDecGetsRGB_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecGetsRGB_fnid, @object
	.size	pngDecGetsRGB_fnid, 4
pngDecGetsRGB_fnid:
	.long	-465473918
	.globl pngDecGettIME_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecGettIME_stub, @object
	.size	pngDecGettIME_stub, 4
pngDecGettIME_stub:
	.long	__pngDecGettIME
	.globl pngDecGettIME_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecGettIME_fnid, @object
	.size	pngDecGettIME_fnid, 4
pngDecGettIME_fnid:
	.long	900105324
	.globl pngDecGettRNS_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecGettRNS_stub, @object
	.size	pngDecGettRNS_stub, 4
pngDecGettRNS_stub:
	.long	__pngDecGettRNS
	.globl pngDecGettRNS_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecGettRNS_fnid, @object
	.size	pngDecGettRNS_fnid, 4
pngDecGettRNS_fnid:
	.long	-1183862162
	.globl pngDecGetPLTE_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecGetPLTE_stub, @object
	.size	pngDecGetPLTE_stub, 4
pngDecGetPLTE_stub:
	.long	__pngDecGetPLTE
	.globl pngDecGetPLTE_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecGetPLTE_fnid, @object
	.size	pngDecGetPLTE_fnid, 4
pngDecGetPLTE_fnid:
	.long	-513566849
	.globl pngDecUnknownChunks_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecUnknownChunks_stub, @object
	.size	pngDecUnknownChunks_stub, 4
pngDecUnknownChunks_stub:
	.long	__pngDecUnknownChunks
	.globl pngDecUnknownChunks_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecUnknownChunks_fnid, @object
	.size	pngDecUnknownChunks_fnid, 4
pngDecUnknownChunks_fnid:
	.long	1621018581
	.globl pngDecGetTextChunk_stub
	.section	.data.sceFStub.cellPngDec
	.align 2
	.type	pngDecGetTextChunk_stub, @object
	.size	pngDecGetTextChunk_stub, 4
pngDecGetTextChunk_stub:
	.long	__pngDecGetTextChunk
	.globl pngDecGetTextChunk_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	pngDecGetTextChunk_fnid, @object
	.size	pngDecGetTextChunk_fnid, 4
pngDecGetTextChunk_fnid:
	.long	-1274240651
	.ident	"GCC: (GNU) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
