#include <string.h>
#include <gcm_sys.h>
#include <rsx_program.h>

#include "rsx_internal.h"

void* rsxFragmentProgramGetUCode(rsxFragmentProgram *fp,u32 *size)
{
	*size = fp->num_insn*sizeof(u32)*4;
	return (void*)(((u8*)fp) + fp->ucode_off);
}

rsxProgramConst* rsxFragmentProgramGetConsts(rsxFragmentProgram *fp)
{
	return (rsxProgramConst*)(((u8*)fp) + fp->const_off);
}

s32 rsxFragmentProgramGetConst(rsxFragmentProgram *fp,const char *name)
{
	u32 i;
	rsxProgramConst *fpc = rsxFragmentProgramGetConsts(fp);

	for(i=0;i<fp->num_const;i++) {
		char *namePtr;

		if(!fpc[i].name_off) continue;

		namePtr = ((char*)fp) + fpc[i].name_off;
		if(strcasecmp(name,namePtr)==0)
			return i;
	}
	return -1;
}

rsxProgramAttrib* rsxFragmentProgramGetAttribs(rsxFragmentProgram *fp)
{
	return (rsxProgramAttrib*)(((u8*)fp) + fp->attrib_off);
}

s32 rsxFragmentProgramGetAttrib(rsxFragmentProgram *fp,const char *name)
{
	u32 i;
	rsxProgramAttrib *attribs = rsxFragmentProgramGetAttribs(fp);

	for(i=0;i<fp->num_attrib;i++) {
		char *namePtr;

		if(!attribs[i].name_off) continue;

		namePtr = ((char*)fp) + attribs[i].name_off;
		if(strcasecmp(name,namePtr)==0)
			return attribs[i].index;
	}
	return -1;
}

rsxConstOffsetTable* rsxFragmentProgramGetConstOffsetTable(rsxFragmentProgram *fp,u32 table_off)
{
	return (rsxConstOffsetTable*)(((u8*)fp) + table_off);
}
