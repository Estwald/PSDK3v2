/* A Bison parser, made by GNU Bison 2.4.2.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
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

extern YYSTYPE yylval;


