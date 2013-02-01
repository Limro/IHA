#pragma once

class IDLLclass
{
public:
  virtual bool Init(IAppUtil * pUtil) =0;
  virtual bool Run() =0;
  virtual void TearDown() =0;
};