#include "stdio.h"

#ifdef _WIN32
#include "malloc.h"
#include "windows.h"
#elif defined(__APPLE__)
#include "stdlib.h"
#include <cg/cg.h>
#else
#include "stdlib.h"
#include "string.h"
#include <Cg/cg.h>
#endif

#include "vpasm.h"
#include "microcode.h"
#include "parameters.h"

struct _Options
{
	const char *SourceFile;
	const char *DestFile;
	const char *Entry;
	char GenerateAssembler;
	char Compile;
	char Strip;
} Options=
{
	NULL,
	NULL,
	"main",
	0,
	1,
	0,
};

#define SWAP16(v) ((v)>>8)|((v)<<8)
#define SWAP32(v) ((v)>>24)|((v)<<24)|(((v)&0xFF00)<<8)|(((v)&0xFF0000)>>8)

#ifdef _WIN32
typedef void*(*_cgCreateContext)();
typedef void(*_cgDestroyContext)(void *context);
typedef void*(*_cgCreateProgramFromFile)(void* context, int program_type, const char *program, int profile, const char *entry, const char **args);
typedef const char*(*_cgGetProgramString)(void *program,int pname);
typedef const char *(*_cgGetLastListing)(void *context);

_cgCreateContext cgCreateContext=NULL;
_cgDestroyContext cgDestroyContext=NULL;
_cgCreateProgramFromFile cgCreateProgramFromFile=NULL;
_cgGetProgramString cgGetProgramString=NULL;
_cgGetLastListing cgGetLastListing=NULL;

void InitCompiler()
{
	HMODULE libcgc=LoadLibrary("cg.dll");
	if(libcgc==NULL)
		return;
	cgCreateContext=(_cgCreateContext)GetProcAddress(libcgc,"cgCreateContext");
	cgDestroyContext=(_cgDestroyContext)GetProcAddress(libcgc,"cgDestroyContext");
	cgCreateProgramFromFile=(_cgCreateProgramFromFile)GetProcAddress(libcgc,"cgCreateProgramFromFile");
	cgGetProgramString=(_cgGetProgramString)GetProcAddress(libcgc,"cgGetProgramString");
	cgGetLastListing=(_cgGetLastListing)GetProcAddress(libcgc,"cgGetLastListing");

}
#endif

void ShowUsage()
{
	printf("vpcomp [options] input output\n");
	printf("\t-a Assemble (do not compile, input an assembly listing instead of .cg\n");
	printf("\t-k Generate intermediate assembler file (.vsa)\n");
	printf("\t-e Entry function (default main)\n");
	printf("\t-s Generate stripped file (no variable names)\n");
	exit(-2);
}

void ReadOptions(_Options *options,int argc,char **argv)
{
	int i;

	for(i=1;i<argc;++i)
	{
		if(argv[i][0]=='-')
		{
			switch(argv[i][1])
			{
				case 'a':	options->Compile=0; break;
				case 'k':	options->GenerateAssembler=1; break;
				case 'e':   options->Entry=argv[i+1]; ++i; break;
				case 's':   options->Strip=1; break;
				case 'h':	ShowUsage(); break;
			}
		}
		else
			break;
	}
	if(i+2!=argc)
		ShowUsage();
	options->SourceFile=argv[i];
	options->DestFile=argv[i+1];
}

static void fatal(const char *error)
{
	printf("%s\n",error);
	exit(-1);
}


