/**********************************************************
* "SWITCH.H":                                             *
* Header file for STK500 SWITCH panel driver (8 switches).*
* The SWITCH panel is connected to the PA pins.           *
* Henning Hargaard, 19/10 2011                            *
***********************************************************/
void initSwitchPort();
unsigned char switchStatus();
unsigned char switchOn(unsigned char switch_nr);
/**********************************************************/