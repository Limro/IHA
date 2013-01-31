// LAB1.cpp : Defines the exported functions for the DLL application.
//

#include "stdafx.h"
#include "LAB1.h"
#include <stdlib.h>
//#include <string>


// This is an example of an exported variable
// LAB1_MATH int nLAB1=0;

namespace LAB
{
	LAB1_MATH double AddDoubles(double a, double b)
	{
		return a + b;
	}

	LAB1_MATH double AddCharStrings(char* a, char* b)
	{
		return atof(a) + atof(b);
	}

	LAB1_MATH double AddStrings(std::string a, std::string b)
	{
		return stod(a) + stod(b);
	}
};