	.file	"libexport.c"
	.section	".got","aw"
	.section	".text"
	.section	.data.sceFStub.sys_net,"aw",@progbits
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
	.string	"sys_net"
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
	.4byte	sys_net
	.4byte	scefstub
	.4byte	0
	.4byte	0
	.4byte	0
	.4byte	0
	.globl netErrnoLoc_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netErrnoLoc_stub, @object
	.size	netErrnoLoc_stub, 4
netErrnoLoc_stub:
	.long	__netErrnoLoc
	.globl netErrnoLoc_fnid
	.section	.rodata.sceFNID,"a",@progbits
	.align 2
	.type	netErrnoLoc_fnid, @object
	.size	netErrnoLoc_fnid, 4
netErrnoLoc_fnid:
	.long	1610993121
	.globl netHErrnoLoc_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netHErrnoLoc_stub, @object
	.size	netHErrnoLoc_stub, 4
netHErrnoLoc_stub:
	.long	__netHErrnoLoc
	.globl netHErrnoLoc_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netHErrnoLoc_fnid, @object
	.size	netHErrnoLoc_fnid, 4
netHErrnoLoc_fnid:
	.long	-921338576
	.globl netAccept_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netAccept_stub, @object
	.size	netAccept_stub, 4
netAccept_stub:
	.long	__netAccept
	.globl netAccept_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netAccept_fnid, @object
	.size	netAccept_fnid, 4
netAccept_fnid:
	.long	-917542599
	.globl netBind_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netBind_stub, @object
	.size	netBind_stub, 4
netBind_stub:
	.long	__netBind
	.globl netBind_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netBind_fnid, @object
	.size	netBind_fnid, 4
netBind_fnid:
	.long	-1331324924
	.globl netConnect_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netConnect_stub, @object
	.size	netConnect_stub, 4
netConnect_stub:
	.long	__netConnect
	.globl netConnect_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netConnect_fnid, @object
	.size	netConnect_fnid, 4
netConnect_fnid:
	.long	1693871413
	.globl netGetHostByAddr_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netGetHostByAddr_stub, @object
	.size	netGetHostByAddr_stub, 4
netGetHostByAddr_stub:
	.long	__netGetHostByAddr
	.globl netGetHostByAddr_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netGetHostByAddr_fnid, @object
	.size	netGetHostByAddr_fnid, 4
netGetHostByAddr_fnid:
	.long	-139687615
	.globl netGetHostByName_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netGetHostByName_stub, @object
	.size	netGetHostByName_stub, 4
netGetHostByName_stub:
	.long	__netGetHostByName
	.globl netGetHostByName_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netGetHostByName_fnid, @object
	.size	netGetHostByName_fnid, 4
netGetHostByName_fnid:
	.long	1911867159
	.globl netGetPeerName_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netGetPeerName_stub, @object
	.size	netGetPeerName_stub, 4
netGetPeerName_stub:
	.long	__netGetPeerName
	.globl netGetPeerName_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netGetPeerName_fnid, @object
	.size	netGetPeerName_fnid, 4
netGetPeerName_fnid:
	.long	-101962314
	.globl netGetSockName_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netGetSockName_stub, @object
	.size	netGetSockName_stub, 4
netGetSockName_stub:
	.long	__netGetSockName
	.globl netGetSockName_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netGetSockName_fnid, @object
	.size	netGetSockName_fnid, 4
netGetSockName_fnid:
	.long	334489589
	.globl netGetSockOpt_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netGetSockOpt_stub, @object
	.size	netGetSockOpt_stub, 4
netGetSockOpt_stub:
	.long	__netGetSockOpt
	.globl netGetSockOpt_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netGetSockOpt_fnid, @object
	.size	netGetSockOpt_fnid, 4
netGetSockOpt_fnid:
	.long	1510235089
	.globl inet_addr_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	inet_addr_stub, @object
	.size	inet_addr_stub, 4
