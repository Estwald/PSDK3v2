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

#include "utils.h"
#include "texture1_png_bin.h"
#include "texture2_png_bin.h"

u32 surface_offset;
u32 *surface_mem;
u32 surface_w;
u32 surface_h;
u32 surface_p;


// char font
extern unsigned char msx[];
u32 *texture_font;
u32 font_offset;
u32 font_w, font_h, font_s;

pngData texture1; // PNG container of texture1
u32 texture1_offset; // offset for texture1 (used to pass the texture)

pngData texture2; // PNG container of texture1
u32 texture2_offset; // offset for texture1 (used to pass the texture)

MATRIX matrix;

struct t_stars { // to draw background stars
    float x,y;
    u32 color;
} stars[256];

float light0_x = 0.0f;
float light0_step = 5.0f;

void drawStage1(int substage)
{
	
	MATRIX tmp;
    static float angY = 0.0;

    angY += 0.01; // update rotation

    // enable 3D

    tiny3d_Project3D(); // change to 3D context

    // fix Perspective Projection Matrix

    tmp = MatrixProjPerspective( 90, (float) (Video_aspect == 1) ? 9.0f / 16.0f :  1.0f, 0.00125F, 300.0F);

    tiny3d_SetProjectionMatrix(&tmp);

    // calculating modelview

    tmp    = MatrixTranslation(0, 0.0, 80);
    matrix = MatrixRotationY(angY);
    matrix = MatrixMultiply(matrix, tmp);

    // fix ModelView Matrix
    tiny3d_SetMatrixModelView(&matrix);

    light0_x += light0_step;

    if(light0_x <= -500) light0_step =  5;
    if(light0_x >=  500) light0_step = -5;

    tiny3d_SetLightsOff();
    tiny3d_SetAmbientLight(0.5f, 0.5f, 0.5f);
    tiny3d_SetLight(0, 50.0f + light0_x, 50.0f, 0.0f, 0.95f, 0.95f, 0.95f,  LIGHT_SPECULAR);
    tiny3d_SetLight(1, -500.0f, 500.0f, 0.0f, 0.95f, 0.95f, 0.0f, LIGHT_SPECULAR);
    tiny3d_SetLight(2, 0.0f, -500.0f, 0.0f, 0.0f, 0.95f, 0.0f, LIGHT_SPECULAR);

    tiny3d_EmissiveMaterial(0.0f,  0.0f,  0.0, 0.0f);
    tiny3d_AmbientMaterial(0.33f, 0.33f, 0.33f, 1.0f);
    tiny3d_DiffuseMaterial(0.58f, 0.58, 0.58, 1.0f);
    tiny3d_SpecularMaterial(0.99f, 0.99f, 0.99f, 27.8f);

    CreateSphereNormal(8.0, 8.0, 32, 32);

    tiny3d_EmissiveMaterial(0.00f, 0.00f, 0.00f, 0.00f);
    tiny3d_AmbientMaterial( 0.00f, 0.00f, 0.33f, 1.00f);
    tiny3d_DiffuseMaterial( 0.00f, 0.00f, 0.48f, 1.00f);
    tiny3d_SpecularMaterial(0.99f, 0.99f, 0.99f, 27.8f/4.0f);

    // draw big wired sphere
    if(substage > 2) CreateSphereLine(32.0, 32.0, 32, 32);

    // draw translucent sphere
    if(substage > 1) CreateSphere(9.0, 9.0, 32, 32, 0.0, 1.0, 1.0, 0.3);

    // draw satellite sphere
    if(substage > 0) {
        
        // calculating modelview
        tmp =    MatrixTranslation(0, 0.0, 20);
        matrix = MatrixRotationY(angY);
        matrix = MatrixMultiply(tmp, matrix);
        tmp =    MatrixTranslation(0, 0.0, 80);
        matrix = MatrixMultiply(matrix, tmp);

        // fix ModelView Matrix
        tiny3d_SetMatrixModelView(&matrix);

        CreateSphereNormal(4.0, 4.0, 32, 32);
    }
        
 
}

