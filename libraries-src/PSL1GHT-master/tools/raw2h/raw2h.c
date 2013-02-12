/* raw2payload. Convert our raw PPC code into a fancy C header */

#include <stdio.h>
#include <string.h>
#include <sys/stat.h>

static const char header[] = 
	"#pragma once\n\n"
	"#include <stdint.h>\n\n"
	"extern const uint8_t %s[0x%08x];\n";

static const char sheader[] =
	".section \".rodata\",\"a\"\n"
	".globl %s\n"
	"%s:";
  
int main(int argc, char **argv)
{
	char buf[256];
	FILE *fi, *fo;
	int r, k;

	if (argc < 5) {
		fprintf(stderr, "Usage: %s <raw> <c header> <asm file> <array name>\n", argv[0]);
		return 1;
	}

	struct stat st;
	if (stat(argv[1], &st)) {
		perror(argv[1]);
		return 1;
	}

	fi = fopen(argv[1], "rb");
	if (fi == NULL) {
		perror(argv[1]);
		return 1;
	}

	fo = fopen(argv[2], "w");
	if (fo == NULL) {
		perror(argv[2]);
		return 1;
	}
	fprintf(fo, header, argv[4], (unsigned int)st.st_size);
    fprintf(fo, "\n\n");
	fclose(fo);

	fo = fopen(argv[3], "w");
	if (fo == NULL) {
		perror(argv[3]);
		return 1;
	}

	fprintf(fo, sheader, argv[4], argv[4]);

	while ((r = fread(buf, 1, 256, fi)) > 0) {
		for (k = 0; k < r; k++) {
			if (!(k & 0xf))
				fprintf(fo, "\n.byte ");
			fprintf(fo, "0x%.2x%s ", buf[k] & 0xff, ((k != r - 1) && ((k & 0xf) != 0xf)) ? "," : "");
		}
	}

    fprintf(fo, "\n\n");
	fclose(fi);
	fclose(fo);
	return 0;
}
