#include <stdio.h>
#include <ppu-asm.h>
#include <usb/usb.h>

typedef struct _usb_ldd_ops_ex
{
  const char *name ATTRIBUTE_PRXPTR;
  opd32 *probe ATTRIBUTE_PRXPTR;
  opd32 *attach ATTRIBUTE_PRXPTR;
  opd32 *detach ATTRIBUTE_PRXPTR;
} usbLddOpsEx;

extern s32 usbControlTransferEx(s32 pipe_id, usbDeviceRequest *req, void *buf, opd32 *opd, void *arg);
extern s32 usbBulkTransferEx(s32 pipe_id, void *buf, s32 len, opd32 *opd, void *arg);
extern s32 usbInterruptTransferEx(s32 pipe_id, void *buf, s32 len, opd32 *opd, void *arg);
extern s32 usbIsochronousTransferEx(s32 pipe_id, usbIsochRequest *req, opd32 *opd, void *arg);
extern s32 usbHSIsochronousTransferEx(s32 pipe_id, usbHSIsochRequest *req, opd32 *opd, void *arg);

extern s32 usbUnregisterLddEx(usbLddOpsEx *lddops);
extern s32 usbRegisterLddEx(usbLddOpsEx *lddops);
extern s32 usbRegisterExtraLddEx(usbLddOpsEx *lddops, u16 vendor_id, u16 product_id);
extern s32 usbRegisterExtraLdd2Ex(usbLddOpsEx *lddops, u16 vendor_id, u16 product_id_min, u16 product_id_max);
extern s32 usbUnregisterExtraLddEx(usbLddOpsEx *lddops);


s32 usbControlTransfer(s32 pipe_id, usbDeviceRequest *req, void *buf, usbDoneCallback cb, void *arg)
{
/*
    printf ( "IN: usbControlTransfer(%d, %p, %p, %p, %p)\n", pipe_id, req, buf, cb, arg ) ;
    printf ( "OUT: usbControlTransferEx(%d, %p, %p, %p, %p)\n", pipe_id, req, buf, (opd32*)__get_opd32(cb), arg ) ;
*/
    return usbControlTransferEx(pipe_id, req, buf, (opd32*)__get_opd32(cb), arg);
}

s32 usbBulkTransfer(s32 pipe_id, void *buf, s32 len, usbDoneCallback cb, void *arg)
{
    return usbBulkTransferEx(pipe_id, buf, len, (opd32*)__get_opd32(cb), arg);
}

s32 usbInterruptTransfer(s32 pipe_id, void *buf, s32 len, usbDoneCallback cb, void *arg)
{
    return usbInterruptTransferEx(pipe_id, buf, len, (opd32*)__get_opd32(cb), arg);
}

s32 usbIsochronousTransfer(s32 pipe_id, usbIsochRequest *req, usbIsochDoneCallback cb, void *arg)
{
    return usbIsochronousTransferEx(pipe_id, req, (opd32*)__get_opd32(cb), arg);
}

s32 usbHSIsochronousTransfer(s32 pipe_id, usbHSIsochRequest *req, usbHSIsochDoneCallback cb, void *arg)
{
    return usbHSIsochronousTransferEx(pipe_id, req, (opd32*)__get_opd32(cb), arg);
}

s32 usbRegisterLdd(usbLddOps *ldd_ops)
{
    usbLddOpsEx ldd_ops_ex =
    {
        "desc",
        (opd32*)__get_opd32(ldd_ops->probe),
        (opd32*)__get_opd32(ldd_ops->attach),
        (opd32*)__get_opd32(ldd_ops->detach)
    };
/*
    printf ( "IN:  usbRegisterLdd(%p) = probe=%p, attach=%p, detach=%p\n", ldd_ops, ldd_ops->probe, ldd_ops->attach, ldd_ops->detach ) ;
    printf ( "OUT: usbRegisterLddEx(%p) = probe=%p, attach=%p, detach=%p\n", &ldd_ops_ex, ldd_ops_ex.probe, ldd_ops_ex.attach, ldd_ops_ex.detach ) ;
*/
    return usbRegisterLddEx(&ldd_ops_ex);
}

