	.file	"libexport.c"
	.section	".got","aw"
	.section	".text"
	.section	.data.sceFStub.cellHttp,"aw",@progbits
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
	.size	name, 9
name:
	.string	"cellHttp"
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
	.4byte	cellHttp
	.4byte	scefstub
	.4byte	0
	.4byte	0
	.4byte	0
	.4byte	0
	.globl httpCreateTransaction_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpCreateTransaction_stub, @object
	.size	httpCreateTransaction_stub, 4
httpCreateTransaction_stub:
	.long	__httpCreateTransaction
	.globl httpCreateTransaction_fnid
	.section	.rodata.sceFNID,"a",@progbits
	.align 2
	.type	httpCreateTransaction_fnid, @object
	.size	httpCreateTransaction_fnid, 4
httpCreateTransaction_fnid:
	.long	86671577
	.globl httpClientGetTotalPoolSize_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientGetTotalPoolSize_stub, @object
	.size	httpClientGetTotalPoolSize_stub, 4
httpClientGetTotalPoolSize_stub:
	.long	__httpClientGetTotalPoolSize
	.globl httpClientGetTotalPoolSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientGetTotalPoolSize_fnid, @object
	.size	httpClientGetTotalPoolSize_fnid, 4
httpClientGetTotalPoolSize_fnid:
	.long	118427680
	.globl httpRequestGetHeader_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpRequestGetHeader_stub, @object
	.size	httpRequestGetHeader_stub, 4
httpRequestGetHeader_stub:
	.long	__httpRequestGetHeader
	.globl httpRequestGetHeader_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpRequestGetHeader_fnid, @object
	.size	httpRequestGetHeader_fnid, 4
httpRequestGetHeader_fnid:
	.long	195029599
	.globl httpCookieImportWithClientId_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpCookieImportWithClientId_stub, @object
	.size	httpCookieImportWithClientId_stub, 4
httpCookieImportWithClientId_stub:
	.long	__httpCookieImportWithClientId
	.globl httpCookieImportWithClientId_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpCookieImportWithClientId_fnid, @object
	.size	httpCookieImportWithClientId_fnid, 4
httpCookieImportWithClientId_fnid:
	.long	226782563
	.globl httpSetProxy_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpSetProxy_stub, @object
	.size	httpSetProxy_stub, 4
httpSetProxy_stub:
	.long	__httpSetProxy
	.globl httpSetProxy_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpSetProxy_fnid, @object
	.size	httpSetProxy_fnid, 4
httpSetProxy_fnid:
	.long	227109783
	.globl httpClientGetAllHeaders_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientGetAllHeaders_stub, @object
	.size	httpClientGetAllHeaders_stub, 4
httpClientGetAllHeaders_stub:
	.long	__httpClientGetAllHeaders
	.globl httpClientGetAllHeaders_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientGetAllHeaders_fnid, @object
	.size	httpClientGetAllHeaders_fnid, 4
httpClientGetAllHeaders_fnid:
	.long	228353470
	.globl httpTransactionGetUri_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpTransactionGetUri_stub, @object
	.size	httpTransactionGetUri_stub, 4
httpTransactionGetUri_stub:
	.long	__httpTransactionGetUri
	.globl httpTransactionGetUri_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpTransactionGetUri_fnid, @object
	.size	httpTransactionGetUri_fnid, 4
httpTransactionGetUri_fnid:
	.long	250704793
	.globl httpResponseGetStatusCode_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpResponseGetStatusCode_stub, @object
	.size	httpResponseGetStatusCode_stub, 4
httpResponseGetStatusCode_stub:
	.long	__httpResponseGetStatusCode
	.globl httpResponseGetStatusCode_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpResponseGetStatusCode_fnid, @object
	.size	httpResponseGetStatusCode_fnid, 4
httpResponseGetStatusCode_fnid:
	.long	282122236
	.globl httpClientGetRecvBufferSize_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientGetRecvBufferSize_stub, @object
	.size	httpClientGetRecvBufferSize_stub, 4
httpClientGetRecvBufferSize_stub:
	.long	__httpClientGetRecvBufferSize
	.globl httpClientGetRecvBufferSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientGetRecvBufferSize_fnid, @object
	.size	httpClientGetRecvBufferSize_fnid, 4
httpClientGetRecvBufferSize_fnid:
	.long	318853354
	.globl httpClientSetSslCallbackEx_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetSslCallbackEx_stub, @object
	.size	httpClientSetSslCallbackEx_stub, 4
httpClientSetSslCallbackEx_stub:
	.long	__httpClientSetSslCallbackEx
	.globl httpClientSetSslCallbackEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetSslCallbackEx_fnid, @object
	.size	httpClientSetSslCallbackEx_fnid, 4
httpClientSetSslCallbackEx_fnid:
	.long	328587473
	.globl httpClientSetCookieRecvCallbackEx_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetCookieRecvCallbackEx_stub, @object
	.size	httpClientSetCookieRecvCallbackEx_stub, 4
httpClientSetCookieRecvCallbackEx_stub:
	.long	__httpClientSetCookieRecvCallbackEx
	.globl httpClientSetCookieRecvCallbackEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetCookieRecvCallbackEx_fnid, @object
	.size	httpClientSetCookieRecvCallbackEx_fnid, 4
httpClientSetCookieRecvCallbackEx_fnid:
	.long	335443579
	.globl httpClientGetConnTimeout_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientGetConnTimeout_stub, @object
	.size	httpClientGetConnTimeout_stub, 4
