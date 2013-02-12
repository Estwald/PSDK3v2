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

#include <sysmodule/sysmodule.h>
#include <pngdec/pngdec.h>

#include <tiny3d.h>
#include <libfont.h>

extern unsigned char msx[];

#include "picture_png_bin.h"

pngData png1; // PNG container


struct {
    void *addr;
    u32 offset;
    u32 w, h, stride;
} texture[4];


void DrawSquare(float x, float y, float z, float dx, float dy)
{
    tiny3d_SetPolygon(TINY3D_QUADS);

    tiny3d_VertexPos(x     , y     , z);

    tiny3d_VertexTexture(0.0f, 0.0f);
    

    tiny3d_VertexPos(x + dx, y     , z);
    tiny3d_VertexTexture(0.99f, 0.0f);
   

    tiny3d_VertexPos(x + dx, y + dy, z);
    tiny3d_VertexTexture(0.99f, 0.99f);
  
    tiny3d_VertexPos(x     , y + dy, z);
    tiny3d_VertexTexture(0.0f, 0.99f);
    

    tiny3d_End();
}

void DrawColorSquare(float x, float y, float z, float dx, float dy, float r, float g, float b, float a)
{
    tiny3d_SetPolygon(TINY3D_QUADS);

    tiny3d_VertexPos(x     , y     , z);
    tiny3d_VertexFcolor(r, g, b, a);
    tiny3d_VertexTexture(0.0f, 0.0f);
    

    tiny3d_VertexPos(x + dx, y     , z);
    tiny3d_VertexTexture(0.99f, 0.0f);
   

    tiny3d_VertexPos(x + dx, y + dy, z);
    tiny3d_VertexTexture(0.99f, 0.99f);
  
    tiny3d_VertexPos(x     , y + dy, z);
    tiny3d_VertexTexture(0.0f, 0.99f);
    

    tiny3d_End();
}


void drawScene(int frame)
{

    int type = 0;

    tiny3d_Project2D(); // change to 2D context (remember you it works with 848 x 512 as virtual coordinates)


    if(!((frame/300) & 1)) {

        // enable YUV 
        tiny3d_Enable_YUV(USE_AYUV_32BITS_TEXTURE); 
      
        // set AYUV 32 bits texture
        tiny3d_SetTextureWrap(0, texture[0].offset, texture[0].w, texture[0].h, texture[0].stride,  
            TINY3D_TEX_FORMAT_A8R8G8B8, TEXTWRAP_CLAMP, TEXTWRAP_CLAMP, TEXTURE_LINEAR);

        type = 0;

    } else {
    
        tiny3d_Enable_YUV(USE_YUV_8BIT_TEXTURES);

        // set Y 8 bit texture
        tiny3d_SetTextureWrap(0, texture[1].offset, texture[1].w, texture[1].h, texture[1].stride,
            TINY3D_TEX_FORMAT_L8, TEXTWRAP_CLAMP, TEXTWRAP_CLAMP, TEXTURE_LINEAR);
       
        // set U 8 bit texture
        tiny3d_SetTextureWrap(1, texture[2].offset, texture[2].w, texture[2].h, texture[2].stride,
            TINY3D_TEX_FORMAT_L8, TEXTWRAP_CLAMP, TEXTWRAP_CLAMP, TEXTURE_LINEAR);
        
        // set V 8 bit texture
        tiny3d_SetTextureWrap(2, texture[3].offset, texture[3].w, texture[3].h, texture[3].stride,
            TINY3D_TEX_FORMAT_L8, TEXTWRAP_CLAMP, TEXTWRAP_CLAMP, TEXTURE_LINEAR);

        type = 1;
    }
    
    // draw YUV image
                                         // r    g    b    a   result = (color + a) * (r, g, b)
    DrawColorSquare(0, 0,  0, 847.0, 511.0, 1.0, 1.0, 1.0, 0.0);

    tiny3d_Disable_YUV();

    SetFontSize(16, 32);
    SetFontColor(0x0040ffff, 0x0);

    if(!type) {

       DrawString(16, 16, "Drawing AYUV 32bits, surface A8R8G8B8");
       
       DrawFormatString(16, 16 + 48, "AYUV (%i x %i x 4)", texture[0].w, texture[0].h);

    } else {

       DrawString(16, 16, "Drawing Y,U,V 8 bits, 3 surfaces L8");
       
       DrawFormatString(16, 16 + 48, "Y (%i x %i), U (%i x %i), V (%i x %i)", texture[1].w, texture[1].h, texture[2].w, texture[2].h,
           texture[3].w, texture[3].h);

    }
        
        
}

