// Math2.h : Declaration of the CMath2

#pragma once
#include "resource.h"       // main symbols



#include "LAB4_i.h"



#if defined(_WIN32_WCE) && !defined(_CE_DCOM) && !defined(_CE_ALLOW_SINGLE_THREADED_OBJECTS_IN_MTA)
#error "Single-threaded COM objects are not properly supported on Windows CE platform, such as the Windows Mobile platforms that do not include full DCOM support. Define _CE_ALLOW_SINGLE_THREADED_OBJECTS_IN_MTA to force ATL to support creating single-thread COM object's and allow use of it's single-threaded COM object implementations. The threading model in your rgs file was set to 'Free' as that is the only threading model supported in non DCOM Windows CE platforms."
#endif

using namespace ATL;


// CMath2

class ATL_NO_VTABLE CMath2 :
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CMath2, &CLSID_Math2>,
	public IDispatchImpl<IMath2, &IID_IMath2, &LIBID_LAB4Lib, /*wMajor =*/ 1, /*wMinor =*/ 0>
{
public:
	CMath2()
	{
	}

DECLARE_REGISTRY_RESOURCEID(IDR_MATH2)


BEGIN_COM_MAP(CMath2)
	COM_INTERFACE_ENTRY(IMath2)
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



	STDMETHOD(Add)(DOUBLE firstNumber, DOUBLE secondNumber, DOUBLE* retvalue);
	STDMETHOD(Sub)(DOUBLE first, DOUBLE second, DOUBLE* retValue);
	STDMETHOD(get_Offset)(DOUBLE* pVal);
	STDMETHOD(put_Offset)(DOUBLE newVal);
};

OBJECT_ENTRY_AUTO(__uuidof(Math2), CMath2)
