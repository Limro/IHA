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
  SPCR = 0b01010101;
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
  // Set to: 2012 January 11, Wednesday, 12:00:00
  SetClock(12, 1, 11, 3, 12, 0, 0);
  while(1)
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
        LCDDispChar(Date10());           
      LCDDispChar(Date1());
	  LCDDispChar(' ');    
      LCDDispChar('2');
      LCDDispChar('0');
      LCDDispChar(Year10());    
      LCDDispChar(Year1());
      LCDGotoXY(0,1);
      LCDDispString(DayTable[Day()]);
      LCDGotoXY(8,1);
      LCDDispChar(Hours10());    
      LCDDispChar(Hours1());
      LCDDispChar(':');
      LCDDispChar(Minutes10());    
      LCDDispChar(Minutes1());
      LCDDispChar(':');
      LCDDispChar(Seconds10());    
      LCDDispChar(Seconds1());
	  old_sec = new_sec;
	}	  
  }
}