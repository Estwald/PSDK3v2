/* src/config.h.in.  Generated from configure.ac by autoheader.  */

#ifndef CONFIG_H
#define CONFIG_H

/* src/config.h.  Generated from config.h.in by configure.  */
/* src/config.h.in.  Generated from configure.ac by autoheader.  */

/* Define if .align takes 3 for alignment of 2^3=8 bytes instead of 8. */
/* #undef ASMALIGN_EXP */


#define CCALIGN 1

#define OPT_GENERIC 1
//#define OPT_MULTI 1
/* Define if debugging is enabled. */
/* #undef DEBUG */

/* Define if building with dynamcally linked libmpg123 */
//#define DYNAMIC_BUILD 1


/* Define if gapless is enabled. */
#define GAPLESS 1


/* Define to 1 if you have the <inttypes.h> header file. */
//#define HAVE_INTTYPES_H 1

/* Define to 1 if you have the `m' library (-lm). */
#define HAVE_LIBM 1

/* Define to 1 if you have the `mx' library (-lmx). */
/* #undef HAVE_LIBMX */

/* Define to 1 if you have the <limits.h> header file. */
#define HAVE_LIMITS_H 1



/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdio.h> header file. */
#define HAVE_STDIO_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the `strerror' function. */
#define HAVE_STRERROR 1

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1


/* Define to 1 if you have the <sys/time.h> header file. */
#define HAVE_SYS_TIME_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
//#define HAVE_SYS_TYPES_H 1



/* Define to 1 if you have the <unistd.h> header file. */
//#define HAVE_UNISTD_H 1


/* size of the frame index seek table */
#define INDEX_SIZE 1000

/* Name of package */
#define PACKAGE "mpg123"

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "mpg123-devel@lists.sourceforge.net"

/* Define to the full name of this package. */
#define PACKAGE_NAME "mpg123"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "mpg123 1.1.0"

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "mpg123"

/* Define to the version of this package. */
#define PACKAGE_VERSION "1.1.0"

/* Path to installed modules */
#define PKGLIBDIR "/usr/lib/mpg123"


/* Define to 1 if you have the ANSI C header files. */
//#define STDC_HEADERS 1

/* Version number of package */
#define VERSION "1.1.0"

/* Define to empty if `const' does not conform to ANSI C. */
/* #undef const */

/* Define to `__inline__' or `__inline' if that's what the C compiler
   calls it, or to nothing if 'inline' is not supported under any name.  */
#ifndef __cplusplus
 #undef inline 
#endif


//#define REAL_IS_FIXED 1
#define REAL_IS_FLOAT 1
//#define REAL_IS_DOUBLE 1
//#define REAL_IS_LONG_DOUBLE 1

#endif
