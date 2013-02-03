#pragma once
#include "../IAppUtil.hpp"
#include "../IDLLclass.hpp"

class DllClass : public IDLLclass
{
public:
	DllClass();	
	~DllClass();
	virtual bool Init(IAppUtil* pUtil);
	virtual bool Run();
	virtual void TearDown();

private:
	IAppUtil* _pAppUtil;
	char* _pName;
};