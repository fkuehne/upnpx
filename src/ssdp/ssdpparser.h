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


#ifndef _SSDPPARSER_H_
#define _SSDPPARSER_H_

#include "osal.h"
#include <vector>
#include "ssdptools.h"
#include "ssdpmessage.h"
#include "ssdpdb.h"

using namespace std;

class SSDPParser{
public:
	SSDPParser(SSDPDB* db);
	~SSDPParser();
	int ReInit();
	int Parse(struct sockaddr* sender, u8* buf, u32 len);
	SSDP_TYPE GetType();
private:
	int ReadLine(u8 *buf, u32 len, u8 **restbuf, u32 *restlen);
	SSDP_TYPE mType;
	vector<SSDP_HTTP_HEADER*> mHeaders;
	vector<SSDPMessage*> mMessages;
	SSDPDB* mDB;
private:
	SSDPParser(const SSDPParser &src);
	SSDPParser& operator= (const SSDPParser &src);	
};

#endif //_SSDPPARSER_H_