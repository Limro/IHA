/********************************************************
* "SWITCH.C":                                           *
* Implementation file for the STK500 SWITCH PORT driver.*
* The SWITCHES are connected to the PA pins.            *
* Henning Hargaard, 19/10 2011                          *
*********************************************************/
#include <avr/io.h>

#define MAX_SWITCH_NR 7

// Prepare the switch port
void initSwitchPort()
{
  // Switch port (PA pins) = All inputs
  DDRA = 0;	
}

// Reads all switches at a time
unsigned char switchStatus()
{
  return (~PINA);	
}

// Returns TRUE, if the switch having the number
// "switch_nr" is activated - otherwise return FALSE
unsigned char switchOn(unsigned char switch_nr)
{
unsigned char mask;
  if (switch_nr <= MAX_SWITCH_NR)
  {
    mask = 0b00000001 << switch_nr;
    return (~PINA & mask);
  }
  else
    return 0;	
} 
