// Vertex program assembler parser
// for the assembler grammar, check http://oss.sgi.com/projects/ogl-sample/registry/ARB/vertex_program.txt
// for the microcode information, check http://nouveau.freedesktop.org/wiki/

#include "stdio.h"
#include "string.h"
#include "stdlib.h"
#include "ctype.h"


#include "list"
#include "string"
#include "sstream"

typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef unsigned int uint32_t;
typedef unsigned char boolean;

#define INLINE

#include "nv40_vertprog.h"

#include "vpasm.h"

struct _JumpDst
{
	char identifier[64];
	unsigned int instruction;
};

std::list<_JumpDst> JumpDests;
std::list<_JumpDst> Identifiers;


struct _Opcode
{
	const char *mnemonic;
	unsigned int instruction;
	unsigned char unit;
	char param1;	//to which src slot reg goes this param
	char param2;
	char param3;
	char imm;
};

_Opcode Opcodes[]=
{
//	{"NOP",NVFX_VP_INST_SCA_OP_NOP,NVFX_VP_INST_SLOT_SCA},
//	{"MOV",NVFX_VP_INST_SCA_OP_MOV,NVFX_VP_INST_SLOT_SCA},
	{"RCP",NVFX_VP_INST_SCA_OP_RCP,NVFX_VP_INST_SLOT_SCA,-1,-1,0},
	{"RCC",NVFX_VP_INST_SCA_OP_RCC,NVFX_VP_INST_SLOT_SCA,-1,-1,0},
	{"RSQ",NVFX_VP_INST_SCA_OP_RSQ,NVFX_VP_INST_SLOT_SCA,-1,-1,0},
	{"EXP",NVFX_VP_INST_SCA_OP_EXP,NVFX_VP_INST_SLOT_SCA,-1,-1,0},
	{"LOG",NVFX_VP_INST_SCA_OP_LOG,NVFX_VP_INST_SLOT_SCA,-1,-1,0},
	{"LIT",NVFX_VP_INST_SCA_OP_LIT,NVFX_VP_INST_SLOT_SCA,-1,-1,0},
	{"BRA",NVFX_VP_INST_SCA_OP_BRA,NVFX_VP_INST_SLOT_SCA,-1,-1,-1,1},	//??
	{"CAL",NVFX_VP_INST_SCA_OP_CAL,NVFX_VP_INST_SLOT_SCA,-1,-1,-1,1},	//??
	{"RET",NVFX_VP_INST_SCA_OP_RET,NVFX_VP_INST_SLOT_SCA,-1,-1,-1,1},	//??
	{"LG2",NVFX_VP_INST_SCA_OP_LG2,NVFX_VP_INST_SLOT_SCA,-1,-1,0},
	{"EX2",NVFX_VP_INST_SCA_OP_EX2,NVFX_VP_INST_SLOT_SCA,-1,-1,0},
	{"SIN",NVFX_VP_INST_SCA_OP_SIN,NVFX_VP_INST_SLOT_SCA,-1,-1,0},
	{"COS",NVFX_VP_INST_SCA_OP_COS,NVFX_VP_INST_SLOT_SCA,-1,-1,0},
	{"PUSHA",NV40_VP_INST_SCA_OP_PUSHA,NVFX_VP_INST_SLOT_SCA,-1,-1,-1},	//??
	{"POPA",NV40_VP_INST_SCA_OP_POPA,NVFX_VP_INST_SLOT_SCA,-1,-1,-1},
	{"END",0xFFFFFFFF,0xFF,-1,-1},

	//Vector
	{"NOP",NVFX_VP_INST_VEC_OP_NOP,NVFX_VP_INST_SLOT_VEC,-1,-1,-1},
	{"MOV",NVFX_VP_INST_VEC_OP_MOV,NVFX_VP_INST_SLOT_VEC,0,1,-1},
	{"MUL",NVFX_VP_INST_VEC_OP_MUL,NVFX_VP_INST_SLOT_VEC,0,1,-1},
	{"ADD",NVFX_VP_INST_VEC_OP_ADD,NVFX_VP_INST_SLOT_VEC,0,-1,1},	//weird
	{"MAD",NVFX_VP_INST_VEC_OP_MAD,NVFX_VP_INST_SLOT_VEC,0,1,2},
	{"DP3",NVFX_VP_INST_VEC_OP_DP3,NVFX_VP_INST_SLOT_VEC,0,1,-1},
	{"DPH",NVFX_VP_INST_VEC_OP_DPH,NVFX_VP_INST_SLOT_VEC,0,1,-1},
	{"DP4",NVFX_VP_INST_VEC_OP_DP4,NVFX_VP_INST_SLOT_VEC,0,1,-1},
	{"DST",NVFX_VP_INST_VEC_OP_DST,NVFX_VP_INST_SLOT_VEC,0,1,-1},
	{"MIN",NVFX_VP_INST_VEC_OP_MIN,NVFX_VP_INST_SLOT_VEC,0,1,-1},
	{"MAX",NVFX_VP_INST_VEC_OP_MAX,NVFX_VP_INST_SLOT_VEC,0,1,-1},
	{"SLT",NVFX_VP_INST_VEC_OP_SLT,NVFX_VP_INST_SLOT_VEC,0,1,-1},
	{"SGE",NVFX_VP_INST_VEC_OP_SGE,NVFX_VP_INST_SLOT_VEC,0,1,-1},
	{"ARL",NVFX_VP_INST_VEC_OP_ARL,NVFX_VP_INST_SLOT_VEC,0,1,-1},
	{"FRC",NVFX_VP_INST_VEC_OP_FRC,NVFX_VP_INST_SLOT_VEC,0,-1,-1},
	{"FLR",NVFX_VP_INST_VEC_OP_FLR,NVFX_VP_INST_SLOT_VEC,0,-1,-1},
	{"SEQ",NVFX_VP_INST_VEC_OP_SEQ,NVFX_VP_INST_SLOT_VEC,0,1,-1},
	{"SFL",NVFX_VP_INST_VEC_OP_SFL,NVFX_VP_INST_SLOT_VEC,0,1,-1},
	{"SGT",NVFX_VP_INST_VEC_OP_SGT,NVFX_VP_INST_SLOT_VEC,0,1,-1},
	{"SLE",NVFX_VP_INST_VEC_OP_SLE,NVFX_VP_INST_SLOT_VEC,0,1,-1},
	{"SNE",NVFX_VP_INST_VEC_OP_SNE,NVFX_VP_INST_SLOT_VEC,0,1,-1},
	{"STR",NVFX_VP_INST_VEC_OP_STR,NVFX_VP_INST_SLOT_VEC,0,1,-1},
	{"SSG",NVFX_VP_INST_VEC_OP_SSG,NVFX_VP_INST_SLOT_VEC,0,1,-1},
	{"ARR",NVFX_VP_INST_VEC_OP_ARR,NVFX_VP_INST_SLOT_VEC,0,1,-1},
	{"ARA",NVFX_VP_INST_VEC_OP_ARA,NVFX_VP_INST_SLOT_VEC,0,1,-1},
	{"TXL",NV40_VP_INST_VEC_OP_TXL,NVFX_VP_INST_SLOT_VEC,0,1,-1},	//??
};
const int nOpcodes=sizeof(Opcodes)/sizeof(_Opcode);

