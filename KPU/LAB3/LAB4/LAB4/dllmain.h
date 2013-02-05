// dllmain.h : Declaration of module class.

class CLAB4Module : public ATL::CAtlDllModuleT< CLAB4Module >
{
public :
	DECLARE_LIBID(LIBID_LAB4Lib)
	DECLARE_REGISTRY_APPID_RESOURCEID(IDR_LAB4, "{B4D5CEB6-A01E-4555-AC07-CDDDE21A3E2C}")
};

extern class CLAB4Module _AtlModule;
