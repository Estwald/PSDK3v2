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


// font 0: 255 chr from 0 to 254, 8 x 8 pix 1 bit depth
extern unsigned char msx[];

typedef struct
{
    int w, h;
    int stride;
    u32 rsx_offset;
    u8 * bitmap;
    int color_format;
} Surface;

Surface surface1, surface2;

#define SURFACE_RGBA(r, g, b, a) (((a)<<24) | ((r)<<16) | ((g)<<8) | (b))

u8 * CreateSurface(Surface *surface, u8 *texture, int w, int h, text_format color_format)
{
    texture = (u8 *) ((((long) texture) + 15) & ~15);
    surface->rsx_offset   = tiny3d_TextureOffset(texture);
    surface->bitmap       = texture;
    surface->color_format = color_format;
    surface->w            = w;
    surface->h            = h;

    switch(color_format) {
    
        case TINY3D_TEX_FORMAT_L8: // this format is unsupported
        case TINY3D_TEX_FORMAT_A8R8G8B8:
            surface->color_format = TINY3D_TEX_FORMAT_A8R8G8B8; // force color
            surface->stride = w * 4;
            texture += surface->stride * surface->h;
            texture = (u8 *) ((((long) texture) + 15) & ~15);
            break;
       default:
            surface->color_format = TINY3D_TEX_FORMAT_A1R5G5B5; // force color
            surface->stride = w * 2;
            texture += surface->stride * surface->h;
            texture = (u8 *) ((((long) texture) + 15) & ~15);
            break;
    }

    return texture;
}

void SetPixel(Surface *surface, int x, int y, unsigned color)
{
    if(x < 0 || y < 0 || x >= surface->w || y >= surface->h) return;

    switch(surface->color_format) {
        case TINY3D_TEX_FORMAT_A1R5G5B5:
            * (((u16 *) surface->bitmap) + surface->w * y + x) = ((color >> 16) & 0x8000) | ((color >> 9) & 0x7c00)
            | ((color >> 6) & 0x3e0) | ((color >> 3) & 0x1f);
            break;
        case TINY3D_TEX_FORMAT_A8R8G8B8:
            * (((u32 *) surface->bitmap) + surface->w * y + x) = color;
            break;
    }
}

void DrawSurface(Surface *surface, float x, float y, float z, float w, float h, int smooth)
{
     // Load surface texture
    tiny3d_SetTexture(0, surface->rsx_offset, surface->w, surface->h, surface->stride, surface->color_format, smooth);

    tiny3d_SetPolygon(TINY3D_QUADS);

    tiny3d_VertexPos(x    , y    , z);
    tiny3d_VertexColor(0xffffffff);
    tiny3d_VertexTexture(0.0f, 0.0f);

    tiny3d_VertexPos(x + w, y    , z);
    tiny3d_VertexTexture(0.999f, 0.0f);

    tiny3d_VertexPos(x + w, y + h, z);
    tiny3d_VertexTexture(0.999f, 0.999f);

    tiny3d_VertexPos(x    , y + h, z);
    tiny3d_VertexTexture(0.0f, 0.999f);

    tiny3d_End();
}


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
    int n, m;

    tiny3d_Project2D(); // change to 2D context (remember you it works with 848 x 512 as virtual coordinates)
    DrawBackground2D(0x0040ffff) ; // light blue 

    /****************************************************/
    /* surface 1 is used as virtual screen of 320 x 200 */
    /****************************************************/
    
    // clear surface 1
    memset (surface1.bitmap, 0, surface1.stride * surface1.h);

    // grid in surface 1

    for(n = 0; n < surface1.h; n+=16)
         for(m = 0; m < surface1.w; m++)
            SetPixel(&surface1, m, n, SURFACE_RGBA(0, 0xFF, 0, 0xFF));

    for(n = 0; n < surface1.h; n++)
         for(m = 0; m < surface1.w; m+=16)
            SetPixel(&surface1, m, n, SURFACE_RGBA(0, 0xFF, 0, 0xFF));

    /****************************************************/
    /* surface 2                                        */
    /****************************************************/
    
    // clear surface 2
    memset (surface2.bitmap, 0, surface2.stride * surface2.h);
    
    // grid in surface 2

    for(n = 0; n < surface2.h; n++)
         for(m = 0; m < surface2.w; m++)
            if((n ^ m) & 1)
                SetPixel(&surface2, m, n, SURFACE_RGBA(0xFF, 0xFF, 0, 0xFF));

    /****************************************************/
    /* Draw surfaces                                    */
    /****************************************************/
    
    // disable alpha test and blend
    tiny3d_AlphaTest(0, 0x0, 0);
    tiny3d_BlendFunc(0, 0, 0, 0);
     
    // draw surface 1 as virtual screen of 320 x200. Note it test if you are using a 4:3 format in the screen

    DrawSurface(&surface1, (Video_aspect != 1) ? (848-682)/2 : 0, 0.0f, 1.0f, (Video_aspect != 1) ? 682 : 848, 512.0f, 1);
    
    // draw surface 2 in the screen center
    DrawSurface(&surface2, 848/2-32, 512/2-32, 0.0f, 64.0f, 64.0f, 0);

    /****************************************************/
    /* Draw text                                        */
    /****************************************************/

    // enable alpha test and blend
    tiny3d_AlphaTest(1, 0x10, TINY3D_ALPHA_FUNC_GEQUAL);

    // Enable alpha blending.
        tiny3d_BlendFunc(1, TINY3D_BLEND_FUNC_SRC_RGB_SRC_ALPHA | TINY3D_BLEND_FUNC_SRC_ALPHA_SRC_ALPHA,
            TINY3D_BLEND_FUNC_DST_RGB_ONE_MINUS_SRC_ALPHA | TINY3D_BLEND_FUNC_DST_ALPHA_ZERO,
            TINY3D_BLEND_RGB_FUNC_ADD | TINY3D_BLEND_ALPHA_FUNC_ADD);

    SetFontSize(16, 24);

    SetCurrentFont(1);
    SetFontColor(0xffffffff, 0xa000006f);

    SetFontAutoCenter(1);
    DrawFormatString(0, 16,    "This is one sample using two surfaces");
    DrawFormatString(0, 16+32, "Green Grid is 320 x 200 32 bits surface A8R8G8B8");

    DrawFormatString(0, 16+64, "Yellow Grid is 8 x 8 16 bits surface A1R5G5B5");
    SetFontAutoCenter(0);

}


