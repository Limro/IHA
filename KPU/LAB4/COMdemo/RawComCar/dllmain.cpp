// dllmain.cpp : Defines the entry point for the DLL application.
#include "stdafx.h"

BOOL APIENTRY DllMain( HMODULE hModule,
                       DWORD  ul_reason_for_call,
                       LPVOID lpReserved
					 )
{
	switch (ul_reason_for_call)
	{
	case DLL_PROCESS_ATTACH:
    MessageBox(NULL, TEXT("I have been loaded!"), TEXT("DllMain says:"), MB_OK);  // Just for fun...
    break;
	case DLL_THREAD_ATTACH:
	case DLL_THREAD_DETACH:
    break;
	case DLL_PROCESS_DETACH:
    MessageBox(NULL, TEXT("I have been Unloaded!"), TEXT("DllMain says:"), MB_OK);  // Just for fun...
		break;
	}
	return TRUE;
}

