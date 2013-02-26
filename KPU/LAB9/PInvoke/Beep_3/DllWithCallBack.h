// The following ifdef block is the standard way of creating macros which make exporting 
// from a DLL simpler. All files within this DLL are compiled with the DLLWITHCALLBACK_EXPORTS
// symbol defined on the command line. this symbol should not be defined on any project
// that uses this DLL. This way any other project whose source files include this file see 
// DLLWITHCALLBACK_API functions as being imported from a DLL, whereas this DLL sees symbols
// defined with this macro as being exported.
#ifdef DLLWITHCALLBACK_EXPORTS
#define DLLWITHCALLBACK_API __declspec(dllexport)
#else
#define DLLWITHCALLBACK_API __declspec(dllimport)
#endif

typedef double (CALLBACK *FafX)(double x);

// This exported function call backs pF in a loop where x is incremented by 1
extern "C" __declspec(dllexport) void SomeUnmanagedFunctionUsingCallback(double x, FafX pF);
