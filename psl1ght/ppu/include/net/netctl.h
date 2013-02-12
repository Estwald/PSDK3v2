#ifndef __LV2_NETCTL_H__
#define __LV2_NETCTL_H__

#include <ppu-types.h>
#include <net/net.h>
#include <netinet/in.h>

/* info */
#define NET_CTL_INFO_DEVICE                           (1)
#define NET_CTL_INFO_ETHER_ADDR                       (2)
#define NET_CTL_INFO_MTU                              (3)
#define NET_CTL_INFO_LINK                             (4)
#define NET_CTL_INFO_LINK_TYPE                        (5)
#define NET_CTL_INFO_BSSID                            (6)
#define NET_CTL_INFO_SSID                             (7)
#define NET_CTL_INFO_WLAN_SECURITY                    (8)
#define NET_CTL_INFO_8021X_TYPE                       (9)
#define NET_CTL_INFO_8021X_AUTH_NAME                  (10)
#define NET_CTL_INFO_RSSI                             (11)
#define NET_CTL_INFO_CHANNEL                          (12)
#define NET_CTL_INFO_IP_CONFIG                        (13)
#define NET_CTL_INFO_DHCP_HOSTNAME                    (14)
#define NET_CTL_INFO_PPPOE_AUTH_NAME                  (15)
#define NET_CTL_INFO_IP_ADDRESS                       (16)
#define NET_CTL_INFO_NETMASK                          (17)
#define NET_CTL_INFO_DEFAULT_ROUTE                    (18)
#define NET_CTL_INFO_PRIMARY_DNS                      (19)
#define NET_CTL_INFO_SECONDARY_DNS                    (20)
#define NET_CTL_INFO_HTTP_PROXY_CONFIG                (21)
#define NET_CTL_INFO_HTTP_PROXY_SERVER                (22)
#define NET_CTL_INFO_HTTP_PROXY_PORT                  (23)
#define NET_CTL_INFO_UPNP_CONFIG                      (24)

/* lengths */
#define NET_CTL_ETHER_ADDR_LEN                        (6)
#define NET_CTL_BSSID_LEN                             (6)
#define NET_CTL_SSID_LEN                              (32)
#define NET_CTL_WLAN_SECURITY_KEY_LEN                 (65)
#define NET_CTL_AUTH_NAME_LEN                         (128)
#define NET_CTL_AUTH_KEY_LEN                          (128)
#define NET_CTL_DHCP_HOSTNAME_LEN                     (255)
#define NET_CTL_HOSTNAME_LEN                          (256)
#define NET_CTL_IPV4_ADDR_STR_LEN                     (16)

/* states */
#define NET_CTL_STATE_Disconnected                    (0)
#define NET_CTL_STATE_Connecting                      (1)
#define NET_CTL_STATE_IPObtaining                     (2)
#define NET_CTL_STATE_IPObtained                      (3)

/* events */
#define NET_CTL_EVENT_CONNECT_REQ                     (0)
#define NET_CTL_EVENT_ESTABLISH                       (1)
#define NET_CTL_EVENT_GET_IP                          (2)
#define NET_CTL_EVENT_DISCONNECT_REQ                  (3)
#define NET_CTL_EVENT_ERROR                           (4)
#define NET_CTL_EVENT_LINK_DISCONNECTED               (5)
#define NET_CTL_EVENT_AUTO_RETRY                      (6)

/* device types */
#define NET_CTL_DEVICE_WIRED                          (0)
#define NET_CTL_DEVICE_WIRELESS                       (1)

/* link_type */
#define NET_CTL_LINK_TYPE_AUTO                        (0)
#define NET_CTL_LINK_TYPE_10BASE_HALF                 (1)
#define NET_CTL_LINK_TYPE_10BASE_FULL                 (2)
#define NET_CTL_LINK_TYPE_100BASE_HALF                (3)
#define NET_CTL_LINK_TYPE_100BASE_FULL                (4)
#define NET_CTL_LINK_TYPE_1000BASE_HALF               (5)
#define NET_CTL_LINK_TYPE_1000BASE_FULL               (6)

/* link status */
#define NET_CTL_LINK_DISCONNECTED                     (0)
#define NET_CTL_LINK_CONNECTED                        (1)

