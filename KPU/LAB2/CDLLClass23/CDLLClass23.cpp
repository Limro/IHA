// CDLLClass23.cpp : Defines the exported functions for the DLL application.
//

#include "stdafx.h"
#include "CDLLClass23.h"


// This is an example of an exported variable
CDLLCLASS23_API int nCDLLClass23=0;

// This is an example of an exported function.
CDLLCLASS23_API int fnCDLLClass23(void)
{
	return 42;
}

// This is the constructor of a class that has been exported.
// see CDLLClass23.h for the class definition
CCDLLClass23::CCDLLClass23()
{
	return;
}
