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

	IMath2 *pATLServer;

	// Bootstrap COM.
	CoInitialize(NULL);

	hr = CoCreateInstance(CLSID_Math2, NULL, CLSCTX_INPROC, IID_IMath2, (void**)&pATLServer);

	pATLServer->put_Offset(0);

	DOUBLE *addValue = new DOUBLE;
	DOUBLE *subValue = new DOUBLE;

	pATLServer->Add(2.1, 3.2, addValue);
	pATLServer->Sub(3.2, 2.1, subValue);
	
	pATLServer->Release();
	
	cout << "Add: " << *addValue << endl;
	cout << "Sub: " << *subValue << endl;
	_getch();

	delete addValue;
	delete subValue;

	CoUninitialize();
	return 0;
}