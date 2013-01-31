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

	HINSTANCE hDLL = LoadLibrary(TEXT("LAB1.dll")); //(LPCWSTR)
	if (hDLL != NULL)
	{
		func1 = (LPFNDLLFUNC1)GetProcAddress(hDLL, "?AddDoubles@LAB@@YANNN@Z");
		func2 = (LPFNDLLFUNC2)GetProcAddress(hDLL, "?AddCharStrings@LAB@@YANPAD0@Z");
		func3 = (LPFNDLLFUNC3)GetProcAddress(hDLL, "?AddStrings@LAB@@YANV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@0@Z");

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
	}
}
