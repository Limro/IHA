// DynamicLoading.cpp : Defines the entry point for the console application.

#include "stdafx.h"
#include "LAB1.h"
#include <iostream>
#include <string>
#include <conio.h>

int _tmain(int argc, _TCHAR* argv[])
{
	int a = LAB::AddDoubles(2.1, 1.9);
	int b = LAB::AddCharStrings((char*)"2.1", (char*)"1.9");
	int c = LAB::AddStrings((std::string)"2.1", (std::string)"1.9");
	std::cout << a << " " << b << " " << c << std::endl;
	getch();
}