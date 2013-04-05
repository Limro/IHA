#ifndef _KEYBOARD_H_INCLUDED
#define _KEYBOARD_H_INCLUDED

#include "altera_up_avalon_ps2.h"

#define NULL_TERMINATE '\0'

/**
 * @brief Empties the keyboard-buffer and returning the last key pressed down (within the bufferSize!)
 *
 * @param PS2_dev 	Pointer to the PS/2-connection
 * @param keys 		Pointer to the keys previously read keys from keyboard. This array will be
 * 					updated with the newest keys and should therefore be used next time this function
 * 					is called. End of array should always be null terminate.
 * 					At init, all elements in the array should be null terminate!
 * @param PS2_dev 	Buffersize of the keys-array. This should always be one less than the actual size,
 * 					since the last key should be null terminate.
 *
 * @return 	The last pressed key
 **/
unsigned char updateKeyboardKeys(alt_up_ps2_dev *PS2_dev, unsigned char* keys, char bufferSize);

/**
 * @brief Converts chars from PS/2 to ASCII.
 *
 * @param orig_key 	Key to be converted
 *
 * @return The ASCII char
 **/
unsigned char convertKeyboardToAscii(unsigned char orig_key);

int keyboardKeyToHertz(unsigned char key);

#endif // _KEYBOARD_H_INCLUDED