httpClientGetConnTimeout_stub:
	.long	__httpClientGetConnTimeout
	.globl httpClientGetConnTimeout_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientGetConnTimeout_fnid, @object
	.size	httpClientGetConnTimeout_fnid, 4
httpClientGetConnTimeout_fnid:
	.long	348112741
	.globl httpRequestDeleteHeader_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpRequestDeleteHeader_stub, @object
	.size	httpRequestDeleteHeader_stub, 4
httpRequestDeleteHeader_stub:
	.long	__httpRequestDeleteHeader
	.globl httpRequestDeleteHeader_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpRequestDeleteHeader_fnid, @object
	.size	httpRequestDeleteHeader_fnid, 4
httpRequestDeleteHeader_fnid:
	.long	371278865
	.globl httpAddCookieWithClientId_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpAddCookieWithClientId_stub, @object
	.size	httpAddCookieWithClientId_stub, 4
httpAddCookieWithClientId_stub:
	.long	__httpAddCookieWithClientId
	.globl httpAddCookieWithClientId_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpAddCookieWithClientId_fnid, @object
	.size	httpAddCookieWithClientId_fnid, 4
httpAddCookieWithClientId_fnid:
	.long	459005126
	.globl httpClientCloseAllConnections_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientCloseAllConnections_stub, @object
	.size	httpClientCloseAllConnections_stub, 4
httpClientCloseAllConnections_stub:
	.long	__httpClientCloseAllConnections
	.globl httpClientCloseAllConnections_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientCloseAllConnections_fnid, @object
	.size	httpClientCloseAllConnections_fnid, 4
httpClientCloseAllConnections_fnid:
	.long	540260472
	.globl httpClientSetAutoRedirect_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetAutoRedirect_stub, @object
	.size	httpClientSetAutoRedirect_stub, 4
httpClientSetAutoRedirect_stub:
	.long	__httpClientSetAutoRedirect
	.globl httpClientSetAutoRedirect_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetAutoRedirect_fnid, @object
	.size	httpClientSetAutoRedirect_fnid, 4
httpClientSetAutoRedirect_fnid:
	.long	555584419
	.globl httpClientSetRecvTimeout_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetRecvTimeout_stub, @object
	.size	httpClientSetRecvTimeout_stub, 4
httpClientSetRecvTimeout_stub:
	.long	__httpClientSetRecvTimeout
	.globl httpClientSetRecvTimeout_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetRecvTimeout_fnid, @object
	.size	httpClientSetRecvTimeout_fnid, 4
httpClientSetRecvTimeout_fnid:
	.long	575542800
	.globl httpInit_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpInit_stub, @object
	.size	httpInit_stub, 4
httpInit_stub:
	.long	__httpInit
	.globl httpInit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpInit_fnid, @object
	.size	httpInit_fnid, 4
httpInit_fnid:
	.long	621557868
	.globl httpClientGetSendTimeout_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientGetSendTimeout_stub, @object
	.size	httpClientGetSendTimeout_stub, 4
httpClientGetSendTimeout_stub:
	.long	__httpClientGetSendTimeout
	.globl httpClientGetSendTimeout_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientGetSendTimeout_fnid, @object
	.size	httpClientGetSendTimeout_fnid, 4
httpClientGetSendTimeout_fnid:
	.long	656018182
	.globl httpClientCloseConnections_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientCloseConnections_stub, @object
	.size	httpClientCloseConnections_stub, 4
httpClientCloseConnections_stub:
	.long	__httpClientCloseConnections
	.globl httpClientCloseConnections_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientCloseConnections_fnid, @object
	.size	httpClientCloseConnections_fnid, 4
httpClientCloseConnections_fnid:
	.long	670592368
	.globl httpClientGetAutoRedirect_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientGetAutoRedirect_stub, @object
	.size	httpClientGetAutoRedirect_stub, 4
httpClientGetAutoRedirect_stub:
	.long	__httpClientGetAutoRedirect
	.globl httpClientGetAutoRedirect_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientGetAutoRedirect_fnid, @object
	.size	httpClientGetAutoRedirect_fnid, 4
httpClientGetAutoRedirect_fnid:
	.long	694215433
	.globl httpClientSetPipeline_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetPipeline_stub, @object
	.size	httpClientSetPipeline_stub, 4
httpClientSetPipeline_stub:
	.long	__httpClientSetPipeline
	.globl httpClientSetPipeline_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetPipeline_fnid, @object
	.size	httpClientSetPipeline_fnid, 4
httpClientSetPipeline_fnid:
	.long	694830799
	.globl httpClientGetPipeline_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientGetPipeline_stub, @object
	.size	httpClientGetPipeline_stub, 4
httpClientGetPipeline_stub:
	.long	__httpClientGetPipeline
	.globl httpClientGetPipeline_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientGetPipeline_fnid, @object
	.size	httpClientGetPipeline_fnid, 4
httpClientGetPipeline_fnid:
	.long	706685174
	.globl httpTransactionGetSslId_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpTransactionGetSslId_stub, @object
	.size	httpTransactionGetSslId_stub, 4
httpTransactionGetSslId_stub:
	.long	__httpTransactionGetSslId
	.globl httpTransactionGetSslId_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpTransactionGetSslId_fnid, @object
	.size	httpTransactionGetSslId_fnid, 4
httpTransactionGetSslId_fnid:
	.long	712572676
	.globl httpGetProxy_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpGetProxy_stub, @object
	.size	httpGetProxy_stub, 4
