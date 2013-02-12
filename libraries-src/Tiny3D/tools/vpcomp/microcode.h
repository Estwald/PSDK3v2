#ifndef UCODE_H
#define UCODE_H


#include "vpasm.h"

struct _Microcode
{
	unsigned int *ucode;
	unsigned int InputMask;
	unsigned int OutputMask;
};

_Microcode *GenerateMicrocode(_Instruction *instructions,int nInst);

#endif
