
%{
#include <stdio.h>
#include <string.h>
#include "nv40_shader.h"

#define uint32 unsigned int
#define uint32_t unsigned int

//#include "../../src/shaders/fragment.h"
void yyerror(const char *str);

uint32 endian_fp( uint32 v )
{
  return ( ( ( v >> 16 ) & 0xffff ) << 0 ) |
         ( ( ( v >> 0 ) & 0xffff ) << 16 );

}


#define NV40_FP_DEST_MASK(x,y,z,w)  ((w<<3)|(z<<2)|(y<<1)|x)
#define NV40_FP_SWIZZLE(x,y,z,w)  ((w<<6)|(z<<4)|(y<<2)|x)


uint32 fp_inst[4];
float  f[256];


uint32 inst_stack[256][4];
uint32 swizzles[4];
int swz_ptr = 0;

int inst_ptr = 0;
int n;
int v;
int h;
int type = 0;
int src_ptr = 0;
int mod = 0;
int neg = 0;
int cnst = 0;
int last_cmd = 0;
int max_reg = 0;
int creg = 0;
const char *outfile;

typedef union
{
	float f;
	int i;
}f2i;


void dump()
{
	if( fp_inst[0] == 0 )
	{
		cnst = 0;
		return;
	}
	inst_stack[inst_ptr][0] = fp_inst[0];
	inst_stack[inst_ptr][1] = fp_inst[1];
	inst_stack[inst_ptr][2] = fp_inst[2];
	inst_stack[inst_ptr][3] = fp_inst[3];
	
	++inst_ptr;
	last_cmd = 1;

	if( cnst )
	{
		f2i c;
		c.f = f[0];
		inst_stack[inst_ptr][0] = c.i;
		c.f = f[1];
		inst_stack[inst_ptr][1] = c.i;
		c.f = f[2];
		inst_stack[inst_ptr][2] = c.i;
		c.f = f[3];
		inst_stack[inst_ptr][3]	= c.i;
		++inst_ptr;
		last_cmd = 2;
		
	}
	cnst = 0;
	
	
}

void print()
{
	//printf( "asdasdasd" );
	//inst_stack[inst_ptr - 1][3] |= NV40_VP_INST_LAST;
	uint32 i;
	inst_stack[inst_ptr - last_cmd][0] |= NV40_FP_OP_PROGRAM_END;
	for( i = 0; i < inst_ptr; ++i )
	{
		printf( "%8x %8x %8x %8x \n", inst_stack[i][0], inst_stack[i][1], inst_stack[i][2], inst_stack[i][3]  );
		inst_stack[i][0] = endian_fp( inst_stack[i][0] );
		inst_stack[i][1] = endian_fp( inst_stack[i][1] );
		inst_stack[i][2] = endian_fp( inst_stack[i][2] );
		inst_stack[i][3] = endian_fp( inst_stack[i][3] );
		
	}

	
	//fragment_shader_desc_t desc;
    char name[512];
	
	char *pt=strstr(outfile,".h");

    if(!pt) {strcpy(name, outfile); strcat(name, ".h"); outfile = name; pt=strstr(outfile,".h");}

	#if 0
    if(!pt)
	{
	FILE *out = fopen( outfile, "wb" );
	if( out )
	{
	    desc.aux[0] = 0xcafebabe;
	    desc.dword_length = inst_ptr * 4;
	    desc.num_regs = max_reg;
	    fwrite( &desc, sizeof( desc ), 1, out );
	    fwrite( &inst_stack[0][0], 4 * desc.dword_length, 1, out );
	    fclose( out );
	    printf( "fp regs %x \n", max_reg );
	    	
	} 
	}
	else
    #endif
	{
	FILE *out = fopen( outfile, "w" );
	if( out )
	{
        unsigned *punt;
        int n;
        

        *pt=0;

        strcpy(name, outfile);
	    
	    fprintf(out,"/* Fragment Program - Output by Hermes / www.elotrolado.net\nOriginal work by Peter S. Popov */\n\n");

        fprintf(out,"#include <rsx/commands.h>\n\n");

        fprintf(out,"realityFragmentProgram nv30_fp_%s = {\n", name);

	    fprintf(out,".num_regs = %i,\n", max_reg);
	    fprintf(out,".size = (%i*4),\n", inst_ptr);
	    fprintf(out,".data = {\n");
	    
        punt=(unsigned *) &inst_stack[0][0];

	    for(n=0;n<inst_ptr * 4;n++)
	    {
		if(n==0) fprintf(out,"    0x%x", endian_fp(punt[n]));
		else
		if((n & 3)==0) fprintf(out,",\n    0x%x", endian_fp(punt[n]));
		else fprintf(out,", 0x%x", endian_fp(punt[n]));
	   
	    }
	    fprintf(out,"\n}\n};\n\n// End\n\n");
	    fclose( out );
	    printf( "fp regs %x \n", max_reg );
	    	
	} 
	
	}
	inst_ptr = 0;
}

void clean()
{
	
	fp_inst[0] = 0;
	fp_inst[1] = 0;
	fp_inst[2] = 0;
	fp_inst[3] = 0;
	src_ptr = 0;
	type = 0;
	mod = 0;
	neg = 0;
}

void opv( uint32 op )
{
	if( op == 0xff )
	{
	 	op = 0;
	}
	
	printf( "opv code 0x%2x ", op );
	fp_inst[0] &= ~NV40_FP_OP_OPCODE_MASK; 
  	fp_inst[0] |= ( op <<  NV40_FP_OP_OPCODE_SHIFT); 
	
}

void msk( uint32 ms )
{
	printf( "ms %x %x %x %x ", ( ms >> 0 ) & 1, ( ms >> 1 ) & 1, ( ms >> 2 ) & 1, ( ms >> 3 ) & 1  );
	fp_inst[0] &= ~NV40_FP_OP_OUTMASK_MASK; 
  	fp_inst[0] |= ( ms << NV40_FP_OP_OUTMASK_SHIFT ); 

}

void cnd_msk( uint32 cn )
{
	fp_inst[1] &= ~NV40_FP_OP_COND_MASK;
	fp_inst[1] |= ( cn << NV40_FP_OP_COND_SHIFT );
	printf( "cnd %d ", cn );
	
}

void sat( uint32 s )
{
	printf( "sat %x ", s );
	fp_inst[0] &= ~NV40_FP_OP_OUT_SAT;
	if( s )
	{	
		fp_inst[0] |= NV40_FP_OP_OUT_SAT;	
	}

}

void cnd( uint32 s )
{
	printf( "cnd %x \n", s );
	fp_inst[0] &= ~NV40_FP_OP_COND_WRITE_ENABLE;
	if( s )
	{	
		fp_inst[0] |= NV40_FP_OP_COND_WRITE_ENABLE;	
	}

}
	

void com( uint32 s )
{
	swizzles[swz_ptr++] = s;
}

void set_input( uint32 in )
{
	type = 1;
	fp_inst[0] &= ~NV40_FP_OP_INPUT_SRC_MASK;
	fp_inst[0] |= ( in << NV40_FP_OP_INPUT_SRC_SHIFT );
	printf( "inp %d ", in  );
	
}

uint32 get_swizzle()
{
	int st;
	uint32 r;
	if( swz_ptr == 0 )
	{
		swizzles[0] = 0;
		swizzles[1] = 1;
		swizzles[2] = 2;
		swizzles[3] = 3;
		               	
	}
	else
	{
		for( st = swz_ptr; st < 4; ++st )
		{
			swizzles[st] = swizzles[swz_ptr - 1];
		} 
	}
	swz_ptr = 0;
	
	r = NV40_FP_SWIZZLE( swizzles[0], swizzles[1], swizzles[2], swizzles[3] );
	printf( "swz = %x %x %x %x ", swizzles[0], swizzles[1], swizzles[2], swizzles[3] );
	return r;
	
}

void prc( uint32 s )
{
	printf( "prc %x ", s );
	fp_inst[0] &= ~NV40_FP_OP_PRECISION_MASK;
	if( s )
	{	
		fp_inst[0] |= ( s << NV40_FP_OP_PRECISION_SHIFT );	
	}
}

void set_cns()
{
	type = 2;
}

void set_tex( uint32 r )
{
	fp_inst[0] &= ~( NV40_FP_OP_TEX_UNIT_MASK );
	fp_inst[0] |= ( r << NV40_FP_OP_TEX_UNIT_SHIFT );
	
	printf( "tex %d \n", r );
}

void src_reg( uint32 reg )
{

	fp_inst[src_ptr + 1] &= ~NV40_FP_REG_TYPE_MASK;
	fp_inst[src_ptr + 1] |= ( type << NV40_FP_REG_TYPE_SHIFT );

	fp_inst[src_ptr + 1] &= ~NV40_FP_REG_UNK_0;
	if( h )
	{
		fp_inst[src_ptr + 1] |= NV40_FP_REG_UNK_0;
	
	}
	
	fp_inst[src_ptr + 1] &= ~NV40_FP_REG_NEGATE;
	if( neg )
	{
		fp_inst[src_ptr + 1] |= NV40_FP_REG_NEGATE;
	}
	fp_inst[src_ptr + 1] &= ~NV40_FP_REG_SRC_MASK;
	fp_inst[src_ptr + 1] |= ( reg << NV40_FP_REG_SRC_SHIFT );
	
	fp_inst[src_ptr + 1] &= ~NV40_FP_REG_SWZ_ALL_MASK;
	fp_inst[src_ptr + 1] |= ( get_swizzle() << NV40_FP_REG_SWZ_ALL_SHIFT );
	
	printf( "... src %s %2d type %d neg %d \n", h ? "h" : "r", reg, type, neg  );
	src_ptr++;
	type = 0;
	neg = 0;
		
}

        
void out_reg( uint32 reg )
{
	uint32 reg_num =  h ? reg / 2 + 2: reg + 2;
	if( creg == 0 && reg_num > max_reg )
	{
		max_reg = reg_num;
	}
	fp_inst[0] &= ~NV40_FP_OP_UNK0_7;
	if( h )
	{
		fp_inst[0] |= NV40_FP_OP_UNK0_7;
	
	}
	
	
	fp_inst[0] &= ~NV40_FP_OP_OUT_REG_MASK;
	fp_inst[0] |= ( reg << NV40_FP_OP_OUT_REG_SHIFT );
	printf( "out %s %2d ", h ? "h" : "r", reg  );	
	creg = 0;
}

void cnd_swz()
{
	fp_inst[1] &= ~NV40_FP_OP_COND_SWZ_ALL_MASK;
	fp_inst[1] |= ( get_swizzle() << NV40_FP_OP_COND_SWZ_ALL_SHIFT );
	
}

%}

