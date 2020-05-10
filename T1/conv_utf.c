/* Júlio Necyk Cavalcanti Maia		1710430 3WB */
/* Jam Ajna Soares			1013109 3WB */

#include <stdio.h>
//#include <stdlib.h>
#include "conv_utf.h"

/*void dump (void *p, int n)
{
	unsigned char *p1 = p;
	while (n--)
	{
		printf("%p - %02x\n", p1, *p1);
		p1++;
	}

}*/

/**********************************************************************
* Determina através BOM se a ordenação é Little Endian ou Big Endian *
* return 1 -> Little						    *
* return 0 -> Big						   * 
******************************************************************/
int ordByBOM()
{
	unsigned int b = 1;
	
	/*(dump(&b, sizeof(b));
	b = b<<24;
	dump(&b, sizeof(b));*/
	
	return b<<24;	
}

/*
int trocaBigLit (unsigned int x) {
	return (x>>24) | ((x>>8) & 0xFF00) | ((x<<8) & 0xFF0000) | (x<<24);
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
	if (arq_entrada==NULL || arq_saida==NULL){
		printf("Erro de leitura do arquivo\n");
		return -1;
	}


	
}

int utf32_8(FILE *arq_entrada, FILE *arq_saida){
}*/
