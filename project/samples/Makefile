
.PHONY: all pkg clean

FTINCLUDE	:= $(PS3DEV)/portlibs/ppu/include/freetype/freetype.h
ZIPINCLUDE	:= $(PS3DEV)/portlibs/ppu/include/zip.h

all:
	
	$(MAKE) -C spheres3D
	$(MAKE) -C sprites2D
	$(MAKE) -C fonts
	$(MAKE) -C surfaces
	@if test -e $(FTINCLUDE); then $(MAKE) -C fonts_from_ttf; fi
	$(MAKE) -C yuv
	$(MAKE) -C tiny3d_lists
	$(MAKE) -C userviewport
	$(MAKE) -C fireworks3D
pkg:
	$(MAKE) pkg -C spheres3D
	$(MAKE) pkg -C sprites2D
	$(MAKE) pkg -C fonts
	$(MAKE) pkg -C surfaces
	@if test -e $(FTINCLUDE); then $(MAKE) pkg -C fonts_from_ttf; fi
	$(MAKE) pkg -C yuv
	$(MAKE) pkg -C tiny3d_lists
	$(MAKE) pkg -C userviewport
	$(MAKE) pkg -C fireworks3D

clean:
	$(MAKE) clean -C spheres3D
	$(MAKE) clean -C sprites2D
	$(MAKE) clean -C fonts
	$(MAKE) clean -C surfaces
	@if test -e $(FTINCLUDE); then $(MAKE) clean -C fonts_from_ttf; fi
	$(MAKE) clean -C yuv
	$(MAKE) clean -C tiny3d_lists
	$(MAKE) clean -C userviewport
	$(MAKE) clean -C fireworks3D