%token _0 _1 _2 _3 _4 _5 _6 _7 _8 _9 _1D _2D _3D DOT CONST C WHITE DEC WORD SAT H END POW BEG CUBE RECT COLR COLH DEPR WPOS COL0 COL1 FOGC  F R X Y Z W EQ  GE GT LE LT NE TR FL DDX DDY FLR FRC LIT MOV PK2H PK2US PK4B PK4UB COS EXP LG2 RCP RSQ SIN UP2H UP2US UP4B UP4UB ADD DP3 DP4 DST MAX MIN MUL RFL SEQ SFL SGE SGT SLE  SLT  SNE STR SUB MAD LRP  X2D KIL TEX TXP TXD
       






%%

program:       
	BEG space instructionSequence { print(); } END;

instructionSequence:
	 instructionSequence instructionStatement | 
	 instructionStatement;

space:
	/*  empty */     |
	WHITE;


empty:
	WHITE;

instructionStatement:
	instruction ';' { dump(); clean();};    

instruction:          
	localDeclaration     |
	VECTORop_instruction |
        SCALARop_instruction |
	BINSCop_instruction  |
	BINop_instruction    |
	TRIop_instruction    |
       	KILop_instruction    |
        TEXop_instruction    |
        TXDop_instruction;

VECTORop_instruction:
	VECTORop pref empty  maskedDstReg ',' vectorSrc;

