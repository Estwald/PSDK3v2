#ifndef __GEOMETRY_H__
#define __GEOMETRY_H__

#include "mesh.h"

SMeshBuffer* createCube(f32 size);
SMeshBuffer* createDonut(f32 outerRadius,f32 innerRadius,u32 polyCntX,u32 polyCntY);
SMeshBuffer* createSphere(f32 radius,u32 polyCntX,u32 polyCntY);

#endif
