.PHONY: all clean

all:
	$(MAKE) -C spu_soundlib
	$(MAKE) -C libogg-1.2.1
	$(MAKE) -C libmpg123
	$(MAKE) -C audioplayerlib
	$(MAKE) -C libmodplay
	$(MAKE) -C spu_soundmodule

install:
	$(MAKE) install -C spu_soundlib
	$(MAKE) install -C libogg-1.2.1
	$(MAKE) install -C libmpg123
	$(MAKE) install -C audioplayerlib
	$(MAKE) install -C libmodplay
	$(MAKE) install -C spu_soundmodule

clean:
	$(MAKE) clean -C spu_soundlib
	$(MAKE) clean -C libogg-1.2.1
	$(MAKE) clean -C libmpg123
	$(MAKE) clean -C audioplayerlib
	$(MAKE) clean -C libmodplay
	$(MAKE) clean -C spu_soundmodule