inet_addr_stub:
	.long	__inet_addr
	.globl inet_addr_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	inet_addr_fnid, @object
	.size	inet_addr_fnid, 4
inet_addr_fnid:
	.long	-625229120
	.globl inet_aton_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	inet_aton_stub, @object
	.size	inet_aton_stub, 4
inet_aton_stub:
	.long	__inet_aton
	.globl inet_aton_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	inet_aton_fnid, @object
	.size	inet_aton_fnid, 4
inet_aton_fnid:
	.long	-1449100832
	.globl inet_lnaof_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	inet_lnaof_stub, @object
	.size	inet_lnaof_stub, 4
inet_lnaof_stub:
	.long	__inet_lnaof
	.globl inet_lnaof_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	inet_lnaof_fnid, @object
	.size	inet_lnaof_fnid, 4
inet_lnaof_fnid:
	.long	1449694158
	.globl inet_makeaddr_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	inet_makeaddr_stub, @object
	.size	inet_makeaddr_stub, 4
inet_makeaddr_stub:
	.long	__inet_makeaddr
	.globl inet_makeaddr_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	inet_makeaddr_fnid, @object
	.size	inet_makeaddr_fnid, 4
inet_makeaddr_fnid:
	.long	-1273680780
	.globl inet_netof_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	inet_netof_stub, @object
	.size	inet_netof_stub, 4
inet_netof_stub:
	.long	__inet_netof
	.globl inet_netof_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	inet_netof_fnid, @object
	.size	inet_netof_fnid, 4
inet_netof_fnid:
	.long	-476421465
	.globl inet_network_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	inet_network_stub, @object
	.size	inet_network_stub, 4
inet_network_stub:
	.long	__inet_network
	.globl inet_network_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	inet_network_fnid, @object
	.size	inet_network_fnid, 4
inet_network_fnid:
	.long	1349179491
	.globl inet_ntoa_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	inet_ntoa_stub, @object
	.size	inet_ntoa_stub, 4
inet_ntoa_stub:
	.long	__inet_ntoa
	.globl inet_ntoa_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	inet_ntoa_fnid, @object
	.size	inet_ntoa_fnid, 4
inet_ntoa_fnid:
	.long	-2054515957
	.globl inet_ntop_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	inet_ntop_stub, @object
	.size	inet_ntop_stub, 4
inet_ntop_stub:
	.long	__inet_ntop
	.globl inet_ntop_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	inet_ntop_fnid, @object
	.size	inet_ntop_fnid, 4
inet_ntop_fnid:
	.long	-913690298
	.globl inet_pton_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	inet_pton_stub, @object
	.size	inet_pton_stub, 4
inet_pton_stub:
	.long	__inet_pton
	.globl inet_pton_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	inet_pton_fnid, @object
	.size	inet_pton_fnid, 4
inet_pton_fnid:
	.long	-1963752866
	.globl netListen_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netListen_stub, @object
	.size	netListen_stub, 4
netListen_stub:
	.long	__netListen
	.globl netListen_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netListen_fnid, @object
	.size	netListen_fnid, 4
netListen_fnid:
	.long	685902011
	.globl netRecv_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netRecv_stub, @object
	.size	netRecv_stub, 4
netRecv_stub:
	.long	__netRecv
	.globl netRecv_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netRecv_fnid, @object
	.size	netRecv_fnid, 4
netRecv_fnid:
	.long	-73380041
	.globl netRecvFrom_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netRecvFrom_stub, @object
	.size	netRecvFrom_stub, 4
netRecvFrom_stub:
	.long	__netRecvFrom
	.globl netRecvFrom_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netRecvFrom_fnid, @object
	.size	netRecvFrom_fnid, 4
netRecvFrom_fnid:
	.long	529873823
	.globl netRecvMsg_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netRecvMsg_stub, @object
	.size	netRecvMsg_stub, 4
netRecvMsg_stub:
	.long	__netRecvMsg
	.globl netRecvMsg_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netRecvMsg_fnid, @object
	.size	netRecvMsg_fnid, 4
