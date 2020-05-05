#include <stdio.h>

/*
1)
int b[2];
tamanho: 2 * 4 = 8 bytes	    armazenanento: |b[0]|b[0]|b[0]|b[0]|b[1]|b[1]|b[1]|b[1]|
short a[2][3];
tamanho: 2 * 3 * 2 = 12 bytes	    armazenamento: 
|a[0][0]|a[0][0]|a[0][1]|a[0][1]|a[0][2]|a[0][2]|a[1][0]|a[1][0]|a[1][1]|a[1][1]|a[1][2]|a[1][2]
*/


void dump (void *p, int n) 
{
	unsigned char *p1 = p;
	while (n--)
	{
		printf("%p - %02x\n", p1, *p1);
		p1++;
	}
}

int main (void)
{
	int i,j;
	short a[2][3];
	int b[2];

	for (i=0;i<2;i++)
	{
		b[i] = i;
		for (j=0;j<3;j++)
		a[i][j] = 3*i+j;
	}

	printf ("b: \n");
	dump (b, sizeof(b));
	printf ("a: \n");
	dump (a, sizeof(a));

	return 0;
}

/*
	b: 
	0x7fff9ca206a0 - 00		b[0]		0000 0000 
	0x7fff9ca206a1 - 00		b[0]		0000 0000
	0x7fff9ca206a2 - 00		b[0]		0000 0000
	0x7fff9ca206a3 - 00		b[0]		0000 0000
	0x7fff9ca206a4 - 01		b[1]		0000 0001
	0x7fff9ca206a5 - 00		b[1]		0000 0000
	0x7fff9ca206a6 - 00		b[1]		0000 0000
	0x7fff9ca206a7 - 00		b[1]		0000 0000
	a: 
	0x7fff9ca206b0 - 00		a[0][0]		0000 0000				
	0x7fff9ca206b1 - 00		a[0][0]		0000 0000
	0x7fff9ca206b2 - 01		a[0][1]		0000 0001
	0x7fff9ca206b3 - 00		a[0][1]		0000 0000	
	0x7fff9ca206b4 - 02		a[0][2]		0000 0010
	0x7fff9ca206b5 - 00		a[0][2]		0000 0000
	0x7fff9ca206b6 - 03		a[1][0]		0000 0011
	0x7fff9ca206b7 - 00		a[1][0]		0000 0000
	0x7fff9ca206b8 - 04		a[1][1]		0000 0100
	0x7fff9ca206b9 - 00		a[1][1]		0000 0000
	0x7fff9ca206ba - 05		a[1][2]		0000 0101
	0x7fff9ca206bb - 00		a[1][2]		0000 0000
/*
