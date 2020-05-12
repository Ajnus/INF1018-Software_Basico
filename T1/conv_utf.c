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
		fputs ("erro de leitura de arquivo.", stderr);
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
	long rSize;
	long wSize;
	int* bufferRead;
	int* bufferWrite;
	char ordenacao;
	unsigned int BOM = 0;
	
	if (arq_entrada==NULL || arq_saida==NULL)
		{fputs ("erro de leitura de arquivo.", stderr); return -1;}
	
		// LEITURA
	// determina tamanho do arquivo de entrada e de saída
	fseek (arq_entrada, 0, SEEK_END);
	rSize = ftell (arq_entrada);
	wSize = rSize - 4; // texto sem BOM
		printf("O tamanho de rSize eh: %ld\n", rSize);
  	rewind (arq_entrada);
  	
  	// aloca memória para conter todo o arquivo
  	bufferRead = (int*) malloc (sizeof(int)*rSize);
  		if (bufferRead == NULL) {fputs ("erro de memória.", stderr); exit (2);}
  	bufferWrite = (int*) malloc ((sizeof(int)*wSize));
  		if (bufferWrite == NULL) {fputs ("erro de memória.", stderr); exit (2);}	
  		
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
			
  	
  	// insere BOM + texto do arquivo no buffer	
	fread(bufferRead, 4, rSize/4, arq_entrada);
		printf("O tamanho de buffer eh: %ld bytes\n", rSize);
	
	//print e comparação com dump
	int i;
	for (i = 0; i < rSize/4; i++)
		printf("%c", bufferRead[i]);
		printf("\n\n");
		
		printf("int* buffer:\n");		
	for (i = 0; i < rSize/4; i++)
		printf("%08X|", bufferRead[i]);
		
		//dump (&buffer[0], lSize);
		printf("\n\n");
	
	
	for (i = 1; i < rSize/4; i++)
		if (ordenacao) // se Little Endian
			bufferWrite[i-1] = inverte32(bufferRead[i]); // tranfere texto sem BOM

			
		printf("inverso int* buffer (sem BOM):\n");
	for (i = 0; i < wSize/4; i++)
		printf("%02X|", bufferWrite[i]);
		printf("\n\n");
		
		printf("dump - tamanho do buffer: %ld\n", wSize);
		dump (&bufferWrite[0], wSize);
	
	int j = 0;
	i=0;
	unsigned char *p;
	int qtdBitSig;
	int qtdZeros;
	unsigned int varUTF8;
	p = bufferWrite;
	while (wSize--)
	{
		
		//printf("*p eh: %02X\n", *p);
		if ((0x01 & 0x10) == 0x10)
		{
			j=3;	// bit mais sig na 5a posicao
		}
		else if ((0x01 & 0x08) == 0x08)
		{
			j=4;	// bit mais sig na 4a posicao
		}
		else if ((0x01 & 0x04) == 0x04)
		{
			j=5;	// bit mais sig na 3a posicao
		}
		else if ((0x01 & 0x02) == 0x02)
		{
			j=6;	// bit mais sig na 2a posicao
		}
		else
			j = 7; 	// bit mais sig na 1a posicao
			
		
			//printf("saiu.\n");			
			printf("j saida = %d\n", j);
			printf("i saida = %d\n", i);
		qtdBitSig = 24 - j;
			printf("qtdBitSig = %d\n", qtdBitSig);
		
		qtdZeros = 21 - qtdBitSig;
			printf("qtdZeros = %d\n", qtdZeros);			
		switch (qtdZeros)
		{
		    case 4 :
		    varUTF8  = 0xF0808080 & 0xF8DFFFFF;		// molde + 0's na frente 11110(000) 10(0)xxxxx 10xxxxxx 10xxxxxx
		    varUTF8 = varUTF8 | (0x0001D11E>>12)<<16;    // anterior mais 2o byte preenchido	 			 
		    break;
		    
		    case 3 :
		    varUTF8  = 0xF0808080 & 0xF8FFFFFF;	//   	                    11110(000) 10xxxxxx 10xxxxxx 10xxxxxx
		    break;
		    
		    case 2 :
		    varUTF8  = 0xF0808080 & 0xF9FFFFFF;	//    	                   11110(00)x 10xxxxxx 10xxxxxx 10xxxxxx
		    break;
		    
		    case 1 :
		    varUTF8  = 0xF0808080 & 0xFBFFFFFF;	//     	                 11110(0)xx 10xxxxxx 10xxxxxx 10xxxxxx
		    break;
		    
		    default :
		    varUTF8  = 0xF0808080 & 0xFFFFFFF;	// não faz nada
		  }
		
			printf("varUTF8 só com 0's na frente eh:%08X\n", varUTF8);
		
		
	
			//printf("conteudo de bufferWrite como char: %02X\n", *p);
		p+=4;	
	}
			
	free(bufferRead);
	free(bufferWrite);
	return 0;
}