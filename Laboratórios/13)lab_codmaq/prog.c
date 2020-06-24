#include <stdio.h>
typedef int (*funcp) (int x);

int add (int x)
{
	return x+1;
}

unsigned char codigo[]= {0x55, 0x48, 0x89, 0xE5, 0xE8, 0x00, 0x00, 0x00, 0x00, 0xC9, 0xC3};

int main (void)
{
	funcp f = (funcp)codigo;
	int i = (*f)(10);
	
	printf("O valor de i eh: 0x%08X\n", i);
	
	return 0;
}
