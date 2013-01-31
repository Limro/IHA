/*
 * LAB3.c
 *
 * Created: 31-01-2013 08:30:26
 *  Author: Becks Laptop
 */ 

#include "../Headers/lcd162.h"
#include <avr/io.h>

int main(void)
{
	LCDInit();
	LCDDispInteger(123);
	
}