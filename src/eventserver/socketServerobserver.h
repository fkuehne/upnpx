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


#ifndef _SOCKETSERVEROBSERVER_H
#define _SOCKETSERVEROBSERVER_H

#include <arpa/inet.h>

class SocketServerObserver{
public:	
	virtual int DataReceived(struct sockaddr_in *sender, int len, unsigned char *buf) = 0;
	virtual int DataToSend(int *len, unsigned char **buf) = 0;
};

#endif //_SOCKETSERVEROBSERVER_H