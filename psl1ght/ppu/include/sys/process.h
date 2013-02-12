/*! \file sys/process.h
 \brief Process management.
*/

#ifndef __PROCESS_H__
#define __PROCESS_H__

#include <ppu-lv2.h>
#include <ppu-types.h>
#include <lv2/process.h>
#include <lv2/syscalls.h>


#define SYS_PROCESS_SPAWN_MAGIC                  0x13bcc5f6

#define SYS_PROCESS_SPAWN_VERSION_1              0x00000001
#define SYS_PROCESS_SPAWN_VERSION_084            0x00008400
#define SYS_PROCESS_SPAWN_VERSION_090            0x00009000
#define SYS_PROCESS_SPAWN_VERSION_330            0x00330000
#define SYS_PROCESS_SPAWN_VERSION_INVALID        0xffffffff

#define SYS_PROCESS_SPAWN_MALLOC_PAGE_SIZE_NONE  0x00000000
#define SYS_PROCESS_SPAWN_MALLOC_PAGE_SIZE_64K   0x00010000
#define SYS_PROCESS_SPAWN_MALLOC_PAGE_SIZE_1M    0x00100000

#define SYS_PROCESS_SPAWN_FW_VERSION_192         0x00192001
#define SYS_PROCESS_SPAWN_FW_VERSION_330         0x00330000
#define SYS_PROCESS_SPAWN_FW_VERSION_UNKNOWN     0xffffffff

#define SYS_PROCESS_SPAWN_PPC_SEG_DEFAULT        0x00000000
#define SYS_PROCESS_SPAWN_PPC_SEG_OVLM           0x00000001
#define SYS_PROCESS_SPAWN_PPC_SEG_PRX            0x00000002

/*! \brief set stack size to 32 kilobytes. */
#define SYS_PROCESS_SPAWN_STACK_SIZE_32K	 0x10
/*! \brief set stack size to 64 kilobytes. */
#define SYS_PROCESS_SPAWN_STACK_SIZE_64K	 0x20
/*! \brief set stack size to 96 kilobytes. */
#define SYS_PROCESS_SPAWN_STACK_SIZE_96K	 0x30
/*! \brief set stack size to 128 kilobytes. */
#define SYS_PROCESS_SPAWN_STACK_SIZE_128K	 0x40
/*! \brief set stack size to 256 kilobytes. */
#define SYS_PROCESS_SPAWN_STACK_SIZE_256K	 0x50
/*! \brief set stack size to 512 kilobytes. */
#define SYS_PROCESS_SPAWN_STACK_SIZE_512K	 0x60
/*! \brief set stack size to 1 megabyte. */
#define SYS_PROCESS_SPAWN_STACK_SIZE_1M		 0x70

/* initial stack size
 * \param size
 * \param magic
 * \param version
 * \param sdk_version
 * \param priority
 * \param stack size
 * \param malloc pagesize
 * \param ppc segment
 * \param crash dump param addr
 */
/*! \brief Configure process priority and stack size.

Typically call this macro outside function declarations.
\param prio priority (1000 = normal)
\param stacksize stack size
*/
#define SYS_PROCESS_PARAM(prio,stacksize) \
	sys_process_param_t __sys_process_param __attribute__((aligned(8), section(".sys_proc_param"), unused)) = { \
		sizeof(sys_process_param_t), \
		SYS_PROCESS_SPAWN_MAGIC, \
		SYS_PROCESS_SPAWN_VERSION_090, \
		SYS_PROCESS_SPAWN_FW_VERSION_192, \
		prio, \
		stacksize, \
		SYS_PROCESS_SPAWN_MALLOC_PAGE_SIZE_1M, \
		SYS_PROCESS_SPAWN_PPC_SEG_DEFAULT\
	};

#define SYS_PROCESS_PARAM_OVLM(prio,stacksize) \
	sys_process_param_t __sys_process_param __attribute__((aligned(8), section(".sys_proc_param"), unused)) = { \
		sizeof(sys_process_param_t), \
		SYS_PROCESS_SPAWN_MAGIC, \
		SYS_PROCESS_SPAWN_VERSION_090, \
		SYS_PROCESS_SPAWN_FW_VERSION_192, \
		prio, \
		stacksize, \
		SYS_PROCESS_SPAWN_MALLOC_PAGE_SIZE_1M, \
		SYS_PROCESS_SPAWN_PPC_SEG_OVLM \
	};