httpGetProxy_stub:
	.long	__httpGetProxy
	.globl httpGetProxy_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpGetProxy_fnid, @object
	.size	httpGetProxy_fnid, 4
httpGetProxy_fnid:
	.long	713515066
	.globl httpTransactionAbortConnection_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpTransactionAbortConnection_stub, @object
	.size	httpTransactionAbortConnection_stub, 4
httpTransactionAbortConnection_stub:
	.long	__httpTransactionAbortConnection
	.globl httpTransactionAbortConnection_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpTransactionAbortConnection_fnid, @object
	.size	httpTransactionAbortConnection_fnid, 4
httpTransactionAbortConnection_fnid:
	.long	760382603
	.globl httpDestroyTransaction_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpDestroyTransaction_stub, @object
	.size	httpDestroyTransaction_stub, 4
httpDestroyTransaction_stub:
	.long	__httpDestroyTransaction
	.globl httpDestroyTransaction_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpDestroyTransaction_fnid, @object
	.size	httpDestroyTransaction_fnid, 4
httpDestroyTransaction_fnid:
	.long	854969058
	.globl httpTransactionGetSslCipherId_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpTransactionGetSslCipherId_stub, @object
	.size	httpTransactionGetSslCipherId_stub, 4
httpTransactionGetSslCipherId_stub:
	.long	__httpTransactionGetSslCipherId
	.globl httpTransactionGetSslCipherId_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpTransactionGetSslCipherId_fnid, @object
	.size	httpTransactionGetSslCipherId_fnid, 4
httpTransactionGetSslCipherId_fnid:
	.long	872816201
	.globl httpTransactionGetSslCipherBits_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpTransactionGetSslCipherBits_stub, @object
	.size	httpTransactionGetSslCipherBits_stub, 4
httpTransactionGetSslCipherBits_stub:
	.long	__httpTransactionGetSslCipherBits
	.globl httpTransactionGetSslCipherBits_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpTransactionGetSslCipherBits_fnid, @object
	.size	httpTransactionGetSslCipherBits_fnid, 4
httpTransactionGetSslCipherBits_fnid:
	.long	949305651
	.globl httpClientSetVersion_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetVersion_stub, @object
	.size	httpClientSetVersion_stub, 4
httpClientSetVersion_stub:
	.long	__httpClientSetVersion
	.globl httpClientSetVersion_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetVersion_fnid, @object
	.size	httpClientSetVersion_fnid, 4
httpClientSetVersion_fnid:
	.long	1079278987
	.globl httpRequestGetChunkedTransferStatus_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpRequestGetChunkedTransferStatus_stub, @object
	.size	httpRequestGetChunkedTransferStatus_stub, 4
httpRequestGetChunkedTransferStatus_stub:
	.long	__httpRequestGetChunkedTransferStatus
	.globl httpRequestGetChunkedTransferStatus_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpRequestGetChunkedTransferStatus_fnid, @object
	.size	httpRequestGetChunkedTransferStatus_fnid, 4
httpRequestGetChunkedTransferStatus_fnid:
	.long	1094164982
	.globl httpRequestGetAllHeaders_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpRequestGetAllHeaders_stub, @object
	.size	httpRequestGetAllHeaders_stub, 4
httpRequestGetAllHeaders_stub:
	.long	__httpRequestGetAllHeaders
	.globl httpRequestGetAllHeaders_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpRequestGetAllHeaders_fnid, @object
	.size	httpRequestGetAllHeaders_fnid, 4
httpRequestGetAllHeaders_fnid:
	.long	1109417952
	.globl httpClientSetCookieStatus_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetCookieStatus_stub, @object
	.size	httpClientSetCookieStatus_stub, 4
httpClientSetCookieStatus_stub:
	.long	__httpClientSetCookieStatus
	.globl httpClientSetCookieStatus_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetCookieStatus_fnid, @object
	.size	httpClientSetCookieStatus_fnid, 4
httpClientSetCookieStatus_fnid:
	.long	1128536520
	.globl httpResponseGetContentLength_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpResponseGetContentLength_stub, @object
	.size	httpResponseGetContentLength_stub, 4
httpResponseGetContentLength_stub:
	.long	__httpResponseGetContentLength
	.globl httpResponseGetContentLength_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpResponseGetContentLength_fnid, @object
	.size	httpResponseGetContentLength_fnid, 4
httpResponseGetContentLength_fnid:
	.long	1179646089
	.globl httpClientGetPerHostKeepAliveMax_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientGetPerHostKeepAliveMax_stub, @object
	.size	httpClientGetPerHostKeepAliveMax_stub, 4
httpClientGetPerHostKeepAliveMax_stub:
	.long	__httpClientGetPerHostKeepAliveMax
	.globl httpClientGetPerHostKeepAliveMax_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientGetPerHostKeepAliveMax_fnid, @object
	.size	httpClientGetPerHostKeepAliveMax_fnid, 4
httpClientGetPerHostKeepAliveMax_fnid:
	.long	1186777599
	.globl httpClientSetRedirectCallbackEx_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetRedirectCallbackEx_stub, @object
	.size	httpClientSetRedirectCallbackEx_stub, 4
httpClientSetRedirectCallbackEx_stub:
	.long	__httpClientSetRedirectCallbackEx
	.globl httpClientSetRedirectCallbackEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetRedirectCallbackEx_fnid, @object
	.size	httpClientSetRedirectCallbackEx_fnid, 4
