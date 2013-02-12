/* A Bison parser, made by GNU Bison 2.4.2.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2006, 2009-2010 Free Software
   Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.4.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Copy the first part of user declarations.  */

/* Line 189 of yacc.c  */
#line 2 "crc.y"

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



/* Line 189 of yacc.c  */
#line 435 "y.tab.c"

/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     _0 = 258,
     _1 = 259,
     _2 = 260,
     _3 = 261,
     _4 = 262,
     _5 = 263,
     _6 = 264,
     _7 = 265,
     _8 = 266,
     _9 = 267,
     _1D = 268,
     _2D = 269,
     _3D = 270,
     DOT = 271,
     CONST = 272,
     C = 273,
     WHITE = 274,
     DEC = 275,
     WORD = 276,
     SAT = 277,
     H = 278,
     END = 279,
     POW = 280,
     BEG = 281,
     CUBE = 282,
     RECT = 283,
     COLR = 284,
     COLH = 285,
     DEPR = 286,
     WPOS = 287,
     COL0 = 288,
     COL1 = 289,
     FOGC = 290,
     F = 291,
     R = 292,
     X = 293,
     Y = 294,
     Z = 295,
     W = 296,
     EQ = 297,
     GE = 298,
     GT = 299,
     LE = 300,
     LT = 301,
     NE = 302,
     TR = 303,
     FL = 304,
     DDX = 305,
     DDY = 306,
     FLR = 307,
     FRC = 308,
     LIT = 309,
     MOV = 310,
     PK2H = 311,
     PK2US = 312,
     PK4B = 313,
     PK4UB = 314,
     COS = 315,
     EXP = 316,
     LG2 = 317,
     RCP = 318,
     RSQ = 319,
     SIN = 320,
     UP2H = 321,
     UP2US = 322,
     UP4B = 323,
     UP4UB = 324,
     ADD = 325,
     DP3 = 326,
     DP4 = 327,
     DST = 328,
     MAX = 329,
     MIN = 330,
     MUL = 331,
     RFL = 332,
     SEQ = 333,
     SFL = 334,
     SGE = 335,
     SGT = 336,
     SLE = 337,
     SLT = 338,
     SNE = 339,
     STR = 340,
     SUB = 341,
     MAD = 342,
     LRP = 343,
     X2D = 344,
     KIL = 345,
     TEX = 346,
     TXP = 347,
     TXD = 348
   };
#endif
/* Tokens.  */
#define _0 258
#define _1 259
#define _2 260
#define _3 261
#define _4 262
#define _5 263
#define _6 264
#define _7 265
#define _8 266
#define _9 267
#define _1D 268
#define _2D 269
#define _3D 270
#define DOT 271
#define CONST 272
#define C 273
#define WHITE 274
#define DEC 275
#define WORD 276
#define SAT 277
#define H 278
#define END 279
#define POW 280
#define BEG 281
#define CUBE 282
#define RECT 283
#define COLR 284
#define COLH 285
#define DEPR 286
#define WPOS 287
#define COL0 288
#define COL1 289
#define FOGC 290
#define F 291
#define R 292
#define X 293
#define Y 294
#define Z 295
#define W 296
#define EQ 297
#define GE 298
#define GT 299
#define LE 300
#define LT 301
#define NE 302
#define TR 303
#define FL 304
#define DDX 305
#define DDY 306
#define FLR 307
#define FRC 308
#define LIT 309
#define MOV 310
#define PK2H 311
#define PK2US 312
#define PK4B 313
#define PK4UB 314
#define COS 315
#define EXP 316
#define LG2 317
#define RCP 318
#define RSQ 319
#define SIN 320
#define UP2H 321
#define UP2US 322
#define UP4B 323
#define UP4UB 324
#define ADD 325
#define DP3 326
#define DP4 327
#define DST 328
#define MAX 329
#define MIN 330
#define MUL 331
#define RFL 332
#define SEQ 333
#define SFL 334
#define SGE 335
#define SGT 336
#define SLE 337
#define SLT 338
#define SNE 339
#define STR 340
#define SUB 341
#define MAD 342
#define LRP 343
#define X2D 344
#define KIL 345
#define TEX 346
#define TXP 347
#define TXD 348




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif


/* Copy the second part of user declarations.  */


