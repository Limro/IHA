/**************************************************
* "uart.c":                                       *
* Simple polled Mega32 UART driver.               *
*                                                 *
* Henning Hargaard, 13/1 2012                     *
***************************************************/
#include <avr/io.h>
#include "uart.h"

// Constants
#define XTAL 3686400  

__attribute__ ((section (".uart")))
void InitUART()
{
  // "Normal" clock, no multiprocessor mode (= default)
  UCSRA = 0b00100000;
  // No interrupts enabled
  // Receiver enabled
  // Transmitter enabled
  UCSRB = 0b00011000;	
  // Asynchronous operation, 1 stop bit, no parity
  // 8 data bits
  UCSRC = 0b100001101;
  //Baud rate = 115200
  // Write upper part of UBRR
  UBRRH = ((XTAL/16)/115200 - 1) >> 8;
  // Write lower part of UBRR
  UBRRL = ((XTAL/16)/115200 - 1);
}


/*************************************************************************
Awaits new character received.
Then this character is returned.
*************************************************************************/
__attribute__ ((section (".uart")))
char ReadChar()
{
  // Wait for new character received
  while ( (UCSRA & (1<<7)) == 0 )
  {}                        
  // Then return it
  return UDR;
}

/*************************************************************************
Awaits transmitter-register ready.
Then it send the character.
Parameter :
	Ch : Character for sending. 
*************************************************************************/
__attribute__ ((section (".uart")))
void SendChar(char Ch)
{
  // Wait for transmitter register empty (ready for new character)
  while ( (UCSRA & (1<<5)) == 0 )
  {}
  // Then send the character
  UDR = Ch;
}