httpClientSetRedirectCallbackEx_fnid:
	.long	1195170289
	.globl httpClientAddHeader_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientAddHeader_stub, @object
	.size	httpClientAddHeader_stub, 4
httpClientAddHeader_stub:
	.long	__httpClientAddHeader
	.globl httpClientAddHeader_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientAddHeader_fnid, @object
	.size	httpClientAddHeader_fnid, 4
httpClientAddHeader_fnid:
	.long	1261671466
	.globl httpClientGetProxy_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientGetProxy_stub, @object
	.size	httpClientGetProxy_stub, 4
httpClientGetProxy_stub:
	.long	__httpClientGetProxy
	.globl httpClientGetProxy_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientGetProxy_fnid, @object
	.size	httpClientGetProxy_fnid, 4
httpClientGetProxy_fnid:
	.long	1296093080
	.globl httpClientSetCookieSendCallbackEx_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetCookieSendCallbackEx_stub, @object
	.size	httpClientSetCookieSendCallbackEx_stub, 4
httpClientSetCookieSendCallbackEx_stub:
	.long	__httpClientSetCookieSendCallbackEx
	.globl httpClientSetCookieSendCallbackEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetCookieSendCallbackEx_fnid, @object
	.size	httpClientSetCookieSendCallbackEx_fnid, 4
httpClientSetCookieSendCallbackEx_fnid:
	.long	1301369348
	.globl httpCreateClient_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpCreateClient_stub, @object
	.size	httpCreateClient_stub, 4
httpCreateClient_stub:
	.long	__httpCreateClient
	.globl httpCreateClient_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpCreateClient_fnid, @object
	.size	httpCreateClient_fnid, 4
httpCreateClient_fnid:
	.long	1313793338
	.globl httpResponseGetHeader_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpResponseGetHeader_stub, @object
	.size	httpResponseGetHeader_stub, 4
httpResponseGetHeader_stub:
	.long	__httpResponseGetHeader
	.globl httpResponseGetHeader_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpResponseGetHeader_fnid, @object
	.size	httpResponseGetHeader_fnid, 4
httpResponseGetHeader_fnid:
	.long	1331531040
	.globl httpsInit_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpsInit_stub, @object
	.size	httpsInit_stub, 4
httpsInit_stub:
	.long	__httpsInit
	.globl httpsInit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpsInit_fnid, @object
	.size	httpsInit_fnid, 4
httpsInit_fnid:
	.long	1377927356
	.globl httpRequestSetHeader_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpRequestSetHeader_stub, @object
	.size	httpRequestSetHeader_stub, 4
httpRequestSetHeader_stub:
	.long	__httpRequestSetHeader
	.globl httpRequestSetHeader_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpRequestSetHeader_fnid, @object
	.size	httpRequestSetHeader_fnid, 4
httpRequestSetHeader_fnid:
	.long	1425188062
	.globl httpClientGetKeepAlive_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientGetKeepAlive_stub, @object
	.size	httpClientGetKeepAlive_stub, 4
httpClientGetKeepAlive_stub:
	.long	__httpClientGetKeepAlive
	.globl httpClientGetKeepAlive_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientGetKeepAlive_fnid, @object
	.size	httpClientGetKeepAlive_fnid, 4
httpClientGetKeepAlive_fnid:
	.long	1495015848
	.globl httpClientSetPerHostKeepAliveMax_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetPerHostKeepAliveMax_stub, @object
	.size	httpClientSetPerHostKeepAliveMax_stub, 4
httpClientSetPerHostKeepAliveMax_stub:
	.long	__httpClientSetPerHostKeepAliveMax
	.globl httpClientSetPerHostKeepAliveMax_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetPerHostKeepAliveMax_fnid, @object
	.size	httpClientSetPerHostKeepAliveMax_fnid, 4
httpClientSetPerHostKeepAliveMax_fnid:
	.long	1499127529
	.globl httpClientGetAutoAuthentication_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientGetAutoAuthentication_stub, @object
	.size	httpClientGetAutoAuthentication_stub, 4
httpClientGetAutoAuthentication_stub:
	.long	__httpClientGetAutoAuthentication
	.globl httpClientGetAutoAuthentication_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientGetAutoAuthentication_fnid, @object
	.size	httpClientGetAutoAuthentication_fnid, 4
httpClientGetAutoAuthentication_fnid:
	.long	1501602451
	.globl httpClientSetKeepAlive_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetKeepAlive_stub, @object
	.size	httpClientSetKeepAlive_stub, 4
httpClientSetKeepAlive_stub:
	.long	__httpClientSetKeepAlive
	.globl httpClientSetKeepAlive_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetKeepAlive_fnid, @object
	.size	httpClientSetKeepAlive_fnid, 4
httpClientSetKeepAlive_fnid:
	.long	1564946800
	.globl httpClientDeleteHeader_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientDeleteHeader_stub, @object
	.size	httpClientDeleteHeader_stub, 4
httpClientDeleteHeader_stub:
	.long	__httpClientDeleteHeader
	.globl httpClientDeleteHeader_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientDeleteHeader_fnid, @object
	.size	httpClientDeleteHeader_fnid, 4
httpClientDeleteHeader_fnid:
	.long	1635707906
	.globl httpEndCookie_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpEndCookie_stub, @object
	.size	httpEndCookie_stub, 4
httpEndCookie_stub:
	.long	__httpEndCookie
	.globl httpEndCookie_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpEndCookie_fnid, @object
	.size	httpEndCookie_fnid, 4
