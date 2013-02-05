// ComCarCF.cpp: implementation of the ComCarCF class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "ComCarCF.h"
#include "RawComCarImp.h"

extern ULONG g_LockCount;
extern ULONG g_ObjectCount;

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

ComCarCF::ComCarCF() : m_refCount(0)
{
	g_ObjectCount++;
}

ComCarCF::~ComCarCF()
{
	g_ObjectCount--;
}

//////////////////////////////////////////////////////////////////////
// IUnknown interface implementation
//////////////////////////////////////////////////////////////////////
STDMETHODIMP_(ULONG) ComCarCF::AddRef()
{
	return ++m_refCount;
}


STDMETHODIMP_(ULONG) ComCarCF::Release()
{
	if(--m_refCount == 0)
		delete this;
	return m_refCount;
}


STDMETHODIMP ComCarCF::QueryInterface(REFIID riid, void** ppInterface) 
{
	// Remember!  Always AddRef() when handing out an interface.
	if(riid == IID_IUnknown)
	{
		*ppInterface = (IUnknown*)this;
		((IUnknown*)(*ppInterface ))->AddRef();
		return S_OK;
	}
	else if(riid == IID_IClassFactory)
	{
		*ppInterface = (IClassFactory*)this;
		((IUnknown*)(*ppInterface ))->AddRef();
		return S_OK;
	}
	else
	{
		*ppInterface = NULL;
		return E_NOINTERFACE;
	}
}

//////////////////////////////////////////////////////////////////////
// IClassFActory implementation
//////////////////////////////////////////////////////////////////////
STDMETHODIMP ComCarCF::CreateInstance(LPUNKNOWN pUnkOuter, REFIID riid, void** ppInterface)
{
	// We do not support aggregation in this class object.
	if(pUnkOuter != NULL)
		return CLASS_E_NOAGGREGATION;

	ComCar* pCarObj = NULL;
	HRESULT hr;

	// Create the car.
	pCarObj = new ComCar;
	
	// Ask car for an interface.
	hr = pCarObj -> QueryInterface(riid, ppInterface);

	// Problem?  We must delete the memory we allocated.
	if (FAILED(hr))
		delete pCarObj;

	return hr;	// S_OK or E_NOINTERFACE.
}

STDMETHODIMP ComCarCF::LockServer(BOOL lock)
{
	if(lock)
		g_LockCount++;
	else
		g_LockCount--;

	return S_OK;
}
