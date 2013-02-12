// (c) 2013, Estwald
//  released under GPLv3, see http://gplv3.fsf.org/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>



int main(int argc, char* argv[]) {
 
 int n, ret = 0;
 char current_dir[1024];
 char cmd[1024];

 if(getcwd(current_dir, 1024)==0) return -1;

 strcpy(cmd, argv[0]);
 n= strlen(cmd);

 while(n!=0 && cmd[n]!='/' && cmd[n]!='\\') n--;

 cmd[n] = 0;
 chdir(cmd);

 strcpy(cmd, "scetool.exe");

 for(n=1; n<argc; n++) {
     strcat(cmd, " ");
     strcat(cmd, argv[n]);
 }

 if(system(cmd)!=0) ret= -2;

 chdir(current_dir);
 
 return ret;
}
