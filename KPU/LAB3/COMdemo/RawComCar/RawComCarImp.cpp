// RawComCarImp.cpp: implementation of the ComCar class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "RawComCarImp.h"

// MIDL generated file.
#include "rawcomcar_i.c"

extern ULONG g_ObjectCount;  // Defined in RawComCar

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

ComCar::ComCar() : m_refCount(0), m_currSpeed(0)
{
	g_ObjectCount++;
}

ComCar::~ComCar()
{
	g_ObjectCount--;
}

//////////////////////////////////////////////////////////////////////
// IUnknown interface implementation
// Must be thread safe in real life
//////////////////////////////////////////////////////////////////////
STDMETHODIMP_(ULONG) ComCar::AddRef()
{
	return ++m_refCount;  
}


STDMETHODIMP_(ULONG) ComCar::Release()
{
	if(--m_refCount == 0)
		delete this;
	return m_refCount;
}


STDMETHODIMP ComCar::QueryInterface(REFIID riid, void** ppInterface) 
{
	// Remember!  Always AddRef() when handing out an interface.
	if(riid == IID_IUnknown)
	{
		*ppInterface = (IUnknown*)(ICar*)this;
		((IUnknown*)(*ppInterface ))->AddRef();
		return S_OK;
	}
	else if(riid == IID_ICar)
	{
		*ppInterface = (ICar*)this;
		((IUnknown*)(*ppInterface ))->AddRef();
		return S_OK;
	}
	else if(riid == IID_IRadio)
	{
		*ppInterface = (IRadio*)this;
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
// ICar interface implementation
//////////////////////////////////////////////////////////////////////
STDMETHODIMP ComCar::SpeedUp(long delta) 
{
	m_currSpeed += delta;
	return S_OK;
}


STDMETHODIMP ComCar::CurrentSpeed(long* currSp)
{
	*currSp = m_currSpeed;
	return S_OK;
}

//////////////////////////////////////////////////////////////////////
// IRadio interface implementation
//////////////////////////////////////////////////////////////////////
STDMETHODIMP ComCar::CrankTunes()
{
	MessageBox(NULL, TEXT("Cranking music!"), TEXT("ComCar"), MB_OK);
	return S_OK;
}