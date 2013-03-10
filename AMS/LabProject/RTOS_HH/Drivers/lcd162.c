/*-----------------------------------------------------------------------
  Description: Driver for the PowerTip PC1602-F alphanumeric display.
  Display controller = HD44780U (LCD-II).
  
  Max. uC clock frequency = 16 MHz (Tclk = 62,5 ns)

  Connection : PORTx (4 bit mode) :
  [LCD]             [Portx]
  RS (pin4)  ------  bit 0
  RW (pin 5) ------  bit 1
  E  (pin 6) ------  bit 2
  DB4 (pin 11) ---   bit 4
  DB5 (pin 12) ---   bit 5
  DB6 (pin 13) ---   bit 6
  DB7 (pin 14) ---   bit 7
-----------------------------------------------------------------------*/
#include <avr/io.h>
#define F_CPU 3686400
#include <avr/delay.h>

// Enabling us to use macro _NOP() to insert the NOP instruction
#include <avr/cpufunc.h>
#include "../Source/include/FreeRTOS.h"
#include "lcd162.h"
#include "../Source/include/task.h"

// library function itoa() is needed
#include <stdlib.h>

// Defining the used port pin numbers
// (the used port is defined in "lcd.h")
#define RS   0
#define RW   1
#define E    2
#define BUSY 7

//*********************** PRIVATE (static) operations *********************
static void E_High()
{
	// Set the E pin high
	PORT_lcd |= 1<<E;
	// Min 230 ns E-pulse-width : PWEH
	_NOP();
	_NOP();
	_NOP();
}

static void E_Low()
{
	// Set the E pin low
	PORT_lcd &= ~(1<<E);
	// Enable cycle time : Min 500 ns
	_NOP();
	_NOP();
}

static void waitBusy()
{
	unsigned int counter = 0;
	unsigned char BusyStatus;
                                                            
	// DB7-DB4 = input
	DDR_lcd &= 0b00001111;
	// RW = 1, RS = 0
	PORT_lcd |= 1<<RW;
	PORT_lcd &= ~(1<<RS);
	do
	{ 
		// Set pin E high (tAS > 40 ns gained via the call of E_High() )
		// - and wait tDDR (min. 160 ns)
		E_High();
		// Read BUSY flag (DB7)  
		BusyStatus = PIN_lcd & 1<<BUSY;
		// Min 230 ns E-pulse-width : (PWEH > 230 ns is gained)
		E_Low();
		// Dummy "reading" AC3-AC0		              
		E_High();
		E_Low();
		// "Counter" used for implementing timeout:
		// If the Busy flag is not reset within (appr.) 100 ms, the loop is broken
		counter++;
	} while( BusyStatus && counter );  
	// DB7-DB4 = output
	DDR_lcd |= 0b11110000;
}  

static void sendInstruction( unsigned char data )
{      
	// Wait for display controller ready
	waitBusy();
	// Write high nibble ::
	// RW = 0, RS = 0, E = 0, DB7-DB4 = Data high nibble
	PORT_lcd = (data & 0b11110000);
	// Set pin E high (tAS > 40 ns gained via calling E_High() )
	E_High();
	// Set pin E low (PWEH > 230 ns is gained)
	E_Low();

	// Write low nibble ::
	// RS = 0, RW = 0, E = 0, DB7-DB4 = Data low nibble
	PORT_lcd = (data & 0x0F)<<4;
	// Set pin E high (tAS > 40 ns is gained via calling E_High() )
	E_High();
	// Set pin E low (PWEH > 230 ns is gained)
	E_Low();
}

static void sendData( unsigned char data )
{      
    // Wait for display controller ready
    waitBusy();
    // Write high nibble ::
    // RW = 1, RS = 1, E = 0, DB7-DB4 = Data high nibble
    PORT_lcd = (data & 0b11110000) | 0b00000001;
    // Set pin E high (tAS > 40 ns gained via calling E_High() )
    E_High();
    // Set pin E low (PWEH > 230 ns is gained)
    E_Low();

    // Write low nibble ::
    // RS = 1, RW = 0, E = 0, DB7-DB4 = Data low nibble
    PORT_lcd = (data & 0x0F)<<4 | 0b00000001;
    // Set pin E high (tAS > 40 ns is gained via calling E_High() )
    E_High();
    // Set pin E low (PWEH > 230 ns is gained)
    E_Low();
}

