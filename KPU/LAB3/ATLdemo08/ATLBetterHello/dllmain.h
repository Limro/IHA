// dllmain.h : Declaration of module class.

class CATLBetterHelloModule : public CAtlDllModuleT< CATLBetterHelloModule >
{
public :
	DECLARE_LIBID(LIBID_ATLBetterHelloLib)
	DECLARE_REGISTRY_APPID_RESOURCEID(IDR_ATLBETTERHELLO, "{B3117C5A-9B4A-4741-9613-F16559EE3284}")
};

extern class CATLBetterHelloModule _AtlModule;
