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


#include "ssdpsearchreq.h"

SSDPSearchReq::SSDPSearchReq(){
	AddSignatureHeader((char*)"HOST", (char*)"");
	AddSignatureHeader((char*)"MAN", (char*)"ssdp:discover");
	AddSignatureHeader((char*)"ST", (char*)"");
}

void SSDPSearchReq::ReInit(){
}

int SSDPSearchReq::Process(struct sockaddr* sender, std::vector<SSDP_HTTP_HEADER*> msgheaders){
	//At the moment we don't advertise ourselves
	printf("SSDPSearchReq\n");
	return 0;
}