void Load_PNG()
{

    // load PNG from memory

    pngLoadFromBuffer(picture_png_bin, picture_png_bin_size, &png1);

}

u8 * build_AYUV_32bits(u8 *texture, u32 * argb, u32 w, u32 h, u32 stride)
{
    float r, g, b;
    float y, u, v;

    int n, m;

    u8 * p = (u8 *) argb;

    for(n = 0; n < h; n++)
        {

        for(m = 0; m < w * 4; m+= 4)
            {
            r = (float) (u32) p[m+1]; g = (float) (u32) p[m+2];b = (float) (u32)p[m+3];

            y =   (0.257 * r) + (0.504 * g) + (0.098 * b) + 16.0;

            v =  (0.439 * r) - (0.368 * g) - (0.071 * b) + 128.0;

            u = -(0.148 * r) - (0.291 * g) + (0.439 * b) + 128.0;
           
            texture[m+0] = 255; // A (Alpha)
            
            texture[m+1] = (u8) y;
                     
            texture[m+2] = (u8) u;
            
            texture[m+3] = (u8) v;
            }

        texture += stride;
        p       += stride;

        }

 
    texture = (u8 *) ((((long) texture) + 15) & ~15); // align pointer for next texture

    return texture;
}

u8 * build_Y_8bits(u8 *texture, u32 * argb, u32 w, u32 h, u32 stride)
{
    float r, g, b;
    float y;

    int n, m;

    u8 * p = (u8 *) argb;

    for(n = 0; n < h; n++)
        {

        for(m = 0; m < w * 4; m+= 4)
            {
            r = (float) (u32) p[m+1]; g = (float) (u32) p[m+2];b = (float) (u32)p[m+3];

            y =   (0.257 * r) + (0.504 * g) + (0.098 * b) + 16.0;

            texture[m/4] = (u8) y;
                     
            }

        texture += stride/4;
        p       += stride;

        }


    texture = (u8 *) ((((long) texture) + 15) & ~15); // align pointer for next texture
    return texture;
}

u8 * build_U_8bits(u8 *texture, u32 * argb, u32 w, u32 h, u32 stride)
{
    float r, g, b;
    float u;

    int n, m;

    u8 * p = (u8 *) argb;
    u8 * p2;

    for(n = 0; n < h; n+=2)
        {

        for(m = 0; m < w * 4; m+= 8)
            {
            r = (float) (u32) p[m+1]; g = (float) (u32) p[m+2];b = (float) (u32)p[m+3];
          
            u = -(0.148 * r) - (0.291 * g) + (0.439 * b) + 128.0;

            p2 = p + stride;

            r = (float) (u32) p[m+1]; g = (float) (u32) p[m+2];b = (float) (u32)p[m+3];
          
            u += -(0.148 * r) - (0.291 * g) + (0.439 * b) + 128.0;
           
            u/=2.0;
            
            texture[m/8] = (u8) u;
                     
        
            }

        texture += stride/8;
        p       += stride*2;

        }


    texture = (u8 *) ((((long) texture) + 15) & ~15); // align pointer for next texture

    return texture;
}

