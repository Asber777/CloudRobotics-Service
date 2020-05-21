#include "arcodelistener/client.h"

Client::Client(objectType serverType)
{
  this->serverType=serverType;	
  Call_client =Callnh.serviceClient<arcodelistener::RecongServerOn>("RecongServerOn");
  Stop_client =Stopnh.serviceClient<arcodelistener::TerminatePID>("TerminatePID");
  Find_client =Findnh.serviceClient<arcodelistener::SelectFromSqlite3>("SelectFromSqlite3");
}
Client::~Client()
{
  
}
int Client::get_pid()
{
  return this->pid;
}
bool Client::set_pid(int pid)
{
  this->pid=pid;
  return true;
}
bool Client::Call()
{
  arcodelistener::RecongServerOn srv;
  srv.request.servertype = this->serverType;
  if (Call_client.call(srv))
  {
    ROS_INFO("Client::Call():send srv, srv.Request.servertype: %d",(int)srv.request.servertype);
    ROS_INFO("Client::Call():receive srv, srv.Response.pid: %d", (int)srv.response.pid);
    this->pid=srv.response.pid;
    return true;
  }
  else
  {
    ROS_ERROR("Client::Call():Failed to call service RecongServerOn");
    return false;
  }
}


bool Client::Stop()
{
  arcodelistener::TerminatePID srv;
  // 在执行服务客户端节点时用作输入的参数分别保存在a和b中
  srv.request.pid = this->pid;
  // 请求服务,如果请求被接受,则显示响应值
  if (Stop_client.call(srv))
  {
    ROS_INFO("Client::Stop():send srv, srv.Request.pid: %d",(int)srv.request.pid);
    ROS_INFO("Client::Stop():receive srv, srv.Response.result: %d", (int)srv.response.result);
    return true;
  }
  else
  {
    ROS_ERROR("Client::Stop():Failed to call service TerminatePID");
    return false;
  }
}

bool Client::Find(string name,struct Location *location)
{
  arcodelistener::SelectFromSqlite3 srv;
  srv.request.name = name;
  srv.request.type = this->serverType;
  if (Find_client.call(srv))
  {
    ROS_INFO("Client::Find() Called,x:%f;y:%f;z:%f",srv.response.x,srv.response.y,srv.response.z);
    location->x=srv.response.x;
    location->y=srv.response.y;
    location->z=srv.response.z;
    return true;
  }
  else
  {
    ROS_INFO("SORRY CANT FIND");
    return false;
  }
}