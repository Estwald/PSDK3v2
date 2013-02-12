/*
 */

#ifndef __SYSCALL_SYSCALLS_H__
#define __SYSCALL_SYSCALLS_H__

#define MAX_NUM_OF_SYSTEM_CALLS                                 1024

/* lv2 syscalls */

#define SYSCALL_PROCESS_GETPID                                  1
#define SYSCALL_PROCESS_WAIT_FOR_CHILD                          2
#define SYSCALL_PROCESS_GET_STATUS                              4
#define SYSCALL_PROCESS_DETACH_CHILD                            5
#define SYSCALL_PROCESS_GET_NUMBER_OF_OBJECT                    12
#define SYSCALL_PROCESS_GET_ID                                  13
#define SYSCALL_PROCESS_IS_SPU_LOCK_LINE_RESERVATION_ADDRESS    14
#define SYSCALL_PROCESS_GETPPID                                 18
#define SYSCALL_PROCESS_KILL                                    19
#define SYSCALL_PROCESS_WAIT_FOR_CHILD2                         23
#define SYSCALL_PROCESS_GET_SDK_VERSION                         25
#define SYSCALL_PROCESS_GET_PPU_GUID                            31

#define SYSCALL_PPU_THREAD_YIELD                                43 /* thread.h */
#define SYSCALL_PPU_THREAD_JOIN                                 44 /* thread.h */
#define SYSCALL_PPU_THREAD_DETACH                               45 /* thread.h */
#define SYSCALL_PPU_THREAD_GET_JOIN_STATE                       46 /* thread.h */
#define SYSCALL_PPU_THREAD_SET_PRIORITY                         47 /* thread.h */
#define SYSCALL_PPU_THREAD_GET_PRIORITY                         48 /* thread.h */
#define SYSCALL_PPU_THREAD_GET_STACK_INFORMATION                49 /* thread.h */
#define SYSCALL_PPU_THREAD_RENAME                               56 /* thread.h */
#define SYSCALL_PPU_THREAD_RECOVER_PAGE_FAULT                   57 /* thread.h */
#define SYSCALL_PPU_THREAD_GET_PAGE_FAULT_CONTEXT               58 /* thread.h */

#define SYSCALL_TRACE_ALLOCATE_BUFFER                           67
#define SYSCALL_TRACE_FREE_BUFFER                               68
#define SYSCALL_TRACE_CREATE2                                   69
#define SYSCALL_TRACE_CREATE2_IN_CBEPM                          77

#define SYSCALL_TIMER_CREATE                                    70
#define SYSCALL_TIMER_DESTROY                                   71
#define SYSCALL_TIMER_GET_INFORMATION                           72
#define SYSCALL_TIMER_START                                     73
#define SYSCALL_TIMER_STOP                                      74
#define SYSCALL_TIMER_CONNECT_EVENT_QUEUE                       75
#define SYSCALL_TIMER_DISCONNECT_EVENT_QUEUE                    76
#define SYSCALL_TIMER_USLEEP                                    141 /* systime.h */
#define SYSCALL_TIMER_SLEEP                                     142 /* systime.h */

#define SYSCALL_INTERRUPT_TAG_CREATE                            80 /* interrupt.h */
#define SYSCALL_INTERRUPT_TAG_DESTROY                           81 /* interrupt.h */
#define SYSCALL_INTERRUPT_THREAD_ESTABLISH                      84 /* interrupt.h */
#define SYSCALL_INTERRUPT_THREAD_EOI                            88 /* interrupt.h */
#define SYSCALL_INTERRUPT_THREAD_DISESTABLISH                   89 /* interrupt.h */

#define SYSCALL_EVENT_FLAG_CREATE                               82
#define SYSCALL_EVENT_FLAG_DESTROY                              83
#define SYSCALL_EVENT_FLAG_WAIT                                 85
#define SYSCALL_EVENT_FLAG_TRYWAIT                              86
#define SYSCALL_EVENT_FLAG_SET                                  87
#define SYSCALL_EVENT_FLAG_CLEAR                                118
#define SYSCALL_EVENT_QUEUE_CREATE                              128
#define SYSCALL_EVENT_QUEUE_DESTROY                             129
#define SYSCALL_EVENT_QUEUE_RECEIVE                             130
#define SYSCALL_EVENT_QUEUE_TRYRECEIVE                          131
#define SYSCALL_EVENT_FLAG_CANCEL                               132
#define SYSCALL_EVENT_QUEUE_DRAIN                               133
#define SYSCALL_EVENT_PORT_CREATE                               134
#define SYSCALL_EVENT_PORT_DESTROY                              135
#define SYSCALL_EVENT_PORT_CONNECT_LOCAL                        136
#define SYSCALL_EVENT_PORT_DISCONNECT                           137
#define SYSCALL_EVENT_PORT_SEND                                 138
#define SYSCALL_EVENT_FLAG_GET                                  139
#define SYSCALL_EVENT_PORT_CONNECT_IPC                          140