struct _IOToken
{
	const char *Token;
	unsigned int Index;
};

_IOToken InputTokens[]=
{
	{"vertex.position",0},
	{"vertex.weight[0]",1},
	{"vertex.weight",1},
	{"vertex.normal",2},
	{"vertex.color.primary",3},
	{"vertex.color.secondary",4},
	{"vertex.color",3},
	{"vertex.fogcoord",5},
	{"vertex.texcoord[0]",8},
	{"vertex.texcoord[1]",9},
	{"vertex.texcoord[2]",10},
	{"vertex.texcoord[3]",11},
	{"vertex.texcoord[4]",12},
	{"vertex.texcoord[5]",13},
	{"vertex.texcoord[6]",14},
	{"vertex.texcoord[7]",15},
	{"vertex.texcoord",8},
	{"vertex.attrib[0]",0},
	{"vertex.attrib[1]",1},
	{"vertex.attrib[2]",2},
	{"vertex.attrib[3]",3},
	{"vertex.attrib[4]",4},
	{"vertex.attrib[5]",5},
	{"vertex.attrib[6]",6},
	{"vertex.attrib[7]",7},
	{"vertex.attrib[8]",8},
	{"vertex.attrib[9]",9},
	{"vertex.attrib[10]",10},
	{"vertex.attrib[11]",11},
	{"vertex.attrib[12]",12},
	{"vertex.attrib[13]",13},
	{"vertex.attrib[14]",14},
	{"vertex.attrib[15]",15},
	{"OPOS",0},
	{"POSITION",0},
	{"WHGT",1},
	{"NRML",2},
	{"COL0",3},
	{"COL1",4},
	{"FOGC",5},
	{"TEX0",8},
	{"TEX1",9},
	{"TEX2",10},
	{"TEX3",11},
	{"TEX4",12},
	{"TEX5",13},
	{"TEX6",14},
	{"TEX7",15},
};
const int nInputTokens=sizeof(InputTokens)/sizeof(_IOToken);

