// ClassExportDLL.cpp : Defines the exported functions for the DLL application.

#include "stdafx.h"
#include "ClassExportDLL.h"
#include <iostream>
#include <conio.h>

namespace SmoothDLL
{
	SMOOTH void ClassExportDLL::Output()
	{
		std::cout << "It works" << std::endl;		
		getch();		
	}

	SMOOTH ClassExportDLL::ClassExportDLL()
	{}
}