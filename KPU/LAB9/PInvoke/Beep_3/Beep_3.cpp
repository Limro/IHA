// Beep_3.cpp : Defines the exported functions for the DLL application.
//

#include "stdafx.h"
#include "Beep_3.h"


// This is an example of an exported variable
BEEP_3_API int nBeep_3=0;

// This is an example of an exported function.
BEEP_3_API int fnBeep_3(void)
{
	return 42;
}

// This is the constructor of a class that has been exported.
// see Beep_3.h for the class definition
CBeep_3::CBeep_3()
{
	return;
}
