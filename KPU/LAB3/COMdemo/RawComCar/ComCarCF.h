// ComCarCF.h: interface for the ComCarCF class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_COMCARCF_H__EBC645B5_5F6E_4859_85A7_35D1C2E28CC0__INCLUDED_)
#define AFX_COMCARCF_H__EBC645B5_5F6E_4859_85A7_35D1C2E28CC0__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include <windows.h>

// Class factories NEVER implement the interfaces
// of the COM class they create!
class ComCarCF  : public IClassFactory  
{
public:
	ComCarCF();
	virtual ~ComCarCF();

	// IUnknown impl.
	STDMETHOD_(ULONG,AddRef)();
	STDMETHOD_(ULONG,Release)();
	STDMETHOD (QueryInterface)(REFIID riid, void** pInterface);

	// ICF impl.
	STDMETHOD (CreateInstance)(LPUNKNOWN pUnkOuter, REFIID iid, void** pInterface);
	STDMETHOD (LockServer)(BOOL lock);

	// Ref counter.
	ULONG m_refCount;
};

#endif // !defined(AFX_COMCARCF_H__EBC645B5_5F6E_4859_85A7_35D1C2E28CC0__INCLUDED_)
