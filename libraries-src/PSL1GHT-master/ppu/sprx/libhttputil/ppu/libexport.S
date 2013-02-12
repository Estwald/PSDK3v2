	.file	"libexport.c"
	.section	".got","aw"
	.section	".text"
	.section	.data.sceFStub.cellHttpUtil,"aw",@progbits
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
	.size	name, 13
name:
	.string	"cellHttpUtil"
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
	.4byte	cellHttpUtil
	.4byte	scefstub
	.4byte	0
	.4byte	0
	.4byte	0
	.4byte	0
	.globl httpUtilBuildHeader_stub
	.section	.data.sceFStub.cellHttpUtil
	.align 2
	.type	httpUtilBuildHeader_stub, @object
	.size	httpUtilBuildHeader_stub, 4
httpUtilBuildHeader_stub:
	.long	__httpUtilBuildHeader
	.globl httpUtilBuildHeader_fnid
	.section	.rodata.sceFNID,"a",@progbits
	.align 2
	.type	httpUtilBuildHeader_fnid, @object
	.size	httpUtilBuildHeader_fnid, 4
httpUtilBuildHeader_fnid:
	.long	78433983
	.globl httpUtilBuildRequestLine_stub
	.section	.data.sceFStub.cellHttpUtil
	.align 2
	.type	httpUtilBuildRequestLine_stub, @object
	.size	httpUtilBuildRequestLine_stub, 4
httpUtilBuildRequestLine_stub:
	.long	__httpUtilBuildRequestLine
	.globl httpUtilBuildRequestLine_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpUtilBuildRequestLine_fnid, @object
	.size	httpUtilBuildRequestLine_fnid, 4
httpUtilBuildRequestLine_fnid:
	.long	476990907
	.globl httpUtilUnescapeUri_stub
	.section	.data.sceFStub.cellHttpUtil
	.align 2
	.type	httpUtilUnescapeUri_stub, @object
	.size	httpUtilUnescapeUri_stub, 4
httpUtilUnescapeUri_stub:
	.long	__httpUtilUnescapeUri
	.globl httpUtilUnescapeUri_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpUtilUnescapeUri_fnid, @object
	.size	httpUtilUnescapeUri_fnid, 4
httpUtilUnescapeUri_fnid:
	.long	660864358
	.globl httpUtilParseStatusLine_stub
	.section	.data.sceFStub.cellHttpUtil
	.align 2
	.type	httpUtilParseStatusLine_stub, @object
	.size	httpUtilParseStatusLine_stub, 4
httpUtilParseStatusLine_stub:
	.long	__httpUtilParseStatusLine
	.globl httpUtilParseStatusLine_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpUtilParseStatusLine_fnid, @object
	.size	httpUtilParseStatusLine_fnid, 4
httpUtilParseStatusLine_fnid:
	.long	734777044
	.globl httpUtilParseUri_stub
	.section	.data.sceFStub.cellHttpUtil
	.align 2
	.type	httpUtilParseUri_stub, @object
	.size	httpUtilParseUri_stub, 4
httpUtilParseUri_stub:
	.long	__httpUtilParseUri
	.globl httpUtilParseUri_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpUtilParseUri_fnid, @object
	.size	httpUtilParseUri_fnid, 4
httpUtilParseUri_fnid:
	.long	855289688
	.globl httpUtilAppendHeaderValue_stub
	.section	.data.sceFStub.cellHttpUtil
	.align 2
	.type	httpUtilAppendHeaderValue_stub, @object
	.size	httpUtilAppendHeaderValue_stub, 4
httpUtilAppendHeaderValue_stub:
	.long	__httpUtilAppendHeaderValue
	.globl httpUtilAppendHeaderValue_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpUtilAppendHeaderValue_fnid, @object
	.size	httpUtilAppendHeaderValue_fnid, 4
httpUtilAppendHeaderValue_fnid:
	.long	935023522
	.globl httpUtilFormUrlEncode_stub
	.section	.data.sceFStub.cellHttpUtil
	.align 2
	.type	httpUtilFormUrlEncode_stub, @object
	.size	httpUtilFormUrlEncode_stub, 4
httpUtilFormUrlEncode_stub:
	.long	__httpUtilFormUrlEncode
	.globl httpUtilFormUrlEncode_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpUtilFormUrlEncode_fnid, @object
	.size	httpUtilFormUrlEncode_fnid, 4
httpUtilFormUrlEncode_fnid:
	.long	1154963158
	.globl httpUtilCopyStatusLine_stub
	.section	.data.sceFStub.cellHttpUtil
	.align 2
	.type	httpUtilCopyStatusLine_stub, @object
	.size	httpUtilCopyStatusLine_stub, 4
httpUtilCopyStatusLine_stub:
	.long	__httpUtilCopyStatusLine
	.globl httpUtilCopyStatusLine_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpUtilCopyStatusLine_fnid, @object
	.size	httpUtilCopyStatusLine_fnid, 4
httpUtilCopyStatusLine_fnid:
	.long	1357542844
	.globl httpUtilBuildUri_stub
	.section	.data.sceFStub.cellHttpUtil
	.align 2
	.type	httpUtilBuildUri_stub, @object
	.size	httpUtilBuildUri_stub, 4
httpUtilBuildUri_stub:
	.long	__httpUtilBuildUri
	.globl httpUtilBuildUri_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpUtilBuildUri_fnid, @object
	.size	httpUtilBuildUri_fnid, 4
httpUtilBuildUri_fnid:
	.long	1863284327
	.globl httpUtilBase64Encoder_stub
	.section	.data.sceFStub.cellHttpUtil
	.align 2
	.type	httpUtilBase64Encoder_stub, @object
	.size	httpUtilBase64Encoder_stub, 4