httpEndCookie_fnid:
	.long	1639103198
	.globl httpRecvResponse_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpRecvResponse_stub, @object
	.size	httpRecvResponse_stub, 4
httpRecvResponse_stub:
	.long	__httpRecvResponse
	.globl httpRecvResponse_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpRecvResponse_fnid, @object
	.size	httpRecvResponse_fnid, 4
httpRecvResponse_fnid:
	.long	1640564369
	.globl httpClientSetSslVersion_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetSslVersion_stub, @object
	.size	httpClientSetSslVersion_stub, 4
httpClientSetSslVersion_stub:
	.long	__httpClientSetSslVersion
	.globl httpClientSetSslVersion_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetSslVersion_fnid, @object
	.size	httpClientSetSslVersion_fnid, 4
httpClientSetSslVersion_fnid:
	.long	1701386133
	.globl httpClientSetAuthenticationCallbackEx_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetAuthenticationCallbackEx_stub, @object
	.size	httpClientSetAuthenticationCallbackEx_stub, 4
httpClientSetAuthenticationCallbackEx_stub:
	.long	__httpClientSetAuthenticationCallbackEx
	.globl httpClientSetAuthenticationCallbackEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetAuthenticationCallbackEx_fnid, @object
	.size	httpClientSetAuthenticationCallbackEx_fnid, 4
httpClientSetAuthenticationCallbackEx_fnid:
	.long	1712145065
	.globl httpClientGetResponseBufferMax_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientGetResponseBufferMax_stub, @object
	.size	httpClientGetResponseBufferMax_stub, 4
httpClientGetResponseBufferMax_stub:
	.long	__httpClientGetResponseBufferMax
	.globl httpClientGetResponseBufferMax_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientGetResponseBufferMax_fnid, @object
	.size	httpClientGetResponseBufferMax_fnid, 4
httpClientGetResponseBufferMax_fnid:
	.long	1753533879
	.globl httpResponseGetStatusLine_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpResponseGetStatusLine_stub, @object
	.size	httpResponseGetStatusLine_stub, 4
httpResponseGetStatusLine_stub:
	.long	__httpResponseGetStatusLine
	.globl httpResponseGetStatusLine_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpResponseGetStatusLine_fnid, @object
	.size	httpResponseGetStatusLine_fnid, 4
httpResponseGetStatusLine_fnid:
	.long	1786885604
	.globl httpClientSetAuthenticationCacheStatus_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetAuthenticationCacheStatus_stub, @object
	.size	httpClientSetAuthenticationCacheStatus_stub, 4
httpClientSetAuthenticationCacheStatus_stub:
	.long	__httpClientSetAuthenticationCacheStatus
	.globl httpClientSetAuthenticationCacheStatus_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetAuthenticationCacheStatus_fnid, @object
	.size	httpClientSetAuthenticationCacheStatus_fnid, 4
httpClientSetAuthenticationCacheStatus_fnid:
	.long	1861044633
	.globl httpClientSetSendTimeout_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetSendTimeout_stub, @object
	.size	httpClientSetSendTimeout_stub, 4
httpClientSetSendTimeout_stub:
	.long	__httpClientSetSendTimeout
	.globl httpClientSetSendTimeout_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetSendTimeout_fnid, @object
	.size	httpClientSetSendTimeout_fnid, 4
httpClientSetSendTimeout_fnid:
	.long	1903250652
	.globl httpClientSetSslIdDestroyCallbackEx_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetSslIdDestroyCallbackEx_stub, @object
	.size	httpClientSetSslIdDestroyCallbackEx_stub, 4
httpClientSetSslIdDestroyCallbackEx_stub:
	.long	__httpClientSetSslIdDestroyCallbackEx
	.globl httpClientSetSslIdDestroyCallbackEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetSslIdDestroyCallbackEx_fnid, @object
	.size	httpClientSetSslIdDestroyCallbackEx_fnid, 4
httpClientSetSslIdDestroyCallbackEx_fnid:
	.long	1930676109
	.globl httpTransactionGetSslCipherName_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpTransactionGetSslCipherName_stub, @object
	.size	httpTransactionGetSslCipherName_stub, 4
httpTransactionGetSslCipherName_stub:
	.long	__httpTransactionGetSslCipherName
	.globl httpTransactionGetSslCipherName_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpTransactionGetSslCipherName_fnid, @object
	.size	httpTransactionGetSslCipherName_fnid, 4
httpTransactionGetSslCipherName_fnid:
	.long	-1990434740
	.globl httpClientSetTotalPoolSize_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetTotalPoolSize_stub, @object
	.size	httpClientSetTotalPoolSize_stub, 4
httpClientSetTotalPoolSize_stub:
	.long	__httpClientSetTotalPoolSize
	.globl httpClientSetTotalPoolSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetTotalPoolSize_fnid, @object
	.size	httpClientSetTotalPoolSize_fnid, 4
httpClientSetTotalPoolSize_fnid:
	.long	-1968833325
	.globl httpRequestSetChunkedTransferStatus_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpRequestSetChunkedTransferStatus_stub, @object
	.size	httpRequestSetChunkedTransferStatus_stub, 4
httpRequestSetChunkedTransferStatus_stub:
	.long	__httpRequestSetChunkedTransferStatus
	.globl httpRequestSetChunkedTransferStatus_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpRequestSetChunkedTransferStatus_fnid, @object
	.size	httpRequestSetChunkedTransferStatus_fnid, 4
httpRequestSetChunkedTransferStatus_fnid:
	.long	-1908441375
	.globl httpClientSetAutoAuthentication_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetAutoAuthentication_stub, @object
	.size	httpClientSetAutoAuthentication_stub, 4
