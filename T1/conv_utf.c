/* Júlio Necyk Cavalcanti Maia		1710430 3WB */
/* Jam Ajna Soares			1013109 3WB */

#include <stdio.h>
//#include <stdlib.h>
#include "conv_utf.h"

char isLittleEndian()
{
	int b = 1;
	
	return *(char*)&b;	
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
	int bom;
	int insBom;	
	if (arq_entrada==NULL || arq_saida==NULL){
		printf("Erro de leitura do arquivo\n");
		return -1;
	}
	bom=isLittleEndian();
	if (bom==1)
		insBom=0xFFFE0000;
	else
		insBom=0x0000FEFF;
	i=contaBits(c);

	
}

int utf32_8(FILE *arq_entrada, FILE *arq_saida){
}*/