SCALARop_instruction:
       	SCALARop pref empty maskedDstReg ',' scalarSrc;

BINSCop_instruction:
	BINSCop pref empty maskedDstReg ',' scalarSrc ',' scalarSrc;
 
BINop_instruction:
	BINop pref empty maskedDstReg ',' vectorSrc ',' vectorSrc;


TRIop_instruction:
	TRIop pref empty maskedDstReg ',' vectorSrc ',' vectorSrc ',' vectorSrc;

KILop_instruction:
	KILop ccMask;

TEXop_instruction:
	TEXop pref empty maskedDstReg ',' vectorSrc ',' texImageId;


TXDop_instruction:
	TXDop pref empty maskedDstReg ',' vectorSrc ',' vectorSrc ',' vectorSrc ',' texImageId;


prec:
	R  { prc( 0 ); }   	                       |
	H  { prc( 1 ); }                               |
	X  { prc( 2 ); }			       |
	/* empty */ { prc( 0 );	};	
	

cond:
	C { cnd( 1 ); }  |
	/* empty */ { cnd( 0 ); };

sat:
	SAT { sat( 1 ); } |
	/* empty */ { sat( 0 ); };

pref: 
	prec cond sat { type = 0; };
      

VECTORop:
	DDX   { opv( NV40_FP_OP_OPCODE_DDX ); }  |
        DDY   { opv( NV40_FP_OP_OPCODE_DDY ); } |
	FLR   { opv( NV40_FP_OP_OPCODE_FLR ); } |
	FRC   { opv( NV40_FP_OP_OPCODE_FRC ); } |
	LIT   { opv( 0xff ); } |
	MOV   { opv( NV40_FP_OP_OPCODE_MOV ); } |            
        PK2H  { opv( NV40_FP_OP_OPCODE_PK2H ); }|
	PK2US { opv( NV40_FP_OP_OPCODE_PK2US ); }|
	PK4B  { opv( NV40_FP_OP_OPCODE_PK4B ); }|
	PK4UB { opv( NV40_FP_OP_OPCODE_PK4UB ); }; 