netRecvMsg_fnid:
	.long	-909075404
	.globl netSend_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netSend_stub, @object
	.size	netSend_stub, 4
netSend_stub:
	.long	__netSend
	.globl netSend_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netSend_fnid, @object
	.size	netSend_fnid, 4
netSend_fnid:
	.long	-596305088
	.globl netSendMsg_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netSendMsg_stub, @object
	.size	netSendMsg_stub, 4
netSendMsg_stub:
	.long	__netSendMsg
	.globl netSendMsg_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netSendMsg_fnid, @object
	.size	netSendMsg_fnid, 4
netSendMsg_fnid:
	.long	-1391900645
	.globl netSendTo_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netSendTo_stub, @object
	.size	netSendTo_stub, 4
netSendTo_stub:
	.long	__netSendTo
	.globl netSendTo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netSendTo_fnid, @object
	.size	netSendTo_fnid, 4
netSendTo_fnid:
	.long	-1773709557
	.globl netSetSockOpt_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netSetSockOpt_stub, @object
	.size	netSetSockOpt_stub, 4
netSetSockOpt_stub:
	.long	__netSetSockOpt
	.globl netSetSockOpt_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netSetSockOpt_fnid, @object
	.size	netSetSockOpt_fnid, 4
netSetSockOpt_fnid:
	.long	-1997523595
	.globl netShutdown_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netShutdown_stub, @object
	.size	netShutdown_stub, 4
netShutdown_stub:
	.long	__netShutdown
	.globl netShutdown_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netShutdown_fnid, @object
	.size	netShutdown_fnid, 4
netShutdown_fnid:
	.long	-1526237242
	.globl netSocket_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netSocket_stub, @object
	.size	netSocket_stub, 4
netSocket_stub:
	.long	__netSocket
	.globl netSocket_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netSocket_fnid, @object
	.size	netSocket_fnid, 4
netSocket_fnid:
	.long	-1677366942
	.globl netClose_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netClose_stub, @object
	.size	netClose_stub, 4
netClose_stub:
	.long	__netClose
	.globl netClose_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netClose_fnid, @object
	.size	netClose_fnid, 4
netClose_fnid:
	.long	1840703693
	.globl netPoll_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netPoll_stub, @object
	.size	netPoll_stub, 4
netPoll_stub:
	.long	__netPoll
	.globl netPoll_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netPoll_fnid, @object
	.size	netPoll_fnid, 4
netPoll_fnid:
	.long	85910510
	.globl netSelect_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netSelect_stub, @object
	.size	netSelect_stub, 4
netSelect_stub:
	.long	__netSelect
	.globl netSelect_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netSelect_fnid, @object
	.size	netSelect_fnid, 4
netSelect_fnid:
	.long	1057612298
	.globl netAbortResolver_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netAbortResolver_stub, @object
	.size	netAbortResolver_stub, 4
netAbortResolver_stub:
	.long	__netAbortResolver
	.globl netAbortResolver_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netAbortResolver_fnid, @object
	.size	netAbortResolver_fnid, 4
netAbortResolver_fnid:
	.long	-1932589587
	.globl netAbortSocket_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netAbortSocket_stub, @object
	.size	netAbortSocket_stub, 4
netAbortSocket_stub:
	.long	__netAbortSocket
	.globl netAbortSocket_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netAbortSocket_fnid, @object
	.size	netAbortSocket_fnid, 4
netAbortSocket_fnid:
	.long	-1927579653
	.globl netCloseDump_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netCloseDump_stub, @object
	.size	netCloseDump_stub, 4
netCloseDump_stub:
	.long	__netCloseDump
	.globl netCloseDump_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netCloseDump_fnid, @object
	.size	netCloseDump_fnid, 4
netCloseDump_fnid:
	.long	1144162978
	.globl netFinalizeNetwork_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netFinalizeNetwork_stub, @object
	.size	netFinalizeNetwork_stub, 4