_IOToken OutputTokens[]=
{
	{"result.position",0},
	{"result.color.primary",1},
	{"result.color.secondary",2},
	{"result.color.front.primary",1},
	{"result.color.front.secondary",2},
	{"result.color.back.primary",3},
	{"result.color.back.secondary",4},
	{"result.color.front",1},
	{"result.color.back",4},
	{"result.color",1},
	{"result.fogcoord",5},
	{"result.pointsize",6},
	{"result.texcoord[0]",7},
	{"result.texcoord[1]",8},
	{"result.texcoord[2]",9},
	{"result.texcoord[3]",10},
	{"result.texcoord[4]",11},
	{"result.texcoord[5]",12},
	{"result.texcoord[6]",13},
	{"result.texcoord[7]",14},
	{"result.texcoord",7},
	{"HPOS",0},
	{"POSITION",0},
	{"COL0",1},
	{"COL1",2},
	{"BFC0",3},
	{"BFC1",4},
	{"FOGC",5},
	{"PSIZ",6},
	{"PSZ",6},
	{"TEX0",7},
	{"TEX1",8},
	{"TEX2",9},
	{"TEX3",10},
	{"TEX4",11},
	{"TEX5",12},
	{"TEX6",13},
	{"TEX7",14},
	{"TEMP",15},
};
const int nOutputTokens=sizeof(OutputTokens)/sizeof(_IOToken);


_Opcode *ScanOpcode(char *opcode)
{
	for(int i=0;i<nOpcodes;++i)
	{
		if(!strncasecmp(opcode,Opcodes[i].mnemonic,strlen(Opcodes[i].mnemonic)))
			return Opcodes+i;
	}
	
	return NULL;
}

char *trim(char *str)
{
	if(!str)
		return str;
	while(*str==' ' || *str=='\t')
		++str;
	char *str2=str;
	str2+=strlen(str)-1;
	while(*str2==' ' || *str2=='\t')
	{
		*str2=0;
		--str2;
	}
	return str;
}


static int nLine=0;
static void fatal(const char *error,char *param)
{
	printf("Line %d: %s %s\n",nLine,error,param);
	exit(-1);
}

char tkncmp(char *str1,const char *str2,int *size)
{
	*size=strlen(str2);
	return strncasecmp(str1,str2,strlen(str2));
}

static unsigned char ConvertInputReg(char *input,int *size)
{
	int i;
	
	for(i=0;i<nInputTokens;++i)
	{
		if(tkncmp(input,InputTokens[i].Token,size)==0)
		{
			return InputTokens[i].Index;
		}
	}
	fatal("unknown input reg",input);
	return 0;
}

static unsigned char ConvertOutputReg(char *input,int *size)
{
	int i;
	
	for(i=0;i<nOutputTokens;++i)
	{
		if(tkncmp(input,OutputTokens[i].Token,size)==0)
		{
			return OutputTokens[i].Index;
		}
	}

	fatal("unknown output reg",input);
	return 0;
}

unsigned char ConvertCond(char *input)
{
	if(strncasecmp(input,"FL",2)==0)
		return NVFX_COND_TR;
	if(strncasecmp(input,"LT",2)==0)
		return NVFX_COND_LT;
	if(strncasecmp(input,"EQ",2)==0)
		return NVFX_COND_EQ;
	if(strncasecmp(input,"LE",2)==0)
		return NVFX_COND_LE;
	if(strncasecmp(input,"GT",2)==0)
		return NVFX_COND_GT;
	if(strncasecmp(input,"NE",2)==0)
		return NVFX_COND_NE;
	if(strncasecmp(input,"GE",2)==0)
		return NVFX_COND_GE;
	if(strncasecmp(input,"TR",2)==0)
		return NVFX_COND_TR;
	fatal("unknown condition",input);
	return 0;
}