void LoadTexture()
{

    u32 * texture_mem = tiny3d_AllocTexture(64*1024*1024); // alloc 64MB of space for textures (this pointer can be global)    

    u32 * texture_pointer; // use to asign texture space without changes texture_mem

    if(!texture_mem) return; // fail!

    texture_pointer = texture_mem;

    ResetFont();
    texture_pointer = (u32 *) AddFontFromBitmapArray((u8 *) msx   , (u8 *) texture_pointer,  0, 254,  8,  8, 1, BIT7_FIRST_PIXEL);

    // creates one surface of 320 x 200 and 32 bits
    texture_pointer = (u32 *) CreateSurface(&surface1, (u8 *) texture_pointer, 320, 200, TINY3D_TEX_FORMAT_A8R8G8B8);

    // creates one surface of 64 x 64 and 16 bits
    texture_pointer = (u32 *) CreateSurface(&surface2, (u8 *) texture_pointer, 8, 8, TINY3D_TEX_FORMAT_A1R5G5B5);

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
        
        // Check the pads.
		ioPadGetInfo(&padinfo);

		for(i = 0; i < MAX_PADS; i++){

			if(padinfo.status[i]){
				ioPadGetData(i, &paddata);
				
				if(paddata.BTN_CROSS){
					return 0;
				}
			}

        /* DRAWING STARTS HERE */

        // clear the screen, buffer Z and initializes environment to 2D

        tiny3d_Clear(0xff000000, TINY3D_CLEAR_ALL);

        // Enable alpha Test
        tiny3d_AlphaTest(1, 0x10, TINY3D_ALPHA_FUNC_GEQUAL);

        // Enable alpha blending.
        tiny3d_BlendFunc(1, TINY3D_BLEND_FUNC_SRC_RGB_SRC_ALPHA | TINY3D_BLEND_FUNC_SRC_ALPHA_SRC_ALPHA,
            TINY3D_BLEND_FUNC_DST_RGB_ONE_MINUS_SRC_ALPHA | TINY3D_BLEND_FUNC_DST_ALPHA_ZERO,
            TINY3D_BLEND_RGB_FUNC_ADD | TINY3D_BLEND_ALPHA_FUNC_ADD);
      
			
		}

        drawScene(); // Draw

        /* DRAWING FINISH HERE */

        tiny3d_Flip();
		
	}

	return 0;
}

