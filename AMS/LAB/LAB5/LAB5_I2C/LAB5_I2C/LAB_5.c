/************************************************
*  AMS: LAB16                                   * 
*  LM75 and the Mega32 2-wire Interface         *
*                                               *
*  STK500 setup:                                *
*    Header "RS232 spare" connected to RXD/TXD: *
*      RXD = PORTD, bit0                        *
*      TXD = PORTD, bit1                        *
*    I2C data bus (LM75 slaves):                *
*      SCL connected to PORTC, bit0             *
*      SDA connected to PORTC, bit1             *
*    Two LM75 slaves powered from STK500:       *
*      Address no.1 = 0.                        *
*      Address no.2 = 7.                        *
*                                               *
*   Henning Hargaard, January 11, 2012          * 
*************************************************/
#include <avr/io.h>
#define F_CPU 3686400
#include <avr/delay.h>
#include "uart.h"

#define PRESCALER 0b00000011 

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

// The (positive) temperatures is send to the terminal
// Format: "T1 = xx,x C  T2 = xx,x C"
// Temp1 and Temp2 = 1/2 of centigrades
void PrintTemperatures(/*int temp1, */int temp2)
{
	/*
  SendString("First sensor is: ");
  SendInteger(temp1>>1);
  if(temp1 % 2 != 0)
  {
	  SendChar(',');
	  SendInteger(5);
  }
  SendChar('\n');
  SendChar('\r');
  */
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

// Reads the temperature register from specified sensor
// SensorAddress is between 0 and 7
int LM75_temperature(unsigned char SensorAddress)
{
	int retValue;
	
	//SendString("Start reading");
	//SendChar('\n');
	//SendChar('\r');
	i2c_start();
	
	//SendString("Writing to address");
	//SendChar('\n');
	//SendChar('\r');
	unsigned char address = ((0b01001000 | SensorAddress) << 1) | 0x01;
	i2c_write(address); //Address write
	//i2c_write(0); //Pointer byte
	
	//i2c_start();
	//address |= 0x01;
	//i2c_write(address); //Read
	////
	//SendString("Read MSB bytes");
	//SendChar('\n');
	//SendChar('\r');
	unsigned char tempMSB = i2c_read(0x00); 
	
	//SendString("Read LSB bytes");
	//SendChar('\n');
	//SendChar('\r');
	unsigned char tempLSB = i2c_read(0x01);
	
	//SendString("Stopping to read");
	//SendChar('\n');
	//SendChar('\r');
	i2c_stop();
//
	//SendString("Returning value");
	//SendChar('\n');
	//SendChar('\r');
	//
		retValue = (tempLSB>>7) | (tempMSB<<1);
				
		
	return retValue;
}

int main()
{
  // Initialize the 2 wire interface
  i2c_init(); 
  // Initialize the display
  InitUART(9600,8);
  int counter = 0;
  while (1)
  {
	  SendString("Read number: ");
	  SendInteger(counter);
	  SendChar('\n');
	  SendChar('\r');
    // Read and display the temperature of sensor #0 and #7
    PrintTemperatures(LM75_temperature(7));
    // Avoid self heating
    _delay_ms(500);
	counter++;
  }  
}