all:
	@$(MAKE) -C ppu --no-print-directory
	@$(MAKE) -C spu --no-print-directory

install:
	@$(MAKE) -C ppu install --no-print-directory
	@$(MAKE) -C spu install --no-print-directory

clean:
	@$(MAKE) -C ppu clean --no-print-directory
	@$(MAKE) -C spu clean --no-print-directory

.PHONY: all clean install
