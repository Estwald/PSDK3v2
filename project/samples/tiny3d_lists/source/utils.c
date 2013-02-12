/* 
   TINY3D sample / (c) 2011 Hermes <www.elotrolado.net>

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


void CreateSphereNormal(float rx, float ry, int sx, int sy/*, int textured*/)
{
    int n, m, k;
    float x, y, z;
    float x2, y2, z2;

    VECTOR n1, n2;

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

            n1.x = x;
            n1.y = y;
            n1.z = z;

            n2.x = x2;
            n2.y = y2;
            n2.z = z2;

            n1 = VectorToUnit(n1);
            n2 = VectorToUnit(n2);
            //NORMALIZE(x, y, z);
            
            tiny3d_VertexPos(x, y, z);
            //f(textured) tiny3d_VertexTexture((float) k / sx, (float) (n) / sy);
            tiny3d_NormalVector(n1);

            //NORMALIZE(x2, y2, z2);

            tiny3d_VertexPos(x2, y2, z2);
            //if(textured) tiny3d_VertexTexture((float) k / sx, (float) (n+1) / sy);
            tiny3d_NormalVector(n2);
             
        }
        
    tiny3d_End();

    }
}

void CreateCilinderNormal(float rx, float ry, int sx, int sy)
{
    int n, m, k;
    float x, y, z;
    float x2, y2, z2;

    float nx, ny, nz, l;
    
   

    y   = ry;
    y2  = -ry;
    
   
    tiny3d_SetPolygon(TINY3D_TRIANGLE_FAN);
    tiny3d_VertexPos(0.0f, y, 0.0f);
    tiny3d_Normal(0, 1, 0);

    for(k = 0;k <= sx; k++) {
        
        n = k % sx;
       

        x  = rx * cosf(D_PI * FLOAT(n) / FLOAT(sx));
        z  = rx * sinf(D_PI * FLOAT(n) / FLOAT(sx));

        tiny3d_VertexPos(x, y, z);
         
    }
        
    tiny3d_End();

    for(n = 0; n < sy; n++) {

    tiny3d_SetPolygon(TINY3D_QUAD_STRIP);

        for(k = 0;k <= sx; k++) {
            
            m = k % sx;

            x = x2 = rx * cosf(D_PI * FLOAT(m) / FLOAT(sx));
            z=  z2 = rx * sinf(D_PI * FLOAT(m) / FLOAT(sx));

            y   = ry - 2.0f * ry * ( FLOAT(n) / FLOAT(sy));
            y2  = ry - 2.0f * ry * ( FLOAT(n + 1) / FLOAT(sy));

            NORMALIZE(x, y, z);
            
            tiny3d_VertexPos(x, y, z);
            tiny3d_Normal(nx, ny, nz);

            NORMALIZE(x2, y2, z2);

            tiny3d_VertexPos(x2, y2, z2);
            tiny3d_Normal(nx, ny, nz);
             
        }
        
    tiny3d_End();

    }

    tiny3d_SetPolygon(TINY3D_TRIANGLE_FAN);
    tiny3d_VertexPos(0.0f, y2, 0.0f);
    tiny3d_Normal(0, -1, 0);

    for(k = 0;k <= sx; k++) {
        
        n = k % sx;
       

        x  = rx * cosf(D_PI * FLOAT(n) / FLOAT(sx));
        z  = rx * sinf(D_PI * FLOAT(n) / FLOAT(sx));

        tiny3d_VertexPos(x, y2, z);
         
    }

    tiny3d_End();
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


