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

// you need the Oopo ps3libraries to work with freetype

#include <ft2build.h>
#include <freetype/freetype.h> 
#include <freetype/ftglyph.h>

// include fonts

#include "dejavusans_ttf_bin.h"
#include "andika_ttf_bin.h"

/******************************************************************************************************************************************************/
/* TTF functions to load and convert fonts                                                                                                             */
/******************************************************************************************************************************************************/

int ttf_inited = 0;

FT_Library freetype;
FT_Face face;

/* TTFLoadFont can load TTF fonts from device or from memory:

path = path to the font or NULL to work from memory

from_memory = pointer to the font in memory. It is ignored if path != NULL.

size_from_memory = size of the memory font. It is ignored if path != NULL.

*/

int TTFLoadFont(char * path, void * from_memory, int size_from_memory)
{
   
    if(!ttf_inited)
        FT_Init_FreeType(&freetype);
    ttf_inited = 1;

    if(path) {
        if(FT_New_Face(freetype, path, 0, &face)) return -1;
    } else {
        if(FT_New_Memory_Face(freetype, from_memory, size_from_memory, 0, &face)) return -1;
        }

    return 0;
}

/* release all */

void TTFUnloadFont()
{
   FT_Done_FreeType(freetype);
   ttf_inited = 0;
}

/* function to render the character

chr : character from 0 to 255

bitmap: u8 bitmap passed to render the character character (max 256 x 256 x 1 (8 bits Alpha))

*w : w is the bitmap width as input and the width of the character (used to increase X) as output
*h : h is the bitmap height as input and the height of the character (used to Y correction combined with y_correction) as output

y_correction : the Y correction to display the character correctly in the screen

*/

void TTF_to_Bitmap(u8 chr, u8 * bitmap, short *w, short *h, short *y_correction)
{
    FT_Set_Pixel_Sizes(face, (*w), (*h));
    
    FT_GlyphSlot slot = face->glyph;

    memset(bitmap, 0, (*w) * (*h));

    if(FT_Load_Char(face, (char) chr, FT_LOAD_RENDER )) {(*w) = 0; return;}

    int n, m, ww;

    *y_correction = (*h) - 1 - slot->bitmap_top;
    
    ww = 0;

    for(n = 0; n < slot->bitmap.rows; n++) {
        for (m = 0; m < slot->bitmap.width; m++) {

            if(m >= (*w) || n >= (*h)) continue;
            
            bitmap[m] = (u8) slot->bitmap.buffer[ww + m];
        }
    
    bitmap += *w;

    ww += slot->bitmap.width;
    }

    *w = ((slot->advance.x + 31) >> 6) + ((slot->bitmap_left < 0) ? -slot->bitmap_left : 0);
    *h = slot->bitmap.rows;
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
	float x, y;

    tiny3d_Project2D(); // change to 2D context (remember you it works with 848 x 512 as virtual coordinates)
    
    DrawBackground2D(0x0040ffff) ; // light blue 

    SetFontSize(18, 32);
    
    x= 0.0; y = 0.0;

    SetCurrentFont(1);
    SetFontColor(0xffffffff, 0x0);
    x = DrawString(x, y, "Hello World!. My nick is ");

    SetCurrentFont(0);
    SetFontColor(0x00ff00ff, 0x0);
    x = DrawString(x, y, "Hermes ");

    SetCurrentFont(1);
    SetFontColor(0xffffffff, 0x0);
    x = DrawString(x, y, "and this is one sample working with captured TTF fonts.");
    
    x = 0; y += 40;
    SetCurrentFont(1);
    DrawString(x, y, "I am using 3 fonts:");
    
    SetCurrentFont(0);
    y += 40;
    SetFontColor(0xffffffff, 0x00a000ff);
    DrawFormatString(x, y, "Font 0 is one TTF array capture of 224 chars 32 x 32 pix and texture size %i KB", 224 * 32 * 32 * 2 / 1024);

    SetCurrentFont(1);
    y += 40;
    SetFontColor(0xffffffff, 0xa00000ff);
    DrawFormatString(x, y, "Font 1 is one TTF array capture of 224 chars 32 x 32 pix and texture size %i KB", 224 * 32 * 32 * 2 / 1024);

    SetCurrentFont(2);
    y += 40;
    SetFontColor(0x000000ff, 0xffff00ff);
    DrawFormatString(x, y, "Font 2 is the Font 1 captured as 64 x 64 pix and texture size %i KB", 224 * 64 * 64 * 2 / 1024);

    y += 48;
    SetCurrentFont(2);
    SetFontSize(32, 64);
    SetFontColor(0xffffffff, 0x000000ff);
    SetFontAutoCenter(1);
    DrawString(0, y, "You can resize letters with SetFontSize()");
    SetFontAutoCenter(0);

    SetFontSize(18, 32);
    SetFontColor(0xffffffff, 0x00000000);
    y += 72;

    SetFontAutoNewLine(848);
    x = DrawString(0, y, "change the color, background color and center the text with ");

    SetFontColor(0x00ff00ff, 0x00000000);
    x = DrawString(x, GetFontY(), "SetFontAutoCenter()");

    SetCurrentFont(0);
    SetFontColor(0xffffffff, 0x00000000);

    x = DrawString(x, GetFontY(), ". This txt is displayed using ");

    SetFontColor(0x00ff00ff, 0x00000000);
    x = DrawString(x, GetFontY(), "SetFontAutoNewLine()");
    SetFontColor(0xffffffff, 0x00000000);

    x = DrawString(x, GetFontY(), " option. ");

    DrawString(x, GetFontY(), "TTF captured as bitmap is a good compromise between speed and quality fonts without using one big "
    "surface (1920 x 1080 x 4 bytes) to maintain the quality in all video resolutions and "
    "using the CPU to render the fonts instead of using the RSX for it.\n"
    "Remember you always to test the result at 480/576P video modes .");
    
    SetFontAutoNewLine(0);

    y = GetFontY();
    x = 0;
}


void LoadTexture()
{

    u32 * texture_mem = tiny3d_AllocTexture(64*1024*1024); // alloc 64MB of space for textures (this pointer can be global)    

    u32 * texture_pointer; // use to asign texture space without changes texture_mem

    if(!texture_mem) return; // fail!

    texture_pointer = texture_mem;

    

    ResetFont();

    TTFLoadFont(NULL, (void *) dejavusans_ttf_bin, dejavusans_ttf_bin_size);
    texture_pointer = (u32 *) AddFontFromTTF((u8 *) texture_pointer, 32, 255, 32, 32, TTF_to_Bitmap);
    TTFUnloadFont();

    TTFLoadFont(NULL, (void *) andika_ttf_bin, andika_ttf_bin_size);
    texture_pointer = (u32 *) AddFontFromTTF((u8 *) texture_pointer, 32, 255, 32, 32, TTF_to_Bitmap);
    texture_pointer = (u32 *) AddFontFromTTF((u8 *) texture_pointer, 32, 255, 64, 64, TTF_to_Bitmap);
    TTFUnloadFont();

    // here you can add more textures using 'texture_pointer'. It is returned aligned to 16 bytes
    
}

padInfo padinfo;
padData paddata;

s32 main(s32 argc, const char* argv[])
{
	
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

        drawScene(); // Draw


        /* DRAWING FINISH HERE */

        tiny3d_Flip();
		
	}

	return 0;
}

