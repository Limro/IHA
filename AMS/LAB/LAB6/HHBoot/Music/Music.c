/*
 * Music.c
 *
 * Created: 14-02-2013 09:46:16
 *  Author: Becks Laptop
 */ 


#include <avr/io.h>
#include <avr/delay.h>

#define c (3686400/(261.7*2*1))-1
#define d (3686400/(293.7*2*1))-1
#define e (3686400/(329.7*2*1))-1
#define f (3686400/(349.2*2*1))-1
#define g (3686400/(392*2*1))-1
#define a (3686400/(447*2*1))-1
#define h (3686400/(493.9*2*1))-1
#define C (3686400/(523.3*2*1))-1

char* melodiPtr;
char playing = 0;

char melodi_1[] = "cdef-gahhC-";
char melodi_2[] = "c-d-e-f-g-a-h-C--";

void startMelodi(char* mPtr)
{
	while(playing != 0)
{}
	startTone(*mPtr);
	melodiPtr = mPtr;
	melodiPtr++;
	playing = 1;
}

void startTone(char tone)
{
	switch(tone)
	{
		case 'c':
			OCR1A = c;
			break;
		case 'd':
			OCR1A = d;
			break;
		case 'e':
			OCR1A = e;
			break;
		case 'f':
			OCR1A = f;
			break;
		case 'g':
			OCR1A = g;
			break;
		case 'a':
			OCR1A = a;
			break;
		case 'h':
			OCR1A = h;
			break;
		case 'C':
			OCR1A = C;
			break;
        /*case '-':
            DDRD.5 = 0;
            break;*/  
        default:
            break;
	}
	
    if(tone != '-')
	{
		// DDRD.5 = 0;
        TCCR1A |= 0b01000000;
	}
	TIMSK = 0b00000001;
}

void stopTone()
{
	TCCR1A &= 0b10111111;
}


int main(void)
{
	DDRD = 0x01 << 5;
	
    while(1)
    {
        
        startMelodi(melodi_1);
        startMelodi(melodi_2);
    }
}