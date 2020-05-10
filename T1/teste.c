#include <stdio.h>
#include "conv_utf.h"

int ordByBOM();

int main(void)
{
	//ILE* utf8 = fopen("utf8_peq.txt", "rb");
	//FILE* utf32 = fopen("utf32_peq.txt", "rb");
	
	printf("O processador deste computador e: %s Endian.\n", ordByBOM() ? "Little" : "Big");
	
	//utf8_32(utf8, utf32);
	//utf32_8(utf32, utf8);

	return 0;
}