/* wlan_security */
#define NET_CTL_WLAN_SECURITY_NOAUTH                  (0)
#define NET_CTL_WLAN_SECURITY_WEP                     (1)
#define NET_CTL_WLAN_SECURITY_WPAPSK_TKIP             (2)
#define NET_CTL_WLAN_SECURITY_WPAPSK_AES              (3)
#define NET_CTL_WLAN_SECURITY_WPA2PSK_TKIP            (5)
#define NET_CTL_WLAN_SECURITY_WPA2PSK_AES             (6)
#define NET_CTL_WLAN_SECURITY_WPAPSK_WPA2PSK          (7)

/* 8021x_type */
#define NET_CTL_8021X_NONE                            (0)
#define NET_CTL_8021X_EAP_MD5                         (1)

/* ip config */
#define NET_CTL_IP_DHCP                               (0)
#define NET_CTL_IP_STATIC                             (1)
#define NET_CTL_IP_PPPOE                              (2)

/* http proxy config */
#define NET_CTL_HTTP_PROXY_OFF                        (0)
#define NET_CTL_HTTP_PROXY_ON                         (1)

/* upnp config */
#define NET_CTL_UPNP_ON                               (0)
#define NET_CTL_UPNP_OFF                              (1)

/* upnp status */
#define NET_CTL_NATINFO_UPNP_UNCHECKED                (0)
#define NET_CTL_NATINFO_UPNP_NO                       (1)
#define NET_CTL_NATINFO_UPNP_USED                     (2)

/* stun staus */
#define NET_CTL_NATINFO_STUN_UNCHECKED                (0)
#define NET_CTL_NATINFO_STUN_FAILED                   (1)
#define NET_CTL_NATINFO_STUN_OK                       (2)

/* nat type */
#define NET_CTL_NATINFO_NAT_TYPE_1                    (1)
#define NET_CTL_NATINFO_NAT_TYPE_2                    (2)
#define NET_CTL_NATINFO_NAT_TYPE_3                    (3)

/* type */
#define NET_CTL_NETSTART_TYPE_NET                     (0)
#define NET_CTL_NETSTART_TYPE_NP                      (1)
#define NET_CTL_NETSTART_TYPE_MAX                     (2)


/* status for sysutil callback */
#define SYSUTIL_NET_CTL_NETSTART_LOADED               (0x0801)
#define SYSUTIL_NET_CTL_NETSTART_FINISHED             (0x0802)
#define SYSUTIL_NET_CTL_NETSTART_UNLOADED             (0x0803)

/* 0x80130100 - 0x8013011f: libnetctl */
#define NET_CTL_ERROR_NOT_INITIALIZED                 (0x80130101) /* library not initialized */
#define NET_CTL_ERROR_NOT_TERMINATED                  (0x80130102) /* not terminated */
#define NET_CTL_ERROR_HANDLER_MAX                     (0x80130103) /* no space for new handler */
#define NET_CTL_ERROR_ID_NOT_FOUND                    (0x80130104) /* specified ID not found */
#define NET_CTL_ERROR_INVALID_ID                      (0x80130105) /* specified ID invalid */
#define NET_CTL_ERROR_INVALID_CODE                    (0x80130106) /* specified code invalid */
#define NET_CTL_ERROR_INVALID_ADDR                    (0x80130107) /* specified addr invalid */
#define NET_CTL_ERROR_NOT_CONNECTED                   (0x80130108) /* not connected */
#define NET_CTL_ERROR_NOT_AVAIL                       (0x80130109) /* not available */
#define NET_CTL_ERROR_INVALID_TYPE                    (0x8013010a) /* type invalid */
#define NET_CTL_ERROR_INVALID_SIZE                    (0x8013010b) /* size invalid */

/* 0x80130180 - 0x8013019f: libnetctl NetStart dialog */
#define NET_CTL_ERROR_NET_DISABLED                    (0x80130181) /* internet connection disabled */
#define NET_CTL_ERROR_NET_NOT_CONNECTED               (0x80130182) /* no IP addr */
#define NET_CTL_ERROR_NET_CABLE_NOT_CONNECTED         (0x80130186) /* ethernet cable not connected */

#define NET_CTL_ERROR_DIALOG_CANCELED                 (0x80130190) /* dialog closed by user */
#define NET_CTL_ERROR_DIALOG_ABORTED                  (0x80130191) /* dialog aborted by API */

