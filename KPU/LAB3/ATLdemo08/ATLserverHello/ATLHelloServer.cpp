// ATLHelloServer.cpp : Implementation of CATLHelloServer

#include "stdafx.h"
#include "ATLHelloServer.h"


// CATLHelloServer


STDMETHODIMP CATLHelloServer::Hello(CHAR* arg)
{
	MessageBoxA(NULL, arg, "My ATL Hello Server says", MB_OK);

	return S_OK;
}