httpClientSetAutoAuthentication_stub:
	.long	__httpClientSetAutoAuthentication
	.globl httpClientSetAutoAuthentication_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetAutoAuthentication_fnid, @object
	.size	httpClientSetAutoAuthentication_fnid, 4
httpClientSetAutoAuthentication_fnid:
	.long	-1901115485
	.globl httpTransactionGetSslCipherVersion_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpTransactionGetSslCipherVersion_stub, @object
	.size	httpTransactionGetSslCipherVersion_stub, 4
httpTransactionGetSslCipherVersion_stub:
	.long	__httpTransactionGetSslCipherVersion
	.globl httpTransactionGetSslCipherVersion_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpTransactionGetSslCipherVersion_fnid, @object
	.size	httpTransactionGetSslCipherVersion_fnid, 4
httpTransactionGetSslCipherVersion_fnid:
	.long	-1813432091
	.globl httpRequestGetContentLength_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpRequestGetContentLength_stub, @object
	.size	httpRequestGetContentLength_stub, 4
httpRequestGetContentLength_stub:
	.long	__httpRequestGetContentLength
	.globl httpRequestGetContentLength_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpRequestGetContentLength_fnid, @object
	.size	httpRequestGetContentLength_fnid, 4
httpRequestGetContentLength_fnid:
	.long	-1786567729
	.globl httpInitCookie_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpInitCookie_stub, @object
	.size	httpInitCookie_stub, 4
httpInitCookie_stub:
	.long	__httpInitCookie
	.globl httpInitCookie_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpInitCookie_fnid, @object
	.size	httpInitCookie_fnid, 4
httpInitCookie_fnid:
	.long	-1774651546
	.globl httpDestroyClient_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpDestroyClient_stub, @object
	.size	httpDestroyClient_stub, 4
httpDestroyClient_stub:
	.long	__httpDestroyClient
	.globl httpDestroyClient_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpDestroyClient_fnid, @object
	.size	httpDestroyClient_fnid, 4
httpDestroyClient_fnid:
	.long	-1744284244
	.globl httpTransactionCloseConnection_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpTransactionCloseConnection_stub, @object
	.size	httpTransactionCloseConnection_stub, 4
httpTransactionCloseConnection_stub:
	.long	__httpTransactionCloseConnection
	.globl httpTransactionCloseConnection_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpTransactionCloseConnection_fnid, @object
	.size	httpTransactionCloseConnection_fnid, 4
httpTransactionCloseConnection_fnid:
	.long	-1596382660
	.globl httpClientSetHeader_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetHeader_stub, @object
	.size	httpClientSetHeader_stub, 4
httpClientSetHeader_stub:
	.long	__httpClientSetHeader
	.globl httpClientSetHeader_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetHeader_fnid, @object
	.size	httpClientSetHeader_fnid, 4
httpClientSetHeader_fnid:
	.long	-1555281041
	.globl httpSendRequest_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpSendRequest_stub, @object
	.size	httpSendRequest_stub, 4
httpSendRequest_stub:
	.long	__httpSendRequest
	.globl httpSendRequest_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpSendRequest_fnid, @object
	.size	httpSendRequest_fnid, 4
httpSendRequest_fnid:
	.long	-1487556603
	.globl httpClientSetPerHostPoolSize_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetPerHostPoolSize_stub, @object
	.size	httpClientSetPerHostPoolSize_stub, 4
httpClientSetPerHostPoolSize_stub:
	.long	__httpClientSetPerHostPoolSize
	.globl httpClientSetPerHostPoolSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetPerHostPoolSize_fnid, @object
	.size	httpClientSetPerHostPoolSize_fnid, 4
httpClientSetPerHostPoolSize_fnid:
	.long	-1424206421
	.globl httpTransactionGetSslVersion_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpTransactionGetSslVersion_stub, @object
	.size	httpTransactionGetSslVersion_stub, 4
httpTransactionGetSslVersion_stub:
	.long	__httpTransactionGetSslVersion
	.globl httpTransactionGetSslVersion_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpTransactionGetSslVersion_fnid, @object
	.size	httpTransactionGetSslVersion_fnid, 4
httpTransactionGetSslVersion_fnid:
	.long	-1390645502
	.globl httpSessionCookieFlush_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpSessionCookieFlush_stub, @object
	.size	httpSessionCookieFlush_stub, 4
httpSessionCookieFlush_stub:
	.long	__httpSessionCookieFlush
	.globl httpSessionCookieFlush_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpSessionCookieFlush_fnid, @object
	.size	httpSessionCookieFlush_fnid, 4
httpSessionCookieFlush_fnid:
	.long	-1385550245
	.globl httpClientPollConnections_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientPollConnections_stub, @object
	.size	httpClientPollConnections_stub, 4
httpClientPollConnections_stub:
	.long	__httpClientPollConnections
	.globl httpClientPollConnections_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientPollConnections_fnid, @object
	.size	httpClientPollConnections_fnid, 4
httpClientPollConnections_fnid:
	.long	-1379883854
	.globl httpClientSetResponseBufferMax_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetResponseBufferMax_stub, @object
	.size	httpClientSetResponseBufferMax_stub, 4
httpClientSetResponseBufferMax_stub:
	.long	__httpClientSetResponseBufferMax
	.globl httpClientSetResponseBufferMax_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetResponseBufferMax_fnid, @object
	.size	httpClientSetResponseBufferMax_fnid, 4
