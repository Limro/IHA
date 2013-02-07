// CppRawComClient.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"

// MIDL generated files from the COM server.
#include "..\\RawComCar\\RawComCar_i.c"	// Defines GUIDs.
#include "..\\RawComCar\\RawComCar_h.h"		// Defines interface definitions.

using namespace std;

int _tmain(int argc, _TCHAR* argv[])
{
  // Bootstrap COM.
  CoInitialize(NULL);

  // Just for kicks, let's get IUnknown first.
  IUnknown* pUnk = NULL;
  ICar* pCar = NULL;
  HRESULT hr = E_FAIL;
  IClassFactory* pCF = NULL;

  // Using CoGetClassObject().

  hr = CoGetClassObject(CLSID_ComCar, CLSCTX_INPROC_SERVER,
    NULL, IID_IClassFactory, (void**)&pCF);
  if(SUCCEEDED(hr))
    hr = pCF->CreateInstance(NULL, IID_ICar, (void**)&pCar); 
  else
  {
    //cout << "Debug info: Unable to load COM-server get access to Class Factory";
	MessageBox(NULL, TEXT("Unable to load COM-server and get access to Class Factory!"), TEXT("Raw Com Car Says:"), MB_OK);
    exit(1);
  }

  // You may replace the 2 statements above with the 2 statements below

  // Using CoCreateInstance() 
  //hr = CoCreateInstance(CLSID_ComCar, NULL, CLSCTX_INPROC, IID_IUnknown, (void**)&pUnk);

  // Now ask for ICar.
  //if(SUCCEEDED(hr))
  //	hr = pUnk->QueryInterface(IID_ICar, (void**)&pCar);

  if(SUCCEEDED(hr))
  {
    // Speed up car.
    for(int i = 0; i < 5; i++)
    {
      long currSp = 0;
      pCar->SpeedUp(10);
      pCar->CurrentSpeed(&currSp);
      cout << "Car Speed: " << currSp << endl;
    }
    // Turn on radio.
    IRadio* pRadio = NULL;
    hr = pCar->QueryInterface(IID_IRadio, (void**)&pRadio);
    if(SUCCEEDED(hr))
    {
      pRadio->CrankTunes();
    }
    else
      cout << "No radio onboard!\n";

    // Clean up.
    if(pCar != NULL) pCar->Release();	 
    if(pCF!= NULL) pCF->Release();
    if(pUnk!= NULL) pUnk->Release();	 
    if(pRadio!= NULL) pRadio->Release();
  }	
  CoUninitialize();	 
  return 0;
}

