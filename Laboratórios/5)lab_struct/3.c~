#include <stdio.h>
#include "3.h"


void dump (void *p, int n)
{
	unsigned char *p1 = p;
	printf("A estrutura tem %d bytes.\n", n);
	while (n--)
	{
		printf("%p - %02x\n", p1, *p1);
		p1++;
	}
	
}

int main(void)
{
	int i;
    
	X1 x1 = {0xc1, 0x01020304, 0xc2};			 //1(char) + 3(padding/lixo) + 4(int) + 1(char) + 3(padding/lixo) = 12 bytes
	X2 x2 = {0x0102030405060708, 0xc1};			 //8(long) + 1(char) + 7(padding/lixo) = 16 bytes 
	X3 x3 = {0x01020304, 0xc1, 0xc2};		         //4(int) + 1(char) + 1(char) +2(padding/lixo) = 8 bytes
	X4 x4 = {{0x0102030405060708, 0xc1}, 0xc2};		 //8(long) + 1(char) + 7(padding/lixo) + 1(char) + 7(padding/lixo) = 24 bytes
	X5 x5 = {0xc1, 0xc2, 0xc3};				 //1(char) + 1(char) + 1(char) = 3 bytes
	X6 x6 = {0x0102, 0x01020304, {0xc1, 0xc2, 0xc3}, 0x0102};//2(short) + 2(padding/lixo) + 4(int) + 3(char) + 1((padding/lixo) + 2(short) 								           + 2(padding/lixo)= 16 bytes 

	U1 u1;
	U2 u2;

	printf("\nx1:\n");
		dump(&x1, sizeof(x1));
	printf("\nx2:\n");
		dump(&x2, sizeof(x2));
	printf("\nx3:\n");
		dump(&x3, sizeof(x3));
	printf("\nx4:\n");
		dump(&x4, sizeof(x4));
	printf("\nx5:\n");
		dump(&x5, sizeof(x5));
	printf("\nx6:\n");
		dump(&x6, sizeof(x6));

	u1.i = 0x01020304;					 //8(long) =  8 bytes
	printf("\nu1 (int)\n");
		dump(&u1, sizeof(u1));
	for (i = 0; i <5; i++)
		u1.c[i] = 0xcc;					 //5(char) + 3(padding/lixo) = 8 bytes
	printf("u1 (char)\n");
	    dump(&u1, sizeof(u1));

	u2.s = 0x0102;						 //2(short) + 4(padding/lixo) = 6 bytes
	printf("\nu2 (short)\n");
		dump(&u2, sizeof(u2));
		for (i = 0; i <5; i++)
			u2.c[i] = 0xcc;				 //5(char) + 1(padding/lixo) = 6 bytes
	printf("u2 (char)\n");
		dump(&u2, sizeof(u2));
		
	return 0;
}
