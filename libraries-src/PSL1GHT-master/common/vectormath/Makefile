#---------------------------------------------------------------------------------
# Clear the implicit built in rules
#---------------------------------------------------------------------------------
.SUFFIXES:
#---------------------------------------------------------------------------------

all:

install:
	@$(MAKE) -C ppu install --no-print-directory
	@$(MAKE) -C spu install --no-print-directory

clean:
	@echo clean ...

.PHONY: all clean install