/* network error code which comes from libnetctl handler */
/* WLAN error */
#define NET_CTL_ERROR_WLAN_DEAUTHED                   (0x80130137) /* deauthed/disassociated from AP */
#define NET_CTL_ERROR_WLAN_KEYINFO_EXCHNAGE_TIMEOUT   (0x8013013d) /* WPA key exchange has timed out */
#define NET_CTL_ERROR_WLAN_ASSOC_FAILED               (0x8013013e) /* association failed */
#define NET_CTL_ERROR_WLAN_AP_DISAPPEARED             (0x8013013f) /* access point has disappeared */

/* PPPoE error */
#define NET_CTL_ERROR_PPPOE_SESSION_INIT              (0x80130409) /* initialization error */
#define NET_CTL_ERROR_PPPOE_SESSION_NO_PADO           (0x8013040a) /* cannot get PADO */
#define NET_CTL_ERROR_PPPOE_SESSION_NO_PADS           (0x8013040b) /* cannot get PADS */
#define NET_CTL_ERROR_PPPOE_SESSION_GET_PADT          (0x8013040d) /* PADT received */
#define NET_CTL_ERROR_PPPOE_SESSION_SERVICE_NAME      (0x8013040f) /* service name error */
#define NET_CTL_ERROR_PPPOE_SESSION_AC_SYSTEM         (0x80130410) /* AC system error */
#define NET_CTL_ERROR_PPPOE_SESSION_GENERIC           (0x80130411) /* generic error */
#define NET_CTL_ERROR_PPPOE_STATUS_AUTH               (0x80130412) /* authentication error */
#define NET_CTL_ERROR_PPPOE_STATUS_NETWORK            (0x80130413) /* network error */
#define NET_CTL_ERROR_PPPOE_STATUS_TERMINATE          (0x80130414) /* terminate error */

/* DHCP error */
#define NET_CTL_ERROR_DHCP_LEASE_TIME                 (0x80130504) /* lease expired */


#ifdef __cplusplus
extern "C" {
#endif

struct net_ctl_ether_addr {
    u8 data[NET_CTL_ETHER_ADDR_LEN];
    u8 padding[2];
};

struct net_ctl_SSID {
    u8 data[NET_CTL_SSID_LEN];
    u8 term;
    u8 padding[3];
};

struct net_ctl_nat_info {
    size_t size;
    int upnp_status;
    int stun_status;
    int nat_type;
    struct in_addr mapped_addr;
};

struct net_ctl_net_start_dialog_param {
    size_t size;
    int type;
    uint32_t cid;
};

struct net_ctl_net_start_dialog_result {
    size_t size;
    int result;
};

union net_ctl_info {
    u32 device;
    struct net_ctl_ether_addr ether_addr;
    u32 mtu;
    u32 link;
    u32 link_type;
    struct net_ctl_ether_addr bssid;
    struct net_ctl_SSID ssid;
    u32 wlan_security;
    u32 auth_8021x_type;
    char auth_8021x_auth_name[NET_CTL_AUTH_NAME_LEN];
    u8 rssi;
    u8 channel;
    u32 ip_config;
    char dhcp_hostname[NET_CTL_HOSTNAME_LEN];
    char pppoe_auth_name[NET_CTL_AUTH_NAME_LEN];
    char ip_address[NET_CTL_IPV4_ADDR_STR_LEN];
    char netmask[NET_CTL_IPV4_ADDR_STR_LEN];
    char default_route[NET_CTL_IPV4_ADDR_STR_LEN];
    char primary_dns[NET_CTL_IPV4_ADDR_STR_LEN];
    char secondary_dns[NET_CTL_IPV4_ADDR_STR_LEN];
    u32 http_proxy_config;
    char http_proxy_server[NET_CTL_HOSTNAME_LEN];
    u16 http_proxy_port;
    u32 upnp_config;
};


s32 netCtlInit(void);
void netCtlTerm(void);
s32 netCtlGetInfo(s32 code,union net_ctl_info *info);
s32 netCtlGetState(s32 *state);
s32 netCtlGetNatInfo(struct net_ctl_nat_info *natinfo);
/*
typedef void (*net_ctl_handler)(s32 prev_state, s32 new_state, s32 event, s32 error_code, void *arg);
s32 netCtlAddHandler(net_ctl_handler handler, void *arg, s32 *hid);
s32 netCtlDelHandler(s32 hid);
s32 netCtlNetStartDialogLoadAsync(struct net_ctl_net_start_dialog_param *param);
s32 netCtlNetStartDialogAbortAsync(void);
s32 netCtlNetStartDialogUnloadAsync(struct net_ctl_net_start_dialog_result *result);
*/
#ifdef __cplusplus
    }
#endif

#endif
