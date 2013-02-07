/************************************************
*  AMS: LAB4, Part2                             *
*  Test program for the RTC DS1305 driver       *
*  ("RTC.c" + "RTC.h").                         *
*                                               *
*  STK500 setup :                               *
*   LCD display connected to PORTC.             *
*                                               *
*   [Mega32]  [RTC1305]                         *
*     Vcc          Vcc                          *
*     GND          GND                          *
*     SS=PB.4      CE                           *
*     MOSI=PB.5    SI                           *
*     MISO=PB.6    SO                           *
*     SCK=PB.7     CLK                          *
*                                               *
*  Henning Hargaard, February 6, 2012           *
*************************************************/
#include <avr/io.h>
#include <avr/delay.h>
#include "lcd162.h"
#include "RTC.h"

char MonthTable[12][10] = 
{ "January ",
  "February ",
  "March ",
  "April ",
  "May ",
  "June ",
  "July ",
  "August ",
  "Septemb.",
  "October ",
  "November ",
  "December "}; 

char DayTable[7][9] = 
{ "Sunday",
  "Monday",
  "Tuesday",
  "Wednesd.",
  "Thursday",
  "Friday",
  "Saturday"}; 

void SPI_Init()
{
  // SCK, MOSI and SS outputs
  // MISO input
  DDRB = 0b10110000;
  // Enable SPI
  // SPI Master
  // SPI clock = fosc/16
  // CPHA = 1
  // CPOL = 0 - Falling edge read
  SPCR = 0b01010101;
}

void ShowElement(unsigned char obj, char* text, long int delay)
{
	char str[10];
	strcpy(str, text);
	strcat(str, ":");
	
	LCDDispString(str);
	LCDDispChar(' ');
	LCDDispInteger(obj);
	_delay_ms(delay);
	LCDClear();	
}

int main(void)
{
	unsigned char old_sec, new_sec;	
	
	// Initialize LDC display
	LCDInit();
	// Initialize Mega16 SPI unit  
	SPI_Init();
	// Initialize DS1305
	RTCInit();
	
	//Set to: 2013, February 7, thursday, 14:41:00
	//SetClock(13, 2, 7, 4, 14, 41, 00);
	//
	//long int delay = 1500;
	//ShowElement(Year10(), "Year10", delay);
	//ShowElement(Year1(), "Year1", delay);
	//ShowElement(Date10(), "date10", delay);
	//ShowElement(Date1(), "date1", delay);
	//ShowElement(Hours10(), "Hour10", delay);
	//ShowElement(Hours1(), "Hour1", delay);
	//ShowElement(Minutes10(), "minute10", delay);
	//ShowElement(Minutes1(), "minute1", delay);
	//ShowElement(Seconds10(), "second10", delay);
	//ShowElement(Seconds1(), "second1", delay);
	//ShowElement(Month(), "Month", delay);
	//LCDDispString("Day: ");
	//LCDDispString(DayTable[Day()]);
	

	
	
	// Set to: 2012 January 11, Wednesday, 12:00:00
	SetClock(12, 1, 11, 3, 12, 0, 0);
	while(1)
	{
		_delay_ms(1000);
		RunClock(old_sec, new_sec);
	}
	return 0;
}

void RunClock(unsigned char old_sec, unsigned char new_sec)
{
	new_sec = Seconds1();
	if (old_sec != new_sec)
	{
		LCDClear();
		// January 12 2012
		// Thursday 12:02:24
		LCDDispString(MonthTable[Month()]);
		if (Date10() == '0')
		LCDDispChar(' ');
		else
		LCDDispInteger(Date10());
		LCDDispInteger(Date1());
		LCDDispChar(' ');
		LCDDispChar('2');
		LCDDispChar('0');
		LCDDispInteger(Year10());
		LCDDispInteger(Year1());
		LCDGotoXY(0,1);
		LCDDispString(DayTable[Day()]);
		LCDGotoXY(8,1);
		LCDDispInteger(Hours10());
		LCDDispInteger(Hours1());
		LCDDispChar(':');
		LCDDispInteger(Minutes10());
		LCDDispInteger(Minutes1());
		LCDDispChar(':');
		LCDDispInteger(Seconds10());
		LCDDispInteger(Seconds1());
		old_sec = new_sec;
	}
}