#ifdef CLASSEXPORTDLL_EXPORTS
#define SMOOTH __declspec(dllexport)
#else
#define SMOOTH __declspec(dllimport)
#endif

namespace SmoothDLL
{
	class SMOOTH ClassExportDLL {
	public:
		ClassExportDLL(void);
		void Output(void);
	};
};