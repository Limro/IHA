#include <avr/io.h>
#include <avr/delay.h>
#include <avr/interrupt.h>

#define ANTAL_OVERFLOWS 4
#define c (3686400/(261.7*2*1))-1
#define d (3686400/(293.7*2*1))-1
#define e (3686400/(329.7*2*1))-1
#define f (3686400/(349.2*2*1))-1
#define g (3686400/(392*2*1))-1
#define a (3686400/(447*2*1))-1
#define h (3686400/(493.9*2*1))-1
#define C (3686400/(523.3*2*1))-1
	
char melodi_1[] = "cdef-gahhC-";
char melodi_2[] = "c-d-e-f-g-a-h-C--";

char* melodiPtr;
char playing = 0;
unsigned char overflow_cnt = 0;
    
void initTimer0()
{
	//1024 prescaler, normal mode
	TCCR0 = 0b00000101;
}

void initTimer1()
{
	DDRD |= (1<<PB5);
	TCCR1A = 0b00000000;
	TCCR1B = 0b00001001;  
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

void startMelodi(char* mPtr)
{
	while(playing != 0)
	{}
	startTone(*mPtr);
	melodiPtr = mPtr;
	melodiPtr++;
	playing = 1;
}

ISR(TIMER0_OVF_vect)
{
	overflow_cnt++;
	
	if(overflow_cnt == ANTAL_OVERFLOWS)
	{
		if( *melodiPtr == '-')
		{	
			stopTone();
			melodiPtr++;
		}
		else if(*melodiPtr == '\0')
		{
			stopTone();
			TIMSK = 0b00000000;
			playing = 0;
		}
        else
        {
            startTone(*melodiPtr);
            melodiPtr++;
        } 
    overflow_cnt = 0;
	}
}

void main(void)
{
  // Klargør timer 0
  initTimer0();
  // Klargør timer 1
  initTimer1();
  
  SREG = 128;
  // Enable global interrupt
  sei();
	
  while (1)
  {
    startMelodi(melodi_1);  
    startMelodi(melodi_2);
  }
}
