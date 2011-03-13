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


#include "ssdpnotifybye.h"

SSDPNotifyBye::SSDPNotifyBye(){
	AddSignatureHeader((char*)"HOST", (char*)"");
	AddSignatureHeader((char*)"NT", (char*)"");
	AddSignatureHeader((char*)"NTS", (char*)"ssdp:byebye");
	AddSignatureHeader((char*)"USN", (char*)"");
	/*
	AddSignatureHeader("BOOTID.UPNP.ORG", "");
	AddSignatureHeader("CONFIGID.UPNP.ORG", "");
	*/
}

void SSDPNotifyBye::ReInit(){
}

int SSDPNotifyBye::Process(struct sockaddr* sender, std::vector<SSDP_HTTP_HEADER*> msgheaders){
	int ret = 0;
	u8* usn;
	int usnlen;
	ssdpuuid uuid;
	
	//Get the Device USN (Unique Service Name)	
	ret=GetHeaderValueFromCollection(msgheaders, (u8*)"USN", 3, &usn, &usnlen);
	if(ret != 0 || usnlen<=0){
		ret = -1;
		goto EXIT;
	}
	
	ret = ParseUSN(usn, usnlen, &uuid);
	if(ret < 0){
		goto EXIT; //Unknown format
	}
		
	//Delete the UUID
	//Specs : If a control point has received at least one ssdp:byebye message of a root device, any of its embedded devices or any of its
	//        services then the control point can assume that all are no longer available.
	mDB->DeleteDevicesByUuid(uuid.uuid, uuid.uuidlen);
	
	printf("SSDPNotifyBey\n");
	
	
EXIT:
	return ret;
}