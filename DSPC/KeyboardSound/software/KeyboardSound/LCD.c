#include "LCD.h"

void writeToLCD(char* str, char line)
{
	FILE* fp = fopen(LCD_0_NAME,"w");
	if(fp != NULL)
	{
		fprintf(fp,SET_POS(%u,1),line);	// move cursor to
		fprintf(fp,CLR_LINE());			// clear the line
		fprintf(fp,str);				// write the string
		fclose(fp);
	} else {
		printf("Error using %s! Trying to write \"%s\" to line %u\n",LCD_0_NAME,str,line);
	}
}
