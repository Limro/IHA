#ifdef CDLLCLASS23_EXPORTS
#define CDLLCLASS23_API __declspec(dllexport)
#else
#define CDLLCLASS23_API __declspec(dllimport)
#endif
#include "CDllClass.h"

extern "C" class CDLLCLASS23_API GLOBAL {
public:
	CDllClass CreateDllObject(void);
	void DeleteDllObj(CDllClass* obj);
};