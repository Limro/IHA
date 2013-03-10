#include <avr/io.h>
#include <util/delay.h>

#define PRESCALER 0b00000011 

void i2c_init();
void i2c_start();
void i2c_write(unsigned char data);
unsigned char i2c_read (unsigned char isLast);
void i2c_stop();
int LM75_temperature(unsigned char SensorAddress);