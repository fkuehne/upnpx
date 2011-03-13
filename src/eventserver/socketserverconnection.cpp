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

#include "socketserverconnection.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define SERVER_BUFFER_STEP 2048

SocketServerConnection::SocketServerConnection(SOCKET socket, struct sockaddr_in *sender){
	mSocket = socket;
	isActive = true;
	mBuffer = (u8*)malloc(SERVER_BUFFER_STEP);
	mBufferSize = SERVER_BUFFER_STEP;
	memcpy(&mSender, sender, sizeof(struct sockaddr_in));
}



SocketServerConnection::~SocketServerConnection(){
	free(mBuffer);
}



SOCKET SocketServerConnection::GetSocket(){
	return mSocket;
}

u8* SocketServerConnection::GetBuffer(){
	return mBuffer;
}



int SocketServerConnection::ReadDataFromSocket(struct sockaddr_in **sender){
	int len = 0; 
	
	memset(sender, 0, sizeof(struct sockaddr_in));
	
	while(true){
		
		len = recv(mSocket, mBuffer, mBufferSize, 0);
//		len = recvfrom(mSocket, mBuffer, mBufferSize, 0, (struct sockaddr*)sender, &senderlen);		
		*sender = &mSender;
		
		if(len < 0 /* error */ || len == 0 /* closed */){
			return len;
		}
		if(len == mBufferSize){
			//there is more to read (?)
			printf("?????????????????\n");
			return -1;
		}else{
			break;
		}
	}
	
	return len;
}

int SocketServerConnection::SendDataOnSocket(unsigned char *sendbuf, int len){
	int sentlen = send(mSocket, sendbuf, len, 0);
	return sentlen;
}


int SocketServerConnection::ErrorOnSocket(){
	return -1;
}



