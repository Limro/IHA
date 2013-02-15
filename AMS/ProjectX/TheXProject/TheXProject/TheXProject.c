/*
 * TheXProject.c
 *
 * Created: 14-02-2013 11:13:59
 *  Author: Becks Laptop
 */ 


#include <avr/io.h>
#include <avr/delay.h>

int main(void)
{
	DDRD = (1>>PD4);
	
	TCCR1A = 0b00110011;
	TCCR1B = 0b00000010;
	OCR1B = 512;
	
    while(1)
    {
        _delay_ms(1000);
		OCR1B = 1023;
		
		_delay_ms(1000);
		OCR1B = 100;
		
		
		_delay_ms(1000);
		OCR1B = 512;
    }
}