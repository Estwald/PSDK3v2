#ifndef VPASM_H
#define VPASM_H

struct _Reg
{
	unsigned char type;
	unsigned short index;
	unsigned char swizzle[4];
	unsigned char neg;
	unsigned char abs;
};

struct _Instruction
{
	unsigned char op;
	unsigned char unit;

	unsigned char saturate;
	unsigned char updateCC;
	unsigned char testCC;
	unsigned char condSwizzle[4];
	unsigned char condition;

	unsigned char dstType;
	unsigned char dstIndex;
	unsigned int dstMask;

	_Reg src[3];
};

_Instruction *ParseAsm(char *file,int *nInsts);

#endif