httpClientSetResponseBufferMax_fnid:
	.long	-1378456740
	.globl httpRequestSetContentLength_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpRequestSetContentLength_stub, @object
	.size	httpRequestSetContentLength_stub, 4
httpRequestSetContentLength_stub:
	.long	__httpRequestSetContentLength
	.globl httpRequestSetContentLength_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpRequestSetContentLength_fnid, @object
	.size	httpRequestSetContentLength_fnid, 4
httpRequestSetContentLength_fnid:
	.long	-1351375282
	.globl httpClientSetTransactionStateCallbackEx_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetTransactionStateCallbackEx_stub, @object
	.size	httpClientSetTransactionStateCallbackEx_stub, 4
httpClientSetTransactionStateCallbackEx_stub:
	.long	__httpClientSetTransactionStateCallbackEx
	.globl httpClientSetTransactionStateCallbackEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetTransactionStateCallbackEx_fnid, @object
	.size	httpClientSetTransactionStateCallbackEx_fnid, 4
httpClientSetTransactionStateCallbackEx_fnid:
	.long	-1224820661
	.globl httpClientGetRecvTimeout_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientGetRecvTimeout_stub, @object
	.size	httpClientGetRecvTimeout_stub, 4
httpClientGetRecvTimeout_stub:
	.long	__httpClientGetRecvTimeout
	.globl httpClientGetRecvTimeout_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientGetRecvTimeout_fnid, @object
	.size	httpClientGetRecvTimeout_fnid, 4
httpClientGetRecvTimeout_fnid:
	.long	-1166482145
	.globl httpResponseGetAllHeaders_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpResponseGetAllHeaders_stub, @object
	.size	httpResponseGetAllHeaders_stub, 4
httpResponseGetAllHeaders_stub:
	.long	__httpResponseGetAllHeaders
	.globl httpResponseGetAllHeaders_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpResponseGetAllHeaders_fnid, @object
	.size	httpResponseGetAllHeaders_fnid, 4
httpResponseGetAllHeaders_fnid:
	.long	-1096715383
	.globl httpClientSetRecvBufferSize_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetRecvBufferSize_stub, @object
	.size	httpClientSetRecvBufferSize_stub, 4
httpClientSetRecvBufferSize_stub:
	.long	__httpClientSetRecvBufferSize
	.globl httpClientSetRecvBufferSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetRecvBufferSize_fnid, @object
	.size	httpClientSetRecvBufferSize_fnid, 4
httpClientSetRecvBufferSize_fnid:
	.long	-1083296167
	.globl httpClientSetUserAgent_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetUserAgent_stub, @object
	.size	httpClientSetUserAgent_stub, 4
httpClientSetUserAgent_stub:
	.long	__httpClientSetUserAgent
	.globl httpClientSetUserAgent_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetUserAgent_fnid, @object
	.size	httpClientSetUserAgent_fnid, 4
httpClientSetUserAgent_fnid:
	.long	-892732364
	.globl httpClientGetSslVersion_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientGetSslVersion_stub, @object
	.size	httpClientGetSslVersion_stub, 4
httpClientGetSslVersion_stub:
	.long	__httpClientGetSslVersion
	.globl httpClientGetSslVersion_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientGetSslVersion_fnid, @object
	.size	httpClientGetSslVersion_fnid, 4
httpClientGetSslVersion_fnid:
	.long	-856329418
	.globl httpClientGetPerPipelineMax_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientGetPerPipelineMax_stub, @object
	.size	httpClientGetPerPipelineMax_stub, 4
httpClientGetPerPipelineMax_stub:
	.long	__httpClientGetPerPipelineMax
	.globl httpClientGetPerPipelineMax_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientGetPerPipelineMax_fnid, @object
	.size	httpClientGetPerPipelineMax_fnid, 4
httpClientGetPerPipelineMax_fnid:
	.long	-798191452
	.globl httpClientGetHeader_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientGetHeader_stub, @object
	.size	httpClientGetHeader_stub, 4
httpClientGetHeader_stub:
	.long	__httpClientGetHeader
	.globl httpClientGetHeader_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientGetHeader_fnid, @object
	.size	httpClientGetHeader_fnid, 4
httpClientGetHeader_fnid:
	.long	-773059803
	.globl httpEnd_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpEnd_stub, @object
	.size	httpEnd_stub, 4
httpEnd_stub:
	.long	__httpEnd
	.globl httpEnd_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpEnd_fnid, @object
	.size	httpEnd_fnid, 4
httpEnd_fnid:
	.long	-763953377
	.globl httpTransactionReleaseConnection_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpTransactionReleaseConnection_stub, @object
	.size	httpTransactionReleaseConnection_stub, 4
httpTransactionReleaseConnection_stub:
	.long	__httpTransactionReleaseConnection
	.globl httpTransactionReleaseConnection_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpTransactionReleaseConnection_fnid, @object
	.size	httpTransactionReleaseConnection_fnid, 4
httpTransactionReleaseConnection_fnid:
	.long	-730020250
	.globl httpClientSetConnTimeout_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetConnTimeout_stub, @object
	.size	httpClientSetConnTimeout_stub, 4
httpClientSetConnTimeout_stub:
	.long	__httpClientSetConnTimeout
	.globl httpClientSetConnTimeout_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetConnTimeout_fnid, @object
	.size	httpClientSetConnTimeout_fnid, 4
httpClientSetConnTimeout_fnid:
	.long	-683208568
	.globl httpClientSetProxy_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetProxy_stub, @object
	.size	httpClientSetProxy_stub, 4