//*********************** PUBLIC operations *****************************

// Initializes the display, blanks it and sets "current display position"
// at the upper line, leftmost character (cursor invisible)
void LCDInit()
{
	//portTickType xLastWakeTime;
	//xLastWakeTime = xTaskGetTickCount();
	
	// Initializing the used port
	DDR_lcd = 0xFF;  // bits 0-7 output
	PORT_lcd = 0x00; // bits 0-7 low
	
	// Wait 50 ms (min.15 ms demanded according to the data sheet)
	//vTaskDelayUntil(&xLastWakeTime, 50);
	_delay_ms(50);
	
	// Function set (still 8 bit interface)
	PORT_lcd = 0b00110000;
	E_High();
	E_Low();

	// Wait 10 ms (min.4,1 ms demanded according to the data sheet)
	//vTaskDelayUntil(&xLastWakeTime, 100);
	_delay_ms(100);
	// Function set (still 8 bit interface)
	PORT_lcd = 0b00110000;
	E_High();
	E_Low();

	// Wait 10 ms (min.100 us demanded according to the data sheet)
	//vTaskDelayUntil(&xLastWakeTime, 10);
	_delay_ms(10);
	// Function set (still 8 bit interface)
	PORT_lcd = 0b00110000;
	E_High();
	E_Low();

	// Wait 10 ms (min.100 us demanded according to the data sheet)
	//vTaskDelayUntil(&xLastWakeTime, 10);
	_delay_ms(10);
	// Function set (now selecting 4 bit interface !)
	// - and polling the busy flag will now be possible
	PORT_lcd = 0b00100000;
	E_High();
	E_Low();

	// Function Set : 4 bit interface, 2 line display, 5x8 dots
	sendInstruction( 0b00101000 );
	// Display, cursor and blinking OFF
	sendInstruction( 0b00001000 );
	// Clear display and set DDRAM adr = 0
	sendInstruction( 0b00000001 );
	// By display writes : Increment cursor / no shift
	sendInstruction( 0b00000110 );
	// Display ON, cursor and blinking OFF
	sendInstruction( 0b00001110 );
}

// Blanks the display and sets "current display position" to
// the upper line, leftmost character
void LCDClear()
{
	// Clear display and set DDRAM adr = 0
	sendInstruction( 0b00000001 );	
}

// Sets DDRAM address to character position x and line number y
void LCDGotoXY( unsigned char x, unsigned char y )
{
	if(y)
		sendInstruction(0b10000000 | 64 | x);
	else
		sendInstruction(0b10000000 | x);
}

// Display "ch" at "current display position"
void LCDDispChar( char ch )
{
	sendData(ch);
}

// Displays the string "str" starting at "current display position"
void LCDDispString( char* str )
{
	for(int i = 0 ; i < 32 ; i++)
	{
		if(str[i] == '\0')
			break;
		sendData(str[i]);		
	}
}

// Displays the value of integer "i" at "current display position"
void LCDDispInteger( int i )
{
	char arr[3];
	itoa(i, arr, 10);
	LCDDispString(arr);
}

// Loads one of the 8 user definable characters (UDC) with a dot-pattern,
// pre-defined in an 8 byte const array
void LCDLoadUDC( unsigned char UDCNo, const unsigned char *UDCTab )
{
	int i;
	unsigned char CGRam = 0b00000001;
	sendInstruction(((CGRam<<3) | UDCNo)<<3 ); 
	
	for(i = 0 ; i < 8 ; i++)
	{
		sendData(UDCTab[i]);
	}
	
	LCDGotoXY(0,0);
}

// Selects, if the cursor has to be visible, and if the character at
// the cursor position has to blink.
// "cursor" not 0 => visible cursor.
// "blink" not 0 => the character at the cursor position blinks.
void LCDOnOffControl( unsigned char cursor, unsigned char blink )
{
	unsigned char x = 0b00000011<<1 | cursor;
	x = x<<1 | blink;
	sendInstruction( x );
}

// Moves the cursor to the left
void LCDCursorLeft()
{
	sendInstruction( 0b00010000 );
}

// Moves the cursor to the right
void LCDCursorRight()
{
	sendInstruction( 0b00010100 );
}

// Moves the display text one position to the left
void LCDShiftLeft()
{
	sendInstruction( 0b00011000 );
}

// Moves the display text one position to the right
void LCDShiftRight()
{
	sendInstruction( 0b00011100 );
}