httpUtilBase64Encoder_stub:
	.long	__httpUtilBase64Encoder
	.globl httpUtilBase64Encoder_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpUtilBase64Encoder_fnid, @object
	.size	httpUtilBase64Encoder_fnid, 4
httpUtilBase64Encoder_fnid:
	.long	-2080726188
	.globl httpUtilParseUriPath_stub
	.section	.data.sceFStub.cellHttpUtil
	.align 2
	.type	httpUtilParseUriPath_stub, @object
	.size	httpUtilParseUriPath_stub, 4
httpUtilParseUriPath_stub:
	.long	__httpUtilParseUriPath
	.globl httpUtilParseUriPath_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpUtilParseUriPath_fnid, @object
	.size	httpUtilParseUriPath_fnid, 4
httpUtilParseUriPath_fnid:
	.long	-1951004444
	.globl httpUtilBase64Decoder_stub
	.section	.data.sceFStub.cellHttpUtil
	.align 2
	.type	httpUtilBase64Decoder_stub, @object
	.size	httpUtilBase64Decoder_stub, 4
httpUtilBase64Decoder_stub:
	.long	__httpUtilBase64Decoder
	.globl httpUtilBase64Decoder_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpUtilBase64Decoder_fnid, @object
	.size	httpUtilBase64Decoder_fnid, 4
httpUtilBase64Decoder_fnid:
	.long	-1907167736
	.globl httpUtilFormUrlDecode_stub
	.section	.data.sceFStub.cellHttpUtil
	.align 2
	.type	httpUtilFormUrlDecode_stub, @object
	.size	httpUtilFormUrlDecode_stub, 4
httpUtilFormUrlDecode_stub:
	.long	__httpUtilFormUrlDecode
	.globl httpUtilFormUrlDecode_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpUtilFormUrlDecode_fnid, @object
	.size	httpUtilFormUrlDecode_fnid, 4
httpUtilFormUrlDecode_fnid:
	.long	-1905501255
	.globl httpUtilMergeUriPath_stub
	.section	.data.sceFStub.cellHttpUtil
	.align 2
	.type	httpUtilMergeUriPath_stub, @object
	.size	httpUtilMergeUriPath_stub, 4
httpUtilMergeUriPath_stub:
	.long	__httpUtilMergeUriPath
	.globl httpUtilMergeUriPath_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpUtilMergeUriPath_fnid, @object
	.size	httpUtilMergeUriPath_fnid, 4
httpUtilMergeUriPath_fnid:
	.long	-1901969941
	.globl httpUtilEscapeUri_stub
	.section	.data.sceFStub.cellHttpUtil
	.align 2
	.type	httpUtilEscapeUri_stub, @object
	.size	httpUtilEscapeUri_stub, 4
httpUtilEscapeUri_stub:
	.long	__httpUtilEscapeUri
	.globl httpUtilEscapeUri_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpUtilEscapeUri_fnid, @object
	.size	httpUtilEscapeUri_fnid, 4
httpUtilEscapeUri_fnid:
	.long	-1878806030
	.globl httpUtilCopyHeader_stub
	.section	.data.sceFStub.cellHttpUtil
	.align 2
	.type	httpUtilCopyHeader_stub, @object
	.size	httpUtilCopyHeader_stub, 4
httpUtilCopyHeader_stub:
	.long	__httpUtilCopyHeader
	.globl httpUtilCopyHeader_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpUtilCopyHeader_fnid, @object
	.size	httpUtilCopyHeader_fnid, 4
httpUtilCopyHeader_fnid:
	.long	-1745224731
	.globl httpUtilParseProxy_stub
	.section	.data.sceFStub.cellHttpUtil
	.align 2
	.type	httpUtilParseProxy_stub, @object
	.size	httpUtilParseProxy_stub, 4
httpUtilParseProxy_stub:
	.long	__httpUtilParseProxy
	.globl httpUtilParseProxy_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpUtilParseProxy_fnid, @object
	.size	httpUtilParseProxy_fnid, 4
httpUtilParseProxy_fnid:
	.long	-1555728279
	.globl httpUtilSweepPath_stub
	.section	.data.sceFStub.cellHttpUtil
	.align 2
	.type	httpUtilSweepPath_stub, @object
	.size	httpUtilSweepPath_stub, 4
httpUtilSweepPath_stub:
	.long	__httpUtilSweepPath
	.globl httpUtilSweepPath_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpUtilSweepPath_fnid, @object
	.size	httpUtilSweepPath_fnid, 4
httpUtilSweepPath_fnid:
	.long	-1430341527
	.globl httpUtilParseHeader_stub
	.section	.data.sceFStub.cellHttpUtil
	.align 2
	.type	httpUtilParseHeader_stub, @object
	.size	httpUtilParseHeader_stub, 4
httpUtilParseHeader_stub:
	.long	__httpUtilParseHeader
	.globl httpUtilParseHeader_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpUtilParseHeader_fnid, @object
	.size	httpUtilParseHeader_fnid, 4
httpUtilParseHeader_fnid:
	.long	-503640387
	.globl httpUtilCopyUri_stub
	.section	.data.sceFStub.cellHttpUtil
	.align 2
	.type	httpUtilCopyUri_stub, @object
	.size	httpUtilCopyUri_stub, 4
httpUtilCopyUri_stub:
	.long	__httpUtilCopyUri
	.globl httpUtilCopyUri_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpUtilCopyUri_fnid, @object
	.size	httpUtilCopyUri_fnid, 4
httpUtilCopyUri_fnid:
	.long	-262277239
	.ident	"GCC: (GNU) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
