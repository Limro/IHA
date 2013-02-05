// SimpleClient.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "..\\AtlServerHello\\AtlServerHello_i.h"
#include "..\\AtlServerHello\\AtlServerHello_i.c"

int _tmain(int argc, _TCHAR* argv[])
{
	HRESULT hr = E_FAIL;

	IATLHelloServer *pMyATLServ;

	// Bootstrap COM.
	CoInitialize(NULL);

	hr = CoCreateInstance(CLSID_ATLHelloServer, NULL, CLSCTX_INPROC, IID_IATLHelloServer, (void**)&pMyATLServ);

	pMyATLServ->Hello("Hello World");
	pMyATLServ->Release();

	CoUninitialize();
	return 0;
}

