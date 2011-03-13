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

/*
#include <iostream>

#include "upnp.h"
#include "ssdp.h"
#include "ssdpobserver.h"
#include "ssdpdbobserver.h"

#import "Test_ObjC.h"


class MainClass: public SSDPObserver, public SSDPDBObserver{
public:
	int SSDPMessage(SSDPParser *parsedmsg){
		switch(parsedmsg->GetType()){
			case SSDP_TYPE_HTTP:
				//printf("SSDP_TYPE_HTTP\n");
				break;
			case SSDP_TYPE_NOTIFY:
				//printf("SSDP_TYPE_NOTIFY\n");
				break;
			case SSDP_TYPE_MSEARCH:
				//printf("SSDP_TYPE_MSEARCH\n");
				break;
			default:
				printf("unknown\n");
				break;
		}
		return 0;
	}
	
	int SSDPDBMessage(SSDPDBMsg* msg){
		SSDPDB* db = UPNP::GetInstance()->GetSSDP()->GetDB();

		switch(msg->type){
			case SSDPDBMsg_DeviceUpdate:
			case SSDPDBMsg_ServiceUpdate:
				{
					db->Lock();
					vector<SSDPDBDevice*>devices = db->GetDevices();
					std::vector<SSDPDBDevice*>::iterator it;
					printf("devices.size()=%d\n", devices.size());
					for(it=devices.begin(); it<devices.end(); it++){
						printf("full usn=%s, type=%s, version=%s, location=%s\n", ((SSDPDBDevice*)*it)->usn.c_str(), ((SSDPDBDevice*)*it)->type.c_str(), ((SSDPDBDevice*)*it)->version.c_str(), ((SSDPDBDevice*)*it)->location.c_str());						
					}
					db->Unlock();
				}	
				printf("SSDPDBMsg_DeviceUpdate\n");
				break;
		}
		return 0;
	}
	
private:
};

int main (int argc, char * const argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
	
	MainClass mm;
	
	Test_ObjC* testObjC = [[Test_ObjC alloc] init];
	
	UPNP* upnp = UPNP::GetInstance();
	
	SSDP* ssdp = upnp->GetSSDP();
	SSDPDB* db = ssdp->GetDB();
//	db->AddObserver(&mm);
//	ssdp->AddObserver(&mm);
	ssdp->Start();
    
	while(1){
		ssdp->Search();
		printf("sleep...\n");
		sleep(30);
	}
	
	[testObjC release];
	
	return 0;
}
*/