/* 
   TINY3D sample / (c) 2011 Hermes <www.elotrolado.net>

*/

#include <assert.h>
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


/*---------------------------------------------------------------------------------------------------------------------------------------------*/
/* LISTS                                                                                                                                       */
/*---------------------------------------------------------------------------------------------------------------------------------------------*/

/*

// start recording list of polygon, vertex, textures, material, matrix propierties

int tiny3d_RecordList(); // first function to call to  start the record

// use this instead tiny3d_SetMatrixModelView() to set one external-dynamic matrix

void tiny3d_DynamicMatrixList(MATRIX *mat); // put one matrix to control the object externally

// use this instead tiny3d_SetMatrixModelView() to apply the matrix changes directly

void tiny3d_ApplyMatrixList(MATRIX *mat); // apply directly the matrix to the vertex position and normals

// Record list stop and return the head of the list command

void * tiny3d_StopList();  // last function to call (return the recorded list)

// draw list. Also can link the list with the recording current list (hierarchy lists)

void tiny3d_DrawList(void * headlist); // draw the list. You can concatenate this function in others list recording

// free list (is not recursive)

void tiny3d_FreeList(void * headlist); // to free the current list. If you have concatenate list call to this function individually for the list

*/

/* 

functions to use into one recording list:


void tiny3d_SetMatrixModelView(MATRIX *mat); // effect : put one static matrix (when you call to DrawList this matrix is the first to multiply)

void tiny3d_ApplyMatrixList(MATRIX *mat); // apply directly the matrix to the vertex position and normals to create the object

void tiny3d_DynamicMatrixList(MATRIX *mat); // put one matrix to control the object externally (if you modify the matrix, the object changes)

int tiny3d_SetPolygon(type_polygon type); 
int tiny3d_End();

void tiny3d_VertexPos(float x, float y, float z);
void tiny3d_VertexPos4(float x, float y, float z, float w);
void tiny3d_VertexPosVector(VECTOR v);

void tiny3d_VertexColor(u32 rgba);
void tiny3d_VertexFcolor(float r, float g, float b, float a);

void tiny3d_VertexTexture(float u, float v);
void tiny3d_VertexTexture2(float u, float v);
 
void tiny3d_Normal(float x, float y, float z);
void tiny3d_NormalVector(VECTOR v);

void tiny3d_EmissiveMaterial(float r, float g, float b, float a);

void tiny3d_AmbientMaterial (float r, float g, float b, float a);

void tiny3d_DiffuseMaterial (float r, float g, float b, float a);

void tiny3d_SpecularMaterial(float r, float g, float b, float shininess);

void tiny3d_SelMultiTexturesMethod(u32 method);
void tiny3d_SetTexture(u32 unit, u32 offset, u32 width, u32 height, u32 stride, text_format fmt, int smooth);
void tiny3d_SetTextureWrap(u32 unit, u32 offset, u32 width, u32 height, u32 stride, text_format fmt, int wrap_u, int wrap_v, int smooth);

*/

MATRIX matrix;

struct t_stars { // to draw background stars
    float x,y;
    u32 color;
} stars[256];

float light0_x = 0.0f;
float light0_step = 5.0f;

void *material_white_plastic = NULL;
void *material_red_plastic = NULL;

void *list_object1;
void *list_object2;

MATRIX mat_object1;
MATRIX mat_object2;

void *list_arm;

void Build_White_Plastic()
{
    // build list material

    tiny3d_RecordList();

    tiny3d_EmissiveMaterial(0.0f,  0.0f,  0.0, 0.0f);
    tiny3d_AmbientMaterial(0.33f, 0.33f, 0.33f, 1.0f);
    tiny3d_DiffuseMaterial(0.58f, 0.58, 0.58, 1.0f);
    tiny3d_SpecularMaterial(0.99f, 0.99f, 0.99f, 128.8f);

    material_white_plastic = tiny3d_StopList();

    assert(material_white_plastic);
}