/* Line 264 of yacc.c  */
#line 663 "y.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  5
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   265

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  106
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  61
/* YYNRULES -- Number of rules.  */
#define YYNRULES  172
/* YYNRULES -- Number of states.  */
#define YYNSTATES  268

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   348

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      97,    98,     2,   103,    95,   104,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    94,
       2,   105,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   100,     2,   101,     2,     2,     2,     2,     2,     2,
       2,     2,    99,     2,     2,     2,     2,     2,     2,     2,
       2,   102,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    96,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     4,    10,    13,    15,    16,    18,    20,
      23,    25,    27,    29,    31,    33,    35,    37,    39,    41,
      48,    55,    64,    73,    84,    87,    96,   109,   111,   113,
     115,   116,   118,   119,   121,   122,   126,   128,   130,   132,
     134,   136,   138,   140,   142,   144,   146,   148,   150,   152,
     154,   156,   158,   160,   162,   164,   166,   168,   170,   172,
     174,   176,   178,   180,   182,   184,   186,   188,   190,   192,
     194,   196,   198,   200,   202,   204,   206,   208,   212,   216,
     221,   225,   229,   233,   237,   242,   246,   250,   254,   256,
     258,   262,   263,   266,   268,   270,   272,   274,   276,   278,
     280,   282,   285,   288,   292,   295,   299,   303,   308,   311,
     315,   319,   324,   328,   333,   338,   344,   345,   347,   349,
     354,   356,   358,   360,   362,   364,   366,   368,   370,   372,
     374,   376,   378,   380,   382,   384,   386,   388,   390,   393,
     396,   399,   402,   405,   410,   412,   414,   416,   419,   425,
     430,   434,   437,   438,   440,   442,   444,   446,   454,   457,
     459,   461,   463,   465,   467,   469,   471,   472,   474,   476,
     481,   483,   484
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     107,     0,    -1,    -1,    26,   110,   109,   108,    24,    -1,
     109,   112,    -1,   112,    -1,    -1,    19,    -1,    19,    -1,
     113,    94,    -1,   164,    -1,   114,    -1,   115,    -1,   116,
      -1,   117,    -1,   118,    -1,   119,    -1,   120,    -1,   121,
      -1,   126,   125,   111,   140,    95,   137,    -1,   127,   125,
     111,   140,    95,   134,    -1,   128,   125,   111,   140,    95,
     134,    95,   134,    -1,   129,   125,   111,   140,    95,   137,
      95,   137,    -1,   130,   125,   111,   140,    95,   137,    95,
     137,    95,   137,    -1,   131,   143,    -1,   132,   125,   111,
     140,    95,   137,    95,   159,    -1,   133,   125,   111,   140,
      95,   137,    95,   137,    95,   137,    95,   159,    -1,    37,
      -1,    23,    -1,    38,    -1,    -1,    18,    -1,    -1,    22,
      -1,    -1,   122,   123,   124,    -1,    50,    -1,    51,    -1,
      52,    -1,    53,    -1,    54,    -1,    55,    -1,    56,    -1,
      57,    -1,    58,    -1,    59,    -1,    60,    -1,    61,    -1,
      62,    -1,    63,    -1,    64,    -1,    65,    -1,    66,    -1,
      67,    -1,    68,    -1,    69,    -1,    25,    -1,    70,    -1,
      71,    -1,    72,    -1,    73,    -1,    74,    -1,    75,    -1,
      76,    -1,    78,    -1,    80,    -1,    81,    -1,    82,    -1,
      83,    -1,    84,    -1,    86,    -1,    87,    -1,    89,    -1,
      90,    -1,    91,    -1,    92,    -1,    93,    -1,   110,   135,
     110,    -1,   110,   136,   110,    -1,   163,    96,   136,    96,
      -1,   163,   162,   156,    -1,   163,   146,   156,    -1,   110,
     138,   110,    -1,   110,   139,   110,    -1,   163,    96,   139,
      96,    -1,   163,   162,   157,    -1,   163,   146,   157,    -1,
     141,   145,   142,    -1,   149,    -1,   154,    -1,    97,   143,
      98,    -1,    -1,   144,   157,    -1,    42,    -1,    43,    -1,
      44,    -1,    45,    -1,    46,    -1,    47,    -1,    48,    -1,
      49,    -1,    16,    38,    -1,    16,    39,    -1,    16,    38,
      39,    -1,    16,    40,    -1,    16,    38,    40,    -1,    16,
      39,    40,    -1,    16,    38,    39,    40,    -1,    16,    41,
      -1,    16,    38,    41,    -1,    16,    39,    41,    -1,    16,
      38,    39,    41,    -1,    16,    40,    41,    -1,    16,    38,
      40,    41,    -1,    16,    39,    40,    41,    -1,    16,    38,
      39,    40,    41,    -1,    -1,   147,    -1,   149,    -1,    99,
     100,   148,   101,    -1,    32,    -1,    33,    -1,    34,    -1,
      35,    -1,   160,    -1,   152,    -1,   153,    -1,     3,    -1,
       4,    -1,     5,    -1,     6,    -1,     7,    -1,     8,    -1,
       9,    -1,    10,    -1,    11,    -1,    12,    -1,   150,    -1,
     151,   150,    -1,    37,   151,    -1,    37,    18,    -1,    23,
     151,    -1,    23,    18,    -1,   102,   100,   155,   101,    -1,
      29,    -1,    30,    -1,    31,    -1,    16,   158,    -1,    16,
     158,   158,   158,   158,    -1,    16,   158,   158,   158,    -1,
      16,   158,   158,    -1,    16,   158,    -1,    -1,    38,    -1,
      39,    -1,    40,    -1,    41,    -1,   110,   160,   110,    95,
     110,   161,   110,    -1,    91,   151,    -1,    13,    -1,    14,
      -1,    15,    -1,    27,    -1,    28,    -1,    17,    -1,    21,
      -1,    -1,   103,    -1,   104,    -1,    20,   111,   165,   166,
      -1,    21,    -1,    -1,   105,   162,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   375,   375,   375,   378,   379,   381,   383,   387,   390,
     393,   394,   395,   396,   397,   398,   399,   400,   401,   404,
     407,   410,   413,   417,   420,   423,   427,   431,   432,   433,
     434,   438,   439,   442,   443,   446,   450,   451,   452,   453,
     454,   455,   456,   457,   458,   459,   462,   463,   464,   465,
     466,   467,   468,   469,   470,   471,   474,   477,   478,   479,
     480,   481,   482,   483,   484,   485,   486,   487,   488,   489,
     490,   495,   496,   499,   503,   504,   507,   511,   512,   515,
     519,   520,   523,   524,   528,   532,   533,   537,   541,   542,
     546,   547,   550,   553,   554,   555,   556,   557,   558,   559,
     560,   564,   565,   566,   567,   568,   569,   570,   571,   572,
     573,   574,   575,   576,   577,   578,   579,   583,   584,   587,
     591,   592,   593,   594,   595,   598,   598,   602,   603,   604,
     605,   606,   607,   608,   609,   610,   611,   616,   617,   621,
     622,   625,   626,   629,   633,   634,   635,   640,   643,   644,
     645,   646,   646,   650,   651,   652,   653,   656,   659,   664,
     665,   666,   667,   668,   672,   673,   677,   678,   679,   683,
     687,   689,   691
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "_0", "_1", "_2", "_3", "_4", "_5", "_6",
  "_7", "_8", "_9", "_1D", "_2D", "_3D", "DOT", "CONST", "C", "WHITE",
  "DEC", "WORD", "SAT", "H", "END", "POW", "BEG", "CUBE", "RECT", "COLR",
  "COLH", "DEPR", "WPOS", "COL0", "COL1", "FOGC", "F", "R", "X", "Y", "Z",
  "W", "EQ", "GE", "GT", "LE", "LT", "NE", "TR", "FL", "DDX", "DDY", "FLR",
  "FRC", "LIT", "MOV", "PK2H", "PK2US", "PK4B", "PK4UB", "COS", "EXP",
  "LG2", "RCP", "RSQ", "SIN", "UP2H", "UP2US", "UP4B", "UP4UB", "ADD",
  "DP3", "DP4", "DST", "MAX", "MIN", "MUL", "RFL", "SEQ", "SFL", "SGE",
  "SGT", "SLE", "SLT", "SNE", "STR", "SUB", "MAD", "LRP", "X2D", "KIL",
  "TEX", "TXP", "TXD", "';'", "','", "'|'", "'('", "')'", "'f'", "'['",
  "']'", "'o'", "'+'", "'-'", "'='", "$accept", "program", "$@1",
  "instructionSequence", "space", "empty", "instructionStatement",
  "instruction", "VECTORop_instruction", "SCALARop_instruction",
  "BINSCop_instruction", "BINop_instruction", "TRIop_instruction",
  "KILop_instruction", "TEXop_instruction", "TXDop_instruction", "prec",
  "cond", "sat", "pref", "VECTORop", "SCALARop", "BINSCop", "BINop",
  "TRIop", "KILop", "TEXop", "TXDop", "scalarSrc", "absScalarSrc",
  "baseScalarSrc", "vectorSrc", "absVectorSrc", "baseVectorSrc",
  "maskedDstReg", "dstRegister", "optionalCCMask", "ccMask", "ccMaskRule",
  "optionalWriteMask", "srcRegister", "fragAttribReg", "fragAttribRegId",
  "fragTempReg", "NUMBER", "decCalc", "fragF32Reg", "fragF16Reg",
  "fragOutputReg", "fragOutputRegName", "scalarSuffix", "swizzleSuffix",
  "component", "texImageId", "texImageUnit", "texImageTarget",
  "vectorConstant", "negate", "localDeclaration", "namedLocalParameter",
  "optionalLocalValue", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308,   309,   310,   311,   312,   313,   314,
     315,   316,   317,   318,   319,   320,   321,   322,   323,   324,
     325,   326,   327,   328,   329,   330,   331,   332,   333,   334,
     335,   336,   337,   338,   339,   340,   341,   342,   343,   344,
     345,   346,   347,   348,    59,    44,   124,    40,    41,   102,
      91,    93,   111,    43,    45,    61
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   106,   108,   107,   109,   109,   110,   110,   111,   112,
     113,   113,   113,   113,   113,   113,   113,   113,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   122,   122,
     122,   123,   123,   124,   124,   125,   126,   126,   126,   126,
     126,   126,   126,   126,   126,   126,   127,   127,   127,   127,
     127,   127,   127,   127,   127,   127,   128,   129,   129,   129,
     129,   129,   129,   129,   129,   129,   129,   129,   129,   129,
     129,   130,   130,   131,   132,   132,   133,   134,   134,   135,
     136,   136,   137,   137,   138,   139,   139,   140,   141,   141,
     142,   142,   143,   144,   144,   144,   144,   144,   144,   144,
     144,   145,   145,   145,   145,   145,   145,   145,   145,   145,
     145,   145,   145,   145,   145,   145,   145,   146,   146,   147,
     148,   148,   148,   148,   148,   149,   149,   150,   150,   150,
     150,   150,   150,   150,   150,   150,   150,   151,   151,   152,
     152,   153,   153,   154,   155,   155,   155,   156,   157,   157,
     157,   157,   157,   158,   158,   158,   158,   159,   160,   161,
     161,   161,   161,   161,   162,   162,   163,   163,   163,   164,
     165,   166,   166
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     0,     5,     2,     1,     0,     1,     1,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     6,
       6,     8,     8,    10,     2,     8,    12,     1,     1,     1,
       0,     1,     0,     1,     0,     3,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     3,     3,     4,
       3,     3,     3,     3,     4,     3,     3,     3,     1,     1,
       3,     0,     2,     1,     1,     1,     1,     1,     1,     1,
       1,     2,     2,     3,     2,     3,     3,     4,     2,     3,
       3,     4,     3,     4,     4,     5,     0,     1,     1,     4,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     2,     2,
       2,     2,     2,     4,     1,     1,     1,     2,     5,     4,
       3,     2,     0,     1,     1,     1,     1,     7,     2,     1,
       1,     1,     1,     1,     1,     1,     0,     1,     1,     4,
       1,     0,     2
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     6,     0,     7,     0,     1,     0,    56,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    55,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,     2,     5,
       0,    11,    12,    13,    14,    15,    16,    17,    18,    30,
      30,    30,    30,    30,     0,    30,    30,    10,     8,     0,
       0,     4,     9,    28,    27,    29,    32,     0,     0,     0,
       0,     0,    93,    94,    95,    96,    97,    98,    99,   100,
      24,   152,     0,     0,   170,   171,     3,    31,    34,     0,
       0,     0,     0,     0,     0,    92,     0,     0,     0,   169,
      33,    35,     0,     0,     0,     0,   116,    88,   125,   126,
      89,     0,     0,     0,     0,   153,   154,   155,   156,   151,
       0,     0,   164,   165,   172,   127,   128,   129,   130,   131,
     132,   133,   134,   135,   136,   142,   137,   141,   140,   139,
       0,     6,     0,    91,     6,     6,     6,     6,   150,     6,
       6,   138,   144,   145,   146,     0,   166,    19,   101,   102,
     104,   108,     0,    87,   166,    20,     0,     0,     0,   149,
       0,     0,   143,   167,   168,     6,     6,     0,   103,   105,
     109,   106,   110,   112,     0,     6,     6,     0,     6,     6,
       6,   148,     6,     6,    82,    83,   166,     0,   152,   117,
     118,   152,   107,   111,   113,   114,    90,    77,    78,   166,
       0,     0,    21,    22,     0,     0,    25,     0,     0,     0,
       0,    86,    85,   115,     0,     0,     0,    81,    80,     6,
       0,     6,     6,    84,   120,   121,   122,   123,     0,   124,
      79,   147,    23,   158,     0,     0,   119,     6,     6,     0,
      26,   159,   160,   161,   162,   163,     6,   157
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,    70,    48,   166,    69,    49,    50,    51,    52,
      53,    54,    55,    56,    57,    58,    76,    98,   111,    77,
      59,    60,    61,    62,    63,    64,    65,    66,   175,   195,
     196,   167,   185,   186,   115,   116,   173,    90,    91,   153,
     208,   209,   248,   117,   146,   147,   118,   119,   120,   165,
     237,   105,   129,   226,   241,   266,   211,   187,    67,    95,
     109
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -178
static const yytype_int16 yypact[] =
{
       9,    29,    50,  -178,   152,  -178,    35,  -178,  -178,  -178,
    -178,  -178,  -178,  -178,  -178,  -178,  -178,  -178,  -178,  -178,
    -178,  -178,  -178,  -178,  -178,  -178,  -178,  -178,  -178,  -178,
    -178,  -178,  -178,  -178,  -178,  -178,  -178,  -178,  -178,  -178,
    -178,  -178,  -178,  -178,  -178,  -178,  -178,  -178,   152,  -178,
     -38,  -178,  -178,  -178,  -178,  -178,  -178,  -178,  -178,   -10,
     -10,   -10,   -10,   -10,    59,   -10,   -10,  -178,  -178,    58,
      69,  -178,  -178,  -178,  -178,  -178,    77,    35,    35,    35,
      35,    35,  -178,  -178,  -178,  -178,  -178,  -178,  -178,  -178,
    -178,    81,    35,    35,  -178,     4,  -178,  -178,   100,   -17,
     -17,   -17,   -17,   -17,   111,  -178,   -17,   -17,    12,  -178,
    -178,  -178,    62,   109,    26,    39,   148,  -178,  -178,  -178,
    -178,    71,    72,    73,    74,  -178,  -178,  -178,  -178,   111,
      75,    76,  -178,  -178,  -178,  -178,  -178,  -178,  -178,  -178,
    -178,  -178,  -178,  -178,  -178,  -178,  -178,   136,  -178,   136,
      57,    29,   117,    68,    29,    29,    29,    29,   111,    29,
      29,  -178,  -178,  -178,  -178,    78,   -43,  -178,   120,    43,
     132,  -178,    59,  -178,   -43,  -178,    79,    80,    83,   111,
      85,    86,  -178,  -178,  -178,    29,    29,    -7,   122,   135,
    -178,   141,  -178,  -178,    88,    29,    29,     0,    29,    29,
      29,  -178,    29,    29,  -178,  -178,   -43,    87,    81,  -178,
    -178,    81,   142,  -178,  -178,  -178,  -178,  -178,  -178,   -43,
     172,   172,  -178,  -178,    94,    99,  -178,    96,    97,     1,
       7,  -178,  -178,  -178,   102,     1,   111,  -178,  -178,    29,
     136,    29,    29,  -178,  -178,  -178,  -178,  -178,    91,  -178,
    -178,  -178,  -178,   136,   101,   104,  -178,    29,    29,   110,
    -178,  -178,  -178,  -178,  -178,  -178,    29,  -178
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -178,  -178,  -178,  -178,    -1,   -34,   181,  -178,  -178,  -178,
    -178,  -178,  -178,  -178,  -178,  -178,  -178,  -178,  -178,    70,
    -178,  -178,  -178,  -178,  -178,  -178,  -178,  -178,  -136,  -178,
     -19,  -148,  -178,    25,   -25,  -178,  -178,    65,  -178,  -178,
    -171,  -178,  -178,  -172,  -142,  -111,  -178,  -178,  -178,  -178,
      27,  -177,  -126,   -12,    17,  -178,  -107,  -170,  -178,  -178,
    -178
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1
static const yytype_uint16 yytable[] =
{
       4,   134,   149,   158,   197,   161,   112,   161,   177,   178,
     132,   180,   181,    73,   133,   210,   112,   132,   132,   176,
     113,   133,   133,   112,   112,   210,   220,    74,    75,   132,
     113,   231,   179,   133,   232,     1,   229,   113,   113,   244,
     245,   246,   247,    99,   100,   101,   102,   103,     3,   235,
       5,   223,   224,   201,    68,   227,    72,   210,   106,   107,
     183,   184,   222,   210,   220,   135,   136,   137,   138,   139,
     140,   141,   142,   143,   144,   121,   122,   123,   124,    94,
     145,   130,   131,   191,   192,   114,   162,   163,   164,   206,
     221,   252,   207,    96,   255,    97,   219,   104,   240,   207,
     207,    82,    83,    84,    85,    86,    87,    88,    89,   108,
     251,   161,   135,   136,   137,   138,   139,   140,   141,   142,
     143,   144,   110,   261,   262,   263,   150,   148,   221,   253,
      78,    79,    80,    81,   151,    92,    93,   264,   265,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   125,
     126,   127,   128,   174,   174,   168,   169,   170,   171,   188,
     189,   190,   212,   213,   152,   172,   154,   155,   156,   157,
     159,   160,     6,   193,   198,   199,   214,     7,   200,   182,
     202,   203,   215,   233,   204,   205,   216,   230,   236,   239,
     240,   242,   256,   243,   217,   218,   257,   174,   250,   258,
     234,   225,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    71,
      35,   228,    36,    37,    38,    39,    40,   194,    41,    42,
     254,    43,    44,    45,    46,    47,   260,   249,   238,     0,
       0,     0,     0,     0,     0,     0,   259,   225,     0,     0,
       0,     0,     0,     0,     0,   267
};

static const yytype_int16 yycheck[] =
{
       1,   108,   113,   129,   174,   147,    23,   149,   156,   157,
      17,   159,   160,    23,    21,   187,    23,    17,    17,   155,
      37,    21,    21,    23,    23,   197,   197,    37,    38,    17,
      37,   208,   158,    21,   211,    26,   206,    37,    37,    32,
      33,    34,    35,    77,    78,    79,    80,    81,    19,   219,
       0,   199,   200,   179,    19,   203,    94,   229,    92,    93,
     103,   104,   198,   235,   235,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,   100,   101,   102,   103,    21,
      18,   106,   107,    40,    41,   102,    29,    30,    31,    96,
     197,   239,    99,    24,   242,    18,    96,    16,    91,    99,
      99,    42,    43,    44,    45,    46,    47,    48,    49,   105,
     236,   253,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    22,    13,    14,    15,   100,    18,   235,   240,
      60,    61,    62,    63,    95,    65,    66,    27,    28,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    38,
      39,    40,    41,   154,   155,    38,    39,    40,    41,    39,
      40,    41,    40,    41,    16,    97,    95,    95,    95,    95,
      95,    95,    20,    41,    95,    95,    41,    25,    95,   101,
      95,    95,    41,    41,   185,   186,    98,   100,    16,    95,
      91,    95,   101,    96,   195,   196,    95,   198,    96,    95,
     219,   202,    50,    51,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    48,
      78,   206,    80,    81,    82,    83,    84,   172,    86,    87,
     241,    89,    90,    91,    92,    93,   258,   230,   221,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   257,   258,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   266
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    26,   107,    19,   110,     0,    20,    25,    50,    51,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    78,    80,    81,    82,    83,
      84,    86,    87,    89,    90,    91,    92,    93,   109,   112,
     113,   114,   115,   116,   117,   118,   119,   120,   121,   126,
     127,   128,   129,   130,   131,   132,   133,   164,    19,   111,
     108,   112,    94,    23,    37,    38,   122,   125,   125,   125,
     125,   125,    42,    43,    44,    45,    46,    47,    48,    49,
     143,   144,   125,   125,    21,   165,    24,    18,   123,   111,
     111,   111,   111,   111,    16,   157,   111,   111,   105,   166,
      22,   124,    23,    37,   102,   140,   141,   149,   152,   153,
     154,   140,   140,   140,   140,    38,    39,    40,    41,   158,
     140,   140,    17,    21,   162,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    18,   150,   151,    18,   151,
     100,    95,    16,   145,    95,    95,    95,    95,   158,    95,
      95,   150,    29,    30,    31,   155,   110,   137,    38,    39,
      40,    41,    97,   142,   110,   134,   134,   137,   137,   158,
     137,   137,   101,   103,   104,   138,   139,   163,    39,    40,
      41,    40,    41,    41,   143,   135,   136,   163,    95,    95,
      95,   158,    95,    95,   110,   110,    96,    99,   146,   147,
     149,   162,    40,    41,    41,    41,    98,   110,   110,    96,
     146,   162,   134,   137,   137,   110,   159,   137,   139,   163,
     100,   157,   157,    41,   136,   163,    16,   156,   156,    95,
      91,   160,    95,    96,    32,    33,    34,    35,   148,   160,
      96,   158,   137,   151,   110,   137,   101,    95,    95,   110,
     159,    13,    14,    15,    27,    28,   161,   110
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  However,
   YYFAIL appears to be in use.  Nevertheless, it is formally deprecated
   in Bison 2.4.2's NEWS entry, where a plan to phase it out is
   discussed.  */

#define YYFAIL		goto yyerrlab
#if defined YYFAIL
  /* This is here to suppress warnings from the GCC cpp's
     -Wunused-macros.  Normally we don't worry about that warning, but
     some users do, and we want to make it easy for users to remove
     YYFAIL uses, which will produce warnings from Bison 2.5.  */
#endif

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}

/* Prevent warnings from -Wmissing-prototypes.  */
#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */


/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*-------------------------.
| yyparse or yypush_parse.  |
`-------------------------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{


    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.

       Refer to the stacks thru separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yytoken = 0;
  yyss = yyssa;
  yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */
  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss_alloc, yyss);
	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:

/* Line 1464 of yacc.c  */
#line 375 "crc.y"
    { print(); }
    break;

  case 9:

/* Line 1464 of yacc.c  */
#line 390 "crc.y"
    { dump(); clean();}
    break;

  case 27:

/* Line 1464 of yacc.c  */
#line 431 "crc.y"
    { prc( 0 ); }
    break;

  case 28:

/* Line 1464 of yacc.c  */
#line 432 "crc.y"
    { prc( 1 ); }
    break;

  case 29:

/* Line 1464 of yacc.c  */
#line 433 "crc.y"
    { prc( 2 ); }
    break;

  case 30:

/* Line 1464 of yacc.c  */
#line 434 "crc.y"
    { prc( 0 );	}
    break;

  case 31:

/* Line 1464 of yacc.c  */
#line 438 "crc.y"
    { cnd( 1 ); }
    break;

  case 32:

/* Line 1464 of yacc.c  */
#line 439 "crc.y"
    { cnd( 0 ); }
    break;

  case 33:

/* Line 1464 of yacc.c  */
#line 442 "crc.y"
    { sat( 1 ); }
    break;

  case 34:

/* Line 1464 of yacc.c  */
#line 443 "crc.y"
    { sat( 0 ); }
    break;

  case 35:

/* Line 1464 of yacc.c  */
#line 446 "crc.y"
    { type = 0; }
    break;

  case 36:

/* Line 1464 of yacc.c  */
#line 450 "crc.y"
    { opv( NV40_FP_OP_OPCODE_DDX ); }
    break;

  case 37:

/* Line 1464 of yacc.c  */
#line 451 "crc.y"
    { opv( NV40_FP_OP_OPCODE_DDY ); }
    break;

  case 38:

/* Line 1464 of yacc.c  */
#line 452 "crc.y"
    { opv( NV40_FP_OP_OPCODE_FLR ); }
    break;

  case 39:

/* Line 1464 of yacc.c  */
#line 453 "crc.y"
    { opv( NV40_FP_OP_OPCODE_FRC ); }
    break;

  case 40:

/* Line 1464 of yacc.c  */
#line 454 "crc.y"
    { opv( 0xff ); }
    break;

  case 41:

/* Line 1464 of yacc.c  */
#line 455 "crc.y"
    { opv( NV40_FP_OP_OPCODE_MOV ); }
    break;

  case 42:

/* Line 1464 of yacc.c  */
#line 456 "crc.y"
    { opv( NV40_FP_OP_OPCODE_PK2H ); }
    break;

  case 43:

/* Line 1464 of yacc.c  */
#line 457 "crc.y"
    { opv( NV40_FP_OP_OPCODE_PK2US ); }
    break;

  case 44:

/* Line 1464 of yacc.c  */
#line 458 "crc.y"
    { opv( NV40_FP_OP_OPCODE_PK4B ); }
    break;

  case 45:

/* Line 1464 of yacc.c  */
#line 459 "crc.y"
    { opv( NV40_FP_OP_OPCODE_PK4UB ); }
    break;

  case 46:

/* Line 1464 of yacc.c  */
#line 462 "crc.y"
    { opv( NV40_FP_OP_OPCODE_COS ); }
    break;

  case 47:

/* Line 1464 of yacc.c  */
#line 463 "crc.y"
    { opv( NV40_FP_OP_OPCODE_EX2 ); }
    break;

  case 48:

/* Line 1464 of yacc.c  */
#line 464 "crc.y"
    { opv( NV40_FP_OP_OPCODE_LG2 ); }
    break;

  case 49:

/* Line 1464 of yacc.c  */
#line 465 "crc.y"
    { opv( NV40_FP_OP_OPCODE_RCP ); }
    break;

  case 50:

/* Line 1464 of yacc.c  */
#line 466 "crc.y"
    { opv( 0xff ); }
    break;

  case 51:

/* Line 1464 of yacc.c  */
#line 467 "crc.y"
    { opv( NV40_FP_OP_OPCODE_SIN ); }
    break;

  case 52:

/* Line 1464 of yacc.c  */
#line 468 "crc.y"
    { opv( NV40_FP_OP_OPCODE_UP2H ); }
    break;

  case 53:

/* Line 1464 of yacc.c  */
#line 469 "crc.y"
    { opv( NV40_FP_OP_OPCODE_UP2US ); }
    break;

  case 54:

/* Line 1464 of yacc.c  */
#line 470 "crc.y"
    { opv( NV40_FP_OP_OPCODE_UP4B ); }
    break;

  case 55:

/* Line 1464 of yacc.c  */
#line 471 "crc.y"
    { opv( NV40_FP_OP_OPCODE_UP4UB ); }
    break;

  case 57:

/* Line 1464 of yacc.c  */
#line 477 "crc.y"
    { opv( NV40_FP_OP_OPCODE_ADD ); }
    break;

  case 58:

/* Line 1464 of yacc.c  */
#line 478 "crc.y"
    { opv( NV40_FP_OP_OPCODE_DP3 ); }
    break;

  case 59:

/* Line 1464 of yacc.c  */
#line 479 "crc.y"
    { opv( NV40_FP_OP_OPCODE_DP4 ); }
    break;

  case 60:

/* Line 1464 of yacc.c  */
#line 480 "crc.y"
    { opv( NV40_FP_OP_OPCODE_DST ); }
    break;

  case 61:

/* Line 1464 of yacc.c  */
#line 481 "crc.y"
    { opv( NV40_FP_OP_OPCODE_MAX ); }
    break;

  case 62:

/* Line 1464 of yacc.c  */
#line 482 "crc.y"
    { opv( NV40_FP_OP_OPCODE_MIN ); }
    break;

  case 63:

/* Line 1464 of yacc.c  */
#line 483 "crc.y"
    { opv( NV40_FP_OP_OPCODE_MUL ); }
    break;

  case 64:

/* Line 1464 of yacc.c  */
#line 484 "crc.y"
    { opv( NV40_FP_OP_OPCODE_SEQ ); }
    break;

  case 65:

/* Line 1464 of yacc.c  */
#line 485 "crc.y"
    { opv( NV40_FP_OP_OPCODE_SGE ); }
    break;

  case 66:

/* Line 1464 of yacc.c  */
#line 486 "crc.y"
    { opv( NV40_FP_OP_OPCODE_SGT ); }
    break;

  case 67:

/* Line 1464 of yacc.c  */
#line 487 "crc.y"
    { opv( NV40_FP_OP_OPCODE_SLE ); }
    break;

  case 68:

/* Line 1464 of yacc.c  */
#line 488 "crc.y"
    { opv( NV40_FP_OP_OPCODE_SLT ); }
    break;

  case 69:

/* Line 1464 of yacc.c  */
#line 489 "crc.y"
    { opv( NV40_FP_OP_OPCODE_SNE ); }
    break;

  case 70:

/* Line 1464 of yacc.c  */
#line 490 "crc.y"
    { opv( NV40_FP_OP_OPCODE_ADD ); }
    break;

  case 71:

/* Line 1464 of yacc.c  */
#line 495 "crc.y"
    { opv( NV40_FP_OP_OPCODE_MAD ); }
    break;

  case 72:

/* Line 1464 of yacc.c  */
#line 496 "crc.y"
    { opv( 0xff ); }
    break;

  case 73:

/* Line 1464 of yacc.c  */
#line 499 "crc.y"
    { opv( NV40_FP_OP_OPCODE_KIL ); }
    break;

  case 74:

/* Line 1464 of yacc.c  */
#line 503 "crc.y"
    { opv( NV40_FP_OP_OPCODE_TEX ); }
    break;

  case 75:

/* Line 1464 of yacc.c  */
#line 504 "crc.y"
    { opv( NV40_FP_OP_OPCODE_TXP ); }
    break;

  case 76:

/* Line 1464 of yacc.c  */
#line 507 "crc.y"
    { opv( NV40_FP_OP_OPCODE_TXD ); }
    break;

  case 77:

/* Line 1464 of yacc.c  */
#line 511 "crc.y"
    {src_reg( v ); }
    break;

  case 78:

/* Line 1464 of yacc.c  */
#line 512 "crc.y"
    {src_reg( v ); }
    break;

  case 82:

/* Line 1464 of yacc.c  */
#line 523 "crc.y"
    {src_reg( v ); }
    break;

  case 83:

/* Line 1464 of yacc.c  */
#line 524 "crc.y"
    {src_reg( v ); }
    break;

  case 84:

/* Line 1464 of yacc.c  */
#line 528 "crc.y"
    { mod = 1; }
    break;

  case 87:

/* Line 1464 of yacc.c  */
#line 537 "crc.y"
    { out_reg( v );  cnd_swz(); type = 0; h = 0; printf( "\n" ); }
    break;

  case 91:

/* Line 1464 of yacc.c  */
#line 547 "crc.y"
    { cnd_msk( NV40_FP_OP_COND_TR ); }
    break;

  case 93:

/* Line 1464 of yacc.c  */
#line 553 "crc.y"
    { cnd_msk( NV40_FP_OP_COND_EQ ); }
    break;

  case 94:

/* Line 1464 of yacc.c  */
#line 554 "crc.y"
    { cnd_msk( NV40_FP_OP_COND_GE ); }
    break;

  case 95:

/* Line 1464 of yacc.c  */
#line 555 "crc.y"
    { cnd_msk( NV40_FP_OP_COND_GT ); }
    break;

  case 96:

/* Line 1464 of yacc.c  */
#line 556 "crc.y"
    { cnd_msk( NV40_FP_OP_COND_LE ); }
    break;

  case 97:

/* Line 1464 of yacc.c  */
#line 557 "crc.y"
    { cnd_msk( NV40_FP_OP_COND_LT ); }
    break;

  case 98:

/* Line 1464 of yacc.c  */
#line 558 "crc.y"
    { cnd_msk( NV40_FP_OP_COND_NE ); }
    break;

  case 99:

/* Line 1464 of yacc.c  */
#line 559 "crc.y"
    { cnd_msk( NV40_FP_OP_COND_TR ); }
    break;

  case 100:

/* Line 1464 of yacc.c  */
#line 560 "crc.y"
    { cnd_msk( NV40_FP_OP_COND_FL ); }
    break;

  case 101:

/* Line 1464 of yacc.c  */
#line 564 "crc.y"
    { msk( NV40_FP_DEST_MASK( 1, 0, 0, 0 ) ); }
    break;

  case 102:

/* Line 1464 of yacc.c  */
#line 565 "crc.y"
    { msk( NV40_FP_DEST_MASK( 0, 1, 0, 0 ) ); }
    break;

  case 103:

/* Line 1464 of yacc.c  */
#line 566 "crc.y"
    { msk( NV40_FP_DEST_MASK( 1, 1, 0, 0 ) ); }
    break;

  case 104:

/* Line 1464 of yacc.c  */
#line 567 "crc.y"
    { msk( NV40_FP_DEST_MASK( 0, 0, 1, 0 ) ); }
    break;

  case 105:

/* Line 1464 of yacc.c  */
#line 568 "crc.y"
    { msk( NV40_FP_DEST_MASK( 1, 0, 1, 0 ) ); }
    break;

  case 106:

/* Line 1464 of yacc.c  */
#line 569 "crc.y"
    { msk( NV40_FP_DEST_MASK( 0, 1, 1, 0 ) ); }
    break;

  case 107:

/* Line 1464 of yacc.c  */
#line 570 "crc.y"
    { msk( NV40_FP_DEST_MASK( 1, 1, 1, 0 ) ); }
    break;

  case 108:

/* Line 1464 of yacc.c  */
#line 571 "crc.y"
    { msk( NV40_FP_DEST_MASK( 0, 0, 0, 1 ) ); }
    break;

  case 109:

/* Line 1464 of yacc.c  */
#line 572 "crc.y"
    { msk( NV40_FP_DEST_MASK( 1, 0, 0, 1 ) ); }
    break;

  case 110:

/* Line 1464 of yacc.c  */
#line 573 "crc.y"
    { msk( NV40_FP_DEST_MASK( 0, 1, 0, 1 ) ); }
    break;

  case 111:

/* Line 1464 of yacc.c  */
#line 574 "crc.y"
    { msk( NV40_FP_DEST_MASK( 1, 1, 0, 1 ) ); }
    break;

  case 112:

/* Line 1464 of yacc.c  */
#line 575 "crc.y"
    { msk( NV40_FP_DEST_MASK( 0, 0, 1, 1 ) ); }
    break;

  case 113:

/* Line 1464 of yacc.c  */
#line 576 "crc.y"
    { msk( NV40_FP_DEST_MASK( 1, 0, 1, 1 ) ); }
    break;

  case 114:

/* Line 1464 of yacc.c  */
#line 577 "crc.y"
    { msk( NV40_FP_DEST_MASK( 0, 1, 1, 1 ) ); }
    break;

  case 115:

/* Line 1464 of yacc.c  */
#line 578 "crc.y"
    { msk( NV40_FP_DEST_MASK( 1, 1, 1, 1 ) ); }
    break;

  case 116:

/* Line 1464 of yacc.c  */
#line 579 "crc.y"
    { msk( NV40_FP_DEST_MASK( 1, 1, 1, 1 ) ); }
    break;

  case 120:

/* Line 1464 of yacc.c  */
#line 591 "crc.y"
    { set_input( NV40_FP_OP_INPUT_SRC_POSITION ); }
    break;

  case 121:

/* Line 1464 of yacc.c  */
#line 592 "crc.y"
    { set_input( NV40_FP_OP_INPUT_SRC_COL0 ); }
    break;

  case 122:

/* Line 1464 of yacc.c  */
#line 593 "crc.y"
    { set_input( NV40_FP_OP_INPUT_SRC_COL1 ); }
    break;

  case 123:

/* Line 1464 of yacc.c  */
#line 594 "crc.y"
    { set_input( NV40_FP_OP_INPUT_SRC_FOGC ); }
    break;

  case 124:

/* Line 1464 of yacc.c  */
#line 595 "crc.y"
    { set_input( NV40_FP_OP_INPUT_SRC_TC0 + v ); }
    break;

  case 127:

/* Line 1464 of yacc.c  */
#line 602 "crc.y"
    { n = 0; }
    break;

  case 128:

/* Line 1464 of yacc.c  */
#line 603 "crc.y"
    { n = 1; }
    break;

  case 129:

/* Line 1464 of yacc.c  */
#line 604 "crc.y"
    { n = 2; }
    break;

  case 130:

/* Line 1464 of yacc.c  */
#line 605 "crc.y"
    { n = 3; }
    break;

  case 131:

/* Line 1464 of yacc.c  */
#line 606 "crc.y"
    { n = 4; }
    break;

  case 132:

/* Line 1464 of yacc.c  */
#line 607 "crc.y"
    { n = 5; }
    break;

  case 133:

/* Line 1464 of yacc.c  */
#line 608 "crc.y"
    { n = 6; }
    break;

  case 134:

/* Line 1464 of yacc.c  */
#line 609 "crc.y"
    { n = 7; }
    break;

  case 135:

/* Line 1464 of yacc.c  */
#line 610 "crc.y"
    { n = 8; }
    break;

  case 136:

/* Line 1464 of yacc.c  */
#line 611 "crc.y"
    { n = 9; }
    break;

  case 137:

/* Line 1464 of yacc.c  */
#line 616 "crc.y"
    { v = n; }
    break;

  case 138:

/* Line 1464 of yacc.c  */
#line 617 "crc.y"
    { v = v * 10 + n; }
    break;

  case 139:

/* Line 1464 of yacc.c  */
#line 621 "crc.y"
    { h = 0; }
    break;

  case 140:

/* Line 1464 of yacc.c  */
#line 622 "crc.y"
    { h = 0; v = 31; creg = 1; }
    break;

  case 141:

/* Line 1464 of yacc.c  */
#line 625 "crc.y"
    { h = 1; }
    break;

  case 142:

/* Line 1464 of yacc.c  */
#line 626 "crc.y"
    { h = 1; v = 63; creg = 1; }
    break;

  case 144:

/* Line 1464 of yacc.c  */
#line 633 "crc.y"
    { v = 0; h = 0; }
    break;

  case 145:

/* Line 1464 of yacc.c  */
#line 634 "crc.y"
    { v = 0; h = 1; }
    break;

  case 153:

/* Line 1464 of yacc.c  */
#line 650 "crc.y"
    { com( 0 ); }
    break;

  case 154:

/* Line 1464 of yacc.c  */
#line 651 "crc.y"
    { com( 1 ); }
    break;

  case 155:

/* Line 1464 of yacc.c  */
#line 652 "crc.y"
    { com( 2 ); }
    break;

  case 156:

/* Line 1464 of yacc.c  */
#line 653 "crc.y"
    { com( 3 ); }
    break;

  case 157:

/* Line 1464 of yacc.c  */
#line 656 "crc.y"
    { set_tex( v ); }
    break;

  case 164:

/* Line 1464 of yacc.c  */
#line 672 "crc.y"
    { set_cns(); cnst = 1;}
    break;

  case 165:

/* Line 1464 of yacc.c  */
#line 673 "crc.y"
    { set_cns(); cnst = 1;}
    break;

  case 166:

/* Line 1464 of yacc.c  */
#line 677 "crc.y"
    { neg = 0; }
    break;

  case 167:

/* Line 1464 of yacc.c  */
#line 678 "crc.y"
    { neg = 0; }
    break;

  case 168:

/* Line 1464 of yacc.c  */
#line 679 "crc.y"
    { neg = 1; }
    break;



/* Line 1464 of yacc.c  */
#line 2954 "y.tab.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined(yyoverflow) || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}



/* Line 1684 of yacc.c  */
#line 695 "crc.y"


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








