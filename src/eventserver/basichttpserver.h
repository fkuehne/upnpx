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


#ifndef _BASICHTTPSERVER_H
#define _BASICHTTPSERVER_H

#include "socketserver.h"
#include "basichttpobserver.h"
#include "httpsession.h"

#include <string>
#include <map>

using namespace std;

class BasicHTTPServer:public SocketServerObserver{
public:
	BasicHTTPServer(unsigned short prefferedPort);
	~BasicHTTPServer();
	
	
	SocketServer* GetSocketServer();
	int Start();
	int Stop();
	int AddObserver(BasicHTTPObserver *observer);
	int RemoveObserver(BasicHTTPObserver *observer);
	
public:
	//SocketServerObserver
	int DataReceived(struct sockaddr_in *sender, int len, unsigned char *buf);
	int DataToSend(int *len, unsigned char **buf);
	
private:
	SocketServer *mServer;
	std::vector<BasicHTTPObserver*> mObservers;
	

	map<string, HTTPSession*> mSessions; 
		
	
};


#endif //_BASICHTTPSERVER_H