#define SYSCALL_SEMAPHORE_CREATE                                90 /* sem.h */
#define SYSCALL_SEMAPHORE_DESTROY                               91 /* sem.h */
#define SYSCALL_SEMAPHORE_WAIT                                  92 /* sem.h */
#define SYSCALL_SEMAPHORE_TRYWAIT                               93 /* sem.h */
#define SYSCALL_SEMAPHORE_POST                                  94 /* sem.h */
#define SYSCALL_SEMAPHORE_GET_VALUE                             114 /* sem.h */

#define SYSCALL_MUTEX_CREATE                                    100 /* mutex.h */
#define SYSCALL_MUTEX_DESTROY                                   101 /* mutex.h */
#define SYSCALL_MUTEX_LOCK                                      102 /* mutex.h */
#define SYSCALL_MUTEX_TRYLOCK                                   103 /* mutex.h */
#define SYSCALL_MUTEX_UNLOCK                                    104 /* mutex.h */

#define SYSCALL_COND_CREATE                                     105 /* cond.h */
#define SYSCALL_COND_DESTROY                                    106 /* cond.h */
#define SYSCALL_COND_WAIT                                       107 /* cond.h */
#define SYSCALL_COND_SIGNAL                                     108 /* cond.h */
#define SYSCALL_COND_SIGNAL_ALL                                 109 /* cond.h */
#define SYSCALL_COND_SIGNAL_TO                                  110 /* cond.h */

#define SYSCALL_RWLOCK_CREATE                                   120
#define SYSCALL_RWLOCK_DESTROY                                  121
#define SYSCALL_RWLOCK_RLOCK                                    122
#define SYSCALL_RWLOCK_TRYRLOCK                                 123
#define SYSCALL_RWLOCK_RUNLOCK                                  124
#define SYSCALL_RWLOCK_WLOCK                                    125
#define SYSCALL_RWLOCK_WUNLOCK                                  127
#define SYSCALL_RWLOCK_TRYWLOCK                                 148

#define SYSCALL_TIME_GET_CURRENT_TIME                           145 /* systime.h */
#define SYSCALL_TIME_SET_CURRENT_TIME                           146 /* systime.h */
#define SYSCALL_TIME_GET_TIMEBASE_FREQUENCY                     147 /* systime.h */

#define SYSCALL_SPU_CREATE_INTERRUPT_TAG                        150
#define SYSCALL_SPU_SET_INT_MASK                                151
#define SYSCALL_SPU_GET_INT_MASK                                152
#define SYSCALL_SPU_SET_INT_STAT                                153
#define SYSCALL_SPU_GET_INT_STAT                                154
#define SYSCALL_SPU_IMAGE_OPEN                                  156
#define SYSCALL_SPU_CREATE                                      160
#define SYSCALL_SPU_DESTROY                                     161
#define SYSCALL_SPU_READ_PUINT_MB                               163
#define SYSCALL_SPU_THREAD_GET_EXIT_STATUS                      165
#define SYSCALL_SPU_THREAD_SET_ARGUMENT                         166
#define SYSCALL_SPU_THREAD_GROUP_START_ON_EXIT                  167
#define SYSCALL_SPU_INITIALIZE                                  169
#define SYSCALL_SPU_THREAD_GROUP_CREATE                         170
#define SYSCALL_SPU_THREAD_GROUP_DESTROY                        171
#define SYSCALL_SPU_THREAD_INITIALIZE                           172
#define SYSCALL_SPU_THREAD_GROUP_START                          173
#define SYSCALL_SPU_THREAD_GROUP_SUSPEND                        174
#define SYSCALL_SPU_THREAD_GROUP_RESUME                         175
#define SYSCALL_SPU_THREAD_GROUP_YIELD                          176
#define SYSCALL_SPU_THREAD_GROUP_TERMINATE                      177
#define SYSCALL_SPU_THREAD_GROUP_JOIN                           178
#define SYSCALL_SPU_THREAD_GROUP_SET_PRIORITY                   179
#define SYSCALL_SPU_THREAD_GROUP_GET_PRIORITY                   180
#define SYSCALL_SPU_THREAD_WRITE_LS                             181
#define SYSCALL_SPU_THREAD_READ_LS                              182
#define SYSCALL_SPU_THREAD_WRITE_SNR                            184
#define SYSCALL_SPU_THREAD_GROUP_CONNECT_EVENT                  185
#define SYSCALL_SPU_THREAD_GROUP_DISCONNECT_EVENT               186
#define SYSCALL_SPU_THREAD_SET_SPU_CFG                          187
#define SYSCALL_SPU_THREAD_GET_SPU_CFG                          188
#define SYSCALL_SPU_THREAD_WRITE_SPU_MB                         190
#define SYSCALL_SPU_THREAD_CONNECT_EVENT                        191
#define SYSCALL_SPU_THREAD_DISCONNECT_EVENT                     192
#define SYSCALL_SPU_THREAD_BIND_QUEUE                           193
#define SYSCALL_SPU_THREAD_UNBIND_QUEUE                         194
#define SYSCALL_SPU_SET_SPU_CFG                                 196
#define SYSCALL_SPU_GET_SPU_CFG                                 197
#define SYSCALL_SPU_THREAD_RECOVER_PAGE_FAULT                   198
#define SYSCALL_SPU_RECOVER_PAGE_FAULT                          199
#define SYSCALL_SPU_THREAD_GROUP_SET_COOPERATIVE_VICTIMS        250
#define SYSCALL_SPU_THREAD_GROUP_CONNECT_EVENT_ALL_THREADS      251
#define SYSCALL_SPU_THREAD_GROUP_DISCONNECT_EVENT_ALL_THREADS   252
#define SYSCALL_SPU_THREAD_GROUP_LOG                            254
#define SYSCALL_SPU_IMAGE_OPEN_BY_FD                            260

