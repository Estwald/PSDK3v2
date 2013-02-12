#include "stdio.h"
#include "stdlib.h"

typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef unsigned int uint32_t;
typedef unsigned char boolean;

#define INLINE

#include "nv40_vertprog.h"
#include "vpasm.h"
#include "microcode.h"

unsigned int build_src(unsigned char src,_Reg *reg,unsigned int words[4],unsigned int *attribs)
{
	unsigned int val=0;
	switch(reg->type)
	{
		case NVFXSR_IMM:
			val|=NV40_VP_SRC_REG_TYPE_INPUT<<NV40_VP_SRC_REG_TYPE_SHIFT;
			val|=reg->index<<8;
			return val;
			break;
		case NVFXSR_TEMP:
			val|=NV40_VP_SRC_REG_TYPE_TEMP<<NV40_VP_SRC_REG_TYPE_SHIFT;
			val|=reg->index<<NV40_VP_SRC_TEMP_SRC_SHIFT;
			break;
		case NVFXSR_INPUT:
			val|=NV40_VP_SRC_REG_TYPE_INPUT<<NV40_VP_SRC_REG_TYPE_SHIFT;
			words[1]|=reg->index<<NV40_VP_INST_INPUT_SRC_SHIFT;
			*attribs|=1<<reg->index;
			break;
		case NVFXSR_CONST:
			val|=NV40_VP_SRC_REG_TYPE_CONST<<NV40_VP_SRC_REG_TYPE_SHIFT;
			words[1]|=reg->index<<NV40_VP_INST_CONST_SRC_SHIFT;
			break;
		case NVFXSR_NONE:
			val|=NV40_VP_SRC_REG_TYPE_INPUT<<NV40_VP_SRC_REG_TYPE_SHIFT;
			words[1]|=0<<NV40_VP_INST_INPUT_SRC_SHIFT;
			break;
	}
	if(reg->neg)
		val|=NV40_VP_SRC_NEGATE;
	if(reg->abs)
	{
		switch(src)
		{
			case 0: words[0]|=NV40_VP_INST_SRC0_ABS; break;
			case 1: words[0]|=NV40_VP_INST_SRC1_ABS; break;
			case 2: words[0]|=NV40_VP_INST_SRC2_ABS; break;
		}
	}
	val|=reg->swizzle[0]<<NV40_VP_SRC_SWZ_X_SHIFT;
	val|=reg->swizzle[1]<<NV40_VP_SRC_SWZ_Y_SHIFT;
	val|=reg->swizzle[2]<<NV40_VP_SRC_SWZ_Z_SHIFT;
	val|=reg->swizzle[3]<<NV40_VP_SRC_SWZ_W_SHIFT;

	return val;
}

_Microcode microcode;

