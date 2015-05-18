#pragma once

//#include <iostream>
#include <bitset>

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#define DATA_LENGTH 8
#define OUTPUT_SIZE 7

using namespace std;

char* SliceBits(uint8_t* data, uint8_t compressBits)
{
	unsigned int  i = 0;
	unsigned int indexer = 0;
	unsigned int arrIndex = 0;
	unsigned int work[8] = { 0 }; // work[64 - (compressBits * 8)];
	unsigned int* output = malloc(OUTPUT_SIZE);

	for (arrIndex = 0; arrIndex < DATA_LENGTH; arrIndex++) // Less than 8
	{
		unsigned int searchIndex;
		unsigned int byte[DATA_LENGTH] = { 0 };								// To store each byte 
		_itoa_s(data[arrIndex], byte, DATA_LENGTH, 2); 				// To binary

		for (searchIndex = 0; searchIndex < 8; searchIndex++)
		{
			if (byte[searchIndex] == '\0')
				break;
		}

		byte = (byte >> (8 - searchIndex)); //This is illigal?

		printf("Byte[%i]: %s ", arrIndex, byte);
		printf(" - Should be %i \n", data[arrIndex]);

		for (i = 0; i < DATA_LENGTH; i++)			// For each byte
		{
			if (i < OUTPUT_SIZE)						// If it's not a bit to cut away
			{
				work[indexer] = byte[i];					// Store the bit
				indexer++;												// Increase saved index variable

				printf("work[%d] = %s \n", i, byte[i]);
				//	printfflush();
			}
		}
	}
	output = work;

	return output;
}


int main()
{
	/*printf("Characters: %c %c \n", 'a', 65);
	printf("Decimals: %d %ld\n", 1977, 650000L);
	printf("Preceding with blanks: %10d \n", 1977);
	printf("Preceding with zeros: %010d \n", 1977);
	printf("Some different radices: %d %x %o %#x %#o \n", 100, 100, 100, 100, 100);
	printf("floats: %4.2f %+.0e %E \n", 3.1416, 3.1416, 3.1416);
	printf("Width trick: %*d \n", 5, 10);
	printf("%s \n", "A string");*/

	uint8_t data[8] = { 3, 2, 2, 2, 2, 2, 2, 2 }; //4, 8, 16, 32, 64, 128};
	char *output;
	uint8_t i;
	output = SliceBits(data, 1);

	getchar();
}