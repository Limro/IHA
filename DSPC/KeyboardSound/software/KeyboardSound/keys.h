#ifndef _KEYS_H_INCLUDED
#define _KEYS_H_INCLUDED

#include "system.h"
#include "altera_avalon_pio_regs.h"

#define NULL_TERMINATE '\0'

/**
 * @brief 	Checks on KEY[3..1] and updated the array with the current values (as chars).
 * 			Please note that this method is currently hardcoded to work on the current project!
 *
 * @param keys_char 	Pointer to array of keys pressed down. After calling the method
 * 						element 0, 1 and 3 will be respectively 1, 2 and/or 3 and
 * 						element 4 will be null terminate.
 **/
void updateKeyKeys(char* keys_char);

#endif // _KEYS_H_INCLUDED
