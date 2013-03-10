/************************************************
*  STK500 setup:								*
*    I2C data bus (LM75 slaves):                *
*      SCL connected to PORTC, bit0             *
*      SDA connected to PORTC, bit1             *
*	   GND connected to PORTC, bit8				*
*	   VCC connected to PORTC, bit9				*
*  LM75 setup									*
*	 A2 = Top									*
*	 A1 = Top									*
*	 A0 = Top									*
*************************************************/
#include "LM75.h"

void i2c_init()
{
  // ---> Write code here to initialize the TWBR register
  // LM75 clock has be to be lower than 400 kHz (according to LM75 data sheet) 
  // The TWBR must be at least 10 in master mode (Mega32 data book)
  TWBR = 0b00010000; //16
  TWSR = 0b00000000; //1 bit
}

void i2c_start()
{
  TWCR = (1<<TWINT) | (1<<TWSTA) | (1<<TWEN);
  while ((TWCR & (1<<TWINT)) == 0)
  {}  	
}

void i2c_write(unsigned char data)
{
  TWDR = data;
  TWCR = (1<<TWINT) | (1<<TWEN);
  while ((TWCR & (1<<TWINT)) == 0)
  {}	
}

unsigned char i2c_read (unsigned char isLast)
{
  if (isLast == 0) //If we want to read more than 1 byte
    TWCR = (1<<TWINT) | (1<<TWEN) | (1<<TWEA);
  else             //If we want to read only one byte
    TWCR = (1<<TWINT) | (1<<TWEN);
	
  while ((TWCR & (1<<TWINT)) == 0)
  {}
  return TWDR;
}

void i2c_stop()
{
  TWCR = (1<<TWINT) | (1<<TWEN) | (1<<TWSTO);
}

/*
// The (positive) temperatures is send to the terminal
// Format: "T1 = xx,x C  T2 = xx,x C"
// Temp1 and Temp2 = 1/2 of centigrades
void PrintTemperatures(int temp2)
{
    SendString("Second sensor is: ");
    SendInteger(temp2 >> 1);
    if(temp2 % 2 != 0)
    {
	    SendChar(',');
	    SendInteger(5);
    }
	SendChar('\n');
	SendChar('\r');
	SendChar('\n');
	SendChar('\r');
	
}
*/

// Reads the temperature register from specified sensor
int LM75_temperature(unsigned char SensorAddress)
{
	i2c_start();
	
	unsigned char address = ((0b01001000 | SensorAddress) << 1) | 0x01;
	i2c_write(address); //Address write
	
	unsigned char tempMSB = i2c_read(0x00); 
	
	unsigned char tempLSB = i2c_read(0x01);
	
	i2c_stop();
	
	return (tempLSB>>7) | (tempMSB<<1);
}