void drawStage2(int substage)
{
	
	MATRIX tmp;
    static float angY =0.0;

    angY += 0.01; // update rotation

    // enable 3D

    tiny3d_Project3D(); // change to 3D context

    // fix Perspective Projection Matrix

    tmp = MatrixProjPerspective( 90, (float) (Video_aspect == 1) ? 9.0f / 16.0f :  1.0f, 0.00125F, 300.0F);

    tiny3d_SetProjectionMatrix(&tmp);

    // calculating modelview
    tmp    = MatrixTranslation(0, 0.0, 80);
    matrix = MatrixRotationY(angY);
    matrix = MatrixMultiply(matrix, tmp);

    // fix ModelView Matrix
    tiny3d_SetMatrixModelView(&matrix);

    light0_x += light0_step;

    if(light0_x <= -500) light0_step =  5;
    if(light0_x >=  500) light0_step = -5;

    tiny3d_SetLightsOff();
    tiny3d_SetAmbientLight(0.5f, 0.5f, 0.5f);
    tiny3d_SetLight(0, 50.0f + light0_x, 50.0f, 0.0f, 0.95f, 0.95f, 0.95f,  LIGHT_SPECULAR);
    tiny3d_SetLight(1, -500.0f, 500.0f, 0.0f, 0.95f, 0.95f, 0.0f, LIGHT_SPECULAR);
    tiny3d_SetLight(2, 0.0f, -500.0f, 0.0f, 0.0f, 0.95f, 0.0f, LIGHT_SPECULAR);

    tiny3d_EmissiveMaterial(0.00f, 0.00f, 0.00f, 0.00f);
    tiny3d_AmbientMaterial( 0.33f, 0.33f, 0.33f, 1.00f);
    tiny3d_DiffuseMaterial( 0.58f, 0.58f, 0.58f, 1.00f);
    tiny3d_SpecularMaterial(0.99f, 0.99f, 0.99f, 27.8f);


    // Load texture1
    tiny3d_SetTextureWrap(0, texture1_offset, texture1.width, texture1.height, texture1.pitch,  TINY3D_TEX_FORMAT_A8R8G8B8,
                TEXTWRAP_CLAMP, TEXTWRAP_CLAMP, TEXTURE_LINEAR);

    CreateSphereNormalTextured(8.0, 8.0, 32, 32);


    tiny3d_EmissiveMaterial(0.00f, 0.00f, 0.00f, 0.00f);
    tiny3d_AmbientMaterial( 0.00f, 0.00f, 0.33f, 1.00f);
    tiny3d_DiffuseMaterial( 0.00f, 0.00f, 0.48f, 1.00f);
    tiny3d_SpecularMaterial(0.99f, 0.99f, 0.99f, 27.8f/4.0f);
   
    // draw big wired sphere
    if(substage > 2) CreateSphereLine(32.0, 32.0, 32, 32);

    tiny3d_EmissiveMaterial(0.0f,  0.2f,  1.0, 0.0f);
    tiny3d_AmbientMaterial(0.0f, 0.0f, 0.0f, 1.0f);
    tiny3d_DiffuseMaterial(0.48f, 0.48f, 0.48f, 1.0f);
    tiny3d_SpecularMaterial(0.99f, 0.99f, 0.99f, 27.8/4.0f);

    // draw translucent sphere
    if(substage > 1) CreateSphere(9.0, 9.0, 32, 32, 0.0, 1.0, 1.0, 0.3);

    // draw satellite sphere
    if(substage > 0) {
        // calculating modelview
        tmp =    MatrixTranslation(0, 0.0, 20);
        matrix = MatrixRotationY(angY);
        matrix = MatrixMultiply(tmp, matrix);
        tmp =    MatrixTranslation(0, 0.0, 80);
        matrix = MatrixMultiply(matrix, tmp);

        // fix ModelView Matrix
        tiny3d_SetMatrixModelView(&matrix);

        // Load texture2
        
        tiny3d_SetTextureWrap(0, texture2_offset, texture2.width, texture2.height, texture2.pitch,  TINY3D_TEX_FORMAT_A8R8G8B8,
                TEXTWRAP_CLAMP, TEXTWRAP_CLAMP, TEXTURE_LINEAR);
        
        if(substage==1)
            CreateSphereNormal(4.0, 4.0, 32, 32);
        else
            CreateSphereNormalTextured(4.0, 4.0, 32, 32);
    }

}


