#include "stdafx.h"
#include "AppUtillMp.h"
#include "../IDLLclass.hpp"

#include <string>
#include <iostream>
#include <Windows.h>
#include <stdio.h>

using namespace std;

typedef IDLLclass* (*DLLFUNC1)(void);
typedef void (*DLLFUNC2)(IDLLclass* obj);

DLLFUNC1 func1;    // Function pointer
DLLFUNC2 func2;    // Function pointer
HINSTANCE hDLL = NULL;

int _tmain(int argc, _TCHAR* argv[])
{
	while(hDLL == NULL)
	{
		cout << "Please enter the location of the .dll file without the '.dll' extention" << std::endl;
		string input;
		cin >> input;

		std::wstring dllFile;
		dllFile.assign(input.begin(), input.end());

		hDLL = LoadLibrary(dllFile.c_str());
	}
	if (hDLL != NULL)
	{
		func1 = (DLLFUNC1)GetProcAddress(hDLL, "CreateDllObject");
		func2 = (DLLFUNC2)GetProcAddress(hDLL, "DeleteDllObj");

		if (func1 == NULL || func2 == NULL)
		{
			std::cout << "One of your functions were not loaded" << std::endl;
			getchar();
			FreeLibrary(hDLL);
			return -1;
		}
		else
		{
			IDLLclass* obj = func1();
			//obj->Init(
		}
		FreeLibrary(hDLL);
	}
}