#include <string>
#include <stdio.h>
#include <stdlib.h>
#include <sqlite3.h>
#include <cstdlib>
#include <typeinfo>
#include <cstring>
#include <map>
#include <iostream>
#include <boost/format.hpp>
//写一个类来存储检测到的物体并且判断是否在数据库中出现过
//目前已经完成了创建表,检查是否在一定范围内存在相同物体,和插入表,但是现在插入的数据
/*大体如这样
TYPE        NAME        X            Y            Z           TIME        
----------  ----------  -----------  -----------  ----------  ------------
0           TEMP        -0.00286071  -0.00277253  0.610729    1583410000.0
0           TEMP        0.163541     0.163846     0.883642    1583410000.0
TYPE 0 都是ARCODE还好 主要的是NAME 我现在的ID都是INT 无法识别toilet还是啥的
可能需要根据ID赋值NAME,之后到院里再看看能不能提取ARCODE的信息
然后我手动设定键值对 be4814630fa4e7a722eecd7f1c000ae3  可乐
*/
using namespace boost;
using namespace std;


enum objectType { ArCode = 1 , RegnizedObj = 2, Other = 0};
struct Location
{
  float x;
  float y;
  float z;
};
#define threshold 1.0
class DetectObject
{
    private:
      sqlite3 *db;
    public:
      string name;
      objectType type;
      int typenum;
      struct Location location;
      float time;

      DetectObject();
      DetectObject(string id,objectType type,float x,float y,float z,float time,sqlite3 *db);
      DetectObject(string name,int typenum,sqlite3 *db);
      ~DetectObject();
      bool FindIfHadOne();
      bool InsertOne();
      bool CreateTable();
      bool DelectTable();
      bool Select();
      // const char* to_string();
};