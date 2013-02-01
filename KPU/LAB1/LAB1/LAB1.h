// The following ifdef block is the standard way of creating macros which make exporting 
// from a DLL simpler. All files within this DLL are compiled with the LAB1_EXPORTS
// symbol defined on the command line. This symbol should not be defined on any project
// that uses this DLL. This way any other project whose source files include this file see 
// LAB1_API functions as being imported from a DLL, whereas this DLL sees symbols
// defined with this macro as being exported.
#ifdef LAB1_EXPORTS //Project name
#define LAB1_MATH __declspec(dllexport)
#else
#define LAB1_MATH __declspec(dllimport)
#endif

#include <string>

namespace LAB
{
	extern "C" LAB1_MATH double AddDoubles(double a, double b);
	extern "C" LAB1_MATH double AddCharStrings(char* a, char* b);
	extern "C" LAB1_MATH double AddStrings(std::string a, std::string b);
}