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

#include "ghost1_png_bin.h"
#include "ghost2_png_bin.h"
#include "ghost3_png_bin.h"
#include "ghost4_png_bin.h"
#include "ghost5_png_bin.h"
#include "ghost6_png_bin.h"
#include "ghost7_png_bin.h"
#include "ghost8_png_bin.h"


pngData texture_ghost  [8]; // PNG container of texture
u32 texture_ghost_offset[8]; // offset for texture (used to pass the texture)

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

void DrawSprites2D(float x, float y, float layer, float dx, float dy, u32 rgba)
{
    tiny3d_SetPolygon(TINY3D_QUADS);

    tiny3d_VertexPos(x     , y     , layer);
    tiny3d_VertexColor(rgba);
    tiny3d_VertexTexture(0.0f, 0.0f);

    tiny3d_VertexPos(x + dx, y     , layer);
    tiny3d_VertexTexture(0.99f, 0.0f);

    tiny3d_VertexPos(x + dx, y + dy, layer);
    tiny3d_VertexTexture(0.99f, 0.99f);

    tiny3d_VertexPos(x     , y + dy, layer);
    tiny3d_VertexTexture(0.0f, 0.99f);

    tiny3d_End();
}

void DrawSpritesRot2D(float x, float y, float layer, float dx, float dy, u32 rgba, float angle)
{
    dx /= 2.0f; dy /= 2.0f;

    MATRIX matrix;
    
    // rotate and translate the sprite
    matrix = MatrixRotationZ(angle);
    matrix = MatrixMultiply(matrix, MatrixTranslation(x + dx, y + dy, 0.0f));
    
    // fix ModelView Matrix
    tiny3d_SetMatrixModelView(&matrix);
   
    tiny3d_SetPolygon(TINY3D_QUADS);

    tiny3d_VertexPos(-dx, -dy, layer);
    tiny3d_VertexColor(rgba);
    tiny3d_VertexTexture(0.0f , 0.0f);

    tiny3d_VertexPos(dx , -dy, layer);
    tiny3d_VertexTexture(0.99f, 0.0f);

    tiny3d_VertexPos(dx , dy , layer);
    tiny3d_VertexTexture(0.99f, 0.99f);

    tiny3d_VertexPos(-dx, dy , layer);
    tiny3d_VertexTexture(0.0f , 0.99f);

    tiny3d_End();

    tiny3d_SetMatrixModelView(NULL); // set matrix identity

}

struct {

    float x, y;
    float dx, dy;
    int frame;
    u32 color;

} ghost[4];

void drawScene()
{
	int i;

    static int count_frames =0;

    static float rotZ = 0.0f;

    static int rotar =0;

    if(!rotar && (rand() & 255)==1) rotar = 180;

    rotZ += 0.1f;

    tiny3d_Project2D(); // change to 2D context (remember you it works with 848 x 512 as virtual coordinates)

    // fix Perspective Projection Matrix

    DrawBackground2D(0x0040ffff) ; // light blue 

    count_frames++;

    for(i = 0; i < 4; i++) {
        
        int cur_text = ghost[i].frame; // get current texture index for frame

        // Load sprite texture
        tiny3d_SetTexture(0, texture_ghost_offset[cur_text], texture_ghost[cur_text].width,
            texture_ghost[cur_text].height, texture_ghost[cur_text].pitch,  
            TINY3D_TEX_FORMAT_A8R8G8B8, TEXTURE_LINEAR);

        if(!rotar) {
            
            // draw sprite
            DrawSprites2D(ghost[i].x, ghost[i].y, (float) i, 64, 64, ghost[i].color);
        
        }
        else {

            // draw with rotation
            DrawSpritesRot2D(ghost[i].x, ghost[i].y, (float) i, 64, 64, ghost[i].color, rotZ);
        }

        // update frame
        if(count_frames>8) {
            
            ghost[i].frame = ((ghost[i].frame + 1) & 3) | (ghost[i].frame & 4); 
        }
        
        // update position
        ghost[i].x += ghost[i].dx; 
        ghost[i].y += ghost[i].dy;

        // test the limits
        if(ghost[i].x <= 0.0f || ghost[i].x >= (847.0f - 64.0f)) {
            
            ghost[i].x  = (ghost[i].x <= 0.0f) ? 0 : (847.0f - 64.0f);
            ghost[i].dx = -ghost[i].dx;
            
        }

        if(ghost[i].y <= 0.0f || ghost[i].y >= (511.0f - 64.0f)) {
            
            ghost[i].y  = (ghost[i].y <= 0.0f) ? 0 : (511.0f - 64.0f);
            ghost[i].dy = -ghost[i].dy;
        }

        // change frames to left - right

        if(ghost[i].dx >= 0.0f) ghost[i].frame |= 4; else ghost[i].frame &= ~4;
        
    }

    if(rotar) rotar--; else rotZ = 0.0f;

    if(count_frames > 8) count_frames = 0;
}