u8 * build_V_8bits(u8 *texture, u32 * argb, u32 w, u32 h, u32 stride)
{
    float r, g, b;
    float v;

    int n, m;

    u8 * p = (u8 *) argb;
    u8 * p2;

    for(n = 0; n < h; n+=2)
        {

        for(m = 0; m < w * 4; m+= 8)
            {
            r = (float) (u32) p[m+1]; g = (float) (u32) p[m+2];b = (float) (u32)p[m+3];

            v =  (0.439 * r) - (0.368 * g) - (0.071 * b) + 128.0;

            p2 = p + stride;

            r = (float) (u32) p[m+1]; g = (float) (u32) p[m+2];b = (float) (u32)p[m+3];

            v +=  (0.439 * r) - (0.368 * g) - (0.071 * b) + 128.0;

            v/=2.0f;

            texture[m/8] = (u8) v;
                     
        
            }

        texture += stride/8;
        p       += stride*2;

        }


    texture = (u8 *) ((((long) texture) + 15) & ~15); // align pointer for next texture

    return texture;
}

void LoadTexture()
{

    u32 * texture_mem = tiny3d_AllocTexture(64*1024*1024); // alloc 64MB of space for textures (this pointer can be global)
    
    u32 * texture_pointer; // use to asign texture space without changes texture_mem

    if(!texture_mem) exit(0); // fail!

    texture_pointer = texture_mem;


    Load_PNG();

    if(!png1.bmp_out) exit(0); // fail!

    ResetFont();
    texture_pointer = (u32 *) AddFontFromBitmapArray((u8 *) msx, (u8 *) texture_pointer,  0, 254,  8,  8, 1, BIT7_FIRST_PIXEL);

    // build AYUV 32 bits map from PNG

    texture[0].addr   = (void *) texture_pointer;
    texture[0].offset = tiny3d_TextureOffset(texture_pointer);
    texture[0].w      = png1.width;
    texture[0].h      = png1.height;
    texture[0].stride = png1.pitch;

    texture_pointer = (u32 *) build_AYUV_32bits((u8 *)texture_pointer, png1.bmp_out, png1.width, png1.height, png1.pitch);

    

    // build Y 8 bits map from PNG (width * height) * 1

    texture[1].addr   = (void *) texture_pointer;
    texture[1].offset = tiny3d_TextureOffset(texture_pointer);
    texture[1].w      = png1.width;
    texture[1].h      = png1.height;
    texture[1].stride = png1.pitch/4;

    texture_pointer = (u32 *)  build_Y_8bits((u8 *)texture_pointer, png1.bmp_out, png1.width, png1.height, png1.pitch);

    // build U 8 bits map from PNG (width/2 * height/2) * 1

    texture[2].addr   = (void *) texture_pointer;
    texture[2].offset = tiny3d_TextureOffset(texture_pointer);
    texture[2].w      = png1.width/2;
    texture[2].h      = png1.height/2;
    texture[2].stride = texture[2].w;

    texture_pointer = (u32 *)  build_U_8bits((u8 *)texture_pointer, png1.bmp_out, png1.width, png1.height, png1.pitch);

    // build V 8 bits map from PNG (width/2 * height/2) * 1

    texture[3].addr   = (void *) texture_pointer;
    texture[3].offset = tiny3d_TextureOffset(texture_pointer);
    texture[3].w      = png1.width/2;
    texture[3].h      = png1.height/2;
    texture[3].stride = texture[3].w;

    texture_pointer = (u32 *)  build_V_8bits((u8 *)texture_pointer, png1.bmp_out, png1.width, png1.height, png1.pitch);


}

void exiting()
{

    sysModuleUnload(SYSMODULE_PNGDEC);
  
}

s32 main(s32 argc, const char* argv[])
{
	padInfo padinfo;
	padData paddata;
	int i;
    int frame = 0;
	
	tiny3d_Init(1024*1024);

	ioPadInit(7);
    
    sysModuleLoad(SYSMODULE_PNGDEC);

    atexit(exiting); // Tiny3D register the event 3 and do exit() call when you exit  to the menu

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


        drawScene(frame);

        frame++;

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

        /* DRAWING FINISH HERE */

        tiny3d_Flip();
		
	}

	return 0;
}

