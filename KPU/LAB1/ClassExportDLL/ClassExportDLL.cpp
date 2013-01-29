// ClassExportDLL.cpp : Defines the exported functions for the DLL application.
//

#include "stdafx.h"
#include "ClassExportDLL.h"
#include <iostream>

namespace SmoothDLL
{
	SMOOTH void ClassExportDLL::Output()
	{
		std::cout << "It works" << std::endl;
		int x;
		while(!getchar())
		{}
	}

	SMOOTH ClassExportDLL::ClassExportDLL()
	{
		return;
	}
}