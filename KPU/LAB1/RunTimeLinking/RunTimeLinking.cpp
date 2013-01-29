// RunTimeLinking.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include <string>
#include <windows.h>
#include <stdio.h>

int _tmain(int argc, _TCHAR* argv[])
{
	typedef double (CALLBACK* LPFNDLLFUNC1)(double, double);
	typedef double (CALLBACK* LPFNDLLFUNC2)(char*, char*);
	typedef double (CALLBACK* LPFNDLLFUNC3)(std::string, std::string);

	LPFNDLLFUNC1 func1;    // Function pointer
	LPFNDLLFUNC2 func2;    // Function pointer
	LPFNDLLFUNC3 func3;    // Function pointer

	HINSTANCE hDLL = LoadLibrary("LAB1.dll");
	if (hDLL != NULL)
	{
		func1 = (LPFNDLLFUNC1)GetProcAddress(hDLL, "AddDoubles");
		func2 = (LPFNDLLFUNC2)GetProcAddress(hDLL, "AddCharStrings");
		func3 = (LPFNDLLFUNC3)GetProcAddress(hDLL, "?AddCharStrings@LAB@@YANV?$char_traits@D@std@@V?allocator@D@2@@std@@0@Z");

	   if (func1 == NULL)
	   {
		  // handle the error
		  FreeLibrary(hDLL);
		  return -1;
	   }
	   else
	   {
			int d = func1(1.2, 2.8);
			int e = func2((char*)"2.1", (char*)"1.9");
			int f = func3((char*)"2.1", (char*)"1.9");
			std::cout << d << " " << e << " " << f << std::endl;
	   }
	}
	int a = 0;
	std::cin >> a;
}

