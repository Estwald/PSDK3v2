#ifndef REALITYVP_H
#define REALITYVP_H


// libreality vertex program


//Param types
#define PARAM_FLOAT		0
#define PARAM_FLOAT2	1
#define PARAM_FLOAT3	2
#define PARAM_FLOAT4	3


#define PARAM_FLOAT4x4	4

#pragma pack(push,1)
//#pragma pack(1)
typedef struct _VPAttribute
{
	unsigned int NameOffset;
	unsigned int Index;
} realityVertexProgramAttribute;

union _VPFloatUInt
{
	unsigned int u;
	float f;
};

typedef struct _VPConstant
{
	unsigned int NameOffset;
	unsigned int Index;
	unsigned char Type;
	unsigned char Internal;	//Is an internal constant? (unnamed but needs to be set)
	union _VPFloatUInt Values[4];
} realityVertexProgramConstant;

typedef struct _realityVertexProgram
{
	unsigned short Magic;		//Magic text 'VP'
	unsigned short NumInsts;	//Number of vertex program instructions
	unsigned int UCodeOffset;	//Microcode offset (16 bytes per instruction)
	unsigned short NumConstants;	//Number of named constants (parameters)
	unsigned short NumAttributes;	//Number of named attributes (inputs)
	unsigned int ConstantsOffset;
	unsigned int AttributesOffset;
	unsigned int InputMask;			//Used input attributes
	unsigned int OutputMask;		//Used output registers

	//data (constants, attributes, ucode)
} realityVertexProgram;

#pragma pack(pop)




void *realityVertexProgramGetUCode(realityVertexProgram *vertexprogram);

unsigned int realityVertexProgramGetInputMask(realityVertexProgram *vertexprogram);

unsigned int realityVertexProgramGetOutputMask(realityVertexProgram *vertexprogram);

realityVertexProgramAttribute *realityVertexProgramGetAttributes(realityVertexProgram *vertexprogram);

int realityVertexProgramGetInputAttribute(realityVertexProgram *vertexprogram,const char *name);

realityVertexProgramConstant *realityVertexProgramGetConstants(realityVertexProgram *vertexprogram);

int realityVertexProgramGetConstant(realityVertexProgram *vertexprogram,const char *name);

#endif
