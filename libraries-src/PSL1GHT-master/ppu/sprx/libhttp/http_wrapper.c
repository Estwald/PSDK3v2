#include <stdio.h>
#include <ppu-asm.h>

#include <http/http.h>


extern s32 httpClientSetAuthenticationCallbackEx(httpClientId cid, opd32 *opd, void *arg);
extern s32 httpClientSetTransactionStateCallbackEx(httpClientId cid, opd32 *opd, void *arg);
extern s32 httpClientSetRedirectCallbackEx(httpClientId cid, opd32 *opd, void *arg);
extern s32 httpClientSetCookieSendCallbackEx(httpClientId cid, opd32 *opd, void *arg);
extern s32 httpClientSetCookieRecvCallbackEx(httpClientId cid, opd32 *opd, void *arg);


s32 httpClientSetAuthenticationCallback(httpClientId cid,httpAuthenticationCallback cb,void *arg)
{
    printf ( "IN: httpClientSetAuthenticationStateCallback(%p, %p, %p)\n", cid, cb, arg ) ;
    printf ( "OUT: httpClientSetAuthenticationStateCallbackEx(%p, %p, %p)\n", cid, (opd32*)__get_opd32(cb), arg ) ;
    return httpClientSetAuthenticationCallbackEx(cid,(opd32*)__get_opd32(cb),arg);
}

s32 httpClientSetTransactionStateCallback(httpClientId cid,httpTransactionStateCallback cb,void *arg)
{
    printf ( "IN: httpClientSetTransactionStateCallback(%p, %p, %p)\n", cid, cb, arg ) ;
    printf ( "OUT: httpClientSetTransactionStateCallbackEx(%p, %p, %p)\n", cid, (opd32*)__get_opd32(cb), arg ) ;
    return httpClientSetTransactionStateCallbackEx(cid,(opd32*)__get_opd32(cb),arg);
}

s32 httpClientSetRedirectCallback(httpClientId cid,httpRedirectCallback cb,void *arg)
{
    printf ( "IN: httpClientSetRedirectCallback(%p, %p, %p)\n", cid, cb, arg ) ;
    printf ( "OUT: httpClientSetRedirectCallbackEx(%p, %p, %p)\n", cid, (opd32*)__get_opd32(cb), arg ) ;
    return httpClientSetRedirectCallbackEx(cid,(opd32*)__get_opd32(cb),arg);
}

s32 httpClientSetCookieSendCallback(httpClientId cid, httpCookieSendCallback cb, void *arg)
{
    printf ( "IN: httpClientSetCookieSendCallback(%p, %p, %p)\n", cid, cb, arg ) ;
    printf ( "OUT: httpClientSetCookieSendCallbackEx(%p, %p, %p)\n", cid, (opd32*)__get_opd32(cb), arg ) ;
    return httpClientSetCookieSendCallbackEx(cid, (opd32*)__get_opd32(cb),arg);
}

s32 httpClientSetCookieRecvCallback(httpClientId cid, httpCookieRecvCallback cb, void *arg)
{
    printf ( "IN: httpClientSetCookieRecvCallback(%p, %p, %p)\n", cid, cb, arg ) ;
    printf ( "OUT: httpClientSetCookieRecvCallbackEx(%p, %p, %p)\n", cid, (opd32*)__get_opd32(cb), arg ) ;
    return httpClientSetCookieRecvCallbackEx(cid, (opd32*)__get_opd32(cb),arg);
}

