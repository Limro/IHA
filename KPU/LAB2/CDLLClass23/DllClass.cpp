#include "stdafx.h"
#include "DllClass.h"
#include <iostream>

using namespace std;

DllClass::DllClass()
{
	//Init
}

DllClass::~DllClass()
{}

bool DllClass::Init(IAppUtil* pUtil)
{
	_pAppUtil = pUtil;
	return true;
}

bool DllClass::Run()
{
	std::cout << "DllClass is now running" << std::endl;
	return true;
}

void DllClass::TearDown()
{
}