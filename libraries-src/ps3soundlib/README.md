PS3 SOUNDLIB
============

PS3 SOUNDLIB is a set of libraries to play PCM voices, MP3 and OGG files, using one SPU (obsolete).

NOTE: this repository will be removed on February 1, 2011 because the changes on PSL1GHT and
the imposibity of the author to create the new environment.

It uses PSL1GHT and install the libraries in PSL1GHT/lib, C Header files
in PSL1GHT/include and SPU module in PSL1GHT/modules to work

- Voices can be in 8 and 16 bits (signed) format, Mono or Stereo.

- Voices can adjust a delay time, left and right volume, and can be one shot, infinite or updated with one callbak 
(to work in double buffer)

Credits
-------

    Hermes         - Author
    HACKERCHANNEL  - PSL1GHT
    Xiph.Org       - OGG support
    mpg123 project - MP3 support

License
-------
    
    It is licensed under GPL v3

Environment
-----------

    spu_soundmodule.bin               -> SPU Module. Frequency converter / mixer of 16 voices

    libspu_sound.a   / spu_soundlib.h -> Sound Voices management

    libaudioplayer.a / audioplayer.h  -> MP3 / Ogg player / decoder

    liboggplayer.a   / audioplayer.h  -> Ogg player / decoder

    libogg.a                          -> Ogg library

    libmpg123.a                       -> MP3 library

NOTE1: spu_soundlib.h and audioplayer.h contain the functions descriptions

NOTE2: spu_sound uses a background thread to work with the SPU

NOTE3: audioplayer uses other background voice to play MP3/OGG files (except when you uses Decode function)

Building
--------

You need the environment variable $PSL1GHT defined

    cd ps3soundlib/libs
    make
    
It makes and install SPU module, libs and includes

Current Status
--------------

It works with one sample (fireworks) :)