void ProcessDst(char *data, _Instruction *instruction)
{
	int sz;
	if(data==NULL)
	{
		instruction->dstType=NVFXSR_NONE;
		instruction->dstIndex=0;
	}
	char *k=strchr(data,';');
	if(k)
		*k=0;
	switch(data[0])
	{
		case 'v':	//input
			instruction->dstType=NVFXSR_INPUT;
			if(data[1]=='e')
			{
				instruction->dstIndex=ConvertInputReg(data,&sz);
				data+=sz;
			}
			else
			{
				if(!isdigit(data[2]))
					instruction->dstIndex=ConvertInputReg(data+2,&sz);
				else
					instruction->dstIndex=atoi(data+2);
			}
			break;
		case 'r':	//result
			instruction->dstType=NVFXSR_OUTPUT;
			instruction->dstIndex=ConvertOutputReg(data,&sz);
			data+=sz;
			break;
		case 'o':	//output
			instruction->dstType=NVFXSR_OUTPUT;
			if(!isdigit(data[2]))
				instruction->dstIndex=ConvertOutputReg(data+2,&sz);
			else
				instruction->dstIndex=atoi(data+2);
			break;
		case 'R':
			if(data[1]=='C')
			{
				instruction->dstType=NVFXSR_NONE;
				instruction->dstIndex=0;
			}
			else
			{
				instruction->dstType=NVFXSR_TEMP;
				instruction->dstIndex=atoi(data+1);
			}
			break;
		case 'c':	//const
			instruction->dstType=NVFXSR_CONST;
			instruction->dstIndex=atoi(data+2);
			break;
		case 'H':
			instruction->dstType=NVFXSR_NONE;
			instruction->dstIndex=0;
			break;
		case 'C':	//cc
			if(data[1]=='C')
			{
				instruction->dstType=NVFXSR_NONE;
				instruction->dstIndex=0;
			}
			else
			{
				instruction->dstType=NVFXSR_CONST;
				instruction->dstIndex=atoi(data+2);
			}
			break;
	}

	char *cond = strchr(data,'(');
	if(cond)
	{
		*cond=0;
		++cond;
	}
	char *swiz = strchr(data,'.');
	if(swiz)
	{
		int n=0;
		++swiz;
		instruction->dstMask=0;
		while(swiz[n])
		{
			switch(swiz[n])
			{
				case 'x': instruction->dstMask|=NVFX_VP_MASK_X; break;
				case 'y': instruction->dstMask|=NVFX_VP_MASK_Y; break;
				case 'z': instruction->dstMask|=NVFX_VP_MASK_Z; break;
				case 'w': instruction->dstMask|=NVFX_VP_MASK_W; break;
			}
			++n;
		}
	}
	else
		instruction->dstMask=NVFX_VP_MASK_ALL;

	if(cond)
	{
		instruction->condition=ConvertCond(cond);
		instruction->testCC=1;
		instruction->condSwizzle[0]=0;
		instruction->condSwizzle[1]=1;
		instruction->condSwizzle[2]=2;
		instruction->condSwizzle[3]=3;
		swiz = strchr(cond,'.');
		if(swiz)
		{
			int n=0;
			instruction->condSwizzle[0]=0;
			instruction->condSwizzle[1]=0;
			instruction->condSwizzle[2]=0;
			instruction->condSwizzle[3]=0;
			++swiz;
			while(swiz[n])
			{
				switch(swiz[n])
				{
					case 'x': instruction->condSwizzle[n]=0; ++n; break;
					case 'y': instruction->condSwizzle[n]=1; ++n; break;
					case 'z': instruction->condSwizzle[n]=2; ++n; break;
					case 'w': instruction->condSwizzle[n]=3; ++n; break;
					default: goto exitloop;
				}
			}
exitloop:;		
			if(n && n!=4)
			{	//extend last swizzle
				unsigned char lastsw=instruction->condSwizzle[n-1];
				while(n<4)
				{
					instruction->condSwizzle[n]=lastsw;
					++n;
				}
			}

		}
	}
}