#define SYSCALL_VM_MEMORY_MAP                                   300
#define SYSCALL_VM_UNMAP                                        301
#define SYSCALL_VM_APPEND_MEMORY                                302
#define SYSCALL_VM_RETURN_MEMORY                                303
#define SYSCALL_VM_LOCK                                         304
#define SYSCALL_VM_UNLOCK                                       305
#define SYSCALL_VM_TOUCH                                        306
#define SYSCALL_VM_FLUSH                                        307
#define SYSCALL_VM_INVALIDATE                                   308
#define SYSCALL_VM_STORE                                        309
#define SYSCALL_VM_SYNC                                         310
#define SYSCALL_VM_TEST                                         311
#define SYSCALL_VM_GET_STATISTICS                               312

#define SYSCALL_MEMORY_CONTAINER_CREATE                         324 /* memory.h */
#define SYSCALL_MEMORY_CONTAINER_DESTROY                        325 /* memory.h */
#define SYSCALL_MEMORY_CONTAINER_GET_SIZE                       343
#define SYSCALL_MEMORY_ALLOCATE                                 348 /* memory.h */
#define SYSCALL_MEMORY_FREE                                     349 /* memory.h */
#define SYSCALL_MEMORY_ALLOCATE_FROM_CONTAINER                  350 /* memory.h */
#define SYSCALL_MEMORY_GET_PAGE_ATTRIBUTE                       351
#define SYSCALL_MEMORY_GET_USER_MEMORY_SIZE                     352

#define SYSCALL_MMAPPER_ALLOCATE_FIXED_ADDRESS                  326
#define SYSCALL_MMAPPER_ENABLE_PAGE_FAULT_NOTIFICATION          327
#define SYSCALL_MMAPPER_ALLOCATE_ADDRESS                        330 /* memory.h */
#define SYSCALL_MMAPPER_FREE_ADDRESS                            331 /* memory.h */
#define SYSCALL_MMAPPER_CHANGE_ADDRESS_ACCESS_RIGHT             336
#define SYSCALL_MMAPPER_SEARCH_AND_MAP                          337 /* memory.h */

#define SYSCALL_TTY_READ                                        402 /* tty.h */
#define SYSCALL_TTY_WRITE                                       403 /* tty.h */

#define SYSCALL_OVERLAY_LOAD_MODULE                             450
#define SYSCALL_OVERLAY_UNLOAD_MODULE                           451
#define SYSCALL_OVERLAY_GET_MODULE_LIST                         452
#define SYSCALL_OVERLAY_GET_MODULE_INFO                         453
#define SYSCALL_OVERLAY_LOAD_MODULE_BY_FD                       454
#define SYSCALL_OVERLAY_GET_MODULE_INFO2                        455
#define SYSCALL_OVERLAY_GET_SDK_VERSION                         456

