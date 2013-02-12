%{
#include <stdio.h>
#include "y.tab.h"

//MARK ARL MOV LIT COM RCP RSQ EXP LOG MUL ADD DP3 DP4 DST MIN MAX SLT SGE MAD DOT X Y Z W  OPOS WGHT NRML COL0 COL1 FOGC TEX0 TEX1 TEX2 TEX3 TEX4 TEX5 TEX6 TEX7 ADDREG R HPOS BFC0 BFC1 FOGC PSIZ


extern float f[256];


void lex( const char *s )
{   

    int v_ptr = 0;
    f[0] = 0.0f;
    f[1] = 0.0f;
    f[2] = 0.0f;
    f[3] = 0.0f;


    while( 1 )
    {
        char v = *s;
        if( v == 0 || v == '}' || v_ptr == 4 )
        {
            break;
        }
        if( v == '{' || v == ' ' || v == ',' || v == '\t' )
        {
            ++s;
        }
        else
        {
            int symbols = 0;
            sscanf( s, "%f%n", &f[v_ptr], &symbols );
            if( symbols == 0 )
            {
                break;
            }
            v_ptr++;
            if( v_ptr == 4 )
            {
                break;
            }
            s += symbols;
        }
    }

};


%}

_0 _1 _2 _3 _4 _5 _6 _7 _8 _9 _1D _2D _3D DOT CONST WHITE WORD DEC SAT CUBE RECT COLR COLH DEPR WPOS COL0 COL1 FOGC F R H X Y Z W GE GT LE LT NE TR FL DDX DDY FLR FRC LIT MOV PK2H PK2US PK4B PK4UB BEG END COS EXP LG2 RCP RSQ SIN UP2H UP2US UP4B UP4UB POW ADD DP3 DP4 DST MAX MIN MUL RFL SEQ SFL SGE SGT SLE  SLT  SNE STR SUB MAD LRP  X2D KIL TEX TXP TXD

%%

DECLARE         return DEC;

F           return F;
R                       return R;
H                       return H;
X                       return X;
Y                       return Y;
Z                       return Z;
W                       return W;
C                       return C;


r                       return R;
h                       return H;
x                       return X;
y                       return Y;
z                       return Z;
w                       return W;
c                       return C;


WPOS                    return WPOS; 
COL0                    return COL0;
COL1                    return COL1;
FOGC                    return FOGC;


1D                      return _1D;
2D                      return _2D;
3D                      return _3D;
CUBE                    return CUBE;
RECT                    return RECT;


0           return _0;
1           return _1;
2           return _2;
3           return _3;
4           return _4;
5           return _5;
6           return _6;
7           return _7;
8           return _8;
9           return _9;


"!!FP1.0"               return BEG;

"END"                   return END;
";"                     return ';';
","                     return ',';
[.]                     return DOT;
"o"                     return 'o';
"f"                     return 'f';
"v"                     return 'v';
"["                     return '[';
"]"                     return ']';

"("                     return '(';
")"                     return ')';

"|"                     return '|';
"="                     return '=';


"_SAT"                  return SAT;


"DDX"                   return DDX;
"DDY"                   return DDY;
"FLR"                   return FLR;
"FRC"                   return FRC;
"LIT"                   return LIT;
"MOV"                   return MOV;
"PK2H"                  return PK2H;
"PK2US"                 return PK2US;
"PK4B"                  return PK4B;
"PK4UB"                 return PK4UB;

"COS"                   return COS;
"EXP"                   return EXP;
"LG2"                   return LG2;
"RCP"                   return RCP;
"RSQ"                   return RSQ;
"SIN"                   return SIN;
"UP2H"                  return UP2H;
"UP2US"                 return UP2US;
"UP4B"                  return UP4B;
"UP4UB"                 return UP4UB;

"POW"                   return POW;

"ADD"           return ADD; 
"DP3"                   return DP3;
"DP4"                   return DP4;
"DST"                   return DST;
"MAX"                   return MAX;
"MIN"                   return MIN;
"MUL"                   return MUL;
"RFL"                   return RFL;
"SEQ"                   return SEQ;
"SFL"                   return SFL;
"SGE"                   return SGE;
"SGT"                   return SGT;
"SLE"                   return SLE;
"SLT"                   return SLT;
"SNE"                   return SNE;
"STR"                   return STR;
"SUB"                   return SUB;

"MAD"           return MAD;
"LRP"                   return LRP;
"X2D"                   return X2D;

"KIL"                   return KIL; 
TEX                     return TEX;
"TXP"                   return TXP;
"TXD"                   return TXD;

"GE"                    return GE; 
"GT"                    return GT;
"LE"                    return LE;
"LT"                    return LT;
"NE"                    return NE;
"TR"                    return TR;
"FL"                    return FL;
"EQ"                    return EQ;



"COLR"                  return COLR; 
"COLH"                  return COLH;
"DEPR"                  return DEPR;


\n                      ;
[ \t]+                  return WHITE;


[_][a-zA-Z][a-zA-Z0-9]*   return WORD;

[{][ \t.,\-\+0-9]*[}]      printf( "const %s \n", yytext ); lex( yytext );    return CONST;

%%