netFinalizeNetwork_stub:
	.long	__netFinalizeNetwork
	.globl netFinalizeNetwork_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netFinalizeNetwork_fnid, @object
	.size	netFinalizeNetwork_fnid, 4
netFinalizeNetwork_fnid:
	.long	-1232251355
	.globl netFreethreadContext_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netFreethreadContext_stub, @object
	.size	netFreethreadContext_stub, 4
netFreethreadContext_stub:
	.long	__netFreethreadContext
	.globl netFreethreadContext_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netFreethreadContext_fnid, @object
	.size	netFreethreadContext_fnid, 4
netFreethreadContext_fnid:
	.long	-38209242
	.globl netGetLibNameServer_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netGetLibNameServer_stub, @object
	.size	netGetLibNameServer_stub, 4
netGetLibNameServer_stub:
	.long	__netGetLibNameServer
	.globl netGetLibNameServer_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netGetLibNameServer_fnid, @object
	.size	netGetLibNameServer_fnid, 4
netGetLibNameServer_fnid:
	.long	487904996
	.globl netGetNetEmuTestParam_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netGetNetEmuTestParam_stub, @object
	.size	netGetNetEmuTestParam_stub, 4
netGetNetEmuTestParam_stub:
	.long	__netGetNetEmuTestParam
	.globl netGetNetEmuTestParam_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netGetNetEmuTestParam_fnid, @object
	.size	netGetNetEmuTestParam_fnid, 4
netGetNetEmuTestParam_fnid:
	.long	914891712
	.globl netGetSockInfo_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netGetSockInfo_stub, @object
	.size	netGetSockInfo_stub, 4
netGetSockInfo_stub:
	.long	__netGetSockInfo
	.globl netGetSockInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netGetSockInfo_fnid, @object
	.size	netGetSockInfo_fnid, 4
netGetSockInfo_fnid:
	.long	992462720
	.globl netGetSockInfoEx_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netGetSockInfoEx_stub, @object
	.size	netGetSockInfoEx_stub, 4
netGetSockInfoEx_stub:
	.long	__netGetSockInfoEx
	.globl netGetSockInfoEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netGetSockInfoEx_fnid, @object
	.size	netGetSockInfoEx_fnid, 4
netGetSockInfoEx_fnid:
	.long	-1486499799
	.globl netGetTestParam_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netGetTestParam_stub, @object
	.size	netGetTestParam_stub, 4
netGetTestParam_stub:
	.long	__netGetTestParam
	.globl netGetTestParam_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netGetTestParam_fnid, @object
	.size	netGetTestParam_fnid, 4
netGetTestParam_fnid:
	.long	-1515690665
	.globl netGetUdpp2pTestparam_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netGetUdpp2pTestparam_stub, @object
	.size	netGetUdpp2pTestparam_stub, 4
netGetUdpp2pTestparam_stub:
	.long	__netGetUdpp2pTestparam
	.globl netGetUdpp2pTestparam_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netGetUdpp2pTestparam_fnid, @object
	.size	netGetUdpp2pTestparam_fnid, 4
netGetUdpp2pTestparam_fnid:
	.long	96289848
	.globl netIfCtl_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netIfCtl_stub, @object
	.size	netIfCtl_stub, 4
netIfCtl_stub:
	.long	__netIfCtl
	.globl netIfCtl_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netIfCtl_fnid, @object
	.size	netIfCtl_fnid, 4
netIfCtl_fnid:
	.long	670774173
	.globl netInitializeNetworkEx_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netInitializeNetworkEx_stub, @object
	.size	netInitializeNetworkEx_stub, 4
netInitializeNetworkEx_stub:
	.long	__netInitializeNetworkEx
	.globl netInitializeNetworkEx_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netInitializeNetworkEx_fnid, @object
	.size	netInitializeNetworkEx_fnid, 4