_Microcode *GenerateMicrocode(_Instruction *insts,int nInsts)
{
	unsigned int *ucode = (unsigned int*)malloc(4*4*nInsts);

	unsigned int UsedAttribs=0;
	unsigned int UsedOutputs=0;

	for(int i=0;i<nInsts;++i)
	{
		unsigned int *words=ucode+4*i;
		unsigned int tmp=0;
		_Instruction *inst=insts+i;

		words[0]=words[1]=words[2]=words[3]=0;

		if(inst->unit==NVFX_VP_INST_SLOT_SCA)
		{
			if(inst->op==NVFX_VP_INST_SCA_OP_BRA || inst->op==NVFX_VP_INST_SCA_OP_CAL || inst->op==NVFX_VP_INST_SCA_OP_RET)
			{
				words[1]|=inst->op<<NV40_VP_INST_SCA_OPCODE_SHIFT;
				words[0]|=NV40_VP_INST_VEC_DEST_TEMP_MASK;
				words[3]|=inst->dstMask<<NV40_VP_INST_SCA_WRITEMASK_SHIFT;
				words[3]|=NV40_VP_INST_SCA_DEST_TEMP_MASK;
				words[3]|=NV40_VP_INST_SCA_RESULT;
				//words[3]|=NV40_VP_INST_VEC_WRITEMASK_X;
			}
			else
			{
				words[1]|=inst->op<<NV40_VP_INST_SCA_OPCODE_SHIFT;
				words[0]|=NV40_VP_INST_VEC_DEST_TEMP_MASK;
				words[3]|=inst->dstMask<<NV40_VP_INST_SCA_WRITEMASK_SHIFT;
			}
		}
		else
		{
			words[1]|=inst->op<<NV40_VP_INST_VEC_OPCODE_SHIFT;
			words[3]|=NV40_VP_INST_SCA_DEST_TEMP_MASK;
			words[3]|=inst->dstMask<<NV40_VP_INST_VEC_WRITEMASK_SHIFT;
		}

		if(inst->updateCC)
			words[0]|=NV40_VP_INST_COND_UPDATE_ENABLE;

		if(inst->testCC)
			words[0]|=NV40_VP_INST_COND_TEST_ENABLE;
		words[0]|=inst->condition<<NV40_VP_INST_COND_SHIFT;
		words[0]|=inst->condSwizzle[0]<<NV40_VP_INST_COND_SWZ_X_SHIFT;
		words[0]|=inst->condSwizzle[1]<<NV40_VP_INST_COND_SWZ_Y_SHIFT;
		words[0]|=inst->condSwizzle[2]<<NV40_VP_INST_COND_SWZ_Z_SHIFT;
		words[0]|=inst->condSwizzle[3]<<NV40_VP_INST_COND_SWZ_W_SHIFT;

		if(inst->saturate)
			words[0]|=NV40_VP_INST_SATURATE;

		switch(inst->dstType)
		{
			case NVFXSR_NONE:
				words[3]|=NV40_VP_INST_DEST_MASK;
				if(inst->unit==NVFX_VP_INST_SLOT_SCA)
					words[3]|=NV40_VP_INST_SCA_DEST_TEMP_MASK;
				else
					words[0]|=NV40_VP_INST_VEC_DEST_TEMP_MASK;
				break;
			case NVFXSR_TEMP:
				words[3]|=NV40_VP_INST_DEST_MASK;
				if(inst->unit==NVFX_VP_INST_SLOT_SCA)
					words[3]|=inst->dstIndex<<NV40_VP_INST_SCA_DEST_TEMP_SHIFT;
				else
					words[0]|=inst->dstIndex<<NV40_VP_INST_VEC_DEST_TEMP_SHIFT;
				break;
			case NVFXSR_OUTPUT:
				words[3]|=inst->dstIndex<<NV40_VP_INST_DEST_SHIFT;
				if(inst->unit==NVFX_VP_INST_SLOT_SCA)
				{
					words[3]|=NV40_VP_INST_SCA_RESULT;
					words[3]|=NV40_VP_INST_SCA_DEST_TEMP_MASK;
				}
				else
				{
					words[0]|=NV40_VP_INST_VEC_RESULT;
					words[0]|=NV40_VP_INST_VEC_DEST_TEMP_MASK;
				}
				if(inst->dstIndex<7)
					UsedOutputs|=1<<inst->dstIndex;
				else
					UsedOutputs|=1<<(inst->dstIndex+7);
				break;
		}

		tmp=build_src(0,inst->src+0,words,&UsedAttribs);
		words[1]|=((tmp&NV40_VP_SRC0_HIGH_MASK)>>NV40_VP_SRC0_HIGH_SHIFT)<<NV40_VP_INST_SRC0H_SHIFT;
		words[2]|=(tmp&NV40_VP_SRC0_LOW_MASK)<<NV40_VP_INST_SRC0L_SHIFT;
		
		tmp=build_src(1,inst->src+1,words,&UsedAttribs);
		words[2]|=tmp<<NV40_VP_INST_SRC1_SHIFT;

		tmp=build_src(2,inst->src+2,words,&UsedAttribs);
		words[2]|=((tmp&NV40_VP_SRC2_HIGH_MASK)>>NV40_VP_SRC2_HIGH_SHIFT)<<NV40_VP_INST_SRC2H_SHIFT;
		words[3]|=(tmp&NV40_VP_SRC2_LOW_MASK)<<NV40_VP_INST_SRC2L_SHIFT;

		if(inst->unit!=NVFX_VP_INST_SLOT_SCA)	//?? it's reversed
			words[3]|=NV40_VP_INST_SCA_RESULT;	//??

		if(i==nInsts-1)
			words[3]|=1;	//END

		
	}
	printf("%d instructions\n",nInsts);
	printf("Attribute mask %x\n",UsedAttribs);
	printf("Output mask %x\n",UsedOutputs);

	microcode.ucode=ucode;
	microcode.InputMask=UsedAttribs;
	microcode.OutputMask=UsedOutputs;

	return &microcode;
}
