#include <stdio.h>
#include <stdlib.h>
#include "sys/alt_timestamp.h"
#include "alt_types.h"
#include "system.h"

typedef union {
  unsigned char comp[4];
  unsigned int vect;
  } vectorType;

typedef vectorType VectorArray[4];

void setInputMatrices(VectorArray A,VectorArray B);
void displayMatrix(VectorArray input);
void multiMatrixSoft(VectorArray A,VectorArray B, VectorArray P);
void multiMatrixHard(VectorArray A,VectorArray B, VectorArray P);

int main()
{
	//VectorArray A[4], B[4];

	VectorArray A =
	{		{ 1,  2,  3,  4},
			{ 5,  6,  7,  8},
			{ 9, 10, 11, 12},
			{13, 14, 15, 16} };

	VectorArray B = {
			{1, 1, 1, 1},
			{2, 2, 2, 2},
			{3, 3, 3, 3},
			{4, 4, 4, 4} };

	VectorArray C, D;
/*
	int i, j;
	unsigned char number;
	number = 1;

	for(i = 0 ; i < 4 ; i++)
	{
		for(j = 0 ; j < 4 ; j++)
		{
			C[i].comp[j] = number;
			number++;
		}
	}

	number = 1;

	for(i = 0 ; i < 4 ; i++)
	{
		for(j = 0 ; j < 4 ; j++)
		{
			D[i].comp[j] = number;
		}
		number++;
	}
*/
/*
    //Display the 4 different VectorArrays
     *
	printf("VectorArray Output:");
	displayMatrix(A);
	printf("\n\n");
	displayMatrix(B);
	printf("\n\n");
	displayMatrix(C);
	printf("\n\n");
	displayMatrix(D);
*/

	//Multiply two VectorArrays
	displayMatrix(A);
	printf("\n\n      X\n");
	displayMatrix(B);
	printf("\n\n      =\n");
	multiMatrixSoft(A, B, C);
	displayMatrix(C);

	return 0;
}

void displayMatrix(VectorArray array)
{
	int i, j;
	for(i = 0 ; i < 4 ; i++ )
	{
		printf("\n%c", '|');

		for(j = 0 ; j < 4 ; j++)
		{
			signed int output = array[i].comp[j];
			if(output / 10 < 1)
				printf(" ");
			printf("%i", output);
			printf("%c", '|');
		}
	}
}

void multiMatrixSoft(VectorArray A,VectorArray B, VectorArray P)
{
	int a, b, pj;

	for(a = 0; a < 4; a++)
	{
		for(pj = 0 ; pj < 4 ; pj++)
		{
			P[a].comp[pj] = 0;

			for(b = 0 ; b < 4 ; b++)
			{
				P[a].comp[pj] += (A[a].comp[b]) * (B[pj].comp[b]);
			}
		}
	}
}





