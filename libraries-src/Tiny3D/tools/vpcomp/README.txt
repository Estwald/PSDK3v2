Vertex program compiler for libreality

Preliminary version. It should compile most simple programs.
Based on the information from Nouveau open source NVidia driver
http://nouveau.freedesktop.org/wiki/

Supported:
All scalar and vector opcodes
Branches
Calls (untested)
Parameter passing in constants

Unsupported:
Texture lookup
Address register access (ARL,ARR)
Indirect constant register access
Program relocation (jump & constants relocations)

The assembler parser is quite simplistic, so it might fail to properly compiled
some valid assembler files.

It requires NVidia CG.dll in the same directory (or in path) in order to
compile .cg programs into .rvp (reality vertex program) files.
(Download NVidia CG toolkit from their webpage to get the .dll)

Only the windows version of the toolkit is currently supported.
