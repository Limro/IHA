// RawComCar.cpp : Defines the exported functions for the DLL application.
//

#include "stdafx.h"
#include "RawComCar.h"    // Not realy used here
#include "rawcomcar_i.c"	// MIDL generated file.
#include "comcarcf.h"	

// Global server variables.
ULONG g_LockCount = 0;		// Represents the number of locks.
ULONG g_ObjectCount = 0;	// Represents the number of living objects.

// The first 2 functions must be implemented!
// If we went the full 9 yards, we
// would also implement DllRegisterServer() and DllUnregisterServer(),
// but we used a *.reg file for simplicity.
/////////////////////////////////////////////////////////////////////////////
// Used to determine whether the DLL can be unloaded by COM.

STDAPI DllCanUnloadNow(void)
{
  // We can unload if we have no objects and no locks.
  if(g_LockCount == 0 && g_ObjectCount == 0)
    return S_OK;
  else
    return E_FAIL;
}

/////////////////////////////////////////////////////////////////////////////
// Returns a class factory to create an object of the requested type.

STDAPI DllGetClassObject(REFCLSID rclsid, REFIID riid, LPVOID* ppv)
{
  // Which Car do you want?
  if(rclsid == CLSID_ComCar)
  {
    ComCarCF* pCarCF = new ComCarCF();
    return pCarCF->QueryInterface(riid, ppv);
  }
  else
  {		
    return CLASS_E_CLASSNOTAVAILABLE;
  }

}

/////////////////////////////////////////////////////////////////////////////
// DllRegisterServer - Adds entries to the system registry
STDAPI DllRegisterServer(void)
{
  MessageBox(NULL, TEXT("If I knew how, I would register these types..."),
    TEXT("DllRegisterServer"), MB_OK);
  return S_OK;
}

/////////////////////////////////////////////////////////////////////////////
// DllUnregisterServer - Removes entries from the system registry

STDAPI DllUnregisterServer(void)
{
  MessageBox(NULL, TEXT("If I knew how, I would UN-register these types..."),
    TEXT("DllUnregisterServer"), MB_OK);
  return S_OK;
}
