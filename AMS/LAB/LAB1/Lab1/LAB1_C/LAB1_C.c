#include <avr/io.h>
#define F_CPU 3686400
#define SPEED 100
#include <avr/delay.h>

int main()
{
	unsigned char i = 0;
	
	DDRB = 0xFF; //PORTB pins are outputs (LEDs)
	while (1)
	{
		PORTB = ~i; //Display "i" at the LEDs
		i++;
		_delay_ms(SPEED);
	}
	return 0;
}