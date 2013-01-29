// DynamicLoading.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "LAB1.h"
#include <iostream>
#include <string>


int _tmain(int argc, _TCHAR* argv[])
{
	int a = LAB::AddDoubles(2.1, 1.9);
	char* first = "2.1";
	char* second = "1.9";
	std::string third = "2.1";
	std::string fourth = "1.9";

	int b = LAB::AddCharStrings(first, second);
	int c = LAB::AddCharStrings(third, fourth);
	

	std::cout << a << " " << b << " " << c << std::endl;
	std::cin >> a;
}