void ProcessDstAddr(char *data, _Instruction *instruction,int nInst)
{
	if(data==NULL)
	{
		instruction->dstType=NVFXSR_NONE;
		instruction->dstIndex=0;
	}

	//Get Identifier!!
	char *cond = strchr(data,'(');
	if(cond)
	{
		*cond=0;
		++cond;
	}

	char *dest=trim(data);
	_JumpDst d;
	d.instruction=nInst;
	strcpy(d.identifier,dest);
	JumpDests.push_back(d);

	instruction->dstMask=0;

	if(cond)
	{
		instruction->condition=ConvertCond(cond);
		instruction->condSwizzle[0]=0;
		instruction->condSwizzle[1]=1;
		instruction->condSwizzle[2]=2;
		instruction->condSwizzle[3]=3;
		char *swiz = strchr(cond,'.');
		if(swiz)
		{
			int n=0;
			instruction->condSwizzle[0]=0;
			instruction->condSwizzle[1]=0;
			instruction->condSwizzle[2]=0;
			instruction->condSwizzle[3]=0;
			++swiz;
			while(swiz[n])
			{
				switch(swiz[n])
				{
					case 'x': instruction->condSwizzle[n]=0; ++n; break;
					case 'y': instruction->condSwizzle[n]=1; ++n; break;
					case 'z': instruction->condSwizzle[n]=2; ++n; break;
					case 'w': instruction->condSwizzle[n]=3; ++n; break;
					default: goto exitloop;
				}
			}
exitloop:;		
			if(n && n!=4)
			{	//extend last swizzle
				unsigned char lastsw=instruction->condSwizzle[n-1];
				while(n<4)
				{
					instruction->condSwizzle[n]=lastsw;
					++n;
				}
			}

		}
	}
}


_Reg ProcessSrc(char *data)
{
	int sz;
	_Reg tmp;

	memset(&tmp,0,sizeof(tmp));
	tmp.neg=0;
	tmp.abs=0;
	tmp.swizzle[0]=0;
	tmp.swizzle[1]=1;
	tmp.swizzle[2]=2;
	tmp.swizzle[3]=3;

	if(data==NULL)
	{
		tmp.type=NVFXSR_NONE;
		tmp.index=0;
		return tmp;
	}
	if(data[0]=='-')
	{
		tmp.neg=1;
		++data;
	}
	if(data[0]=='|')
	{
		tmp.abs=1;
		++data;
	}
	char *k=strchr(data,';');
	if(k)
		*k=0;
	switch(data[0])
	{
		case 'v':	//input
			/*tmp.type=NVFXSR_INPUT;
			if(!isdigit(data[2]))
				tmp.index=ConvertInputReg(data+2);
			else
				tmp.index=atoi(data+2);*/
			tmp.type=NVFXSR_INPUT;
			if(data[1]=='e')
			{
				tmp.index=ConvertInputReg(data,&sz);
				data+=sz;
			}
			else
			{
				if(!isdigit(data[2]))
					tmp.index=ConvertInputReg(data+2,&sz);
				else
					tmp.index=atoi(data+2);
			}

			break;
		case 'o':	//output
			tmp.type=NVFXSR_OUTPUT;
			if(!isdigit(data[2]))
				tmp.index=ConvertOutputReg(data+2,&sz);
			else
				tmp.index=atoi(data+2);
			break;
		case 'r':	//result
			tmp.type=NVFXSR_OUTPUT;
			tmp.index=ConvertOutputReg(data,&sz);
			data+=sz;
			break;
		case 'R':	//temp
			tmp.type=NVFXSR_TEMP;
			tmp.index=atoi(data+1);
			break;
		case 'c':	//const
			tmp.type=NVFXSR_CONST;
			tmp.index=atoi(data+2);
			break;
	}

	char *swiz = strchr(data,'.');
	if(swiz)
	{
		int n=0;
		tmp.swizzle[0]=0;
		tmp.swizzle[1]=0;
		tmp.swizzle[2]=0;
		tmp.swizzle[3]=0;
		++swiz;
		while(swiz[n])
		{
			switch(swiz[n])
			{
				case 'x': tmp.swizzle[n]=0; ++n; break;
				case 'y': tmp.swizzle[n]=1; ++n; break;
				case 'z': tmp.swizzle[n]=2; ++n; break;
				case 'w': tmp.swizzle[n]=3; ++n; break;
				default: goto exitloop;
			}
		}
exitloop:;
		
		if(n && n!=4)
		{	//extend last swizzle
			unsigned char lastsw=tmp.swizzle[n-1];
			while(n<4)
			{
				tmp.swizzle[n]=lastsw;
				++n;
			}
		}
	}

	return tmp;
}


_Instruction instructions[0x1000];

