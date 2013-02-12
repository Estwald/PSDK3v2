/* 
    Copyright (C) 1985, 2010  Francisco Muñoz "Hermes" <www.elotrolado.net>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

*/

/* memfile: functions to read the Ogg file from memory */



#include <unistd.h>
#include <string.h>
#include <malloc.h>
#include <fcntl.h>
#include <stdio.h>

static struct {
	char *mem;
	int  size;
	int  pos;
} file[4];


int f_close(long *f);

long mem_open(char * ogg, int size)
{

    static int one=1;
    int n;

    if(one) {
        
        one = 0;
	    
        for(n = 0; n < 4; n++) file[n].size = 0;
	}

    for( n = 0; n < 4; n++) {
        
        if(file[n].size == 0 ) {
            
            file[n].mem  = ogg;
            file[n].size =size;
            file[n].pos  =0;
            
            return (0x666 + n);
            
        }
    
    }
    
    return -1;
}

int mem_close(long fd)
{

    if(fd >= 0x666 && fd <= 0x669 ) {// it is a memory file descriptor?
       
        fd -= 0x666;

        file[fd].size = 0;

        return 0;

    } 
  
    return f_close( (long *) fd);

}

int f_read(void * punt, int bytes, int blocks, long *f)
{

    int b;
    int c;
    int d;

    if(bytes * blocks <= 0) return 0;

    blocks = bytes * blocks;
    
    c = 0;

    while(blocks > 0) {

        b = blocks; if( b > 4096) b = 4096;

        if(((long) f) >= 0x666 && ((long) f) <= 0x669 ) {
            
            d =((long) f) - 0x666;
            
            if(file[d].size == 0)
                return -1;

            if((file[d].pos + b) > file[d].size)
                b = file[d].size-file[d].pos;

            if(b > 0) {
                memcpy(punt, file[d].mem + file[d].pos, b);
                file[d].pos += b;
            }
        } else
            b = fread(((char *) punt) + c, 1, b, (FILE *) f);

        if(b <= 0) {
            if(b < 0 && c == 0) return b; 
            
            return c / bytes;
        }
        
    c += b;
    
    blocks -= b;
    }

    return c / bytes;
}

int f_seek(long *f, int offset, int mode)
{
    int k, d;

    mode &= 3;

    if(((long) f) >= 0x666 && ((long) f) <= 0x669) {
        
        d = ((long) f) - 0x666;
        k = 0;
         
        if(file[d].size == 0) return -1;

        switch(mode) {

        case 0:
            
            if(offset >= file[d].size) {
                
                file[d].pos = file[d].size;
                k =- 1;

            } else if(offset < 0) {
                
                file[d].pos = 0; k = -1;
            
            } else 
                file[d].pos = offset;
        
        break;

        case 1:
           
            if((file[d].pos + offset) >= file[d].size) {
                
                file[d].pos = file[d].size;
                k = -1;

            } else if((file[d].pos + offset) < 0) {
                
                file[d].pos = 0;
                k = -1;
            
            } else 
                file[d].pos += offset;
        break;

        case 2:
            
            if((file[d].size + offset) >= file[d].size) {
                
                file[d].pos = file[d].size; k = -1;
                
            } else if((file[d].size + offset) < 0) {
                
                file[d].pos = 0;
                k = -1;

            } else 
                file[d].pos = file[d].size + offset;

           break;
        }

    } else
        k = fseek((FILE *) f, (int) offset, mode);

    if(k < 0) k = -1; else k = 0;

    return k;
}

int f_close(long *f)
{
    int d;

    if(((long) f) >= 0x666 && ((long) f) <= 0x669 ) {
        
        d =((long) f) - 0x666;

        file[d].size = 0;
        file[d].pos  = 0;

        if(file[d].mem) {
         
            file[d].mem = (void *) 0;
         }
        
        return 0;
    } else {
        
        d = fclose((FILE *) f);
        //*f = 0;
    
        return d;
    }

    return 0;
}

int f_tell(long *f)
{	
    int k, d;

    if(((long) f) >= 0x666 && ((long) f) <= 0x669) {

        d = ((long) f) - 0x666;
        
        k = file[d].pos;
        
    } else 
        
        k = ftell((FILE *) f);

    return (int) k;
}
