/* 
   TINY3D sample / (c) 2010 Hermes  <www.elotrolado.net>

*/

#ifndef UTILS_H
#define UTILS_H

#include <tiny3d.h>

extern u32 font_offset;
extern u32 font_w;
extern u32 font_h;
extern u32 font_s;

void CreateSphere(float rx, float ry, int sx, int sy, float r, float g, float b, float a);

void CreateSphereNormal(float rx, float ry, int sx, int sy);

void CreateSphereNormalTextured(float rx, float ry, int sx, int sy);

void CreateSphereNormalTextured2(float rx, float ry, int sx, int sy);

void CreateSphereLine(float rx, float ry, int sx, int sy);

void DrawCorners2d(float x, float y, float z, u32 rgba);

void PrintChar(float x, float y, float z, u8 ch, u32 color);

void PrintStr(float x, float y, float z, char *ch, u32 color);


#endif

