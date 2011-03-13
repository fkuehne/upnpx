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

#ifndef _SSDPMESSAGE_H
#define _SSDPMESSAGE_H

#include "ssdptools.h"
#include <vector>
#include <arpa/inet.h>
#include "ssdpdb.h"

class SSDPMessage{
public:
	SSDPMessage();
	virtual ~SSDPMessage();
	//What type of message can we handle 
	virtual SSDP_TYPE GetType()=0;
	//Get the message dignature implemented in this class
	virtual std::vector<SSDP_HTTP_HEADER*> GetHeaderSignature();
	//Can this class parse the message with this signature ?
	virtual u8 CanProcess(std::vector<SSDP_HTTP_HEADER*> msgheaders);
	//Process the message, return value: 
	//0 : processed
	//1 : not for me, search for another to process
	//<0 : message was for me but there is an error
	virtual int Process(struct sockaddr* sender, std::vector<SSDP_HTTP_HEADER*> msgheaders)=0;
	//ReInit all members
	virtual void ReInit()=0;
	virtual SSDPDB* GetDB();
	virtual void SetDB(SSDPDB* db);
private:
	std::vector<SSDP_HTTP_HEADER*> mHeaderSignature;
protected:
	int AddSignatureHeader(char* fieldname, char* fieldvalue);
	SSDPDB *mDB;
private:
	SSDPMessage(const SSDPMessage &src);
	SSDPMessage& operator= (const SSDPMessage &src);			
};


#endif //_SSDPMESSAGE_H