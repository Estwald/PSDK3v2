#---------------------------------------------------------------------------------
# Clear the implicit built in rules
#---------------------------------------------------------------------------------
.SUFFIXES:
#---------------------------------------------------------------------------------

ifeq ($(strip $(PSL1GHT)),)
$(error "Please set PSL1GHT in your environment. export PSL1GHT=<path>")
endif

include	$(PSL1GHT)/ppu_rules

BUILD		:=	build

#---------------------------------------------------------------------------------
ifeq ($(strip $(PLATFORM)),)
#---------------------------------------------------------------------------------
export BASEDIR		:= $(CURDIR)
export DEPS			:= $(BASEDIR)/deps
export LIBS			:=	$(BASEDIR)/lib

#---------------------------------------------------------------------------------
else
#---------------------------------------------------------------------------------

export LIBDIR		:= $(LIBS)/$(PLATFORM)
export DEPSDIR		:=	$(DEPS)/$(PLATFORM)

#---------------------------------------------------------------------------------
endif
#---------------------------------------------------------------------------------

DEPSDIR		 = .
DEFINCS		:= -I$(BASEDIR) -I$(PSL1GHT)/ppu/include
INCLUDES	:= $(DEFINCS) 

MACHDEP		:= -DBIGENDIAN 
CFLAGS		+= -O2 -Wall $(MACHDEP) -fno-strict-aliasing $(INCLUDES)

LIBOGG		:=  vorbisfile.o mdct.o block.o  window.o \
		synthesis.o info.o barkmel.o bitrate.o envelope.o lookup.o lpc.o lsp.o psy.o tone.o \
		floor1.o floor0.o vorbisenc.o smallft.o\
		res0.o  mapping0.o registry.o codebook.o sharedbook.o\
		bitwise.o  framing.o mdct.o synthesis.o

$(BUILD):  libogg.a

#---------------------------------------------------------------------------------
libogg.a: $(LIBOGG)
#---------------------------------------------------------------------------------
	@echo "[AR]  $(notdir $@)"
	@$(AR) -rcs $@ $^

#---------------------------------------------------------------------------------
install: libogg.a 
#---------------------------------------------------------------------------------
	@echo "[CP]  libogg.a"
	@cp -f libogg.a $(PORTLIBS)/lib/
	@echo "[MKDIR] include/ogg"
	@mkdir -p  $(PORTLIBS)/include/ogg
	@echo "[CP]  include/ogg"
	@cp -f ogg/*.h $(PORTLIBS)/include/ogg/
	@echo "[MKDIR] include/vorbis"
	@mkdir -p  $(PORTLIBS)/include/vorbis
	@echo "[CP]  include/vorbis"
	@cp -f vorbis/*.h $(PORTLIBS)/include/vorbis/
	@rm -f *.d
	@rm -f *.o
	@rm -f *.a

#---------------------------------------------------------------------------------
clean:
#---------------------------------------------------------------------------------
	rm -f *.d
	rm -f *.o
	rm -f *.a
