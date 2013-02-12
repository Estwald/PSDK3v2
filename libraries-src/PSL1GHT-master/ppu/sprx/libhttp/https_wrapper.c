#include <stdio.h>
#include <ppu-asm.h>

#include <http/https.h>


extern s32 httpClientSetSslCallbackEx(httpClientId cid, opd32 *opd, void *userArg);


s32 httpClientSetSslCallback(httpClientId cid, httpsSslCallback cb, void *arg)
{
    printf ( "IN: httpClientSetSslCallback(%p, %p, %p)\n", cid, cb, arg ) ;
    printf ( "OUT: httpClientSetSslCallbackEx(%p, %p, %p)\n", cid, (opd32*)__get_opd32(cb), arg ) ;
    return httpClientSetSslCallbackEx(cid, (opd32*)__get_opd32(cb),arg);
}

