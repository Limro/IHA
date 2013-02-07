#include "RTC.h"
#include <avr/io.h>

const unsigned char Reg = 0x8F;

void RTCInit()
{	
	// SCK, MOSI output
	// CE = set
	// MISO input
	PORTB = 0;

	WriteToRTC(Reg, 0x00);
}

//Wait for the SPI interrupt flag to become 1
static void Wait()
{
	while ((SPSR & 0b10000000) == 0);
}

char ReadFromRTC(unsigned char address)
{
	// SCK, MOSI output
	// CE = set
	// MISO input
	PORTB |= (1<<PB4);

	SPDR = address;
	Wait();
	
	SPDR = 0xFF; // Empty byte to get new byte
	Wait();
	
	PORTB &= 0b11101111; // CE = 0
	
	return SPDR;
}

void WriteToRTC(unsigned char address, unsigned char data)
{
	// CE = 1	
	PORTB |= (1<<PB4);
		
	SPDR = address;
	Wait();
	SPDR = data;
	Wait();
	
	// CE = 0
	PORTB &= 0b11101111;
}

char Helper10(unsigned char address)
{
	char raw = ReadFromRTC(address);
	char shifted = raw >> 4;
	return shifted;
}

unsigned char Helper1(unsigned char address)
{
	unsigned char raw = ReadFromRTC(address);
	raw &= 0b00001111;
	return raw;
}

unsigned char HelperWrite(unsigned char address, unsigned char raw)
{
	unsigned char y;
	y = (raw / 10) << 4;
	y = y | (raw % 10);
	WriteToRTC(address, y);
}

void SetClock(unsigned char year, unsigned char month, unsigned char date, unsigned char day,
unsigned char hour, unsigned char minutes, unsigned char seconds)
{
	HelperWrite(0x86, year);
	HelperWrite(0x85, month);
	HelperWrite(0x84, date);
	HelperWrite(0x83, day);
	HelperWrite(0x82, hour);
	HelperWrite(0x81, minutes);
	HelperWrite(0x80, seconds);
}

char Year10()
{
	return Helper10(0x06);
}

char Year1()
{
	return Helper1(0x06);
}

char Date10()
{
	return Helper10(0x04);
}

char Date1()
{
	return Helper1(0x04);
}

char Hours10()
{
	return Helper10(0x02);
	//unsigned char temp = Helper10(0x02);
	//return (temp>>4) - 4;
}

char Hours1()
{
	return Helper1(0x02);
}

char Minutes10()
{
	return Helper10(0x01);
}

char Minutes1()
{
	return Helper1(0x01);
}

char Seconds10()
{
	return Helper10(0x00);
}

char Seconds1()
{
	return Helper1(0x00);
}

unsigned char Month()
{
	return ReadFromRTC(0x05);
}

unsigned char Day()
{
	return Helper1(0x03);
}