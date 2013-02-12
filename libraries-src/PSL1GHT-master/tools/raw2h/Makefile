TARGET		:= raw2h
SOURCE		:= .

CFLAGS		:= -O2 -Wall --std=gnu99

CC			:= gcc

CFILES		:= $(foreach dir,$(SOURCE),$(notdir $(wildcard $(dir)/*.c)))

all: $(TARGET)

clean:
	rm -rf $(TARGET)

install: all
	@cp $(TARGET) $(PS3DEV)/ppu/bin/

$(TARGET): $(CFILES)
	$(CC) $(CFLAGS) $< -o $@