void Build_Red_Plastic()
{
    // build list material

    tiny3d_RecordList();

    tiny3d_EmissiveMaterial(0.0f,  0.0f,  0.0, 0.0f);
    tiny3d_AmbientMaterial(0.33f, 0.0f, 0.0f, 1.0f);
    tiny3d_DiffuseMaterial(0.58f, 0.0, 0.0, 1.0f);
    tiny3d_SpecularMaterial(0.99f, 0.99f, 0.99f, 27.8f);

    material_red_plastic = tiny3d_StopList();

    assert(material_red_plastic);

}

void Build_Object1()
{
    MATRIX tmp;

    tiny3d_RecordList();

    tiny3d_DrawList(material_white_plastic);

    CreateSphereNormal(8.0, 8.0, 32, 32);

    tmp = MatrixTranslation(0.0, -12.0, 0.0);

    tiny3d_ApplyMatrixList(&tmp);

    CreateCilinderNormal(4.0, 8.0, 32, 32);

    list_object1 = tiny3d_StopList();

    assert(list_object1);

}

void Build_Object2()
{
    MATRIX tmp;

    tiny3d_RecordList();
    
    tiny3d_DrawList(material_white_plastic);

    CreateSphereNormal(8.0, 8.0, 32, 32);

    tmp = MatrixTranslation(0.0, -12.0, 0.0);
    tiny3d_ApplyMatrixList(&tmp);

    CreateCilinderNormal(4.0, 8.0, 32, 32);

    tiny3d_DrawList(material_red_plastic);

    tmp = MatrixTranslation(0.0, -24.0, 0.0);
    tiny3d_ApplyMatrixList(&tmp);

    CreateSphereNormal(10.0, 10.0, 32, 32);

    list_object2 = tiny3d_StopList();

    assert(list_object2);

}


void Build_Arm()
{
    tiny3d_RecordList();

    // define one external matrix to control the object1
    tiny3d_DynamicMatrixList(&mat_object1);
    tiny3d_DrawList(list_object1);
    
    // define one external matrix to control the object1
    tiny3d_DynamicMatrixList(&mat_object2);
    tiny3d_DrawList(list_object2);

    list_arm = tiny3d_StopList();

    assert(list_arm);
}

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

    
    // update Light position

    light0_x += light0_step;

    if(light0_x <= -500) light0_step =  5;
    if(light0_x >=  500) light0_step = -5;

    // set lights

    tiny3d_SetLightsOff();
    
    tiny3d_SetAmbientLight(1.0f, 1.0f, 1.0f);
   
    tiny3d_SetLight(0, 50.0f + light0_x, 50.0f, 0.0f, 0.95f, 0.95f, 0.95f,  LIGHT_SPECULAR);
   
    
    // Arm object control
   
    static float angle1= 0.0f, sum_angle1 = 0.01f;
    static float angle2= 0.0f, sum_angle2 = 0.1f;

    VECTOR axis;
    VECTOR trans;
    MATRIX m_axis;

    axis.x = 1.0f; axis.y = 0.0f; axis.z = 0.0f;
    
    // build matrix for object 1

    m_axis = MatrixRotationAxis(angle1, axis);

    tmp     = MatrixTranslation(0.0f, 0.0f, 0.0f);

    mat_object1 = MatrixMultiply(m_axis, tmp);

    // build matrix for object 2

    trans.x = 0.0f; trans.y = -24.0f; trans.z = 0.0f;

    tmp = MatrixTranslation(trans.x, trans.y, trans.z);

    tmp = MatrixMultiply(tmp, mat_object1);

    m_axis = MatrixRotationAxis(angle2, axis);

    mat_object2 = MatrixMultiply(m_axis, tmp);

    // update angles

    angle1 += sum_angle1;
    angle2 += sum_angle2;

    if(angle1 < 0 || angle1 >= 3.141592654f / 1.5f) sum_angle1 =- sum_angle1;
    if(angle2 < 0 || angle2 >= 3.141592654f / 1.5f) sum_angle2 =- sum_angle2;

    // draw the list

    tiny3d_DrawList(list_arm);
               
}

