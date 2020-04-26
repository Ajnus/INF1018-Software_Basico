#include <stdio.h>

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
  	char c = 150;
	short s = -3;
  	int i = -151;
  	
	printf("dump de c: \n");
	dump(&c, sizeof(c));
	printf("dump de s: \n");
	dump(&s, sizeof(s));
	printf("dump de i: \n");
	dump(&i, sizeof(i));
	
	return 0;
}

/* CONTAS

  	char c = 150; 
150/2 = 75/2 = 37/2 = 18/2 = 9/2 = 4/2 = 2/2 = 1
0	1	1	0	1	0	0	1
	c = 10010110; %02X = 0x(1x2^3+1x2^0)(1x2^3+1x2^0) = 0x96
	*CORRETO*

	short s = -3;
0000 0000 0000 0011 -> 1111 1111 1111 1100 + 1 = 1111 1111 1111 1101 
	%02X = 0xFFFD; little_endian: FD, FF
	*CORRETO* 
 
  	int i = -151;
0000 0000 0000 0000 0000 0000 1001 0111 ->
1111 1111 1111 1111 1111 1111 0110 1000 + 1 = 
1111 1111 1111 1111 1111 1111 0110 1001 = 
  F    F    F    F    F    F    6    9
	little endian:  69, FF, FF, FF
	*CORRETO*
*/
