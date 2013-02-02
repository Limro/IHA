#pragma once
#include "../IAppUtil.hpp"

class AppUtillMp : public IAppUtil
{
public:
	AppUtillMp(void);
	AppUtillMp(string name);
	~AppUtillMp();
	
	virtual string GetName();
	virtual string MyAddString(string str1, string str2);
private:
	string m_name;
};