#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "conv_utf.h"

int ordByBOM();

int main(void)
{	
	FILE* utf8;
	FILE* utf32;
	long lSize;
	long lSize2;
	char* buffer;
	char* buffer2;
	
	// abre arquivos
	utf8 = fopen("utf8_peq.txt", "rb");
		if (utf8==NULL) {fputs ("File error",stderr); exit (1);}

	utf32 = fopen("utf32_peq.txt", "rb");
		if (utf32==NULL) {fputs ("File error",stderr); exit (1);}
	
	// determina tamanho dos arquivos
	fseek (utf8 , 0, SEEK_END);
	lSize = ftell (utf8);
		printf("O tamanho de lSize eh: %ld\n", lSize);
  	rewind (utf8);
  	
  	fseek (utf32 , 0, SEEK_END);
	lSize2 = ftell (utf32);
		printf("O tamanho de lSize2 eh: %ld\n", lSize2);
  	rewind (utf32);
  	
  	// aloca memória para conter todo o arquivo
  	buffer = (char*) malloc (sizeof(char)*lSize);
  		if (buffer == NULL) {fputs ("Memory error",stderr); exit (2);}
	
	buffer2 = (char*) malloc (sizeof(char)*lSize2);
  		if (buffer2 == NULL) {fputs ("Memory error",stderr); exit (2);}


   
	fread(buffer, 1, lSize, utf8);
		printf("O tamanho de buffer eh: %ld\n", strlen(buffer));
		printf("%s\n", buffer);
	fread(buffer2, 4, lSize2, utf32);
		printf("O tamanho de buffer2 eh: %ld\n", strlen(buffer2+4));
		printf("%s\n", buffer2+4);
	
	printf("O processador deste computador e: %s Endian.\n", ordByBOM() ? "Little" : "Big");
	
	
	//utf8_32(utf8, utf32);
	//utf32_8(utf32, utf8);
	
	
	fclose(utf8);
	fclose(utf32);
	return 0;
}
