// ClassExportDLL.cpp : Defines the exported functions for the DLL application.

#include "stdafx.h"
#include "ClassExportDLL.h"
#include <iostream>

namespace SmoothDLL
{
	SMOOTH void ClassExportDLL::Output()
	{
		std::cout << "It works" << std::endl;		
		getchar();		
	}

	SMOOTH ClassExportDLL::ClassExportDLL()
	{
		return;
	}
}