httpClientSetProxy_stub:
	.long	__httpClientSetProxy
	.globl httpClientSetProxy_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetProxy_fnid, @object
	.size	httpClientSetProxy_fnid, 4
httpClientSetProxy_fnid:
	.long	-673985187
	.globl httpClientSetSslClientCertificate_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetSslClientCertificate_stub, @object
	.size	httpClientSetSslClientCertificate_stub, 4
httpClientSetSslClientCertificate_stub:
	.long	__httpClientSetSslClientCertificate
	.globl httpClientSetSslClientCertificate_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetSslClientCertificate_fnid, @object
	.size	httpClientSetSslClientCertificate_fnid, 4
httpClientSetSslClientCertificate_fnid:
	.long	-667604416
	.globl httpClientGetVersion_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientGetVersion_stub, @object
	.size	httpClientGetVersion_stub, 4
httpClientGetVersion_stub:
	.long	__httpClientGetVersion
	.globl httpClientGetVersion_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientGetVersion_fnid, @object
	.size	httpClientGetVersion_fnid, 4
httpClientGetVersion_fnid:
	.long	-599763705
	.globl httpClientSetPerPipelineMax_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientSetPerPipelineMax_stub, @object
	.size	httpClientSetPerPipelineMax_stub, 4
httpClientSetPerPipelineMax_stub:
	.long	__httpClientSetPerPipelineMax
	.globl httpClientSetPerPipelineMax_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientSetPerPipelineMax_fnid, @object
	.size	httpClientSetPerPipelineMax_fnid, 4
httpClientSetPerPipelineMax_fnid:
	.long	-595667559
	.globl httpTransactionGetSslCipherString_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpTransactionGetSslCipherString_stub, @object
	.size	httpTransactionGetSslCipherString_stub, 4
httpTransactionGetSslCipherString_stub:
	.long	__httpTransactionGetSslCipherString
	.globl httpTransactionGetSslCipherString_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpTransactionGetSslCipherString_fnid, @object
	.size	httpTransactionGetSslCipherString_fnid, 4
httpTransactionGetSslCipherString_fnid:
	.long	-473684813
	.globl httpsEnd_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpsEnd_stub, @object
	.size	httpsEnd_stub, 4
httpsEnd_stub:
	.long	__httpsEnd
	.globl httpsEnd_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpsEnd_fnid, @object
	.size	httpsEnd_fnid, 4
httpsEnd_fnid:
	.long	-422305745
	.globl httpClientGetCookieStatus_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientGetCookieStatus_stub, @object
	.size	httpClientGetCookieStatus_stub, 4
httpClientGetCookieStatus_stub:
	.long	__httpClientGetCookieStatus
	.globl httpClientGetCookieStatus_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientGetCookieStatus_fnid, @object
	.size	httpClientGetCookieStatus_fnid, 4
httpClientGetCookieStatus_fnid:
	.long	-342090146
	.globl httpRequestAddHeader_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpRequestAddHeader_stub, @object
	.size	httpRequestAddHeader_stub, 4
httpRequestAddHeader_stub:
	.long	__httpRequestAddHeader
	.globl httpRequestAddHeader_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpRequestAddHeader_fnid, @object
	.size	httpRequestAddHeader_fnid, 4
httpRequestAddHeader_fnid:
	.long	-308727481
	.globl httpClientGetUserAgent_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientGetUserAgent_stub, @object
	.size	httpClientGetUserAgent_stub, 4
httpClientGetUserAgent_stub:
	.long	__httpClientGetUserAgent
	.globl httpClientGetUserAgent_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientGetUserAgent_fnid, @object
	.size	httpClientGetUserAgent_fnid, 4
httpClientGetUserAgent_fnid:
	.long	-301616959
	.globl httpCookieExportWithClientId_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpCookieExportWithClientId_stub, @object
	.size	httpCookieExportWithClientId_stub, 4
httpCookieExportWithClientId_stub:
	.long	__httpCookieExportWithClientId
	.globl httpCookieExportWithClientId_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpCookieExportWithClientId_fnid, @object
	.size	httpCookieExportWithClientId_fnid, 4
httpCookieExportWithClientId_fnid:
	.long	-109918413
	.globl httpClientGetAuthenticationCacheStatus_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientGetAuthenticationCacheStatus_stub, @object
	.size	httpClientGetAuthenticationCacheStatus_stub, 4
httpClientGetAuthenticationCacheStatus_stub:
	.long	__httpClientGetAuthenticationCacheStatus
	.globl httpClientGetAuthenticationCacheStatus_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientGetAuthenticationCacheStatus_fnid, @object
	.size	httpClientGetAuthenticationCacheStatus_fnid, 4
httpClientGetAuthenticationCacheStatus_fnid:
	.long	-52194493
	.globl httpClientGetPerHostPoolSize_stub
	.section	.data.sceFStub.cellHttp
	.align 2
	.type	httpClientGetPerHostPoolSize_stub, @object
	.size	httpClientGetPerHostPoolSize_stub, 4
httpClientGetPerHostPoolSize_stub:
	.long	__httpClientGetPerHostPoolSize
	.globl httpClientGetPerHostPoolSize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	httpClientGetPerHostPoolSize_fnid, @object
	.size	httpClientGetPerHostPoolSize_fnid, 4
httpClientGetPerHostPoolSize_fnid:
	.long	-3719165
	.ident	"GCC: (GNU) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