netInitializeNetworkEx_fnid:
	.long	328900251
	.globl netOpenDump_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netOpenDump_stub, @object
	.size	netOpenDump_stub, 4
netOpenDump_stub:
	.long	__netOpenDump
	.globl netOpenDump_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netOpenDump_fnid, @object
	.size	netOpenDump_fnid, 4
netOpenDump_fnid:
	.long	-1421576444
	.globl netReadDump_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netReadDump_stub, @object
	.size	netReadDump_stub, 4
netReadDump_stub:
	.long	__netReadDump
	.globl netReadDump_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netReadDump_fnid, @object
	.size	netReadDump_fnid, 4
netReadDump_fnid:
	.long	-1983278724
	.globl netSetlibNameServer_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netSetlibNameServer_stub, @object
	.size	netSetlibNameServer_stub, 4
netSetlibNameServer_stub:
	.long	__netSetlibNameServer
	.globl netSetlibNameServer_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netSetlibNameServer_fnid, @object
	.size	netSetlibNameServer_fnid, 4
netSetlibNameServer_fnid:
	.long	-1708031399
	.globl netSetnetemutestparam_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netSetnetemutestparam_stub, @object
	.size	netSetnetemutestparam_stub, 4
netSetnetemutestparam_stub:
	.long	__netSetnetemutestparam
	.globl netSetnetemutestparam_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netSetnetemutestparam_fnid, @object
	.size	netSetnetemutestparam_fnid, 4
netSetnetemutestparam_fnid:
	.long	-498907897
	.globl netSetResolverConfigurations_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netSetResolverConfigurations_stub, @object
	.size	netSetResolverConfigurations_stub, 4
netSetResolverConfigurations_stub:
	.long	__netSetResolverConfigurations
	.globl netSetResolverConfigurations_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netSetResolverConfigurations_fnid, @object
	.size	netSetResolverConfigurations_fnid, 4
netSetResolverConfigurations_fnid:
	.long	1988613260
	.globl netSetTestParam_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netSetTestParam_stub, @object
	.size	netSetTestParam_stub, 4
netSetTestParam_stub:
	.long	__netSetTestParam
	.globl netSetTestParam_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netSetTestParam_fnid, @object
	.size	netSetTestParam_fnid, 4
netSetTestParam_fnid:
	.long	1253095865
	.globl netSetUdpp2pTestParam_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netSetUdpp2pTestParam_stub, @object
	.size	netSetUdpp2pTestParam_stub, 4
netSetUdpp2pTestParam_stub:
	.long	__netSetUdpp2pTestParam
	.globl netSetUdpp2pTestParam_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netSetUdpp2pTestParam_fnid, @object
	.size	netSetUdpp2pTestParam_fnid, 4
netSetUdpp2pTestParam_fnid:
	.long	280501974
	.globl netShowIfConfig_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netShowIfConfig_stub, @object
	.size	netShowIfConfig_stub, 4
netShowIfConfig_stub:
	.long	__netShowIfConfig
	.globl netShowIfConfig_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netShowIfConfig_fnid, @object
	.size	netShowIfConfig_fnid, 4
netShowIfConfig_fnid:
	.long	-1266272572
	.globl netShowNameserver_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netShowNameserver_stub, @object
	.size	netShowNameserver_stub, 4
netShowNameserver_stub:
	.long	__netShowNameserver
	.globl netShowNameserver_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netShowNameserver_fnid, @object
	.size	netShowNameserver_fnid, 4
netShowNameserver_fnid:
	.long	1411441689
	.globl netShowRoute_stub
	.section	.data.sceFStub.sys_net
	.align 2
	.type	netShowRoute_stub, @object
	.size	netShowRoute_stub, 4
netShowRoute_stub:
	.long	__netShowRoute
	.globl netShowRoute_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	netShowRoute_fnid, @object
	.size	netShowRoute_fnid, 4
netShowRoute_fnid:
	.long	2041976390
	.ident	"GCC: (GNU) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
