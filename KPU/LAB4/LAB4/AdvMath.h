// AdvMath.h : Declaration of the CAdvMath

#pragma once
#include "resource.h"       // main symbols
#include "LAB4_i.h"



#if defined(_WIN32_WCE) && !defined(_CE_DCOM) && !defined(_CE_ALLOW_SINGLE_THREADED_OBJECTS_IN_MTA)
#error "Single-threaded COM objects are not properly supported on Windows CE platform, such as the Windows Mobile platforms that do not include full DCOM support. Define _CE_ALLOW_SINGLE_THREADED_OBJECTS_IN_MTA to force ATL to support creating single-thread COM object's and allow use of it's single-threaded COM object implementations. The threading model in your rgs file was set to 'Free' as that is the only threading model supported in non DCOM Windows CE platforms."
#endif

using namespace ATL;


// CAdvMath

class ATL_NO_VTABLE CAdvMath :
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CAdvMath, &CLSID_AdvMath>,
	public IDispatchImpl<IAdvMath, &IID_IAdvMath, &LIBID_LAB4Lib, /*wMajor =*/ 1, /*wMinor =*/ 0>
{
public:
	CAdvMath()
	{
	}

DECLARE_REGISTRY_RESOURCEID(IDR_ADVMATH)


BEGIN_COM_MAP(CAdvMath)
	COM_INTERFACE_ENTRY(IAdvMath)
	COM_INTERFACE_ENTRY(IDispatch)
END_COM_MAP()



	DECLARE_PROTECT_FINAL_CONSTRUCT()

	HRESULT FinalConstruct()
	{
		return S_OK;
	}

	void FinalRelease()
	{
	}

public:
	STDMETHOD(Multiply)(DOUBLE first, DOUBLE second, DOUBLE* retValue);
	STDMETHOD(Diversion)(DOUBLE first, DOUBLE second, DOUBLE* retValue);
};

OBJECT_ENTRY_AUTO(__uuidof(AdvMath), CAdvMath)
