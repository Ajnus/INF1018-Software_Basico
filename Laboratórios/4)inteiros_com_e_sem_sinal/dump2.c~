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
	short l = -32765;
	unsigned short k = 32771;
	
	printf("l=%d, k=%u \n", l, k);
	printf("dump de l: \n");
	dump(&l, sizeof(l));
	printf("dump de k: \n");
	dump(&k, sizeof(k));
	
	return 0;
}

/* CONTAS

  	short l = -32765;
32765/2 = 16382/2 = 8191/2 = 4095/2 = 2047/2 = 1023/2 = 511/2 = 255/2=
127/2 = 63/2 = 31/2 = 15/2 = 7/2 = 3/2 = 1
	l -> 0111 1111 1111 1101 -> 1000 0000 0000 0010 + 1 =
	1000 0000 0000 0011  -> 0x8003
	little endian: 03, 80
	
	unsigned short k = 32771;
32771/2  = 16385/2  = 8192/2 = 4096/2 = 2048/2 = 1024/2 = 512/2 =  256/2 = 128/2 = 64/2 = 32/2 16/2 = 8/2 =4/2 = 2/2 = 1
	k = 1000 0000 0000 0011
	%02X = 0x8003; little_endian: 03, 80
	
	
	Em complemento a 2, plicada a formúla (2n - 1) - (-x) + 1 ao valor de l (pois o mesmo é negativo) obtemos a mesma 		representação do valor de k (que é positivo)

*/