void Load_PNG()
{

    // load PNG from memory

    pngLoadFromBuffer(ghost1_png_bin, ghost1_png_bin_size, &texture_ghost[0]);
    pngLoadFromBuffer(ghost2_png_bin, ghost2_png_bin_size, &texture_ghost[1]);
    pngLoadFromBuffer(ghost3_png_bin, ghost3_png_bin_size, &texture_ghost[2]);
    pngLoadFromBuffer(ghost4_png_bin, ghost4_png_bin_size, &texture_ghost[3]);
    pngLoadFromBuffer(ghost5_png_bin, ghost5_png_bin_size, &texture_ghost[4]);
    pngLoadFromBuffer(ghost6_png_bin, ghost6_png_bin_size, &texture_ghost[5]);
    pngLoadFromBuffer(ghost7_png_bin, ghost7_png_bin_size, &texture_ghost[6]);
    pngLoadFromBuffer(ghost8_png_bin, ghost8_png_bin_size, &texture_ghost[7]);

}

void LoadTexture()
{
    int i;

    u32 * texture_mem = tiny3d_AllocTexture(64*1024*1024); // alloc 64MB of space for textures (this pointer can be global)
    
    u32 * texture_pointer; // use to asign texture space without changes texture_mem

    if(!texture_mem) return; // fail!

    texture_pointer = texture_mem;


    Load_PNG();

    // copy texture datas from PNG to the RSX memory allocated for textures

    for(i = 0; i < 8; i++) {
       
        texture_ghost_offset[i]   = 0;
       
        if(texture_ghost[i].bmp_out) {

            memcpy(texture_pointer, texture_ghost[i].bmp_out, texture_ghost[i].pitch * texture_ghost[i].height);
            
            free(texture_ghost[i].bmp_out); // free the PNG because i don't need this datas

            texture_ghost_offset[i] = tiny3d_TextureOffset(texture_pointer);      // get the offset (RSX use offset instead address)

            texture_pointer += ((texture_ghost[i].pitch * texture_ghost[i].height + 15) & ~15) / 4; // aligned to 16 bytes (it is u32) and update the pointer
         }
    }
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
	
	tiny3d_Init(1024*1024);

	ioPadInit(7);
    
    sysModuleLoad(SYSMODULE_PNGDEC);

    atexit(exiting); // Tiny3D register the event 3 and do exit() call when you exit  to the menu

	// Load texture

    LoadTexture();

    /* data for the ghost */

    ghost[0].x     = 0.0f;
    ghost[0].y     = 0.0f;
    ghost[0].dx    = 1.5f;
    ghost[0].dy    = 1.5f;
    ghost[0].frame = 0;
    ghost[0].color = 0xffffff80;

    ghost[1].x     = (847.0f - 64.0f);
    ghost[1].y     = 0.0f;
    ghost[1].dx    = -1.5f;
    ghost[1].dy    = 1.5f;
    ghost[1].frame = 0;
    ghost[1].color = 0x8f8fff80;

    ghost[2].x     = 0.0f;
    ghost[2].y     = (511.0f - 64.0f);
    ghost[2].dx    = 1.5f;
    ghost[2].dy    = -1.5f;
    ghost[2].frame = 0;
    ghost[2].color = 0xff8f8f80;

    ghost[3].x     = (847.0f - 64.0f);
    ghost[3].y     = (511.0f - 64.0f);
    ghost[3].dx    = -1.5f;
    ghost[3].dy    = -1.5f;
    ghost[3].frame = 0;
    ghost[3].color = 0x8fff8f80;
	
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