#define SYSCALL_PRX_GET_MODULE_ID_BY_ADDRESS                    461
#define SYSCALL_PRX_LOAD_MODULE_BY_FD                           463
#define SYSCALL_PRX_LOAD_MODULE_ON_MEMCONTAINER_BY_FD           464
#define SYSCALL_PRX_LOAD_MODULE_LIST                            465
#define SYSCALL_PRX_LOAD_MODULE_LIST_ON_MEMCONTAINER            466
#define SYSCALL_PRX_GET_PPU_GUID                                467
#define SYSCALL_PRX_LOAD_MODULE                                 480
#define SYSCALL_PRX_START_MODULE                                481
#define SYSCALL_PRX_STOP_MODULE                                 482
#define SYSCALL_PRX_UNLOAD_MODULE                               483
#define SYSCALL_PRX_REGISTER_MODULE                             484
#define SYSCALL_PRX_QUERY_MODULE                                485
#define SYSCALL_PRX_REGISTER_LIBRARY                            486
#define SYSCALL_PRX_UNREGISTER_LIBRARY                          487
#define SYSCALL_PRX_LINK_LIBRARY                                488
#define SYSCALL_PRX_UNLINK_LIBRARY                              489
#define SYSCALL_PRX_QUERY_LIBRARY                               490
#define SYSCALL_PRX_GET_MODULE_LIST                             494
#define SYSCALL_PRX_GET_MODULE_INFO                             495
#define SYSCALL_PRX_GET_MODULE_ID_BY_NAME                       496
#define SYSCALL_PRX_LOAD_MODULE_ON_MEMCONTAINER                 497
#define SYSCALL_PRX_START                                       498
#define SYSCALL_PRX_STOP                                        499

#define SYSCALL_STORAGE_OPEN                                    600
#define SYSCALL_STORAGE_CLOSE                                   601
#define SYSCALL_STORAGE_READ                                    602
#define SYSCALL_STORAGE_WRITE                                   603
#define SYSCALL_STORAGE_SEND_DEVICE_COMMAND                     604
#define SYSCALL_STORAGE_ASYNC_CONFIGURE                         605
#define SYSCALL_STORAGE_ASYNC_READ                              606
#define SYSCALL_STORAGE_ASYNC_WRITE                             607
#define SYSCALL_STORAGE_ASYNC_CANCEL                            608
#define SYSCALL_STORAGE_GET_DEVICE_INFO                         609
#define SYSCALL_STORAGE_GET_DEVICE_CONFIG                       610
#define SYSCALL_STORAGE_REPORT_DEVICES                          611
#define SYSCALL_STORAGE_CONFIGURE_MEDIUM_EVENT                  612
#define SYSCALL_STORAGE_SET_MEDIUM_POLLING_INTERVAL             613
#define SYSCALL_STORAGE_CREATE_REGION                           614
#define SYSCALL_STORAGE_DELETE_REGION                           615
#define SYSCALL_STORAGE_EXECUTE_DEVICE_COMMAND                  616
#define SYSCALL_STORAGE_GET_REGION_ACL                          617
#define SYSCALL_STORAGE_SET_REGION_ACL                          618
#define SYSCALL_STORAGE_ASYNC_SEND_DEVICE_COMMAND               619
#define SYSCALL_STORAGE_GET_REGION_OFFSET                       622
#define SYSCALL_STORAGE_SET_EMULATED_SPEED                      623

#define SYSCALL_IO_BUFFER_CREATE                                624
#define SYSCALL_IO_BUFFER_DESTROY                               625
#define SYSCALL_IO_BUFFER_ALLOCATE                              626
#define SYSCALL_IO_BUFFER_FREE                                  627

#define SYSCALL_GPIO_SET                                        630
#define SYSCALL_GPIO_GET                                        631

#define SYSCALL_FSW_CONNECT_EVENT                               633
#define SYSCALL_FSW_DISCONNECT_EVENT                            634

#define SYSCALL_RSX_DEVICE_OPEN                                 666
#define SYSCALL_RSX_DEVICE_CLOSE                                667
#define SYSCALL_RSX_MEMORY_ALLOCATE                             668
#define SYSCALL_RSX_MEMORY_FREE                                 669
#define SYSCALL_RSX_CONTEXT_ALLOCATE                            670
#define SYSCALL_RSX_CONTEXT_FREE                                671
#define SYSCALL_RSX_CONTEXT_IOMAP                               672
#define SYSCALL_RSX_CONTEXT_IOUNMAP                             673
#define SYSCALL_RSX_CONTEXT_ATTRIBUTE                           674
#define SYSCALL_RSX_DEVICE_MAP                                  675
#define SYSCALL_RSX_DEVICE_UNMAP                                676
#define SYSCALL_RSX_ATTRIBUTE                                   677

#define SYSCALL_BDEMU_SEND_COMMAND                              699

#define SYSCALL_SS_GET_OPEN_PSID                                872

#define SYSCALL_DECI3_OPEN                                      880
#define SYSCALL_DECI3_CREATE_EVENT_PATH                         881
#define SYSCALL_DECI3_CLOSE                                     882
#define SYSCALL_DECI3_SEND                                      883
#define SYSCALL_DECI3_RECEIVE                                   884


#endif /* __SYSCALL_SYSCALLS_H__ */

