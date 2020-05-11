#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "conv_utf.h"

void dump (void *p, int n);
int isLittleEndian();
unsigned int inverte32 (unsigned int x);
int utf8_32(FILE *arq_entrada, FILE *arq_saida);
int utf32_8(FILE* arq_entrada, FILE* arq_saida);

int main(void)
{	
	FILE* utf8 = fopen("utf8_peq.txt", "rb");
		if (utf8==NULL) {fputs ("erro ao abrir arquivo",stderr); exit (1);}
	FILE* utf32 = fopen("utf32_peq.txt", "rb");
		if (utf32==NULL) {fputs ("erro ao abrir arquivo",stderr); exit (1);}
	FILE* utf8out = fopen("utf8_peq_out.txt", "wb");
		if (utf8out==NULL) {fputs ("erro ao abrir arquivo",stderr); exit (1);}
	FILE* utf32out = fopen("utf32_peq_out.txt", "wb");
		if (utf32out==NULL) {fputs ("erro ao abrir arquivo",stderr); exit (1);}
	

	printf("O processador deste computador e: %s Endian.\n", isLittleEndian() ? "Little" : "Big");
	
	utf8_32(utf8, utf32out);
	utf32_8(utf32, utf8out);
	
	fclose(utf8);
	fclose(utf32);
	return 0;
}
