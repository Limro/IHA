// ClassExportConsole.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "ClassExportDLL.h"


int _tmain(int argc, _TCHAR* argv[])
{
	SmoothDLL::ClassExportDLL obj = SmoothDLL::ClassExportDLL();
	obj.Output();
}

