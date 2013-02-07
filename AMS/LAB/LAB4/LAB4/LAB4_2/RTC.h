/*----------------------------------------------------------------------
  File name: "RTC.h"

  Driver for DS1305 Real Time Clock.

  Wiring:
  [Mega32]  [RTC1305]
  Vcc          Vcc
  GND          GND
  SS=PB.4      CE  
  MOSI=PB.5    SI  
  MISO=PB.6    SO 
  SCK=PB.7     CLK

  Henning Hargaard, January 11, 2012
-----------------------------------------------------------------------*/
#define RTC_CONTROL_WRITE 0x8F
#define RTC_CONTROL_READ 0x0F
#define CE_PIN 4

void RTCInit();
void SetClock(unsigned char year, unsigned char month, unsigned char date, unsigned char day,
              unsigned char hour, unsigned char minutes, unsigned char seconds);
char Year10();
char Year1();
char Date10();
char Date1();
char Hours10();
char Hours1();
char Minutes10();
char Minutes1();
char Seconds10();
char Seconds1();
unsigned char Month();
unsigned char Day();