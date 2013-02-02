#include "stdafx.h"
#include "DllClass.h"
#include <iostream>

using namespace std;

DllClass::DllClass()
{
	std::cout << "Creating a new class" << std::endl;
}

DllClass::~DllClass()
{
	TearDown();
}

bool DllClass::Init(IAppUtil* pUtil)
{
	_pAppUtil = pUtil;
	std::cout << "Initialted the DLL Class" << std::endl;
	return true;
}

bool DllClass::Run()
{
	std::cout << "DllClass is now running" << std::endl;
	return true;
}

void DllClass::TearDown()
{
	std::cout << "Closing this class object" << std::endl;
	delete _pAppUtil;
}