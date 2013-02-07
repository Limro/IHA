// dllmain.h : Declaration of module class.

class CATLserverHelloModule : public CAtlDllModuleT< CATLserverHelloModule >
{
public :
	DECLARE_LIBID(LIBID_ATLserverHelloLib)
	DECLARE_REGISTRY_APPID_RESOURCEID(IDR_ATLSERVERHELLO, "{16778F19-C454-4A36-A6EE-79125AD722F8}")
};

extern class CATLserverHelloModule _AtlModule;
