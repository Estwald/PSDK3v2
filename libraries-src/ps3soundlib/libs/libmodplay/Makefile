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
DEFINCS		:= -I$(BASEDIR) -I$(BASEDIR)/../spu_soundlib -I$(PSL1GHT)/ppu/include
INCLUDES	:= $(DEFINCS) 

MACHDEP		:= -DBIGENDIAN 
CFLAGS		+= -O2 -Wall $(MACHDEP) -fno-strict-aliasing $(INCLUDES) -DPS3SOUNDLIB

.PHONY: $(BUILD) clean

SOUNDMODLIB	:=  modplay.o gcmodplay.o freqtab.o mixer.o semitonetab.o

%.o: %.c
	@echo "[CC]  $(notdir $<)"
	@$(CC) $(DEPSOPTIONS) -DUSE_MP3 $(CFLAGS) $(INCLUDES) -c $< -o $@


#---------------------------------------------------------------------------------
libmod.a: $(SOUNDMODLIB)
#---------------------------------------------------------------------------------

	@echo "[AR]  $(notdir $@)"
	@$(AR) -rcs $@ $^

#---------------------------------------------------------------------------------
install: libmod.a
#---------------------------------------------------------------------------------
	@echo "[CP]  $(notdir $@)"
	@cp -f  libmod.a $(PORTLIBS)/lib/
	@cp -f  modplay.h $(PORTLIBS)/include/
	@cp -f  gcmodplay.h $(PORTLIBS)/include/
	@rm -f *.d
	@rm -f $(SOUNDMODLIB)
	@rm -f *.a

#---------------------------------------------------------------------------------
clean:
#---------------------------------------------------------------------------------
	
	rm -f *.d
	rm -f *.o
	rm -f *.a

