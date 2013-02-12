NVIDIA= /cygdrive/c/Cg

CFLAGS += -Wall -Os -g -pipe -I../../include/rsx -I$(NVIDIA)/include
LDFLAGS += -lstdc++

UNAME := $(shell uname -s)

ifeq ($(UNAME),Darwin)
LDFLAGS += /Library/Frameworks/Cg.framework/Cg
endif

ifeq ($(UNAME),Linux)
LDFLAGS += -lCg -lpthread -static
endif
LDFLAGS += $(NVIDIA)/lib/cg.lib -lpthread

CC = $(PREFIX)gcc
STRIP = $(PREFIX)strip

BIN = vpcomp$(BIN_EXT)

OBJS = main.o microcode.o parameters.o vpasm.o

all: $(BIN)

clean:
	@rm -f *.o core core.* $(BIN)

strip: all
	$(STRIP) $(BIN)

install: strip
	install -m 755 $(BIN) $(DEVKITPPC)/bin

$(BIN): $(OBJS)
	$(CC) $^ $(CFLAGS) $(LDFLAGS) -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@


osx:
	$(MAKE) clean
	PREFIX=/opt/toolchains/powerpc-apple-darwin8-10.2/bin/ppc-apple-darwin8- CFLAGS=-fabi-version=1 $(MAKE) strip
	cp $(BIN) $(BIN)_ppc
	$(MAKE) clean
	PREFIX=/opt/toolchains/i686-apple-darwin9-10.4/bin/i686-apple-darwin9- $(MAKE) strip
	cp $(BIN) $(BIN)_intel
	$(MAKE) clean
	/opt/toolchains/i686-apple-darwin9-10.4/bin/i686-apple-darwin9-lipo -create $(BIN)_ppc $(BIN)_intel -output $(BIN)
	rm $(BIN)_ppc $(BIN)_intel
