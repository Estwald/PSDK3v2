#ifndef PARAMS_H
#define PARAMS_H

#include "list"
#include "string"
using namespace std;

extern "C"
{
#include "realityVP.h"
}

struct _Parameter
{
	string Name;
	unsigned char IsConstant;
	unsigned char IsInternal;
	unsigned char Type;
	unsigned int Index;
	float Values[4];
	unsigned int User;
};


list<_Parameter> ScanParameters(char *filename);

#endif
