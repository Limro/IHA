#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "../MyFirstProj_bsp/system.h"

int main()
{
  printf("Hello from Nios II!\n");
  printf("Enter something!");

  char buffer1[80] = "";
  char buffer2[80] = "";
  char buffer3[3] = "";

  scanf("%s %s %s", buffer1, buffer2, buffer3);

  if (!strcmp(buffer1,"get"))
	  printf("It’s a get cmd and the target is: %s", buffer2);
  if(!strcmp(buffer1, "set"))
  {
	  printf("Setting new stuff\n");
	  int i = atoi(buffer3);
  }


  FILE* fp = fopen (LCD_0_NAME, "w");

  printf("That's it - cya");
  return 0;
}
