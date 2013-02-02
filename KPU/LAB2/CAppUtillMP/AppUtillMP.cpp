// CAppUtillMP.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "AppUtillMp.h"


AppUtillMp::AppUtillMp()
{}

AppUtillMp::AppUtillMp(string name)
{
	m_name = name;
}

string AppUtillMp::GetName()
{
	return m_name;
}

AppUtillMp::~AppUtillMp()
{}

string AppUtillMp::MyAddString(string str1, string str2)
{
	return str1 + str2;
}
