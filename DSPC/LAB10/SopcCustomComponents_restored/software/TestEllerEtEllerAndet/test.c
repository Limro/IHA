/*
*
* KBE/1. November 2010
*
* SoPC Demo program for simple access to LED's, Switches and LCD display
*
* Using the JTAG UART as console for sending commands:
* led <value> -> setting decimal value (0-255) on PIO_OUTPUT_0_BASE
* sw -> reads switch (0-7) from PIO_INPUT_BASE
* lcd <text> -> prints text on second line of LCD display
*/

#include <stdio.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "system.h"
#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_timestamp.h"
#include "io.h"

#define CMD_LEN 100

#define STR_EXPAND(tok) #tok
#define STR(tok)        STR_EXPAND(tok)
// Moves the cursor to the y,x position specified - counted from top left corner
#define SET_POS(y,x)    "\x1b[" STR(y) ";" STR(x) "H"
// Clears from current position to end of line
#define CLR_LINE()      "\x1b[K"
// Clears the whole screen
#define CLR_SCR()       "\x1b[2J"

// Matrix size
#define MSIZE 4

typedef union {
  unsigned char comp[MSIZE];
  unsigned int vect;
  } vectorType;

typedef vectorType VectorArray[MSIZE];

void setInputMatrices(VectorArray A,VectorArray B);
void displayMatrix(VectorArray input);
void multiMatrixSoft(VectorArray A,VectorArray B, VectorArray P);
void multiMatrixHard(VectorArray A,VectorArray B, VectorArray P);
int BSDConverter(unsigned char input);

void setInputMatrices(VectorArray A,VectorArray B)
{
	A[0].vect = 0x04030201;
	B[0].vect = 0x01010101;
	A[1].vect = 0x08070605;
	B[1].vect = 0x02020202;
	A[2].vect = 0x0C0B0A09;
	B[2].vect = 0x03030303;
	A[3].vect = 0x100F0E0D;
	B[3].vect = 0x04040404;
}

void displayMatrix(VectorArray input)
{
	printf("Matrix :\n");
	printf("%2d %2d %2d %2d\n", input[0].comp[0],
			                	input[0].comp[1],
			                	input[0].comp[2],
			                	input[0].comp[3]);
	printf("%2d %2d %2d %2d\n", input[1].comp[0],
			                	input[1].comp[1],
			                	input[1].comp[2],
			                	input[1].comp[3]);
	printf("%2d %2d %2d %2d\n", input[2].comp[0],
			                	input[2].comp[1],
			                	input[2].comp[2],
			                	input[2].comp[3]);
	printf("%2d %2d %2d %2d\n", input[3].comp[0],
			                	input[3].comp[1],
			                	input[3].comp[2],
			                	input[3].comp[3]);

}

void multiMatrixSoft(VectorArray A,VectorArray B, VectorArray P)
{
	int row, col, k;
	for (row = 0; row < MSIZE; row++)
	{
		for (col = 0; col < MSIZE; col++)
		{
			P[row].comp[col] = 0;
			for (k = 0; k < MSIZE; k++)
				P[row].comp[col] += A[row].comp[k] * B[col].comp[k];
		}
	}

}

void multiMatrixHard(VectorArray A,VectorArray B, VectorArray P)
{
	int row, col, k;
	for (row = 0; row < MSIZE; row++)
	{
		for (col = 0; col < MSIZE; col++)
		{
			P[row].comp[col] = ALT_CI_VECTOR_MULT_INST( A[row].vect, B[col].vect);
		}
	}

}


//////////////////////////////////////////////////////////

