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
	char temp;
	unsigned int carac32;
	int i;
	//long lSize;
	//char* buffer;
	unsigned int aux;
	int bom;
	int insBom;	
	
	if (arq_entrada==NULL || arq_saida==NULL)
	{
		printf("erro de leitura de arquivo.");
		return -1;
	}
	bom=isLittleEndian();
	
	if (bom==1)
		insBom=0xFFFE0000;
		
	else
		insBom=0x0000FEFF;
	
	fwrite(&insBom,sizeof(int),1,arq_saida);
	
	while(fread(&temp,1,1,arq_entrada)==1){
		carac32=0;		
		i=contaBits(temp);		
		
		if (i==0)				
			temp= temp | carac32;		
		else{
			temp=temp<<(i+1);
			temp=temp>>(i+1);
			
			aux=(unsigned int)temp;
			carac32=carac32 |aux;
       			
			for(;i!=0;--i){
                		temp = fread(&temp,1,1,arq_entrada);
                		temp = temp << 2;

                		aux = (unsigned int)temp;
                		aux = aux << 24;
                		aux = aux >> 24;
                
               		 	carac32 = carac32 << 8;
                		carac32 = carac32 | aux;
                		carac32 = carac32 >> 2; 
            		}

		}
		fwrite(&temp,sizeof(int),1,arq_saida);	
	}
	dump(&temp,sizeof(int));
	return 0;
	/*
	// determina tamanho dos arquivos
	fseek (arq_entrada , 0, SEEK_END);
	lSize = ftell (arq_entrada);
		printf("O tamanho de lSize eh: %ld\n", lSize);
  	rewind (arq_entrada);
  	
  	// aloca memória para conter todo o arquivo
  	buffer = (char*) malloc (sizeof(char)*lSize);
  		if (buffer == NULL) {fputs ("erro de memória.", stderr); exit (2);}

   	// insere texto do arquivo no buffer
	fread(buffer, 1, lSize, arq_entrada);
		printf("O tamanho de buffer eh: %ld\n", strlen(buffer));
		
	//print e comparação com dump
	printf("%s\n\n", buffer);
  	dump (&buffer[0], lSize);
  	printf("---\n\n");

	*/


	//free(buffer);
	//return 0;	
}

int utf32_8(FILE* arq_entrada, FILE* arq_saida)
{
	long lSize;
	int* bufferRead;
	int* bufferWrite;
	char ordenacao;
	unsigned int BOM = 0;
	//int qtdBitsSig = 0;
	//int N = 24;
	//char bitBuffer[24];
	//ic* bufferUnion;
	//char hexTemp[];
	
	if (arq_entrada==NULL || arq_saida==NULL)
	{
		fputs ("erro de leitura de arquivo.", stderr);
		return -1;
	}
	
		// LEITURA
	// determina tamanho do arquivo de entrada
	fseek (arq_entrada, 0, SEEK_END);
	lSize = ftell (arq_entrada);
		printf("O tamanho de lSize eh: %ld\n", lSize);
  	rewind (arq_entrada);
  	
  	// aloca memória para conter todo o arquivo
  	bufferRead = (int*) malloc (sizeof(int)*lSize);
  		if (bufferRead == NULL) {fputs ("erro de memória.", stderr); exit (2);}
  	bufferWrite = (int*) malloc ((sizeof(int)*lSize)-4);
  		if (bufferWrite == NULL) {fputs ("erro de memória.", stderr); exit (2);}	
  	/*bufferUnion = (ic*) malloc (sizeof(ic)*lSize);
  		if (bufferUnion == NULL) {fputs ("erro de memória.", stderr); exit (2);}*/
  		
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
			{fputs ("BOM inválido.", stderr); return -1;}
			
		rewind (arq_entrada);
	}
			
  	
  	// insere BOM+ texto do arquivo no buffer	
	fread(bufferRead, 4, lSize, arq_entrada);
	printf("O tamanho de buffer eh: %ld bytes\n", lSize);
	
	//print e comparação com dump
	int i;
	for (i = 0; i < lSize/4; i++)
		printf("%c", bufferRead[i]);
		printf("\n\n");
		
		printf("int* buffer:\n");		
	for (i = 0; i < lSize/4; i++)
		printf("%08X|", bufferRead[i]);
		
		//dump (&buffer[0], lSize);
		printf("\n\n");
	
	
	for (i = 1; i < (lSize/4); i++)
	{
		if (ordenacao) // se Little Endian
			bufferWrite[i-1] = inverte32(bufferRead[i]); // tranfere texto sem BOM
			
			//buffer[0] = inverte32(buffer[1])
			//buffer[1] = inverte32(buffer[2])
			//buffer[2] = inverte32(buffer[3])
			//for (j = 0; j < 4; j++)
			//bufferUnion[i-1].i = buffer[i]; 
	}		
			
	printf("inverso int* buffer (sem BOM):\n");
	for (i = 0; i < (lSize/4)-1; i++)
		printf("%02X|", bufferWrite[i]);
		printf("\n\n");
		
	printf("dump - tamanho do buffer: %ld\n", lSize-4);
	dump (&bufferWrite[0], lSize-4);
		
	/*printf("inverso int* bufferUnion:\n");
	for (i = 0; i < lSize/4; i++)
		printf("%02X|", bufferUnion[i].i);
		printf("\n\n");
		
	int j = 0;
		printf("inverso char* bufferUnion:\n");
	for (i = 0; i < lSize/4; i++)
	{
		for (j=0; j<4; j++)
			printf("%02X|", bufferUnion[i].c[j]);
			
	}
		printf("\n\n");
		
	for (i = 1; i < lSize/4; i++)
	{
		for (j=0; j<4; j++)
		{
			num2stringOG(hexTemp, bufferUnion[i].c[j], 16, 24);
			num2string(bitBuffer, hexTemp, 24);		
			//dump(&bufferUnion[1], lSize-4);
		}
	}*/

		
			
		
	 	//printf("%s", binBuffer);

		
		// inverte para escrita
		
		//if (buffer[i] <= 0x007F)
			
		
		//else if (buffer[i] <= 0x07FF)
		
		//else if (buffer[i] <= 0xFFFF)
		//{
		//	if (buffer[i] == 0xFEFF)
		//		{puts ("BOM em posição inválida.", stderr); return -1;}
				
		//}
		//if (buffer[i] <= 0x10FFFF)
		//{	
		
		
		
		/*
		int j =0;;
		while (binBuffer[j] != 1)
			j++;
			
		printf("\nj = %d\n", j);

			
		qtdBitsSig = 24 - j;
			
		int k = 21 - qtdBitsSig; 
		printf("\nk = %d\n", k);
		//}
			
			
		
		//else
			//{fputs ("caractere não pertence a UTF-32.", stderr); return -1;} */
			

	//printf("hex to dec: %d\n", hextoDec(buffer[i]));

	//printf("\n%s\n", bitBuffer);
	
		
	
	
	free(bufferRead);
	free(bufferWrite);
	return 0;
}