_Instruction *ParseAsm(char *program,int *nInsts)
{
	bool inProgram=false;
	std::stringstream inputProgram(program);
	
	*nInsts=0;
	nLine=0;

	while(!inputProgram.eof())
	{
		char line[256];

		inputProgram.getline(line,255);

		++nLine;
		//remove \n & \r
		char *newline = strchr(line,'\n');
		if(newline)
			*newline=0;
		newline = strchr(line,'\n');
		if(newline)
			*newline=0;

		if(line[0]==0)
			continue;
		if(!inProgram)
		{
			if(strncmp(line,"!!VP2.0",7)==0)
				inProgram=true;
			if(strncmp(line,"!!ARBvp1.0",10)==0)
				inProgram=true;
			continue;
		}
		//is it a comment
		if(line[0]=='#')
		{

		}
		else
		{
			//get the opcode token
			_Instruction instruction;
			_Opcode *opcode = ScanOpcode(line);
			if(opcode==NULL)
			{
				if(strchr(line,':'))	//identifier
				{
					char *p=strchr(line,':');
					*p=0;
					_JumpDst d;
					strcpy(d.identifier,trim(line));
					d.instruction=*nInsts;
					Identifiers.push_back(d);
					continue;
				}
				if(strncasecmp(line,"PARAM",5)==0)
					continue;
				if(strncasecmp(line,"TEMP",4)==0)
					continue;
				if(strncasecmp(line,"OPTION",6)==0)
					continue;
				if(line[0]==' ' || line[0]=='\t')
					continue;
				//printf("Illegal opcode %s. Line %d",line,nLine);
				fatal("Illegal opcode",line);
				return NULL;
			}
			if(opcode->instruction==0xFFFFFFFF)
				break;
			char *next=line+strlen(opcode->mnemonic);
			if(next[0]=='C')
			{
				instruction.updateCC=1;
				++next;
			}
			else
				instruction.updateCC=0;
			instruction.saturate=0;
			if(next[0]=='_')
			{
				if(strncasecmp(next,"_sat",4)==0)
				{
					instruction.saturate=1;
					next+=4;
				}
			}
				

			instruction.op=opcode->instruction;
			instruction.unit=opcode->unit;

			instruction.condition = NVFX_COND_TR;	//always
			instruction.testCC=0;
			instruction.condSwizzle[0]=0;
			instruction.condSwizzle[1]=1;
			instruction.condSwizzle[2]=2;
			instruction.condSwizzle[3]=3;

			char *token = trim(strtok(next,","));
			_Reg param[3];
			_Reg tmp;
			tmp.type=NVFXSR_NONE;
			tmp.index=0;
			tmp.neg=0;
			tmp.abs=0;
			tmp.swizzle[0]=0;
			tmp.swizzle[1]=1;
			tmp.swizzle[2]=2;
			tmp.swizzle[3]=3;

			if(opcode->imm)
			{
				ProcessDstAddr(token,&instruction,*nInsts);
			}
			else
			{
				ProcessDst(token,&instruction);
			}
			token=trim(strtok(NULL,","));
			param[0]=ProcessSrc(token);
			token=trim(strtok(NULL,","));
			param[1]=ProcessSrc(token);
			token=trim(strtok(NULL,","));
			param[2]=ProcessSrc(token);

			if(opcode->param1!=-1)
				instruction.src[0]=param[(int)opcode->param1];
			else
				instruction.src[0]=tmp;
			if(opcode->param2!=-1)
				instruction.src[1]=param[(int)opcode->param2];
			else
				instruction.src[1]=tmp;
			
			if(opcode->param3!=-1)
				instruction.src[2]=param[(int)opcode->param3];
			else
				instruction.src[2]=tmp;
			
			memcpy(instructions+*nInsts,&instruction,sizeof(_Instruction));
			++*nInsts;
		}
	}

	//Update jump locations
	for(std::list<_JumpDst>::iterator r=JumpDests.begin();r!=JumpDests.end();++r)
	{
		char found=0;
		//Find identifier
		for(std::list<_JumpDst>::iterator i=Identifiers.begin();i!=Identifiers.end();++i)
		{
			if(strcmp(r->identifier,i->identifier)==0)
			{
				found=1;
				_Reg tmp;
				tmp.type=NVFXSR_IMM;
				tmp.index=i->instruction;
				tmp.neg=0;
				tmp.abs=0;
				tmp.swizzle[0]=0;
				tmp.swizzle[1]=1;
				tmp.swizzle[2]=2;
				tmp.swizzle[3]=3;

				instructions[r->instruction].src[2]=tmp;
				break;
			}
		}
		if(!found)
		{
			fatal("identifer not found",r->identifier);
		}
	}

	return instructions;
}


