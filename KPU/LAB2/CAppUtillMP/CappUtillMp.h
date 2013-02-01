#pragma once
#include "../CAppUtil.hpp"

class CAppUtillMp : public CAppUtil
{
public:
	CAppUtillMp(void);
	CAppUtillMp(string name);
	~CAppUtillMp();
	
	virtual string GetName();
	virtual string MyAddString(string str1, string str2);
private:
	string m_name;
};