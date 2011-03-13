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


#ifndef _SSDPDBDEVICE_H
#define _SSDPDBDEVICE_H

#include "ssdptools.h"
#include <vector>
#include <string>

using namespace std;

class SSDPDBDevice{
public:
	SSDPDBDevice();
	~SSDPDBDevice();
	u8 isdevice;
	u8 isroot;
	u8 isservice;
	string uuid;
	string urn;
	string usn;
	ssdpuuid parsedusn;
	string type;
	string version;
	string host;
	string location;
	
	u32 ip;
	u16 port;
	
	u32 cachecontrol;
	u32 lastupdate;
	
	
private:
	SSDPDBDevice(const SSDPDBDevice &src);
	SSDPDBDevice& operator= (const SSDPDBDevice &src);		
};


#endif //_SSDPDBDEVICE_H
