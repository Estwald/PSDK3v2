#include "stdio.h"
#include "string.h"
#include "stdlib.h"

#include "parameters.h"

#include "string"
#include "sstream"


struct _ParamType
{
	const char *Name;
	unsigned char Type;
} ParamTypes[]=
{
	{"float",PARAM_FLOAT},
	{"float2",PARAM_FLOAT2},
	{"float3",PARAM_FLOAT3},
	{"float4",PARAM_FLOAT4},
	{"float4x4",PARAM_FLOAT4x4},
};

const unsigned char nParamTypes = sizeof(ParamTypes)/sizeof(_ParamType);


static int nLine;
static void fatal(const char *error, char *param)
{
	printf("Line %d: %s %s\n",nLine,error, param);
	exit(-1);
}

unsigned char GetParamType(char *str)
{
	for(int i=0;i<nParamTypes;++i)
	{
		if(strcasecmp(str,ParamTypes[i].Name)==0)
			return ParamTypes[i].Type;
	}

	fatal("unknown parameter type", str);
	return 0;
}

char isempty(char *string)
{
	while(*string!=0)
	{
		if(*string!=' ')
			return 0;
		++string;
	}
	return 1;
}

static unsigned char ConvertInputReg(char *input)
{
	if(strcasecmp(input,"POSITION")==0)
		return 0;
	if(strcasecmp(input,"WHGT")==0)
		return 1;
	if(strcasecmp(input,"NORMAL")==0)
		return 2;
	if(strcasecmp(input,"COLOR")==0 || strcasecmp(input,"COLOR0")==0 || strcasecmp(input,"DIFFUSE")==0)
		return 3;
	if(strcasecmp(input,"COLOR1")==0 || strcasecmp(input,"SPCULAR")==0)
		return 4;
	if(strcasecmp(input,"FOGCOORD")==0)
		return 5;
	if(strcasecmp(input,"TEXCOORD0")==0)
		return 8;
	if(strcasecmp(input,"TEXCOORD1")==0)
		return 9;
	if(strcasecmp(input,"TEXCOORD2")==0)
		return 10;
	if(strcasecmp(input,"TEXCOORD3")==0)
		return 11;
	if(strcasecmp(input,"TEXCOORD4")==0)
		return 12;
	if(strcasecmp(input,"TEXCOORD5")==0)
		return 13;
	if(strcasecmp(input,"TEXCOORD6")==0)
		return 14;
	if(strcasecmp(input,"TEXCOORD7")==0)
		return 15;
	fatal("unknown input reg", input);
	return 0;
}
/*
static unsigned char ConvertOutputReg(char *input)
{
	if(strcasecmp(input,"HPOS")==0 || strcasecmp(input,"POSITION")==0)
		return 0;
	if(strcasecmp(input,"COL0")==0 || strcasecmp(input,"COLOR")==0 || strcasecmp(input,"COLOR0")==0  || strcasecmp(input,"COL")==0)
		return 1;
	if(strcasecmp(input,"COL1")==0 || strcasecmp(input,"COLOR1")==0)
		return 2;
	if(strcasecmp(input,"BCOL0")==0)
		return 3;
	if(strcasecmp(input,"BCOL1")==0)
		return 4;
	if(strcasecmp(input,"FOGC")==0  || strcasecmp(input,"FOG")==0)
		return 5;
	if(strcasecmp(input,"PSIZ")==0  || strcasecmp(input,"PSIZE")==0)
		return 6;
	if(strcasecmp(input,"TEX0")==0 || strcasecmp(input,"TEXCOORD0")==0)
		return 7;
	if(strcasecmp(input,"TEX1")==0 || strcasecmp(input,"TEXCOORD1")==0)
		return 8;
	if(strcasecmp(input,"TEX2")==0 || strcasecmp(input,"TEXCOORD2")==0)
		return 9;
	if(strcasecmp(input,"TEX3")==0 || strcasecmp(input,"TEXCOORD3")==0)
		return 10;
	if(strcasecmp(input,"TEX4")==0 || strcasecmp(input,"TEXCOORD4")==0)
		return 11;
	if(strcasecmp(input,"TEX5")==0 || strcasecmp(input,"TEXCOORD5")==0)
		return 12;
	if(strcasecmp(input,"TEX6")==0 || strcasecmp(input,"TEXCOORD6")==0)
		return 13;
	if(strcasecmp(input,"TEX7")==0 || strcasecmp(input,"TEXCOORD7")==0)
		return 14;
	fatal("unknown output reg",input);
	return 0;
}
*/

extern unsigned char ConvertOutputReg(char *input);

list<_Parameter> ScanParameters(char *input)
{
	std::stringstream file(input);
	list<_Parameter> parameters;

	nLine=0;

	while(!file.eof())
	{
		char line[256];

		file.getline(line,255);

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
		//is it a comment
		if(line[0]=='#')
		{
			if(strncasecmp(line+1,"var",3)==0)
			{
				_Parameter p;
				char *token = strtok(line+5," :");
				p.Type=GetParamType(token);
				p.IsInternal=0;
				p.IsConstant=0;
				p.Name = strtok(NULL," :");
				p.Values[0]=0.0f;
				p.Values[1]=0.0f;
				p.Values[2]=0.0f;
				p.Values[3]=0.0f;
				token = strtok(NULL,":");
				if(isempty(token))
				{
					p.IsConstant=1;
					token=strtok(NULL," :");
					if(token[0]=='c')
					{
						p.Index = atoi(token+2);
					}
					else
					{
						fatal("unknown constant register",token);
					}
				}
				else if(strstr(token,"$vin"))	//Scan input semantic
				{
					token=strtok(NULL," :");
					if(strncasecmp(token,"ATTR",4)==0)	//Numbered
						p.Index = atoi(token+4);
					else
						p.Index=ConvertInputReg(token);
				}
				else if(strstr(token,"$vout"))	//scan output semantic
				{
					//we don't need the output attributes
					//token=strtok(NULL," :");
					//p.Index=ConvertOutputReg(token);
					continue;
				}
				else if(isempty(token))
				{
					continue;
				}
				else
				{
					fatal("Unknown semantic",token);
				}
				

				parameters.push_back(p);
			}
			else if(strncasecmp(line+1,"const",5)==0)
			{
				_Parameter p;
				p.IsInternal=1;
				p.IsConstant=1;
				p.Type=PARAM_FLOAT4;

				char *token = strtok(line+7," ");

				if(token[0]=='c')
				{
					p.Index = atoi(token+2);
					for(int i=0;i<4;++i)
					{
						token=strtok(NULL," =");
						if(token)
							p.Values[i]=(float)atof(token);
						else
							p.Values[i]=0;
					}
				}
				else
				{
					fatal("unknown constant register",token);
				}


				parameters.push_back(p);
			}
			else if(strncasecmp(line+1,"default",7)==0)
			{
				char *token = strtok(line+9," ");
				char found=0;
				
				for(list<_Parameter>::iterator p = parameters.begin();p!=parameters.end();++p)
				{
					if(p->Name==token && p->IsConstant)
					{
						for(int i=0;i<4;++i)
						{
							token=strtok(NULL," =");
							if(token)
								p->Values[i]=(float)atof(token);
							else
								p->Values[i]=0;
						}
						found=1;
						break;
					}
				}
				if(!found)
				{
					fatal("unknown constant register",token);
				}
			}
		}
	}

	return parameters;
}
