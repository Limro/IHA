#ifndef _LCD_H_INCLUDED
#define _LCD_H_INCLUDED

#include "altera_avalon_pio_regs.h"
#include "system.h"
#include <stdio.h>
#include <unistd.h>

/* Macro-functions to use when writing to the LCD*/
#define STR_EXPAND(tok) #tok
#define STR(tok)        STR_EXPAND(tok)
// Moves the cursor to the y,x position specified - counted from top left corner
#define SET_POS(y,x)    "\x1b[" STR(y) ";" STR(x) "H"
// Clears from current position to end of line
#define CLR_LINE()      "\x1b[K"
// Clears the whole screen
#define CLR_SCR()       "\x1b[2J"

/* Function declarations */
void writeToLCD(char* str, char line);

#endif // _LCD_H_INCLUDED
