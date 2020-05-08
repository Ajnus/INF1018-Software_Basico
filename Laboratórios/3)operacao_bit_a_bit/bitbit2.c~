#include <stdio.h>

int odd_ones(unsigned int x)
{
		printf("x = %X\n---\n", x);
		printf("x ^= x>>16: x = %X ^ x>>16 => x = %X ^ %X    = %X\n", x, x, x>>16, x^x>>16);
	x ^= x>>16;
		printf("x ^= x>>8 : x = %X ^ x>>8  => x = %X ^ %X  = %X\n", x, x, x>>8, x^x>>8);
	x ^= x>>8;
		printf("x ^= x>>4 : x = %X ^ x>>4  => x = %X ^ %X = %X\n", x, x, x>>4, x^x>>4);
	x ^= x>>4;
		printf("x ^= x>>2 : x = %X ^ x>>2  => x = %X ^ %X = %X\n", x, x, x>>2, x^x>>2);
	x ^= x>>2;
		printf("x ^= x>>1 : x = %X ^ x>>1  => x = %X ^ %X = %X\n", x, x, x>>1, x^x>>1);
	x ^= x>>1;
	
		printf("x &  1    :     %X & 0000001    = %X\n", x, x&1);
	return x&1;
}
int main()
{
	printf("%x tem numero %s de bits.\n\n",0x01010101,odd_ones(0x01010101) ? "impar":"par");
	printf("%x tem numero %s de bits.\n\n",0x01030101,odd_ones(0x01030101) ? "impar":"par");
	return 0;
}
