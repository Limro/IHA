// RunTimeLinking.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include <string>
#include <windows.h>
#include <stdio.h>

int _tmain(int argc, _TCHAR* argv[])
{
	typedef double (*LPFNDLLFUNC1)(double, double);
	typedef double (*LPFNDLLFUNC2)(char*, char*);
	typedef double (*LPFNDLLFUNC3)(std::string, std::string);

	LPFNDLLFUNC1 func1;    // Function pointer
	LPFNDLLFUNC2 func2;    // Function pointer
	LPFNDLLFUNC3 func3;    // Function pointer

	std::wstring dllFile = TEXT("LAB1.dll");

	HINSTANCE hDLL = LoadLibrary(dllFile.c_str());
	if (hDLL != NULL)
	{
		func1 = (LPFNDLLFUNC1)GetProcAddress(hDLL, "AddDoubles");
		func2 = (LPFNDLLFUNC2)GetProcAddress(hDLL, "AddCharStrings");
		func3 = (LPFNDLLFUNC3)GetProcAddress(hDLL, "AddStrings");

	   if (func1 == NULL)
	   {
		  // handle the error
		  FreeLibrary(hDLL);
		  return -1;
	   }
	   else
	   {
			double d = func1(1.2, 2.8);
			double e = func2((char*)"2.1", (char*)"1.9");
			double f = func3((std::string)"2.1", (std::string)"1.9");
			std::cout << d << " " << e << " " << f << std::endl;
			getchar();
	   }
	   FreeLibrary(hDLL);
	}
}
