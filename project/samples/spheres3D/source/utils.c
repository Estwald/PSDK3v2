/* 
   TINY3D sample / (c) 2010 Hermes  <www.elotrolado.net>

*/

#include "utils.h"

#include <math.h>
#include <string.h>

#define S_PI 3.14159265f
#define D_PI 6.28318531f

#define FLOAT(x) ((float) (x))

#define NORMALIZE(X,Y,Z) \
        l=sqrtf(X*X + Y*Y + Z*Z); \
        \
        if(l == 0.0f) l = 1.0f; \
        \
        nx= X / l; ny= Y / l; nz = Z / l;

void CreateSphere(float rx, float ry, int sx, int sy, float r, float g, float b, float a)
{
    int n, m, k;
    float x, y, z;
    float x2, y2, z2;

    for(n = 0; n < sy; n++) {

    tiny3d_SetPolygon(TINY3D_QUAD_STRIP);

        for(k = 0;k <= sx; k++) {
            
            m = k % sx;

            x = x2 = rx * cosf(D_PI * FLOAT(m) / FLOAT(sx));
            z=  z2 = rx * sinf(D_PI * FLOAT(m) / FLOAT(sx));

            x  *= sinf(S_PI * FLOAT(n) / FLOAT(sy));
            z  *= sinf(S_PI * FLOAT(n) / FLOAT(sy));
            x2 *= sinf(S_PI * FLOAT(n + 1) / FLOAT(sy));
            z2 *= sinf(S_PI * FLOAT(n + 1) / FLOAT(sy));

            y   = ry * cosf(S_PI * FLOAT(n) / FLOAT(sy));
            y2  = ry * cosf(S_PI * FLOAT(n + 1) / FLOAT(sy));

           
            
            tiny3d_VertexPos(x, y, z);
            tiny3d_VertexFcolor(r, g, b, a);


            tiny3d_VertexPos(x2, y2, z2);
            tiny3d_VertexFcolor(r, g, b, a);
            
             
        }
        
    tiny3d_End();

    }
}


void CreateSphereNormal(float rx, float ry, int sx, int sy)
{
    int n, m, k;
    float x, y, z;
    float x2, y2, z2;

    float nx, ny, nz, l;

    for(n = 0; n < sy; n++) {

    tiny3d_SetPolygon(TINY3D_QUAD_STRIP);

        for(k = 0;k <= sx; k++) {
            
            m = k % sx;

            x = x2 = rx * cosf(D_PI * FLOAT(m) / FLOAT(sx));
            z=  z2 = rx * sinf(D_PI * FLOAT(m) / FLOAT(sx));

            x  *= sinf(S_PI * FLOAT(n) / FLOAT(sy));
            z  *= sinf(S_PI * FLOAT(n) / FLOAT(sy));
            x2 *= sinf(S_PI * FLOAT(n + 1) / FLOAT(sy));
            z2 *= sinf(S_PI * FLOAT(n + 1) / FLOAT(sy));

            y   = ry * cosf(S_PI * FLOAT(n) / FLOAT(sy));
            y2  = ry * cosf(S_PI * FLOAT(n + 1) / FLOAT(sy));

            NORMALIZE(x, y, z);
            
            tiny3d_VertexPos(x, y, z);
            tiny3d_Normal(nx, ny, nz);

            NORMALIZE(x2, y2, z2);

            tiny3d_VertexPos(x2, y2, z2);
            tiny3d_Normal(nx, ny, nz);
             
        }
        
    tiny3d_End();

    }
}

void CreateSphereNormalTextured(float rx, float ry, int sx, int sy)
{
    int n, m, k;
    float x, y, z;
    float x2, y2, z2;

    float nx, ny, nz, l;

    for(n = 0; n < sy; n++) {

    tiny3d_SetPolygon(TINY3D_QUAD_STRIP);

        for(k = 0;k <= sx; k++) {
            
            m = k % sx;

            x = x2 = rx * cosf(D_PI * FLOAT(m) / FLOAT(sx));
            z=  z2 = rx * sinf(D_PI * FLOAT(m) / FLOAT(sx));

            x  *= sinf(S_PI * FLOAT(n) / FLOAT(sy));
            z  *= sinf(S_PI * FLOAT(n) / FLOAT(sy));
            x2 *= sinf(S_PI * FLOAT(n + 1) / FLOAT(sy));
            z2 *= sinf(S_PI * FLOAT(n + 1) / FLOAT(sy));

            y   = ry * cosf(S_PI * FLOAT(n) / FLOAT(sy));
            y2  = ry * cosf(S_PI * FLOAT(n + 1) / FLOAT(sy));

            NORMALIZE(x, y, z);
            
            tiny3d_VertexPos(x, y, z);
            tiny3d_VertexTexture((float) k / sx, (float) (n) / sy);
            tiny3d_Normal(nx, ny, nz);

            NORMALIZE(x2, y2, z2);

            tiny3d_VertexPos(x2, y2, z2);
            tiny3d_VertexTexture((float) k / sx, (float) (n + 1) / sy);
            tiny3d_Normal(nx, ny, nz);
             
        }
        
    tiny3d_End();

    }
}