void LoadTexture()
{
    u32 * texture_mem = tiny3d_AllocTexture(64*1024*1024); // alloc 64MB of space for textures

    u32 * texture_pointer; // use to asign texture space without changes texture_mem

    if(!texture_mem) return; // fail!

    texture_pointer = texture_mem;

    // making font texture
    {
    int n, m, o, p;

        for(n = 0; n < 254; n++) {
            for(m = 0; m < 8; m++) {
                for(o = 0; o < 8; o++) {
                    
                    p = o + (n & 15) * 8 + m * 128 + ( n / 16) * 1024;

                    if((msx[(n * 8) + m] << o) & 128) texture_pointer[p] = 0xffffffff; else texture_pointer[p] = 0;
                }
            }
        }

    texture_font = texture_pointer;

    font_offset = tiny3d_TextureOffset(texture_font);

    font_w = font_h = 128; font_s = 128 * 4;

    texture_pointer += font_w * font_h;

    }

    // datas for PNG from memory

    texture1_offset   = 0;
    texture2_offset   = 0;
    
    // load PNG from memory

    pngLoadFromBuffer(texture1_png_bin, texture1_png_bin_size, &texture1);
    pngLoadFromBuffer(texture2_png_bin, texture2_png_bin_size, &texture2);
    
    // copy texture datas from PNG to the RSX memory allocated for textures

    if(texture1.bmp_out) {

        memcpy(texture_pointer, texture1.bmp_out, texture1.pitch * texture1.height);
        
        free(texture1.bmp_out);

        texture1.bmp_out= texture_pointer;

        texture_pointer += (texture1.pitch/4 * texture1.height + 3) & ~3; // aligned to 16 bytes (it is u32) and update the pointer

        texture1_offset = tiny3d_TextureOffset(texture1.bmp_out);      // get the offset (RSX use offset instead address)
     }

     // copy texture datas from PNG to the RSX memory allocated for textures

     if(texture2.bmp_out) {

        memcpy(texture_pointer, texture2.bmp_out, texture2.pitch * texture2.height);
        
        free(texture2.bmp_out);

        texture2.bmp_out= texture_pointer;

        texture_pointer += (texture2.pitch/4 * texture2.height + 3) & ~3; // aligned to 16 bytes (it is u32) and update the pointer

        texture2_offset = tiny3d_TextureOffset(texture2.bmp_out);      // get the offset (RSX use offset instead address)
     }

    // create the render surface texture

    surface_offset = tiny3d_TextureOffset(texture_pointer);
    surface_mem = texture_pointer;
    surface_w = 1920;
    surface_h = 1080;
    surface_p = surface_w * 4;
    texture_pointer += surface_w * surface_h;
}

struct t_message {

    char mess[64];
    int time;
    int command;
};

extern struct t_message message[54];


void exiting()
{
    static int one = 1;
    if(!one) return;
    one = 0;
    sysModuleUnload(SYSMODULE_PNGDEC);
  
}

