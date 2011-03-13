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



#ifndef _SSDP_H_
#define _SSDP_H_

#include <arpa/inet.h>
#include <vector>
#include <pthread.h>
#include <sys/select.h>

#include "osal.h"
#include "ssdpobserver.h"
#include "ssdpparser.h"
#include "ssdpdb.h"

#define SSDP_MCAST_ADDRESS	"239.255.255.250"
#define SSDP_MCAST_PORT		1900


class SSDP{
public:
	SSDP();
	virtual ~SSDP();
	int Start();
	int Stop();
	int AddObserver(SSDPObserver* observer);
	int RemoveObserver(SSDPObserver* observer);
	int Advertise();
	int Search();
	SSDPDB* GetDB();
private:
	SOCKET mSocket;
	struct sockaddr_in mSrcaddr;
	struct sockaddr_in mDstaddr;
	struct ip_mreq mMreq;
	std::vector<SSDPObserver*> mObservers;
	u8 mReadLoop;
	pthread_t mReadThread;
	fd_set mExceptionFDS;
	fd_set mReadFDS;
	u16 mTTL;
	SSDPParser* mParser;
	SSDPDB* mDB;
private:
	int ReadLoop();
	int IncommingMessage(struct sockaddr* sender, u8* buf, u32 len);
private:
	static void* sReadLoop(void* data);
private:
	SSDP(const SSDP &src);
	SSDP& operator= (const SSDP &src);
		
};


#endif //_SSDP_H_