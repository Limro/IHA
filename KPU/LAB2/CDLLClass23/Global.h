#pragma once
//#ifdef DLLCLASS_EXPORTS
#define DLLCLASS_EXPORT __declspec(dllexport)
//#else
#define DLLCLASS_IMPORT __declspec(dllimport)
//#endif

#include "DllClass.h"

extern "C" 
{
	namespace GLOBAL
	{
		DLLCLASS_EXPORT DllClass* CreateDllObject(void);
		DLLCLASS_EXPORT void DeleteDllObj(DllClass* obj);
	}
}