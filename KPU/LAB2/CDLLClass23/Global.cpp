#include "stdafx.h"
#include "Global.h"



extern "C" 
{
	namespace GLOBAL
	{

		DLLCLASS_EXPORT DllClass* CreateDllObject()
		{
			DllClass* obj = new DllClass();
			return obj;
		}

		DLLCLASS_EXPORT void DeleteDllObj(DllClass* obj)
		{
			delete obj;
		}
	}
}