#ifdef CDLLCLASS23_EXPORTS
#define CDLLCLASS23_API __declspec(dllexport)
#else
#define CDLLCLASS23_API __declspec(dllimport)
#endif

class CDLLCLASS23_API CCDLLClass23 {
public:
	CCDLLClass23(void);
};