void LoadTexture()
{

}

void exiting()
{   
  
}

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


s32 main(s32 argc, const char* argv[])
{
	padInfo padinfo;
	padData paddata;
	int i;


	
    // initalize Tiny3D using Z32 and 4MB for vertex datas

	tiny3d_Init(/*TINY3D_Z16 | */32*1024*1024);

	ioPadInit(7);

    atexit(exiting); // Tiny3D register the event 3 and do exit() call when you exit  to the menu

	// Load texture

    LoadTexture();

    // create list for materials
    
    Build_White_Plastic();
    Build_Red_Plastic();

    // create list for objects
    
    Build_Object1();
    Build_Object2();
    Build_Arm();

    /* generating the background stars for 2D context) */

    for(i = 0; i < 256; i++) {

        if(i & 1) stars[i].color = 0xa0a0a0ff; else stars[i].color = 0xffffffff;
        stars[i].x = (float) (848 * (rand() & 511) / 512);
        stars[i].y = (float) (rand() & 511);
   
    }

 
	
	// Ok, everything is setup. Now for the main loop.
	while(1){

        /* DRAWING STARTS HERE */

        tiny3d_Clear(0xff000000, TINY3D_CLEAR_ALL);
        // Enable alpha Test
        tiny3d_AlphaTest(1, 0x10, TINY3D_ALPHA_FUNC_GEQUAL);

        // Enable alpha blending.
        tiny3d_BlendFunc(1, TINY3D_BLEND_FUNC_SRC_RGB_SRC_ALPHA | TINY3D_BLEND_FUNC_SRC_ALPHA_SRC_ALPHA,
            TINY3D_BLEND_FUNC_DST_RGB_ONE_MINUS_SRC_ALPHA | TINY3D_BLEND_FUNC_DST_ALPHA_ZERO,
            TINY3D_BLEND_RGB_FUNC_ADD | TINY3D_BLEND_ALPHA_FUNC_ADD);


        /* drawing stars */
 
        tiny3d_SetPolygon(TINY3D_TRIANGLES);

        for(i = 0; i < 256; i++) {
    
            tiny3d_VertexPos(stars[i].x, stars[i].y, 65535.0f); // note pos is always the first element of the vertex
            tiny3d_VertexColor(stars[i].color);

            tiny3d_VertexPos(stars[i].x-1.0f, stars[i].y+1.0f, 65535.0f); // note color element is not necessary repeat here
            tiny3d_VertexPos(stars[i].x+1.0f, stars[i].y+1.0f, 65535.0f);
        }

	    tiny3d_End();

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
        
        drawStage1(0); // Draw
    
        /* CHANGE TO 2D */

        tiny3d_Project2D(); // change to 2D context ( virtual size of the screen is 848.0 x 512.0)

        tiny3d_SetMatrixModelView(NULL); // this force to use Matrix Identity

        /* DRAW SCREEN CORNERS BOXES */

        DrawCorners2d(0.0         , 0.0         , 0.0, 0xffff00ff); // Yellow = 0xffff00ff = RGBA
        DrawCorners2d(848.0 - 32.0, 0.0         , 0.0, 0xffff00ff); // Yellow = 0xffff00ff = RGBA
        DrawCorners2d(0.0         , 512.0 - 32.0, 0.0, 0xffff00ff); // Yellow = 0xffff00ff = RGBA
        DrawCorners2d(848.0 - 32.0, 512.0 - 32.0, 0.0, 0xffff00ff); // Yellow = 0xffff00ff = RGBA

        
        /* DRAWING FINISH HERE */

        tiny3d_Flip();
		
	}
	
	return 0;
}