int main(int argc,char **argv)
{
	char *prg;
	_Instruction *insts;
	int nInsts;

	ReadOptions(&Options,argc,argv);

	if(Options.Compile)
	{
		printf("Compiling...\n");
#ifdef _WIN32		
		InitCompiler();

		if(cgCreateContext==NULL)
		{
			fatal("Compiling requires NVidia CG.dll");
		}

		void  *context=cgCreateContext();
		void *program=cgCreateProgramFromFile(context,4112/*CG_SOURCE*/,Options.SourceFile,6148/*VP30*//*7001*//*VP40*/,Options.Entry,NULL);
		if(program==NULL)
		{
			const char *error=cgGetLastListing(context);
			printf("%s\n",error);
			fatal("Error compiling shader");
		}
		prg=(char*)cgGetProgramString(program,4106/*CG_COMPILED_PROGRAM*/);
#else
		CGcontext context=cgCreateContext();
		CGprogram program=cgCreateProgramFromFile(context,CG_SOURCE,Options.SourceFile,CG_PROFILE_VP30,Options.Entry,NULL);
		if(program==NULL)
		{
			const char *error=cgGetLastListing(context);
			printf("%s\n",error);
			fatal("Error compiling shader");
		}
		prg=(char*)cgGetProgramString(program,CG_COMPILED_PROGRAM);
#endif
		if(Options.GenerateAssembler)
		{
			char aux[256];
			strcpy(aux,Options.SourceFile);
			strcat(aux,".vsa");
			FILE *f=fopen(aux,"wt");
			fwrite(prg,1,strlen(prg),f);
			fclose(f);
		}
	}
	else
	{
		FILE *f=fopen(Options.SourceFile,"rb");
		if(f==NULL)
			fatal("Can't open input file");
		fseek(f,0,SEEK_END);
		unsigned int sz=ftell(f);
		fseek(f,0,SEEK_SET);
		prg=(char*)malloc(sz);
		if(fread(prg,1,sz,f) != sz)
			fatal("The input file magically changed it's size on us");
		fclose(f);
	}

	printf("Assembling...\n");
	insts=ParseAsm(prg,&nInsts);

	printf("Generating microcode...\n");

	_Microcode *ucode;

	ucode=GenerateMicrocode(insts,nInsts);

	printf("Scanning attribute & params\n");

	list<_Parameter> parameters = ScanParameters(prg);

	//allocate a 2MB buffer for the generated vertex program
	unsigned char *vertexprogram = (unsigned char*)malloc(2*1024*1024);
	unsigned int lastoffset=0;
	realityVertexProgram *vp=(realityVertexProgram *) vertexprogram;

	unsigned short magic = ('V'<<8)|'P';
	vp->Magic=SWAP16(magic);
	vp->InputMask=SWAP32(ucode->InputMask);
	vp->OutputMask=SWAP32(ucode->OutputMask);
	
	lastoffset=sizeof(realityVertexProgram);
	
	while(lastoffset&3)	//align
	{
		vertexprogram[lastoffset]=0;
		++lastoffset;
	}

	//attributes
	realityVertexProgramAttribute *attributes = (realityVertexProgramAttribute*)(vertexprogram+lastoffset);
	int n=0;

	vp->AttributesOffset=SWAP32(lastoffset);

	for(list<_Parameter>::iterator i=parameters.begin();i!=parameters.end();++i)
	{
		if(!i->IsConstant)
		{
			i->User=lastoffset+n*sizeof(realityVertexProgramAttribute);
			attributes[n].Index=SWAP32(i->Index);
			attributes[n].NameOffset=SWAP32(0);	//will patch it later
			++n;
		}
	}
	vp->NumAttributes=SWAP16(n);
	lastoffset+=n*sizeof(realityVertexProgramAttribute);
	
	while(lastoffset&3)	//align
	{
		vertexprogram[lastoffset]=0;
		++lastoffset;
	}

	realityVertexProgramConstant *constants = (realityVertexProgramConstant*)(vertexprogram+lastoffset);
	n=0;

	vp->ConstantsOffset=SWAP32(lastoffset);

	for(list<_Parameter>::iterator i=parameters.begin();i!=parameters.end();++i)
	{
		if(i->IsConstant)
		{
			i->User=lastoffset+n*sizeof(realityVertexProgramConstant);
			constants[n].Index=SWAP32(i->Index);
			constants[n].Type=i->Type;
			constants[n].Internal=i->IsInternal;
			constants[n].Values[0].f=i->Values[0];	
			constants[n].Values[0].u=SWAP32(constants[n].Values[0].u);
			constants[n].Values[1].f=i->Values[1];
			constants[n].Values[1].u=SWAP32(constants[n].Values[1].u);
			constants[n].Values[2].f=i->Values[2];
			constants[n].Values[2].u=SWAP32(constants[n].Values[2].u);
			constants[n].Values[3].f=i->Values[3];
			constants[n].Values[3].u=SWAP32(constants[n].Values[3].u);

			constants[n].NameOffset=SWAP32(0);	//will patch it later
			++n;
		}
	}
	vp->NumConstants=SWAP16(n);
	lastoffset+=n*sizeof(realityVertexProgramConstant);
	
	if(!Options.Strip)
	{
		while(lastoffset&3)	//align
		{
			vertexprogram[lastoffset]=0;
			++lastoffset;
		}

		//Now the string table
		for(list<_Parameter>::iterator i=parameters.begin();i!=parameters.end();++i)
		{
			if(!i->Name.empty() && !i->IsInternal)
			{
				const char *str=i->Name.c_str();
				int offset=lastoffset;
				while(*str)
				{
					vertexprogram[lastoffset++]=*str++;
				}
				vertexprogram[lastoffset++]=0;
				//now patch the offset (first dword)
				*((unsigned int *) (vertexprogram+i->User))=SWAP32(offset);
			}
		}
	}

	//now the microcode
	while(lastoffset&15)	//align
	{
		vertexprogram[lastoffset]=0;
		++lastoffset;
	}

	vp->UCodeOffset=SWAP32(lastoffset);
	vp->NumInsts=SWAP16(nInsts);

	unsigned int *dstcodeptr = (unsigned int*)(vertexprogram+lastoffset);
	unsigned int *srccodeptr = ucode->ucode;

	for(int i=0;i<nInsts*4;++i)
	{
		dstcodeptr[i]=SWAP32(srccodeptr[i]);
		lastoffset+=4;
	}

	FILE *f=fopen(Options.DestFile,"wb");
	fwrite(vertexprogram,1,lastoffset,f);
	fclose(f);

	return 0;
}
