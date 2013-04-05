#include "HEX.h"

int BCDto7Seg(int bcd)
{
	return bcd%10
				+(((bcd%100)/10)*16)
				+(((bcd%1000)/100)*16*16)
				+(((bcd%10000)/1000)*16*16*16);
};

void printBCDon7Seg(int bcd)
{
	// Update HEX-LEDs
	IOWR_16DIRECT(MM_BUS_SEVEN_SEG_FOUR_DIGIT_0_BASE, 2, BCDto7Seg(bcd));
}