SCALARop:
	COS  { opv( NV40_FP_OP_OPCODE_COS ); } |
	EXP  { opv( NV40_FP_OP_OPCODE_EX2 ); } |
	LG2  { opv( NV40_FP_OP_OPCODE_LG2 ); } |
	RCP  { opv( NV40_FP_OP_OPCODE_RCP ); } |
	RSQ  { opv( 0xff ); } |
	SIN  { opv( NV40_FP_OP_OPCODE_SIN ); } |
	UP2H { opv( NV40_FP_OP_OPCODE_UP2H ); } |
	UP2US{ opv( NV40_FP_OP_OPCODE_UP2US ); } |
	UP4B { opv( NV40_FP_OP_OPCODE_UP4B ); } |
	UP4UB { opv( NV40_FP_OP_OPCODE_UP4UB ); };
              
BINSCop:
	POW;

BINop:
	ADD { opv( NV40_FP_OP_OPCODE_ADD ); }  |
	DP3 { opv( NV40_FP_OP_OPCODE_DP3 ); }  |
	DP4 { opv( NV40_FP_OP_OPCODE_DP4 ); }  |
        DST { opv( NV40_FP_OP_OPCODE_DST ); }  |
 	MAX { opv( NV40_FP_OP_OPCODE_MAX ); }  |
	MIN { opv( NV40_FP_OP_OPCODE_MIN ); }  |
	MUL { opv( NV40_FP_OP_OPCODE_MUL ); }  |
	SEQ { opv( NV40_FP_OP_OPCODE_SEQ ); }  |
        SGE { opv( NV40_FP_OP_OPCODE_SGE ); }  |
	SGT { opv( NV40_FP_OP_OPCODE_SGT ); }  |
	SLE { opv( NV40_FP_OP_OPCODE_SLE ); }  |
	SLT { opv( NV40_FP_OP_OPCODE_SLT ); }  |              
	SNE { opv( NV40_FP_OP_OPCODE_SNE ); }  |
	SUB { opv( NV40_FP_OP_OPCODE_ADD ); };                 


