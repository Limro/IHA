#include "keys.h"

void updateKeyKeys(char* keys_char)
{
	unsigned char keys_binary = ~IORD_ALTERA_AVALON_PIO_DATA(PIO_INPUT_KEY_BASE);
	keys_char[0] = ((keys_binary & 1) == 1 ? '1' : ' ');
	keys_char[1] = ((keys_binary & 2) == 2 ? '2' : ' ');
	keys_char[2] = ((keys_binary & 4) == 4 ? '3' : ' ');
	keys_char[3] = NULL_TERMINATE;
}
