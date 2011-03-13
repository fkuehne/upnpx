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


#include "ssdpnotifyupdate.h"

SSDPNotifyUpdate::SSDPNotifyUpdate(){
	AddSignatureHeader((char*)"HOST", (char*)"");
	AddSignatureHeader((char*)"LOCATION", (char*)"");
	AddSignatureHeader((char*)"NT", (char*)"");
	AddSignatureHeader((char*)"NTS", (char*)"ssdp:update");
	AddSignatureHeader((char*)"USN", (char*)"");
	/*
	AddSignatureHeader("BOOTID.UPNP.ORG", "");
	AddSignatureHeader("CONFIGID.UPNP.ORG", "");
	AddSignatureHeader("NEXTBOOTID.UPNP.ORG", "");
	*/
}

void SSDPNotifyUpdate::ReInit(){
}

int SSDPNotifyUpdate::Process(struct sockaddr* sender, std::vector<SSDP_HTTP_HEADER*> msgheaders){
	//The only reason seem to be to update the "BOOTID.UPNP.ORG" field which my devices don't send anyway
	printf("SSDPNotifyUpdate\n");
	return 0;
}