int main()
{
	char cmd[CMD_LEN];
	char text[CMD_LEN];
	char* msg = "\x1b[1;1HSoPC Demo";
	unsigned char i_value;
	FILE *fp;
	VectorArray AInst;
	VectorArray BTinst;
	VectorArray PInst;
	alt_u32 time1;
	alt_u32 time2;

	if (alt_timestamp_start() < 0)
    {
	  printf ("No timestamp device available\n");
    }

	// Opens LCD display driver
	fp = fopen (LCD_0_NAME, "w");
	if (fp==NULL)
	{
		printf("Could not open LCD driver\n");
	}
	else
		fprintf(fp, "%s", msg);

	// Set LED pattern
	IOWR_ALTERA_AVALON_PIO_DATA(PIO_OUTPUT_0_BASE, 0xAA);
	IOWR_ALTERA_AVALON_PIO_DATA(PIO_OUTPUT_1_BASE, 0x55);

	// Nios II Console welcome text
	printf("Demo SoPC program\n");
	printf("Enter command: ledr <value> | ledg <value> | sw | lcd <text> | mult <value>\n\n");

	while(1)
	{
		printf("CMD:\> ");
		scanf(" %s", &cmd);

		if (!strcmp(cmd, "mult")) // LED command
		{
			setInputMatrices(AInst, BTinst);
			displayMatrix(AInst);
			displayMatrix(BTinst);
			scanf(" %d", &i_value);

			switch (i_value)
			{
			case 1:
				time1 = alt_timestamp();
				multiMatrixSoft(AInst, BTinst, PInst);
				time2 = alt_timestamp();
				printf("SW time: %d\n", time2-time1);
				displayMatrix(PInst);
				break;
			case 2:
				time1 = alt_timestamp();
				multiMatrixHard(AInst, BTinst, PInst);
				time2 = alt_timestamp();
				printf("HW time: %d\n", time2-time1);
				displayMatrix(PInst);
				break;
			default:
				printf("mult: invalid parameter");
				break;
			}

		}

		if (!strcmp(cmd, "ledr")) // LED command
		{
			scanf(" %d", &i_value);
			// Writes to memory mapped PIO block
			IOWR_ALTERA_AVALON_PIO_DATA(PIO_OUTPUT_0_BASE, i_value); //
			printf("LED Red val:%d\n",i_value);
		}

		if (!strcmp(cmd, "ledg")) // LED command
		{
			scanf(" %d", &i_value);
			// Writes to memory mapped PIO block
			IOWR_ALTERA_AVALON_PIO_DATA(PIO_OUTPUT_1_BASE, i_value);
			printf("LED Green val:%d\n",i_value);
		}

		if (!strcmp(cmd, "sw")) // Switch command
		{
			// Reads from memory mapped PIO block
			printf("SW val: %02X\n", IORD_ALTERA_AVALON_PIO_DATA(PIO_INPUT_0_BASE));
		}

		if (!strcmp(cmd, "lcd")) // LCD command
		{
			// Uses SW driver to access LCD block
			scanf(" %s", &text);
			fprintf(fp, CLR_SCR()); // VT100 control command clear screen
			fprintf(fp, SET_POS(1,1));
			fprintf(fp, "%s", text);
		}

		if (!strcmp(cmd, "cnt")) // Counter command
		{
			// Reads from memory mapped PIO block
			// printf("Counter val: %d\n", IORD_16DIRECT(MM_BUS_COUNTER_0_BASE, 0));
		}

		if (!strcmp(cmd, "reset")) // Reset command
		{
			// Writes a reset to counter
			//IOWR_ALTERA_AVALON_PIO_DATA(MM_BUS_COUNTER_0_BASE + 1, 0);
		}

		if(!strcmp(cmd, "hex"))
		{
			scanf(" %d", &i_value);
			char * pEnd;
			IOWR_16DIRECT(MM_BUS_SEVEN_SEG_FOUR_DIGIT_1_BASE, 0, strtol(i_value, &pEnd,16));
		}

		usleep(10000); // Busy waiting 1 sec.
	}

	fclose (fp);

}

int BSDConverter(unsigned char input)
{
	int buffer;
	buffer = input/100 << 8;
	buffer = buffer | (input % 100);

	buffer = buffer/10 << 4;
	buffer = buffer | (buffer % 10);
	return buffer;
}