s32 usbUnregisterLdd(usbLddOps *ldd_ops)
{
    usbLddOpsEx ldd_ops_ex =
    {
        "desc",
        (opd32*)__get_opd32(ldd_ops->probe),
        (opd32*)__get_opd32(ldd_ops->attach),
        (opd32*)__get_opd32(ldd_ops->detach)
    };
/*
    printf ( "IN:  usbUnregisterLdd(%p) = probe=%p, attach=%p, detach=%p\n", ldd_ops, ldd_ops->probe, ldd_ops->attach, ldd_ops->detach ) ;
    printf ( "OUT: usbUnregisterLddEx(%p) = probe=%p, attach=%p, detach=%p\n", &ldd_ops_ex, ldd_ops_ex.probe, ldd_ops_ex.attach, ldd_ops_ex.detach ) ;
*/
    return usbUnregisterLddEx(&ldd_ops_ex);
}

s32 usbRegisterExtraLdd(usbLddOps *ldd_ops, u16 vendor_id, u16 product_id)
{
    usbLddOpsEx ldd_ops_ex =
    {
        "desc",
        (opd32*)__get_opd32(ldd_ops->probe),
        (opd32*)__get_opd32(ldd_ops->attach),
        (opd32*)__get_opd32(ldd_ops->detach)
    };
/*
    printf ( "IN:  usbRegisterExtraLdd(%p) = probe=%p, attach=%p, detach=%p\n", ldd_ops, ldd_ops->probe, ldd_ops->attach, ldd_ops->detach ) ;
    printf ( "OUT: usbRegisterExtraLddEx(%p) = probe=%p, attach=%p, detach=%p\n", &ldd_ops_ex, ldd_ops_ex.probe, ldd_ops_ex.attach, ldd_ops_ex.detach ) ;
*/
    return usbRegisterExtraLddEx(&ldd_ops_ex, vendor_id, product_id);
}

s32 usbRegisterExtraLdd2(usbLddOps *ldd_ops, u16 vendor_id, u16 product_id_min, u16 product_id_max)
{
    usbLddOpsEx ldd_ops_ex =
    {
        "desc",
        (opd32*)__get_opd32(ldd_ops->probe),
        (opd32*)__get_opd32(ldd_ops->attach),
        (opd32*)__get_opd32(ldd_ops->detach)
    };
/*
    printf ( "IN:  usbRegisterExtraLdd2(%p) = probe=%p, attach=%p, detach=%p\n", ldd_ops, ldd_ops->probe, ldd_ops->attach, ldd_ops->detach ) ;
    printf ( "OUT: usbRegisterExtraLdd2Ex(%p) = probe=%p, attach=%p, detach=%p\n", &ldd_ops_ex, ldd_ops_ex.probe, ldd_ops_ex.attach, ldd_ops_ex.detach ) ;
*/
    return usbRegisterExtraLdd2Ex(&ldd_ops_ex, vendor_id, product_id_min, product_id_max);
}

s32 usbUnregisterExtraLdd(usbLddOps *ldd_ops)
{
    usbLddOpsEx ldd_ops_ex =
    {
        "desc",
        (opd32*)__get_opd32(ldd_ops->probe),
        (opd32*)__get_opd32(ldd_ops->attach),
        (opd32*)__get_opd32(ldd_ops->detach)
    };
/*
    printf ( "IN:  usbUnregisterExtraLdd(%p) = probe=%p, attach=%p, detach=%p\n", ldd_ops, ldd_ops->probe, ldd_ops->attach, ldd_ops->detach ) ;
    printf ( "OUT: usbUnregisterExtraLddEx(%p) = probe=%p, attach=%p, detach=%p\n", &ldd_ops_ex, ldd_ops_ex.probe, ldd_ops_ex.attach, ldd_ops_ex.detach ) ;
*/
    return usbUnregisterExtraLddEx(&ldd_ops_ex);
}

