#include <stdio.h>

int main(void) 
{
	unsigned int x = 0x87654321;
	unsigned int y, z;

	/* o byte menos significativo de x e os outros bits em 0 */
	y = x & 0x00000021;

	/* o byte mais significativo com todos os bits em '1' 
	e os outros bytes com o mesmo valor dos bytes de x */
	z = x | 0xFF000000;

	printf("0x%08X 0x%08X\n", y, z);
	
	return 0;
}
