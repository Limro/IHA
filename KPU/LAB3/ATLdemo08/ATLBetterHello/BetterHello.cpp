// BetterHello.cpp : Implementation of CBetterHello

#include "stdafx.h"
#include "BetterHello.h"
#include <iostream>

using namespace std;

// CBetterHello


STDMETHODIMP CBetterHello::Hello(BSTR arg)
{

	MessageBox(NULL, arg, TEXT("My Better Hello Server says"), MB_OK);

	return S_OK;
}
