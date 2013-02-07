#include <avr/io.h>
#include <avr/interrupt.h>

#define LEDS PORTC
#define LEDReg DDRC
#define SWITCHReg DDRD

ISR(SPI_STC_vect) 
{
	cli();
	LEDS = SPDR;
	
	sei();
	SPDR = PIND;
}

void InitSPI()
{
	//Interrupt enable
	//SPI enable
	//MSB first
	//Master
	//CPOL = 0
	//CPHA = 0
	//SCK = f_os/4
	SPCR = 0b11010001;
	SPSR = 0b00000000;
	
	DDRB = 0b00100000;
}

void InitLEDs()
{
	LEDReg = 0xFF;
	LEDS = 0x0F;
}

int main(void)
{
	
	InitSPI();
	InitLEDs();
	SWITCHReg = 0;	
	
	SREG = 128;
	sei();
	SPDR = PIND;
	
    while(1)
    {
    }
}