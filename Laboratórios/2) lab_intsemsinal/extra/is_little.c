#include <stdio.h>
//00000001 00000000

int is_little()
{
	int i = 256;
	int* p = &i;
	
	return !p;
}

int main(void)
{
	printf("A memória deste computador tem organização ");
	if (is_little())
		printf("big endian.\n\n");
	else
		printf("little endian.\n\n");
		
	return 0;
}
	

	

