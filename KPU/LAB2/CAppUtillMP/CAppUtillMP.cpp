// CAppUtillMP.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "CappUtillMp.h"


CAppUtillMp::CAppUtillMp()
{}

CAppUtillMp::CAppUtillMp(string name)
{
	m_name = name;
}

string CAppUtillMp::GetName()
{
	return m_name;
}

CAppUtillMp::~CAppUtillMp()
{}

string CAppUtillMp::MyAddString(string str1, string str2)
{
	return str1 + str2;
}
