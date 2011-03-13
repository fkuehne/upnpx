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


#ifndef _SSDPTOOLS_H
#define _SSDPTOOLS_H

#include "tools.h"
#include <vector>

using namespace std;


typedef struct ssdpuuid{
	u8* uuid;
	u32 uuidlen;
	u8* fullurn;
	u32 fullurnlen;
	u8* urn;
	u32 urnlen;
	u8  isdevice;
	u8  isrootdevice;
	u8  isservice;
	u8* type;
	u32 typelen;
	u8* version;
	u32 versionlen;
}ssdpuuid;


typedef struct SSDP_HTTP_HEADER{
	u8* fieldname;
	u32 fieldnamelen;
	u8* fieldvalue;	
	u32 fieldvaluelen;
	int aa;
	int bb;
}SSDP_HTTP_HEADER;


typedef enum SSDP_TYPE{
	SSDP_TYPE_UNKNOWN = 0,
	SSDP_TYPE_NOTIFY = 1,
	SSDP_TYPE_MSEARCH,
	SSDP_TYPE_HTTP
}SSDP_TYPE;



int GetHeaderValueFromCollection(vector<SSDP_HTTP_HEADER*> headers, u8* fieldname, int fieldnamelen, u8** value, int *len);
int ParseUSN(u8* uuidraw, u32 len, ssdpuuid *uuid);
int cachecontroltoi(u8* s, u32 l);

#endif //_SSDPTOOLS_H