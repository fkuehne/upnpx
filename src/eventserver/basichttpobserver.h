// ******************************************************************
//
// This file is part of upnpx.
//
// upnpx is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as 
// published by the Free Software Foundation, either version 3 of the 
// License, or (at your option) any later version.
//
// upnpx is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with upnpx.  If not, see <http://www.gnu.org/licenses/>.
//
// Copyright (C)2011, Bruno Keymolen, email: bruno.keymolen@gmail.com
//
// ******************************************************************


#ifndef _BASICHTTPOBSERVER_H
#define _BASICHTTPOBSERVER_H

#include <map>

using namespace std;


class BasicHTTPObserver{
public:
	//Methods to hook into the HTTP Server
	virtual bool CanProcessMethod(string *method) = 0;
	virtual bool Request(char *senderIP, unsigned short senderPort, string *method, string *path, string *version, map<string, string> *headers, char *body, int bodylen) = 0;
	virtual bool Response(int *returncode, map<string, string> *headers, char **body, int *bodylen) = 0;
};


#endif //_BASICHTTPOBSERVER_H