TRIop:

	MAD { opv( NV40_FP_OP_OPCODE_MAD ); } |
	X2D { opv( 0xff ); };

KILop:                
	KIL { opv( NV40_FP_OP_OPCODE_KIL ); };


TEXop:  
	TEX { opv( NV40_FP_OP_OPCODE_TEX ); }|
	TXP { opv( NV40_FP_OP_OPCODE_TXP ); };

TXDop:      
	TXD { opv( NV40_FP_OP_OPCODE_TXD ); };       


scalarSrc:
	space absScalarSrc space {src_reg( v ); }| 
	space baseScalarSrc space {src_reg( v ); };

absScalarSrc:         
	negate '|' baseScalarSrc '|';


baseScalarSrc:        
       	negate vectorConstant scalarSuffix |
        negate srcRegister scalarSuffix;

vectorSrc:    
	space absVectorSrc space {src_reg( v ); }| 
	space baseVectorSrc space {src_reg( v ); };


absVectorSrc:        
	negate  '|' baseVectorSrc '|' { mod = 1; };


baseVectorSrc:
        negate vectorConstant swizzleSuffix |
        negate srcRegister   swizzleSuffix;


maskedDstReg:        
	dstRegister optionalWriteMask optionalCCMask { out_reg( v );  cnd_swz(); type = 0; h = 0; printf( "\n" ); };


dstRegister:          
	fragTempReg   |
        fragOutputReg; 


optionalCCMask:
	 '(' ccMask ')'|
	  /* empty  */ { cnd_msk( NV40_FP_OP_COND_TR ); };

ccMask:
	ccMaskRule swizzleSuffix;
 
ccMaskRule:        
	EQ  { cnd_msk( NV40_FP_OP_COND_EQ ); } |
	GE  { cnd_msk( NV40_FP_OP_COND_GE ); } |
	GT  { cnd_msk( NV40_FP_OP_COND_GT ); } |
	LE  { cnd_msk( NV40_FP_OP_COND_LE ); } |
	LT  { cnd_msk( NV40_FP_OP_COND_LT ); } |
	NE  { cnd_msk( NV40_FP_OP_COND_NE ); } |
	TR  { cnd_msk( NV40_FP_OP_COND_TR ); } |
	FL  { cnd_msk( NV40_FP_OP_COND_FL ); };
	   

optionalWriteMask:
	DOT X 	    { msk( NV40_FP_DEST_MASK( 1, 0, 0, 0 ) ); }|
	DOT Y 	    { msk( NV40_FP_DEST_MASK( 0, 1, 0, 0 ) ); }|
	DOT X Y     { msk( NV40_FP_DEST_MASK( 1, 1, 0, 0 ) ); }|
	DOT Z       { msk( NV40_FP_DEST_MASK( 0, 0, 1, 0 ) ); }|
	DOT X Z     { msk( NV40_FP_DEST_MASK( 1, 0, 1, 0 ) ); }|
	DOT Y Z     { msk( NV40_FP_DEST_MASK( 0, 1, 1, 0 ) ); }|
	DOT X Y Z   { msk( NV40_FP_DEST_MASK( 1, 1, 1, 0 ) ); }|
	DOT W 	    { msk( NV40_FP_DEST_MASK( 0, 0, 0, 1 ) ); }| 
	DOT X W     { msk( NV40_FP_DEST_MASK( 1, 0, 0, 1 ) ); }|
	DOT Y W     { msk( NV40_FP_DEST_MASK( 0, 1, 0, 1 ) ); }|
	DOT X Y W   { msk( NV40_FP_DEST_MASK( 1, 1, 0, 1 ) ); }|
	DOT Z  W    { msk( NV40_FP_DEST_MASK( 0, 0, 1, 1 ) ); }| 
	DOT X Z W   { msk( NV40_FP_DEST_MASK( 1, 0, 1, 1 ) ); }|
	DOT Y Z W   { msk( NV40_FP_DEST_MASK( 0, 1, 1, 1 ) ); }|
	DOT X Y Z W { msk( NV40_FP_DEST_MASK( 1, 1, 1, 1 ) ); }|
	/* empty */ { msk( NV40_FP_DEST_MASK( 1, 1, 1, 1 ) ); }; 


