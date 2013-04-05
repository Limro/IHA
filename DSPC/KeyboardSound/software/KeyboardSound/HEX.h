#ifndef _HEX_H_INCLUDED
#define _HEX_H_INCLUDED

#include "altera_avalon_pio_regs.h"
#include "system.h"

/* Function declarations */
int BCDto7Seg(int bcd);

void printBCDon7Seg(int bcd);

#endif // _HEX_H_INCLUDED
