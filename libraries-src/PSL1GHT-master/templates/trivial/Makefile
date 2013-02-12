#A trivial makefile for your PSL1GHT projects.
#Some variables have default values. These are commented
#out here. The not commented-out is the minimum set you need 
#to define yourself.
#
#
#Name of your project, binary and package. 
#Default - guess from current directory
#TARGET = 

#OFILES is what is linked into your binary
#the object files are made automatically from the corresponding c/cpp files
OFILES=source/main.o

#The CFLAGS are not set by the framework makefiles. These are sound defaults.
CFLAGS=-I$(PS3DEV)/ppu/include -std=gnu99

LDFLAGS=

# Destination where the .pkg is built
BUILDDIR=build

# Put your user data into this directory - all will be added to the .pkg
# add /dev_hdd0/game/$APPID/ to the relative path of the file inside $PKGFILES
# e.g. $PKGFILES/foo.jpg -> /dev_hdd0/game/MY_APP_ID/foo.jpg
PKGFILES=data

# If you want to use dependancy checking, define a directory for .d files
# DEPSDIR=

#Package specific options. Defaults are provided, you can override them here.
#
# The title that appears in XMB. Do not quote.
#TITLE=Sample

# Icon that appears in XMB. Needs to be of certain properties.
#ICON0=file.png

# ID of your application. Also the installation directory
# (/dev_hdd0/game/$APPID/)
# note: if APPID is of wrong format, the PS3 modifies the install directory!
#APPID = DEFAULT1

# Include psl1ght boilerplate makefiles
include $(PSL1GHT)/ppu_rules

# Targets to make.
#Installation package
pkg: $(TARGET).pkg

#Run with ps3load (requires supporting application on the ps3)
run:
	ps3load $(TARGET).self

clean:
	rm -rf $(TARGET)*.pkg $(TARGET)*.self $(BUILDDIR)