srcRegister:
	fragAttribReg |
        fragTempReg;

fragAttribReg:        
	'f' '[' fragAttribRegId ']';


fragAttribRegId:     
	WPOS  { set_input( NV40_FP_OP_INPUT_SRC_POSITION ); } | 
	COL0  { set_input( NV40_FP_OP_INPUT_SRC_COL0 ); } | 
	COL1  { set_input( NV40_FP_OP_INPUT_SRC_COL1 ); } | 
	FOGC  { set_input( NV40_FP_OP_INPUT_SRC_FOGC ); } | 
	texImageUnit { set_input( NV40_FP_OP_INPUT_SRC_TC0 + v ); };

fragTempReg:
	fragF32Reg | fragF16Reg;


NUMBER:
	_0 { n = 0; } |
	_1 { n = 1; } |
	_2 { n = 2; } |
	_3 { n = 3; } |
	_4 { n = 4; } |
	_5 { n = 5; } |
	_6 { n = 6; } |
	_7 { n = 7; } |
	_8 { n = 8; } |
	_9 { n = 9; };
	    
		
	
decCalc:
	NUMBER { v = n; } |
	decCalc NUMBER { v = v * 10 + n; };    


fragF32Reg:
	R decCalc { h = 0; }; |
	R C { h = 0; v = 31; creg = 1; };

fragF16Reg:
	H decCalc { h = 1; }; |
	H C { h = 1; v = 63; creg = 1; };

fragOutputReg:        
	'o' '[' fragOutputRegName ']';


fragOutputRegName:
	COLR { v = 0; h = 0; }  | 
	COLH { v = 0; h = 1; }  | 
	DEPR;



scalarSuffix:
	DOT component;

swizzleSuffix:
	DOT component component component component  |
	DOT component component component |
	DOT component component |
	DOT component |
	/* empty */ ;  

component:
	X { com( 0 ); }  |
	Y { com( 1 ); }  |
	Z { com( 2 ); }  |
	W { com( 3 ); };

texImageId:
	space texImageUnit space ',' space texImageTarget space { set_tex( v ); };

texImageUnit:
	TEX decCalc;



texImageTarget:
	_1D    | 
	_2D    | 
	_3D    | 
	CUBE   | 
	RECT;


vectorConstant:
	CONST { set_cns(); cnst = 1;}| 
	WORD  { set_cns(); cnst = 1;}; 
               

negate:
	/*  empty */ { neg = 0; }  |
	'+'  { neg = 0; }          |
	'-' { neg = 1; }   ;

              
localDeclaration:
	DEC empty namedLocalParameter optionalLocalValue;


namedLocalParameter:
	WORD;

optionalLocalValue:
	/* empty */     |
        '=' vectorConstant;
	


%%

void yyerror(const char *str)
{
        fprintf(stderr,"error: %s\n",str);
}
 
  
int yywrap()
{
        return 1;
} 
  
int main( int argn, const char *argv[] )
{

    FILE * in;

	if( argn < 2 )
	{
	    printf( "Usage:\n\nfp asmprogram.fp [outname]\n\n" );
	    return 1;
	}

	in = fopen(argv[1], "r");
    if(!in) {printf( "cannot open input file\n" );return 1;}

    if(argn > 2)
	    outfile = argv[2];
    else outfile = "output.h";

    yyrestart(in);

    yyparse();

	return 0;
} 







