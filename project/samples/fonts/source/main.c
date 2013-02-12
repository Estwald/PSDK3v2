/* 
   TINY3D sample / (c) 2010 Hermes  <www.elotrolado.net>

*/

#include <stdio.h>
#include <malloc.h>
#include <string.h>
#include <assert.h>
#include <unistd.h>
#include <math.h>

#include <io/pad.h>

#include <tiny3d.h>
#include <libfont.h>

// font 0: 224 chr from 32 to 255, 16 x 32 pix 2 bit depth
#include "font.h"

// font 1: 224 chr from 32 to 255, 16 x 32 pix 2 bit depth
#include "font_b.h"

// font 2: 255 chr from 0 to 254, 8 x 8 pix 1 bit depth
extern unsigned char msx[];


// draw one background color in virtual 2D coordinates

void DrawBackground2D(u32 rgba)
{
    tiny3d_SetPolygon(TINY3D_QUADS);

    tiny3d_VertexPos(0  , 0  , 65535);
    tiny3d_VertexColor(rgba);

    tiny3d_VertexPos(847, 0  , 65535);

    tiny3d_VertexPos(847, 511, 65535);

    tiny3d_VertexPos(0  , 511, 65535);
    tiny3d_End();
}

void drawScene()
{
	float x, y;
    tiny3d_Project2D(); // change to 2D context (remember you it works with 848 x 512 as virtual coordinates)
    DrawBackground2D(0x0040ffff) ; // light blue 

    SetFontSize(12, 24);
    
    x= 0.0; y = 0.0;

    SetCurrentFont(1);
    SetFontColor(0xffffffff, 0x0);
    x = DrawString(x,y, "Hello World!. My nick is ");
    SetFontColor(0x00ff00ff, 0x0);
    SetCurrentFont(0);
    x = DrawString(x,y, "Hermes ");
    SetCurrentFont(1);
    SetFontColor(0xffffffff, 0x0);
    x = DrawString(x,y, "and this is one sample working with\nfonts.");

    SetCurrentFont(2);
    
    x= 0; y += 64;
    SetCurrentFont(1);
    DrawString(x, y, "I am using 3 fonts:");
    
    SetCurrentFont(0);
    y += 64;
    SetFontColor(0xffffffff, 0x00a000ff);
    DrawString(x, y, "Font 0 is one array of 224 chars 16 x 32 pix and 2 bit depth");

    SetCurrentFont(1);
    y += 64;
    SetFontColor(0xffffffff, 0xa00000ff);
    DrawString(x, y, "Font 1 is one array of 224 chars 16 x 32 pix and 2 bit depth");

    SetCurrentFont(2);
    y += 64;
    SetFontColor(0x000000ff, 0xffff00ff);
    DrawString(x, y, "Font 2 is one array of 255 chars 8 x 8 pix and 1 bit depth");

    y += 64;
    SetCurrentFont(1);
    SetFontSize(32, 64);
    SetFontColor(0xffffffff, 0x000000ff);
    SetFontAutoCenter(1);
    DrawString(0, y, "You can resize letters");
    SetFontAutoCenter(0);

    SetFontSize(12, 24);
    SetFontColor(0xffffffff, 0x00000000);
    y += 72;
    DrawString(0, y, "change the color, background color and center the text\nwith SetFontAutoCenter()");
    y += 72;

    SetFontColor(0x00ff00ff, 0x00000000);
    DrawFormatString(0, y, "Here %s font 0 uses %i bytes as texture", "using DrawFormatString()", 224*(16*2/8)*32);

}


void LoadTexture()
{

    u32 * texture_mem = tiny3d_AllocTexture(64*1024*1024); // alloc 64MB of space for textures (this pointer can be global)    

    u32 * texture_pointer; // use to asign texture space without changes texture_mem

    if(!texture_mem) return; // fail!

    texture_pointer = texture_mem;

    ResetFont();
    texture_pointer = (u32 *) AddFontFromBitmapArray((u8 *) font  , (u8 *) texture_pointer, 32, 255, 16, 32, 2, BIT0_FIRST_PIXEL);
    texture_pointer = (u32 *) AddFontFromBitmapArray((u8 *) font_b, (u8 *) texture_pointer, 32, 255, 16, 32, 2, BIT0_FIRST_PIXEL);
    texture_pointer = (u32 *) AddFontFromBitmapArray((u8 *) msx   , (u8 *) texture_pointer,  0, 254,  8,  8, 1, BIT7_FIRST_PIXEL);

    // here you can add more textures using 'texture_pointer'. It is returned aligned to 16 bytes
}



s32 main(s32 argc, const char* argv[])
{
	padInfo padinfo;
	padData paddata;
	int i;
	
	tiny3d_Init(1024*1024);

	ioPadInit(7);

	// Load texture

    LoadTexture();

	
	// Ok, everything is setup. Now for the main loop.
	while(1) {

        /* DRAWING STARTS HERE */

        // clear the screen, buffer Z and initializes environment to 2D

        tiny3d_Clear(0xff000000, TINY3D_CLEAR_ALL);

        // Enable alpha Test
        tiny3d_AlphaTest(1, 0x10, TINY3D_ALPHA_FUNC_GEQUAL);

        // Enable alpha blending.
        tiny3d_BlendFunc(1, TINY3D_BLEND_FUNC_SRC_RGB_SRC_ALPHA | TINY3D_BLEND_FUNC_SRC_ALPHA_SRC_ALPHA,
            TINY3D_BLEND_FUNC_DST_RGB_ONE_MINUS_SRC_ALPHA | TINY3D_BLEND_FUNC_DST_ALPHA_ZERO,
            TINY3D_BLEND_RGB_FUNC_ADD | TINY3D_BLEND_ALPHA_FUNC_ADD);
      

		// Check the pads.
		ioPadGetInfo(&padinfo);

		for(i = 0; i < MAX_PADS; i++){

			if(padinfo.status[i]){
				ioPadGetData(i, &paddata);
				
				if(paddata.BTN_CROSS){
					return 0;
				}
			}
			
		}

        drawScene(); // Draw

        /* DRAWING FINISH HERE */

        tiny3d_Flip();
		
	}

	return 0;
}

