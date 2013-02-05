// Math2.cpp : Implementation of CMath2

#include "stdafx.h"
#include "Math2.h"
#include <iostream>
#include <sstream>
#include <string>

using namespace std;


// CMath2



STDMETHODIMP CMath2::Add(DOUBLE firstNumber, DOUBLE secondNumber, DOUBLE* retvalue)
{
	DOUBLE result = firstNumber + secondNumber + _offset;
	
	*retvalue = result;

	return S_OK;
}


STDMETHODIMP CMath2::Sub(DOUBLE first, DOUBLE second, DOUBLE* retValue)
{
	DOUBLE result = first - second + _offset;
	*retValue = result;

	return S_OK;
}

DOUBLE _offset;

STDMETHODIMP CMath2::get_Offset(DOUBLE* pVal)
{
	*pVal = _offset;

	return S_OK;
}


STDMETHODIMP CMath2::put_Offset(DOUBLE newVal)
{
	_offset = newVal;

	return S_OK;
}
