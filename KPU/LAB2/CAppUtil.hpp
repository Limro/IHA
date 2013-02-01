#pragma once

#include <string>
using namespace std;

class CAppUtil
{
public:
  virtual string GetName() = 0;
  virtual string MyAddString(string str1, string str2) = 0;
};