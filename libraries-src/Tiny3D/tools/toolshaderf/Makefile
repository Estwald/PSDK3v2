TARGET=fp.exe
all: crc.l crc.y
	yacc -d crc.y
	flex crc.l
	gcc lex.yy.c y.tab.c -o $(TARGET)
