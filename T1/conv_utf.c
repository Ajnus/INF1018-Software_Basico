/* Júlio Necyk Cavalcanti Maia		1710430 3WB */
/* Jam Ajna Soares			1013109 3WB */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "conv_utf.h"

/*
typedef union intChar
{
	int i;
	char c[sizeof(int)];
} ic;*/

void dump (void *p, int n)
{
	unsigned char *p1 = p;
	while (n--)
	{
		printf("%p - %02X\n", p1, *p1);
		p1++;
	}

}

/*
int getNum(char ch)
{
    int num = 0;
    
    if(ch>='0' && ch<='9')
    {
        num = ch - 0x30;
    }
    else
    {
        switch(ch)
        {
            case 'A': case 'a': num=10; break;
            case 'B': case 'b': num=11; break;
            case 'C': case 'c': num=12; break;
            case 'D': case 'd': num=13; break;
            case 'E': case 'e': num=14; break;
            case 'F': case 'f': num=15; break;
            default: num=0;
        }
    }
    return num;
}
 
//function : hex2int
//this function will return integer value against
//hexValue - which is in string format
 
unsigned int hex2int(unsigned char hex[])
{
    unsigned int x=0;
    x=(getNum(hex[0]))*16+(getNum(hex[1]));
    return x;
}

int hextoDec(char* hexVal) 
{    
    int n = strlen(hexVal); 
    int i;  
    // Initializing base value to 1, i.e 16^0 
    int base = 1; 
    int decVal = 0; 
      
    // Extracting characters as digits from last character 
    for (i=n-1; i>=0; i--) 
    {    
        // if character lies in '0'-'9', converting  
        // it to integral 0-9 by subtracting 48 from 
        // ASCII value. 
        if (hexVal[i]>='0' && hexVal[i]<='9') 
        { 
            decVal += (hexVal[i] - 48)*base; 
                  
            // incrementing base by power 
            base = base * 16; 
        } 
  
        // if character lies in 'A'-'F' , converting  
        // it to integral 10 - 15 by subtracting 55  
        // from ASCII value 
        else if (hexVal[i]>='A' && hexVal[i]<='F') 
        { 
            decVal += (hexVal[i] - 55)*base; 
          
            // incrementing base by power 
            base = base*16; 
        } 
    } 
      
    return decVal; 
}

void num2stringOG(char* s, int num, int base, int N)
{
	int n = N-2;

 	while ((num/base)>=1)
	{
		//printf("num = %d, base = %d, ", num, base);
		s[n] = num%base;
		//printf("s[%d] = %d\n", n, s[n]);
		num = num/base;
		//printf("novo num = %d\n", num);
		n--;
		
	}
		s[0] = num;
		//printf("s[0] = %d\n\n", s[0]);
		
	while (n < N-1) // caracteres estranhos ou segfaults com o uso de %s
	{  
		printf("%d", s[n]);
		n++;
	}
	printf("\n");
}

void num2string(char* s, int num, int N)
{
	printf("O valor que entrou em num2string eh: %02X\n", num);

	int n = N-2;

 	while ((num/2)>=1)
	{
		//printf("num = %d, 2 = %d, ", num, 2);
		s[n] = num%2;
		//printf("s[%d] = %d\n", n, s[n]);
		num = num/2;
		//printf("novo num = %d\n", num);
		n--;
		
	}
		s[0] = num;
		
	while (n < N-1) // caracteres estranhos ou segfaults com o uso de %s
	{  
		printf("%u", s[n]);
		n++;
	}
	printf("\n");
}
*/
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

/*
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
}*/

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
		
	//printf("dump - tamanho do buffer: %ld\n", lSize-4);
	//dump (&buffer[0], lSize-4);
		
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