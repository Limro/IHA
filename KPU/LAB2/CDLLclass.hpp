#pragma once

class CDLLclassImp : public CDllClass
{
public:
  virtual bool Init(CAppUtil * pUtil) =0;
  virtual bool Run() =0;
  virtual void TearDown() =0;
};