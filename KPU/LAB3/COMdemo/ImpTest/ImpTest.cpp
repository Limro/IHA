// ImpTest.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "..\\RawComCar\\RawComCarImp.h"

ULONG g_ObjectCount;

using namespace std;

int _tmain(int argc, _TCHAR* argv[])
{
	ICar* pCar = NULL;
	HRESULT hr;
	g_ObjectCount = 0;
	pCar = new ComCar();
  pCar->AddRef();


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
		if(pRadio!= NULL) pRadio->Release();

	return 0;
}

