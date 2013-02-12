/* 
   TINY3D sample / (c) 2010 Hermes  <www.elotrolado.net>

*/

#include <stdio.h>
#include <malloc.h>
#include <string.h>
#include <assert.h>
#include <unistd.h>
#include <math.h>

#include "pad.h"

#include <sysmodule/sysmodule.h>

#include <tiny3d.h>
#include <libfont.h>

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

    tiny3d_SetPolygon(TINY3D_LINE_LOOP);

    tiny3d_VertexPos(0  , 0  , 65535);
    tiny3d_VertexColor(0xffffffff);

    tiny3d_VertexPos(847, 0  , 65535);

    tiny3d_VertexPos(847, 511, 65535);

    tiny3d_VertexPos(0  , 511, 65535);
    tiny3d_End();
}


/*
void DrawBackground3D(u32 rgba)
{
    tiny3d_SetPolygon(TINY3D_LINE_LOOP);

    tiny3d_VertexPos(-960  , -540  , 0);
    tiny3d_VertexColor(rgba);

    tiny3d_VertexPos(960, -540  , 0);

    tiny3d_VertexPos(960, 540, 0);

    tiny3d_VertexPos(-960  , 540, 0);
    tiny3d_End();
}

*/
int videoscale_x = 0;
int videoscale_y = -120;

void drawScene()
{

    /*
    tiny3d_Project3D();
    tiny3d_SetProjectionMatrix(NULL);

	DrawBackground3D(0xffff00ff) ; // yellow
   */

    tiny3d_Project2D(); // change to 2D context (remember you it works with 848 x 512 as virtual coordinates)

    // fix Perspective Projection Matrix

    DrawBackground2D(0x0040ffff) ; // light blue 


    SetFontSize(16, 24);
    SetFontColor(0xffffffff, 0x0);

    SetFontAutoCenter(1);
    DrawString(0, (512 - 24)/2 - 64, "Use LEFT/RIGHT/UP/DOWN to adjust the screen");

    DrawFormatString(0, (512 - 24)/2, "Video Scale X: %i Y: %i", videoscale_x, videoscale_y);

    DrawString(0, (512 - 24)/2 + 64, "Press 'X' to exit");
    SetFontAutoCenter(0);
  
    
}


void LoadTexture()
{

    u32 * texture_mem = tiny3d_AllocTexture(64*1024*1024); // alloc 64MB of space for textures (this pointer can be global)
    
    u32 * texture_pointer; // use to asign texture space without changes texture_mem

    if(!texture_mem) return; // fail!

    ResetFont();

    texture_pointer = texture_mem;

    texture_pointer = (u32 *) AddFontFromBitmapArray((u8 *) msx   , (u8 *) texture_pointer,  0, 254,  8,  8, 1, BIT7_FIRST_PIXEL);
    
}


void exiting()
{

 
  
}

s32 main(s32 argc, const char* argv[])
{

	tiny3d_Init(1024*1024);

	ioPadInit(7);

    atexit(exiting); // Tiny3D register the event 3 and do exit() call when you exit  to the menu

	// Load texture

    LoadTexture();

	
	// Ok, everything is setup. Now for the main loop.
	while(1) {

        static long frame_count = 0;


        /* DRAWING STARTS HERE */

        // clear the screen, buffer Z and initializes environment to 2D

        double sx = (double) Video_Resolution.width;
        double sy = (double) Video_Resolution.height;
        double px = (double) (1000 + videoscale_x)/1000.0;
        double py = (double) (1000 + videoscale_y)/1000.0;
        
        tiny3d_UserViewport(1, 
            (float) ((sx - sx * px) / 2.0), // 2D position
            (float) ((sy - sy * py) / 2.0), 
            (float) ((sx * px) / 848.0),    // 2D scale
            (float) ((sy * py) / 512.0),
            (((float) Video_Resolution.width) / 1920.0f) * (float) (1000 + videoscale_x)/1000.0f,  // 3D scale
            (((float) Video_Resolution.height) / 1080.0f) * (float) (1000 + videoscale_y)/1000.0f);

        tiny3d_Clear(0xff000000, TINY3D_CLEAR_ALL);

        // Enable alpha Test
        tiny3d_AlphaTest(1, 0x10, TINY3D_ALPHA_FUNC_GEQUAL);

        // Enable alpha blending.
        tiny3d_BlendFunc(1, TINY3D_BLEND_FUNC_SRC_RGB_SRC_ALPHA | TINY3D_BLEND_FUNC_SRC_ALPHA_SRC_ALPHA,
            TINY3D_BLEND_FUNC_DST_RGB_ONE_MINUS_SRC_ALPHA | TINY3D_BLEND_FUNC_DST_ALPHA_ZERO,
            TINY3D_BLEND_RGB_FUNC_ADD | TINY3D_BLEND_ALPHA_FUNC_ADD);
      
        ps3pad_read();

        if(!(frame_count & 3)) {
            if(old_pad & BUTTON_UP) {if(videoscale_y > -179) videoscale_y--;}
            if(old_pad & BUTTON_DOWN) {if(videoscale_y < 10) videoscale_y++;}
            if(old_pad & BUTTON_LEFT) {if(videoscale_x > -199) videoscale_x--;}
            if(old_pad & BUTTON_RIGHT) {if(videoscale_x < 10) videoscale_x++;}
        }

        
        if(new_pad & BUTTON_CROSS) break;

        drawScene(); // Draw

        /* DRAWING FINISH HERE */

        tiny3d_Flip();
        
        frame_count++;
		
	}
	
	return 0;
}

