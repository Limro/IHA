// AdvMath.cpp : Implementation of CAdvMath

#include "stdafx.h"
#include "AdvMath.h"


// CAdvMath



STDMETHODIMP CAdvMath::Multiply(DOUBLE first, DOUBLE second, DOUBLE* retValue)
{
	DOUBLE val = first * second;
	*retValue = val;

	return S_OK;
}


STDMETHODIMP CAdvMath::Diversion(DOUBLE first, DOUBLE second, DOUBLE* retValue)
{
	if(second == 0)
		return S_FALSE;

	DOUBLE val = first / second;
	*retValue = val;

	return S_OK;
}