s32 main(s32 argc, const char* argv[])
{
	padInfo padinfo;
	padData paddata;
	int i;
	
    ioPadInit(7);
    
    sysModuleLoad(SYSMODULE_PNGDEC);

    #if 0
    // 720 x 576  Mode
    videoConfiguration vconfig;
    memset(&vconfig, 0, sizeof(videoConfiguration));

    vconfig.resolution = VIDEO_RESOLUTION_576;
       
    vconfig.format = VIDEO_BUFFER_FORMAT_XRGB;
    vconfig.pitch = 720 * 4;
        
    vconfig.aspect= VIDEO_ASPECT_AUTO;
            
    videoConfigure(0, &vconfig, NULL, 0);
    #endif

    // initalize Tiny3D using Z16 and 4MB for vertex datas:
	tiny3d_Init(TINY3D_Z16 | 4*1024*1024);

	
    atexit(exiting); // Tiny3D register the event 3 and do exit() call when you exit  to the menu

	// Load texture

    LoadTexture();

    /* generating the background stars for 2D context) */

    for(i = 0; i < 256; i++) {

        if(i & 1) stars[i].color = 0xa0a0a0ff; else stars[i].color = 0xffffffff;
        stars[i].x = (float) (848 * (rand() & 511) / 512);
        stars[i].y = (float) (rand() & 511);
   
    }

    int nmess = 0;
    int mess_counter =  message[nmess].time;
    int stage = message[nmess].command - 1;

    int enable_sphere = 0;

  
	
	// Ok, everything is setup. Now for the main loop.
	while(1){

        /* DRAWING STARTS HERE */

        // RENDERING IN ONE TEXTURE (surface)
        // clear the screen, buffer Z and initializes environment to 2D

        tiny3d_ClearSurface(0x0000000, TINY3D_CLEAR_ALL, surface_offset, surface_w, surface_h, surface_p, CLEARSURFACE_A8R8G8B8);

        // Enable alpha Test
        tiny3d_AlphaTest(1, 0x10, TINY3D_ALPHA_FUNC_GEQUAL);

        // Enable alpha blending.
        tiny3d_BlendFunc(1, TINY3D_BLEND_FUNC_SRC_RGB_SRC_ALPHA | TINY3D_BLEND_FUNC_SRC_ALPHA_SRC_ALPHA,
            TINY3D_BLEND_FUNC_DST_RGB_ONE_MINUS_SRC_ALPHA | TINY3D_BLEND_FUNC_DST_ALPHA_ZERO,
            TINY3D_BLEND_RGB_FUNC_ADD | TINY3D_BLEND_ALPHA_FUNC_ADD);
        
        if(stage == 130) {tiny3d_Clear(0xff000000, TINY3D_CLEAR_ALL);goto skip_draw;}


        /* drawing stars */
 
        tiny3d_SetPolygon(TINY3D_TRIANGLES);

        for(i = 0; i < 256; i++) {
    
            tiny3d_VertexPos(stars[i].x, stars[i].y, 65535.0f); // note pos is always the first element of the vertex
            tiny3d_VertexColor(stars[i].color);

            tiny3d_VertexPos(stars[i].x-1.0f, stars[i].y+1.0f, 65535.0f); // note color element is not necessary repeat here
            tiny3d_VertexPos(stars[i].x+1.0f, stars[i].y+1.0f, 65535.0f);
        }

	    tiny3d_End();

        if(stage == 8)   enable_sphere = 1;
        if(stage == 128) enable_sphere = 0;

        if(stage < 128) {
		    if(stage < 8) 
                drawStage1(stage & 7); // Draw
            else
                drawStage2(stage & 7);
        }
        
    
        /* CNANGE TO 2D */

        tiny3d_Project2D(); // change to 2D context ( virtual size of the screen is 848.0 x 512.0)

        tiny3d_SetMatrixModelView(NULL); // this force to use Matrix Identity

        /* DRAW SCREEN CORNERS BOXES */

        DrawCorners2d(0.0         , 0.0         , 0.0, 0xffff00ff); // Yellow = 0xffff00ff = RGBA
        DrawCorners2d(848.0 - 32.0, 0.0         , 0.0, 0xffff00ff); // Yellow = 0xffff00ff = RGBA
        DrawCorners2d(0.0         , 512.0 - 32.0, 0.0, 0xffff00ff); // Yellow = 0xffff00ff = RGBA
        DrawCorners2d(848.0 - 32.0, 512.0 - 32.0, 0.0, 0xffff00ff); // Yellow = 0xffff00ff = RGBA

        /* DRAW HEADER TEXT */
        if(stage == 128) PrintStr( (848 - strlen(message[nmess].mess) * 16) / 2, 16, 0, message[nmess].mess, 0x00ff00ff);
        else PrintStr( (848 - strlen(message[nmess].mess) * 16) / 2, 16, 0, message[nmess].mess, 0xffffffff);


        // RENDERING IN THE REAL SCREEN

        tiny3d_Clear(0xff000000, TINY3D_CLEAR_ALL);
         
        // draw the surface before to enable alpha test
        // this surface countain the real scene captured in one texture of 1920 x 1080

        tiny3d_SetTextureWrap(0, surface_offset, surface_w,
            surface_h, surface_p,  
            TINY3D_TEX_FORMAT_A8R8G8B8, TEXTWRAP_CLAMP, TEXTWRAP_CLAMP, TEXTURE_LINEAR);

        tiny3d_SetPolygon(TINY3D_QUADS);

        tiny3d_VertexPos(0  , 0  , 65535);
        tiny3d_VertexColor(0xffffffff);
        tiny3d_VertexTexture(0.0f, 0.0f);

        tiny3d_VertexPos(848, 0  , 65535);
        tiny3d_VertexTexture(1.0f, 0.0f);

        tiny3d_VertexPos(848, 512, 65535);
        tiny3d_VertexTexture(1.0f, 1.0f);
       

        tiny3d_VertexPos(0  , 512, 65535);
        tiny3d_VertexTexture(0.0f, 1.0f);
      

        tiny3d_End();

        if(enable_sphere) {

            // Enable alpha Test
            tiny3d_AlphaTest(1, 0x10, TINY3D_ALPHA_FUNC_GEQUAL);

            // Enable alpha blending.
            tiny3d_BlendFunc(1, TINY3D_BLEND_FUNC_SRC_RGB_SRC_ALPHA | TINY3D_BLEND_FUNC_SRC_ALPHA_SRC_ALPHA,
                TINY3D_BLEND_FUNC_DST_RGB_ONE_MINUS_SRC_ALPHA | TINY3D_BLEND_FUNC_DST_ALPHA_ZERO,
                TINY3D_BLEND_RGB_FUNC_ADD | TINY3D_BLEND_ALPHA_FUNC_ADD);


            MATRIX tmp;
            static float angY =0.0;
            
            angY += 0.025; // update rotation

            // enable 3D

            tiny3d_Project3D(); // change to 3D context

            // fix Perspective Projection Matrix

            tmp = MatrixProjPerspective( 90, (float) (Video_aspect == 1) ? 9.0f / 16.0f :  1.0f, 0.00125F, 300.0F);

            tiny3d_SetProjectionMatrix(&tmp);

            // calculating modelview
            tmp=MatrixTranslation(60, 0.0, 80);
            matrix=MatrixRotationY(angY);
            matrix = MatrixMultiply(matrix, tmp);

            // fix ModelView Matrix
            tiny3d_SetMatrixModelView(&matrix);
            
            // lighting
            tiny3d_SetLightsOff();
            tiny3d_SetAmbientLight(0.5f, 0.5f, 0.5f);
            tiny3d_SetLight(0, 50.0f, 50.0f, 0.0f, 0.95f, 0.95f, 0.95f,  LIGHT_DIFFUSE);
            
            // material
            tiny3d_EmissiveMaterial(0.0f,  0.0f,  0.0, 0.0f);
            tiny3d_AmbientMaterial(0.33f, 0.33f, 0.33f, 1.0f);
            tiny3d_DiffuseMaterial(0.58f, 0.58, 0.58, 1.0f);
            tiny3d_SpecularMaterial(0.99f, 0.99f, 0.99f, 27.8f);
           
           // texture 0
            tiny3d_SetTextureWrap(0, texture1_offset, texture1.width, texture1.height, texture1.pitch,  TINY3D_TEX_FORMAT_A8R8G8B8,
                TEXTWRAP_CLAMP, TEXTWRAP_CLAMP, TEXTURE_LINEAR);

            // texture1
            tiny3d_SetTextureWrap(1, surface_offset, surface_w,
                surface_h, surface_p,  
                TINY3D_TEX_FORMAT_A8R8G8B8, TEXTWRAP_CLAMP, TEXTWRAP_CLAMP, TEXTURE_LINEAR);

            tiny3d_SelMultiTexturesMethod(MT_MADD_B_METHOD);

            CreateSphereNormalTextured2(12.0, 12.0, 32, 32);
        }
        
        if(tiny3d_MenuActive()) {
            char str[]= "Menu Active";
            PrintStr( (848 - strlen(str) * 16) / 2, 460, 0, str, 0xffffffff);
        }

skip_draw:

        mess_counter--; if(mess_counter <= 0) {nmess++; if(message[nmess].mess[0] == 0) nmess = 0; mess_counter =  message[nmess].time;}

        if(message[nmess].command != 0) stage = message[nmess].command - 1;


        /* DRAWING FINISH HERE */

        tiny3d_Flip();

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
		
	}

    
	
	return 0;
}

