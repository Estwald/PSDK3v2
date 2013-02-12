#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <gcm_sys.h>
#include <rsx_program.h>

#include "rsx_internal.h"

void* rsxVertexProgramGetUCode(rsxVertexProgram *vp)
{
	return (void*)(((u8*)vp) + vp->ucode_off);
}

rsxProgramConst* rsxVertexProgramGetConsts(rsxVertexProgram *vp)
{
	return (rsxProgramConst*)(((u8*)vp) + vp->const_off);
}

s32 rsxVertexProgramGetConst(rsxVertexProgram *vp,const char *name)
{
	u32 i;
	rsxProgramConst *vpc = rsxVertexProgramGetConsts(vp);

	for(i=0;i<vp->num_const;i++) {
		char *namePtr;

		if(!vpc[i].name_off) continue;

		namePtr = ((char*)vp) + vpc[i].name_off;
		if(strcasecmp(name,namePtr)==0)
			return i;
	}
	return -1;
}

rsxProgramAttrib* rsxVertexProgramGetAttribs(rsxVertexProgram *vp)
{
	return (rsxProgramAttrib*)(((u8*)vp) + vp->attrib_off);
}

s32 rsxVertexProgramGetAttrib(rsxVertexProgram *vp,const char *name)
{
	u32 i;
	rsxProgramAttrib *attribs = rsxVertexProgramGetAttribs(vp);

	for(i=0;i<vp->num_attrib;i++) {
		char *namePtr;

		if(!attribs[i].name_off) continue;

		namePtr = ((char*)vp) + attribs[i].name_off;
		if(strcasecmp(name,namePtr)==0)
			return attribs[i].index;
	}
	return -1;
}
