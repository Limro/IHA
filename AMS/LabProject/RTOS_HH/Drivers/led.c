/*************************************************
* "LED.C":                                       *
* Implementation file for the STK500 LED driver. *
* The LEDs are connected to PC pins.             *
**************************************************/
#include <avr/io.h>

#define MAX_LED_NR 7
#define LCD_PORT PORTB
#define LCD_DDRX DDRB

void initLEDport()
{
  // All PORTC pins are outputs 
  LCD_DDRX = 0b11111111;
  // Turn off all LEDs
  LCD_PORT = 0xFF;     
}

void writeAllLEDs(unsigned char pattern)
{
  // Fetch the parameter, invert all bits, and send to LEDs
  // The bits has to be inverted, because HW dictates 
  // a 0 will turn ON a LED
  LCD_PORT = ~pattern;   
}

void turnOnLED(unsigned char led_nr)
{
// Local variable
unsigned char mask;
  // We only have to do anything, if led_nr < 8
  if (led_nr <= MAX_LED_NR)
  {
    // Create mask based on the parameter (led_nr)
    mask = ~(0b00000001 << led_nr);
    // Turn ON the actual LED (the rest are unchanged)
    LCD_PORT = LCD_PORT & mask;
  }   
}

void turnOffLED(unsigned char led_nr)
{
// Local variable
unsigned char mask;
  // We only have to do anything, if led_nr < 8
  if (led_nr <= MAX_LED_NR)
  {
    // Create mask based on the parameter (led_nr)
    mask = 0b00000001 << led_nr;
    // Turn OFF the actual LED (the rest are unchanged)
    LCD_PORT = LCD_PORT | mask;
  }
}

void toggleLED(unsigned char led_nr)
{
// Local variable
unsigned char mask;
  // We only have to do anything, if led_nr < 8
  if (led_nr <= MAX_LED_NR)
  {
    // Create mask based on the parameter (led_nr)
    mask = 0b00000001 << led_nr;
    // Toggle the actual LED (the rest are unchanged)
    LCD_PORT = LCD_PORT ^ mask;
  }  
}
