/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>
#include <string.h>
#include "../Ello_World_bsp/system.h"
#include "../Ello_World_bsp/drivers/inc/altera_avalon_lcd_16207.h"
#include "altera_avalon_pio_regs.h"

#define STR_EXPAND(tok) #tok
#define STR(tok) 		STR_EXPAND(tok)
#define SET_POS(y,x) 	"\x1B[" STR(y) ";" STR(x) "H"
#define CLR_LINE() 		"\x1B[K"

int main()
{
  printf("Ready!\n");

  char buffer1[80];
  char buffer2[80];
  char buffer3[80];

  while(1)
  {
	  scanf("%s%s%s", buffer1, buffer2, buffer3);

	  if (!strcmp(buffer1, "exit"))
		  return 0;

	  if (!strcmp(buffer1, "get"))
	  {
		  long switches = IORD_ALTERA_AVALON_PIO_DATA(PIO_INPUT_0_BASE);
		  printf("Switch in decimal: %d\n", switches);
	  }

	  if(!strcmp(buffer1, "set"))
	  {
		  if(!strcmp(buffer2, "led"))
		  {
			  IOWR_ALTERA_AVALON_PIO_DATA(PIO_OUTPUT_0_BASE, atoi(buffer3));
		  }

		  if(!strcmp(buffer2, "lcd1"))
		  {
			  FILE* fp;
			  fp = fopen(LCD_0_NAME, "w");
			  if(fp != NULL)
			  {
				  fprintf(fp, SET_POS(1,1));
				  fprintf(fp, CLR_LINE());
				  fprintf(fp, buffer3);
				  fclose(fp);
			  }
			  else
				  printf("Could not write to %s \n", LCD_0_NAME);
		  }

		  if(!strcmp(buffer2, "lcd2"))
		  {
			  FILE* fp;
			  fp = fopen(LCD_0_NAME, "w");
			  if(fp != NULL)
			  {

				  fprintf(fp, SET_POS(2,1));
				  fprintf(fp, CLR_LINE());
				  fprintf(fp, buffer3);
				  fclose(fp);
			  }
			  else
				  printf("Could not write to %s \n", LCD_0_NAME);
		  }
	  }
  }

  return 0;
}
