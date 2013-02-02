#pragma once
#include "../IAppUtil.hpp"
#include "../IDLLclass.hpp"

class DllClass : public IDLLclass
{
public:
	DllClass();	
	~DllClass();
	bool Init(IAppUtil* pUtil);
	bool Run();
	void TearDown();

private:
	IAppUtil* _pAppUtil;
	char* _pName;
};