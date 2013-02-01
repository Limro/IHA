#include "stdafx.h"
#include "CappUtillMp.h"

#include <string>
#include <iostream>
#include <Windows.h>
#include <stdio.h>

using namespace std;

int _tmain(int argc, _TCHAR* argv[])
{
	cout << "Please enter the location of the .dll file without the '.dll' extention" << std:endl;
	string input;
	cin >> input;

	typedef double (*DLLFUNC1)(double, double);
	typedef double (*DLLFUNC2)(char*, char*);

	DLLFUNC1 func1;    // Function pointer
	DLLFUNC2 func2;    // Function pointer

	std::wstring dllFile = input;

	HINSTANCE hDLL = LoadLibrary(dllFile.c_str());
	if (hDLL != NULL)
	{
		func1 = (DLLFUNC1)GetProcAddress(hDLL, "AddDoubles");
		func2 = (DLLFUNC2)GetProcAddress(hDLL, "AddCharStrings");

		if (func1 == NULL || func2 == NULL)
	   {
		  // handle the error
		  FreeLibrary(hDLL);
		  return;
	   }
	   else
	   {

		}
	   FreeLibrary(hDLL);
	}
}