/* Júlio Necyk Cavalcanti Maia		1710430 3WB */
/* Jam Ajna Soares			1013109 3WB */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "conv_utf.h"

void dump (void *p, int n)
{
	unsigned char *p1 = p;
	while (n--)
	{
		printf("%p - %02X\n", p1, *p1);
		p1++;
	}

}

int isLittleEndian()
{
	int b = 1;
	
	return *(char*)&b;	
}

unsigned int inverte32 (unsigned int x)
{
		//printf("01-D:\n");
	unsigned char d = x>>24;
		//dump (&d, sizeof(d));
		//printf("---\n02-C:\n");
	unsigned char c = (x>>16)&0xFF;
		//dump (&c, sizeof(c));
		//printf("---\n03-B:\n");
	unsigned char b = (x>>8)&0xFF;
		//dump (&b, sizeof(b));
		//printf("---\n04-A:\n");
	unsigned char a = x&0xFF;
		//dump (&a, sizeof(a));
	
		/*printf("\nX:\n");
	
		dump (&x, sizeof(x));
		unsigned int y = (a<<24) + (b<<16) + (c<<8) + d;
		printf("\nY:\n");
		dump (&y, sizeof(y));*/
	
	return (a<<24) + (b<<16) + (c<<8) + d;
}

int contaBits(char s){
	int i = 0;
	char temp = s;
	while(temp & 0x80){
		temp=temp << 1;
		i++;
	}
	return i;
}


int utf8_32(FILE *arq_entrada, FILE *arq_saida){
	char c;
	unsigned int temp;
	unsigned int carac32;
	int i;
	long lSize;
	char* buffer;
	int bom;
	int insBom;	
	
	if (arq_entrada==NULL || arq_saida==NULL){
		fputs ("erro de leitura de arquivo.", stderr);
		return -1;
	}
	bom=isLittleEndian();
	if (bom==1)
		insBom=0xFFFE0000;
	else
		insBom=0x0000FEFF;
	i=contaBits(c);
	
	// determina tamanho dos arquivos
	fseek (arq_entrada , 0, SEEK_END);
	lSize = ftell (arq_entrada);
		printf("O tamanho de lSize eh: %ld\n", lSize);
  	rewind (arq_entrada);
  	
  	// aloca memória para conter todo o arquivo
  	buffer = (char*) malloc (sizeof(char)*lSize);
  		if (buffer == NULL) {fputs ("erro de memória.", stderr); exit (2);}

   	// insere texto do arquivo no *buffer
	fread(buffer, 1, lSize, arq_entrada);
		printf("O tamanho de buffer eh: %ld\n", strlen(buffer));
		
	//print e comparação com dump
	printf("%s\n\n", buffer);
  	dump (&buffer[0], lSize);
  	printf("---\n\n");




	free(buffer);
	return 0;	
}

int utf32_8(FILE* arq_entrada, FILE* arq_saida)
{
	long lSize;
	char* buffer;
	char ordenacao;
	unsigned int BOM = 0;
	
	if (arq_entrada==NULL || arq_saida==NULL)
	{
		fputs ("erro de leitura de arquivo.", stderr);
		return -1;
	}
	
		// LEITURA
	// determina tamanho dos arquivos
	fseek (arq_entrada, 0, SEEK_END);
	lSize = ftell (arq_entrada);
		printf("O tamanho de lSize eh: %ld\n", lSize);
  	rewind (arq_entrada);
  	
  	// aloca memória para conter todo o arquivo
  	buffer = (char*) malloc (sizeof(char)*lSize);
  		if (buffer == NULL) {fputs ("erro de memória.", stderr); exit (2);}
  		
  	ordenacao = isLittleEndian();
  		//printf("Little Endian: %d\n", ordenacao); 
  		
  	// avalia BOM
  	if (fread(&BOM, 4, 1, arq_entrada))
  	{
  			//printf("BOM: %02X\n", BOM);
		if (ordenacao)
			BOM=inverte32(BOM);
			
			//printf("BOM: %02X\n", BOM); 
			
		if (BOM != 0xFFFE0000)
		{
			fputs ("erro de leitura de arquivo. (BOM)", stderr);
			return -1;
		}
		rewind (arq_entrada);
	}
			
  	
  	// insere texto do arquivo no buffer	
	fread(buffer, 4, lSize/4, arq_entrada);
	printf("O tamanho de buffer2 eh: %ld\n", lSize);
	
	//print e comparação com dump
	int i;
	for (i = 0; i < lSize; i++)
		printf("%c", buffer[i]);
	printf("\n\n");			
	dump (&buffer[0], lSize);
	printf("---\n");
	
	
	
	
	
	
	free(buffer);
	return 0;
}