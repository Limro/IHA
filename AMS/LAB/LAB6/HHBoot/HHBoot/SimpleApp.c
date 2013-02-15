/*
 * SimpleApp.c
 *
 * Created: 14-02-2013 09:22:27
 *  Author: Becks Laptop
 */ 

#define F_CPU 3686400
#define delay 200

#include <avr/io.h>
#include <util/delay.h>



void RunShow();

int main(void)
{
	DDRC = 0xFF;
	RunShow(100);
}

void RunShow()
{
	unsigned char number;
	number = 0;
	
	while(1)
	{
		PORTC = ~number;
		_delay_ms(delay);
		number++;
	}	
}