void CreateSphereNormalTextured2(float rx, float ry, int sx, int sy)
{
    int n, m, k;
    float x, y, z;
    float x2, y2, z2;

    float nx, ny, nz, l;

    for(n = 0; n < sy; n++) {

    tiny3d_SetPolygon(TINY3D_QUAD_STRIP);

        for(k = 0;k <= sx; k++) {
            
            m = k % sx;

            x = x2 = rx * cosf(D_PI * FLOAT(m) / FLOAT(sx));
            z=  z2 = rx * sinf(D_PI * FLOAT(m) / FLOAT(sx));

            x  *= sinf(S_PI * FLOAT(n) / FLOAT(sy));
            z  *= sinf(S_PI * FLOAT(n) / FLOAT(sy));
            x2 *= sinf(S_PI * FLOAT(n + 1) / FLOAT(sy));
            z2 *= sinf(S_PI * FLOAT(n + 1) / FLOAT(sy));

            y   = ry * cosf(S_PI * FLOAT(n) / FLOAT(sy));
            y2  = ry * cosf(S_PI * FLOAT(n + 1) / FLOAT(sy));

            NORMALIZE(x, y, z);
            
            tiny3d_VertexPos(x, y, z);
            tiny3d_VertexTexture((float) k / sx, (float) (n) / sy);
            tiny3d_VertexTexture2((float) k / sx, (float) (n) / sy);
            tiny3d_Normal(nx, ny, nz);

            NORMALIZE(x2, y2, z2);

            tiny3d_VertexPos(x2, y2, z2);
            tiny3d_VertexTexture((float) k / sx, (float) (n + 1) / sy);
            tiny3d_VertexTexture2((float) k / sx, (float) (n + 1) / sy);
            tiny3d_Normal(nx, ny, nz);
             
        }
        
    tiny3d_End();

    }
}

void CreateSphereLine(float rx, float ry, int sx, int sy)
{
    int n, m, k;
    float x, y, z;
    float x2, y2, z2;
    float nx, ny, nz, l;

    for(n = 0; n < sy; n++) {

        tiny3d_SetPolygon(TINY3D_LINE_LOOP);

        for(k = 0; k <= sx; k++) {
            
            m = k % sx;

            x = x2 = rx * cosf(D_PI * FLOAT(m) / FLOAT(sx));
            z=  z2 = rx * sinf(D_PI * FLOAT(m) / FLOAT(sx));

            x  *= sinf(S_PI * FLOAT(n) / FLOAT(sy));
            z  *= sinf(S_PI * FLOAT(n) / FLOAT(sy));
            x2 *= sinf(S_PI * FLOAT(n + 1) / FLOAT(sy));
            z2 *= sinf(S_PI * FLOAT(n + 1) / FLOAT(sy));

            y   = ry * cosf(S_PI * FLOAT(n) / FLOAT(sy));
            y2  = ry * cosf(S_PI * FLOAT(n + 1) / FLOAT(sy));

            NORMALIZE(x, y, z);
            
            tiny3d_VertexPos(x, y, z);
            tiny3d_Normal(nx, ny, nz);

            NORMALIZE(x2, y2, z2);

            tiny3d_VertexPos(x2, y2, z2);
            tiny3d_Normal(nx, ny, nz);
             
       }

    tiny3d_End();

    }

}

void DrawCorners2d(float x, float y, float z, u32 rgba)
{
    tiny3d_SetPolygon(TINY3D_QUADS);
    tiny3d_VertexPos(x, y, z);
    tiny3d_VertexColor(rgba);
    tiny3d_VertexPos(x+32.0, y, z);
    tiny3d_VertexPos(x+32.0, y+32.0, z);
    tiny3d_VertexPos(x, y+32.0, z);
    tiny3d_End();
}


// Drawing  font

void PrintChar(float x, float y, float z, u8 ch, u32 color)
{
    float u, v , u2, v2;

    u = ((float) (8 * (ch & 15))) / 128.0f;

    u2 = u + 7.99f / 128.0f;

    v = ((float) (8 * (ch >> 4))) / 128.0f;

    v2 = v + 7.99f / 128.0f;

    tiny3d_SetTexture(0, font_offset, font_w, font_h, font_s,  TINY3D_TEX_FORMAT_A8R8G8B8, 1);

    tiny3d_SetPolygon(TINY3D_QUADS);
    
    tiny3d_VertexPos(x, y, z);
    tiny3d_VertexColor(color);
    tiny3d_VertexTexture(u, v);
    
    tiny3d_VertexPos(x + 16.0f, y, z);
    tiny3d_VertexTexture(u2, v);

    tiny3d_VertexPos(x + 16.0f, y + 16.0f, z);
    tiny3d_VertexTexture(u2, v2);

    tiny3d_VertexPos(x, y + 16.0f, z);
    tiny3d_VertexTexture(u, v2);

    tiny3d_End();

}

void PrintStr(float x, float y, float z, char *ch, u32 color)
{
    while(*ch) {PrintChar(x, y, z, (u8) *ch, color); x += 16; ch++; }
}

