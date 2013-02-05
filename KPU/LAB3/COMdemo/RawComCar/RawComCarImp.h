// RawComCarImp.h: interface for the ComCar class.
//
//////////////////////////////////////////////////////////////////////

#pragma once
#include <windows.h>

#include "rawcomcar_h.h"  // MIDL generated file!

// RawComCarImp implements IUnknown and ICar.
class ComCar : public ICar, public IRadio  
{
public:
	ComCar();
	virtual ~ComCar();

	// IUnknown impl.
	STDMETHOD_(ULONG,AddRef)();
	STDMETHOD_(ULONG,Release)();
	STDMETHOD (QueryInterface)(REFIID riid, void**);

	// ICar impl.
	STDMETHOD (SpeedUp)(long delta);
	STDMETHOD (CurrentSpeed)(long* currSp);

	// IRadio impl.
	STDMETHOD (CrankTunes)();

	// Ref counter.
	ULONG m_refCount;

	// Current speed!
	long m_currSpeed;
};