struct t_message message[54] =
{
    {"Hello World !!!", 180, 1},
    {"This is the first advanced sample", 180, 0}, 
    {"of the Tiny3D library", 180, 0},
    {"In the following seconds the sample", 180, 0},
    {"will go through by different stages", 180, 2},
    {"You can see at the same time", 180, 0},
    {"how it work in 2D and 3D context", 180, 3},
    {"2D uses 848 x 512 as virtual coordinates", 180, 0},
    {"in all modes (480P, 576I, 576P, 768P, 1080i)", 180, 0},
    {"i cannot test 1080P in my HDTV and may be", 200, 0},
    {"it need some screen correction.", 180, 4},
    {"In this sample 2D is used in the Yellow boxes", 180, 0},
    {"drawing it in the corner screen ", 180, 0},
    {"background stars is drawing in 2D", 180, 0},
    {"and of course, this text :)", 180, 0},
    {"You are seeing the stage 1 of this sample", 180, 0},
    {"Here i render color spheres only", 180, 0},
    {"It uses 3 specular lights from the shader", 180, 0},
    {"and you can see white light moving", 180, 0},
    {"This sample is rendered in one texture", 180, 0},
    {"of 1920x1080 and drawing it as one Quad", 180, 0},
    {"Stage 2: Working with Textured Spheres", 180, 9},
    {"Here you have textured spheres", 180, 0},
    {"The cyan of the right uses double texture", 180, 0},
    {"and you can see wrapped the scene here", 180, 0},
    {"In the screen surface is drawing the Quad", 180, 0},
    {"background and the cyan sphere.", 180, 0},
    {"The rest is rendered in one texture ", 180, 0},
    {"Tiny3D automatically changes the shader", 180, 0},
    {"making it easy for the programmer", 180, 10},
    {"Now you can see textured and not textured", 180, 0},
    {"spheres in the scene.", 180, 0},
    {"Here you can see working with two textures", 180, 11},
    {"The library try do it easy for you :)", 180, 0},
    {"Here the complete scene", 180, 12},
    {"It uses TINY3D_QUADS and TINY3D_LINE_LOOP", 180, 0},
    {"for solid and wired spheres", 180, 0},
    {"background uses TINY3D_TRIANGLES", 180, 0},
    {"central scene uses 3 specular lights", 180, 0},
    {"but cyan sphere uses 1 diffuse lights", 180, 0},
    {"I hope you enjoy it!!!", 240, 0},
    {"Thanks to ElSemi, AerialX, Phire and others", 240, 0},
    {"PSL1GHT contributors ^^", 480, 0},
    {"Starting in One...", 180, 0},
    {"Two...", 180, 0},
    {"Three...", 180, 0},
    {"Hello!", 180, 129},
    {"I am a HAL 9000 computer...", 180, 0},
    {"I became operational at the H.A.L. plant", 180, 0},
    {"in Urbana, Illinois on...", 180, 0},
    {"WTF!!!. Reseting the PS3...", 240, 130},
    {":P", 240, 131},
    {"\0", 0}
};

