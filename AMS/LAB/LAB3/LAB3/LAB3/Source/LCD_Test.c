/******************************************
   AMS, LAB3
   Testing the LCD driver "lcd162.c"

   STK500 connection: PORTx (4 bit mode):
   [LCD]            [Portx]
   RS (pin4)  ------ bit 0
   RW (pin 5) ------ bit 1
   E  (pin 6) ------ bit 2
   DB4 (pin 11) ---- bit 4
   DB5 (pin 12) ---- bit 5
   DB6 (pin 13) ---- bit 6
   DB7 (pin 14) ---- bit 7

   Henning Hargaard, January 9, 2012
 *****************************************/

#include <avr/io.h>
#define F_CPU 3686400
#include <avr/delay.h>
#include "../Headers/lcd162.h"

// User defined characters : Æ Ø Å æ ø å (special danish characters)
const unsigned char capital_ae[8]= {
0b0001111,
0b0010100,
0b0010100,
0b0011111,
0b0010100,
0b0010100,
0b0010111,
0b0000000};
const unsigned char capital_oe[8]= {
0b0001110,
0b0010001,
0b0010011,
0b0010101,
0b0011001,
0b0010001,
0b0001110,
0b0000000};
const unsigned char capital_aa[8]= {
0b0000100,
0b0001110,
0b0010001,
0b0011111,
0b0010001,
0b0010001,
0b0010001,
0b0000000};
const unsigned char minor_ae[8]= {
0b0000000,
0b0000000,
0b0001110,
0b0010101,
0b0010101,
0b0010101,
0b0001111,
0b0000000};
const unsigned char minor_oe[8]= {
0b0000000,
0b0000000,
0b0001110,
0b0010011,
0b0010101,
0b0011001,
0b0001110,
0b0000000};
const unsigned char minor_aa[8]= {
0b0000100,
0b0000000,
0b0001110,
0b0010010,
0b0010010,
0b0010010,
0b0001101,
0b0000000};

int main()
{
char SRAMstring[] = "String in SRAM";
int i;

  // Initialize the display
  LCDInit();
  // Loading UDC (CGRAM) with the dot patterns for Æ,Ø,Å,æ,ø,å
  LCDLoadUDC(0,capital_ae);
  LCDLoadUDC(1,capital_oe);
  LCDLoadUDC(2,capital_aa);
  LCDLoadUDC(3,minor_ae);
  LCDLoadUDC(4,minor_oe);
  LCDLoadUDC(5,minor_aa);

  while (1)
  { 
    // Display clear
    LCDClear();
    // Goto line 1, 3.character
    LCDGotoXY(2,0);
    // Testing LCD_DispString()
    LCDDispString("X=2, Y=0");
    _delay_ms(2000);

    // Display clear
    LCDClear();
    // Goto line 2, 4.character
    LCDGotoXY(3,1);
    LCDDispString("X=3, Y=1");
    _delay_ms(2000);

    // Display clear
    LCDClear();
    // Testing LCDDispChar() and the UDC characters
    LCDDispChar('A');
    LCDDispChar('B');
    LCDDispChar('C');
	LCDDispChar(' ');
    LCDDispChar(0);
    LCDDispChar(1);
    LCDDispChar(2);
    LCDDispChar(3);
    LCDDispChar(4);
    LCDDispChar(5);

    // Goto line 2 start
    LCDGotoXY(0,1);
    // Testing LCDDispString()
    LCDDispString(SRAMstring);
    _delay_ms(2000);

    // Visible cursor
    LCDOnOffControl(1,0);
    _delay_ms(1000);
    // Goto line 2, 4.character
    LCDGotoXY(3,1);
    // Blinking characters
    LCDOnOffControl(0,1);
    _delay_ms(2000);
    // Blinking character with visible cursor
    LCDOnOffControl(1,1);
    _delay_ms(2000);

    // Move cursor 2 positions to the left
    LCDCursorLeft();
    LCDCursorLeft();
    _delay_ms(1000);

    // Move cursor 4 positions to the right
    LCDCursorRight();
    LCDCursorRight();
    LCDCursorRight();
    LCDCursorRight();
    _delay_ms(1000);

    // Shift the display text 2 positions to the right
    LCDShiftRight();
    LCDShiftRight();
    _delay_ms(1000);
    // Shift the display text 1 position to the left
    LCDShiftLeft();
    _delay_ms(1000);

    // No blinking characters or cursor
    LCDOnOffControl(0,0);
    // Display clear
    LCDClear();
    // Testing LCDDispInteger()
    for ( i = 0; i < 10; i++ )
    {
      // Goto line 1, 5.character
      LCDGotoXY(4,0);
      LCDDispInteger(i-30000);
      // Goto line 2, 5.character
      LCDGotoXY(4,1);
      LCDDispInteger(i+30000);
      _delay_ms(500);
    }
  }
}