#define SYS_PROCESS_PARAM_FIXED(prio,stacksize) \
	sys_process_param_t __sys_process_param __attribute__((aligned(8), section(".sys_proc_param"), unused)) = { \
		sizeof(sys_process_param_t), \
		SYS_PROCESS_SPAWN_MAGIC, \
		SYS_PROCESS_SPAWN_VERSION_090, \
		SYS_PROCESS_SPAWN_FW_VERSION_192, \
		prio, \
		stacksize, \
		SYS_PROCESS_SPAWN_MALLOC_PAGE_SIZE_1M, \
		SYS_PROCESS_SPAWN_PPC_SEG_PRX \
	};

/* process objects */
#define SYS_OBJECT_MEM                     (0x08UL)
#define SYS_OBJECT_MUTEX                   (0x85UL)
#define SYS_OBJECT_COND                    (0x86UL)
#define SYS_OBJECT_RWLOCK                  (0x88UL)
#define SYS_OBJECT_INTR_TAG                (0x0AUL)
#define SYS_OBJECT_INTR_SERVICE_HANDLE     (0x0BUL)
#define SYS_OBJECT_EVENT_QUEUE             (0x8DUL)
#define SYS_OBJECT_EVENT_PORT              (0x0EUL)
#define SYS_OBJECT_TRACE                   (0x21UL)
#define SYS_OBJECT_SPUIMAGE                (0x22UL)
#define SYS_OBJECT_PRX                     (0x23UL)
#define SYS_OBJECT_SPUPORT                 (0x24UL)
#define SYS_OBJECT_LWMUTEX                 (0x95UL)
#define SYS_OBJECT_TIMER                   (0x11UL)
#define SYS_OBJECT_SEMAPHORE               (0x96UL)
#define SYS_OBJECT_FS_FD                   (0x73UL)
#define SYS_OBJECT_LWCOND                  (0x97UL)
#define SYS_OBJECT_EVENT_FLAG              (0x98UL)


#ifdef __cplusplus
extern "C" {
#endif


typedef struct _sys_process_param
{
	u32 size;
	u32 magic;
	u32 version;
	u32 sdk_version;
	s32 prio;
	u32 stacksize;
	u32 malloc_pagesize;
	u32 ppc_seg;
} sys_process_param_t;


/*! \brief get process id 
 * \param object
 * \param buf
 * \param size
 * \param set_size
 */
/*
s32 sysProcessGetId(u32 object, u32 *buf, size_t size, size_t *set_size)
{
        lv2syscall4 (SYSCALL_PROCESS_GET_ID, object, (u32)(u64)buf, size, (u32)(u64)set_size);
        return_to_user_prog(s32);
}
*/

/*! \brief get process id
 */
LV2_SYSCALL sysProcessGetPid(void)
{
        lv2syscall0 (SYSCALL_PROCESS_GETPID);
        return_to_user_prog(sys_pid_t);
}

/*! \brief get parent process id
 *
 */
LV2_SYSCALL sysProcessGetPpid(void)
{
        lv2syscall0 (SYSCALL_PROCESS_GETPPID);
        return_to_user_prog(sys_pid_t);
}

/*! \brief get number of object
 * \param object
 * \param numptr
 */
LV2_SYSCALL sysProcessGetNumberOfObject(u32 object, size_t *numptr)
{
        lv2syscall2 (SYSCALL_PROCESS_GET_NUMBER_OF_OBJECT, object, (u32)(u64)numptr);
        return_to_user_prog(s32);
}

/*! \brief check if SPU can wait for lock line reservation lost event
 * \param addr
 * \param flags
 */
LV2_SYSCALL sysProcessIsSpuLockLinkReservation(u32 addr, u64 flags)
{
        lv2syscall2 (SYSCALL_PROCESS_IS_SPU_LOCK_LINE_RESERVATION_ADDRESS, (u32)addr, flags);
        return_to_user_prog(s32);
}

/*! \brief get ppu guid info from ELF
 */
LV2_SYSCALL sysProcessGetPpuGuid(void)
{
        lv2syscall0 (SYSCALL_PROCESS_GET_PPU_GUID);
        return_to_user_prog(sys_addr_t);
}


#ifdef __cplusplus
	}
#endif

#endif
