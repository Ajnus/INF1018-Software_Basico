#include <stdio.h>

unsigned char switch_byte(unsigned char x)
{
	unsigned char esq = x >> 4;
	unsigned char dir = x << 4;
	unsigned char full = esq + dir;
	
	return full;
}

unsigned char rotate_left(unsigned char x, int n)
{
	unsigned char left = x >> (8-n);
	x = (x << n) + left;
	
	return x;
}

int main(void)
{
	char c = 0xAB;
	char d = 0x61;
	printf("0x%X, 0x%X\n", switch_byte(c), rotate_left(d, 7));

	return 0;
} 
