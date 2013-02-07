// LAB4_2.cpp : Defines the entry point for the console application.

#include "stdafx.h"
#include "..\\LAB4\\LAB4_i.h"
#include "..\\LAB4\\LAB4_i.c"
#include <iostream>
#include <conio.h>

using namespace std;

int _tmain(int argc, _TCHAR* argv[])
{
	HRESULT hr = E_FAIL;

	IAdvMath *pATLServer;

	// Bootstrap COM.
	CoInitialize(NULL);

	hr = CoCreateInstance(CLSID_AdvMath, NULL, CLSCTX_INPROC, IID_IAdvMath, (void**)&pATLServer);

	DOUBLE *MultValue = new DOUBLE;
	DOUBLE *DivValue = new DOUBLE;

	pATLServer->Multiply(2.1, 3.2, MultValue);
	pATLServer->Diversion(3.2, 2.1, DivValue);
	
	pATLServer->Release();
	
	cout << "Multiply: " << *MultValue << endl;
	cout << "Divsersion: " << *DivValue << endl;
	_getch();

	delete MultValue;
	delete DivValue;

	CoUninitialize();
	return 0;
}