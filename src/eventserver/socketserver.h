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


#ifndef _SOCKETSERVER_H
#define _SOCKETSERVER_H

#include "osal.h"
#include <arpa/inet.h>
#include "socketserverobserver.h"
#include <vector>
#include "socketserverconnection.h"

class SocketServer {
public:
	SocketServer(unsigned short preferredPort);
	~SocketServer();
	int Start();
	int Stop();
	int AddObserver(SocketServerObserver *observer);
	int RemoveObserver(SocketServerObserver *observer);
	
	
	int getLocalIPAddress(char ip[16], int sWaitUntilFound);
	
	char* getServerIPAddress();	
	unsigned short getServerPort();	
	
private:
	std::vector<SocketServerObserver*> mObservers;
	std::vector<SocketServerConnection*> mConnections;
	
	unsigned short mPort;
	char ipAddress[16];
	
	u8 mReadLoop;
	
	SOCKET mServerSocket;
	struct sockaddr_in mClientAddr;
	struct sockaddr_in mServerAddr;

	pthread_t mReadThread;
	fd_set mExceptionFDS;
	fd_set mReadFDS;
	
	int mMaxConnections;
	
	
private:
	int ReadLoop();	
private:
	static void* sReadLoop(void* data);	
};


#endif //_SOCKETSERVER_H
