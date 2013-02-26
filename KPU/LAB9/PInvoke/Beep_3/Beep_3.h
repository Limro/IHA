// The following ifdef block is the standard way of creating macros which make exporting 
// from a DLL simpler. All files within this DLL are compiled with the BEEP_3_EXPORTS
// symbol defined on the command line. This symbol should not be defined on any project
// that uses this DLL. This way any other project whose source files include this file see 
// BEEP_3_API functions as being imported from a DLL, whereas this DLL sees symbols
// defined with this macro as being exported.
#ifdef BEEP_3_EXPORTS
#define BEEP_3_API __declspec(dllexport)
#else
#define BEEP_3_API __declspec(dllimport)
#endif

// This class is exported from the Beep_3.dll
class BEEP_3_API CBeep_3 {
public:
	CBeep_3(void);
	// TODO: add your methods here.
};

extern BEEP_3_API int nBeep_3;

BEEP_3_API int fnBeep_3(void);
