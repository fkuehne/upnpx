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



#ifndef _SOCKETSERVERCONNECTION_H
#define _SOCKETSERVERCONNECTION_H

#include "osal.h"
#include <arpa/inet.h>


class SocketServerConnection{
public:
	SocketServerConnection(SOCKET socket, struct sockaddr_in *sender);
	~SocketServerConnection();
	
	SOCKET GetSocket();
	int ReadDataFromSocket(struct sockaddr_in **sender);
	int SendDataOnSocket(unsigned char *sendbuf, int len);

	int ErrorOnSocket();
	bool isActive;
	
	u8* GetBuffer();
	
	struct sockaddr_in mSender;
	
private:
	SOCKET mSocket;
	u8 *mBuffer;
	int mBufferSize;
	
};


#endif //_SOCKETSERVERCONNECTION_H