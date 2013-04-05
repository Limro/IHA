#include "keyboard.h"

unsigned char updateKeyboardKeys(alt_up_ps2_dev *PS2_dev, unsigned char* keys, char bufferSize)
{
	unsigned char PS2_original_data, PS2_ascii_data, i=0;
	while(alt_up_ps2_read_data_byte (PS2_dev, &PS2_original_data) == 0)
	{
		if(PS2_original_data == 0xF0) // If a key was released
		{
			// Getting respond on which char is released
			while(alt_up_ps2_read_data_byte (PS2_dev, &PS2_original_data) != 0) {}
			PS2_ascii_data = convertKeyboardToAscii(PS2_original_data);
			if(PS2_ascii_data != NULL_TERMINATE) // Not supported key - don't care!
			{
				i = 0;
				while(*(keys+i) != PS2_ascii_data && *(keys+i) != NULL_TERMINATE)
				// Find key in array. If not there, null terminate is reached there is
				// nothing more interesting in array since the last also will be null terminate
				{
					i++;
				}
				while(*(keys+i) != NULL_TERMINATE)
				// Shift keys until we get to null terminate (end of array)
				{
					*(keys+i) = *(keys+i+1);
					i++;
				}
				// We could return here, but there might be more chars in the buffer!
			}
		}
		else
		{
			PS2_ascii_data = convertKeyboardToAscii(PS2_original_data);
			if(PS2_ascii_data != NULL_TERMINATE) // Not supported key - don't care!
			{
				for(i = 0; i < bufferSize; i++)
				{
					if(*(keys+i) == PS2_ascii_data)
						break; // We don't need a new one, since it's already in the array
					else if(*(keys+i) == NULL_TERMINATE)
					{
						// Put key into last available place
						*(keys+i) = PS2_ascii_data;
						// We could return here, but there might be more chars in the buffer!
						break;
					}
				}
			}
		}
	}

	for(i = 0; i < bufferSize; i++)
	{
		if(*(keys+i+1) == NULL_TERMINATE)
		{
			// Next char is null terminate, so the current is the last
			// Note: Current might also be null terminate (if first)
			return *(keys+i);
		}
	}
	return 0; // We should never get here!
}

int keyboardKeyToHertz(unsigned char key)
{
	switch(key)
	{
		/* LETTERS */
		case 'a':
			return 440;
		case 'b':
			return 494;
		case 'c':
			return 262;
		case 'd':
			return 294;
		case 'e':
			return 330;
		case 'f':
			return 349;
		case 'g':
			return 392;
	}

	/* NUMBERS */
	if(key >= '1' && key <= '9')
		return (key-48)*100; // Ex: if 4 (ASCII: 52): (52-48)*100 = 400
	else
		return 0;
}

unsigned char convertKeyboardToAscii(unsigned char orig_key)
{
	switch(orig_key)
	{
		/* LETTERS */
		case 0x1C:
			return 'a';
		case 0x32:
			return 'b';
		case 0x21:
			return 'c';
		case 0x23:
			return 'd';
		case 0x24:
			return 'e';
		case 0x2B:
			return 'f';
		case 0x34:
			return 'g';

		/* NUMBERS */
		case 0x45:
			return '0';
		case 0x16:
			return '1';
		case 0x1E:
			return '2';
		case 0x26:
			return '3';
		case 0x25:
			return '4';
		case 0x2E:
			return '5';
		case 0x36:
			return '6';
		case 0x3D:
			return '7';
		case 0x3E:
			return '8';
		case 0x46:
			return '9';
	}

	return NULL_TERMINATE;
}
