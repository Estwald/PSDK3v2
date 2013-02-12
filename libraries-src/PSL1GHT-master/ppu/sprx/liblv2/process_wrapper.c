#include <lv2/process.h>

extern void sysProcessExitSpawn2Ex (const char *path,const char *ATTRIBUTE_PRXPTR argv[],const char *ATTRIBUTE_PRXPTR envp[],void *data,size_t size,int priority,u64 flags);

void sysProcessExitSpawn2 (const char *path,const char *argv[],const char *envp[],void *data,size_t size,int priority,u64 flags)
{
  const char * ATTRIBUTE_PRXPTR * argv32 = NULL;
  const char * ATTRIBUTE_PRXPTR * envp32 = NULL;
  int i;
  int num;

  if (argv) {
    for (num = 0, i = 0; argv[i]; i++, num++);
    argv32 = malloc (sizeof(u32) * (num + 1));
    for (i = 0; argv[i]; i++)
      argv32[i] = argv[i];
    argv32[num] = NULL;
  }
  if (envp) {
    for (num = 0, i = 0; envp[i]; i++, num++);
    envp32 = malloc (sizeof(u32) * (num + 1));
    for (i = 0; envp[i]; i++)
      envp32[i] = envp[i];
    envp32[num] = NULL;
  }

  sysProcessExitSpawn2Ex(path, argv32, envp32, data, size, priority, flags);
}
