// SmartClient.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"

#import "..\\ATLserverHello\\Debug\\ATLserverHello.tlb" no_namespace named_guids
#import "..\\ATLBetterHello\\Debug\\ATLBetterHello.tlb" no_namespace named_guids

void CallAtlServer()
{
	IATLHelloServerPtr helloPtr(__uuidof(ATLHelloServer));

	helloPtr->Hello("HelloSmart World!");

}   // Com server is automaticaly relaesed here 


void CallBetterServer()
{
	CComBSTR bstr1 = "Greeting From a better COM world";
	IBetterHelloPtr betterPtr(__uuidof(BetterHello));

	betterPtr->Hello(bstr1.Copy());
}

int _tmain(int argc, _TCHAR* argv[])
{
	// Bootstrap COM.
	CoInitialize(NULL);

	CallAtlServer();
	CallBetterServer();
	
	// Clean up COM
	CoUninitialize();

	return 0;
}


