#include "../CAppUtil.hpp"
#include "../CDLLclass.hpp"

class CDllClass : public CDLLclass
{
public:
	CDllClass();	
	~CDllClass();
	bool Init(CAppUtil* pUtil);
	bool Run();
	void TearDown();

private:
	CAppUtil* _pAppUtil;
	char* _pName;
};