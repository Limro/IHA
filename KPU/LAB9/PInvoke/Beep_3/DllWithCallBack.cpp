// DllWithCallBack.cpp : Defines the entry point for the DLL application.
//

#include "stdafx.h"
#include <iostream>
#include <conio.h>
#include "DllWithCallBack.h"

using namespace std;


BOOL APIENTRY DllMain( HANDLE hModule, 
                       DWORD  ul_reason_for_call, 
                       LPVOID lpReserved
					 )
{
	switch (ul_reason_for_call)
	{
	case DLL_PROCESS_ATTACH:
	case DLL_THREAD_ATTACH:
	case DLL_THREAD_DETACH:
	case DLL_PROCESS_DETACH:
		break;
	}
    return TRUE;
}

// This exported function call backs pF in a loop where x is incremented by 1
extern "C" __declspec(dllexport) void SomeUnmanagedFunctionUsingCallback(double x, FafX pF)
{
	double res = 0.0;

	MessageBox(NULL, TEXT("The DLL is now going to use your callback function."), TEXT("Unmanaged DLL says"), MB_OK);

	for (int i = 0; i < 10; i++)
	{
		res = (*pF)(x);
		cout << "x: " << x << "     F: " << res << endl;
		x += 1.0;
	}
	_getch();
}
