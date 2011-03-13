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


#include "ssdptools.h"

int GetHeaderValueFromCollection(vector<SSDP_HTTP_HEADER*> headers, u8* fieldname, int fieldnamelen, u8** value, int *len){
	int ret=0;
	int found=0;
	
	vector<SSDP_HTTP_HEADER*>::const_iterator it;
	SSDP_HTTP_HEADER *hdr;
	
	if(headers.size() <= 0){
		ret = -1;
		goto EXIT;
	}
	
	for(it=headers.begin(); it<headers.end(); it++){
		hdr = *it;
		if(caseinstringcmp(fieldname, fieldnamelen, hdr->fieldname, hdr->fieldnamelen) == 0){
			//found
			found=1;
			break;
		}
	}
	
	if(found){
		*value=hdr->fieldvalue;
		*len=hdr->fieldvaluelen;
	}else{
		ret =-1;
	}
	
EXIT:
	return ret;
}




//Possible formats:
// uuid:device-UUID
// uuid:device-UUID::upnp:rootdevice
// uuid:device-UUID::urn :schemas-upnp-org:device :deviceType :ver
// uuid:device-UUID::urn :schemas-upnp-org:service:serviceType:ver
// uuid:device-UUID::urn :domain-name     :device :deviceType :ver
// uuid:device-UUID::urn :domain-name     :service:serviceType:ver
// 1    2            3    4                5       6           7

int ParseUSN(u8* uuidraw, u32 len, ssdpuuid *uuid){
	int ret = 0;
	int colon1 = 0;
	int colon2 = 0;
	int tel;
	
	int lenleft;
	
	//Sanity
	if(uuid == NULL || len == 0){
		return -1;
	}
	if(memcmp(uuidraw, "uuid", 4) != 0){
		return -2;
	}

	memset(uuid, 0, sizeof(ssdpuuid));

	lenleft = len;
	
	//uuid
	colon1 = getchar(uuidraw, len, ':', 1);
	colon2 = getchar(uuidraw, len, ':', 2);
	if(colon1<0 || colon1+1>=len){ ret = -1; goto EXIT; }	
	if(colon2<0){
		uuid->uuid=uuidraw;//+colon1+1;
		uuid->uuidlen=len;//-colon1-1;
		//uuid->uuidlen=len-colon1-1;
		goto EXIT;
	}else{
		uuid->uuid=uuidraw;//+colon1+1;
		uuid->uuidlen=colon2;
//		uuid->uuidlen=colon2-colon1-1;
	}
	
	//Sanity, there must be a double colon
	colon1 = getchar(uuidraw, len, ':', 2);
	colon2 = getchar(uuidraw, len, ':', 3);
	if(colon2-colon1 != 1){
		ret = -2;
		goto EXIT;
	}
	
	
	//upnp, isroot 
	colon1 = getchar(uuidraw, len, ':', 3);
	if((len-colon1)>=15 && memcmp(uuidraw+colon1+1, "upnp:rootdevice", 15)==0 ){
		uuid->isrootdevice = 1;
		uuid->isdevice = 1;
		uuid->type = uuidraw+colon1+1;
		uuid->typelen = 15;
		goto EXIT;
	}

	//Sanity, there must be 4 colons after
	for(tel=4;tel<=7;tel++){
		colon1 = getchar(uuidraw, len, ':', tel);
		if(colon1 < 0){
			ret = -3;
			goto EXIT;		
		}
	}
	
	
	//urn
	colon1 = getchar(uuidraw, len, ':', 3);
	colon2 = getchar(uuidraw, len, ':', 4);
	if((colon2-colon1)>=3 && memcmp(uuidraw+colon1+1, "urn", 3)!=0 ){
		ret = -4;
		goto EXIT;
	}
	uuid->fullurn = uuidraw+colon1+1;
	uuid->fullurnlen = len-colon1-1;

	colon1 = getchar(uuidraw, len, ':', 4);
	colon2 = getchar(uuidraw, len, ':', 5);
	uuid->urn=uuidraw+colon1+1;
	uuid->urnlen=colon2-colon1-1;
	

	
	//Device or service
	colon1 = getchar(uuidraw, len, ':', 5);
	colon2 = getchar(uuidraw, len, ':', 6);
	if( (colon2-colon1)>=6 && memcmp(uuidraw+colon1+1, "device", 6)==0){		
		//device
		uuid->isdevice = 1;
	}else if((colon2-colon1)>=7 && memcmp(uuidraw+colon1+1, "service", 7)==0){
		//service                                            
		uuid->isservice = 1;
	}else{
		ret = -5;
		goto EXIT;
	}
	
	
	//servicetype / devicetype
	colon1 = getchar(uuidraw, len, ':', 6);
	colon2 = getchar(uuidraw, len, ':', 7);
	uuid->type = uuidraw+colon1+1;
	uuid->typelen=colon2-colon1-1;	
	
	//Workaround for MusicPal bug
	if(uuid->typelen==16 && memcmp(uuid->type, "RenderingControl", 16) == 0){
		uuid->isdevice = 0;
		uuid->isrootdevice = 0;
		uuid->isservice = 1;
	}

	//version
	uuid->version = uuidraw+colon2+1;
	uuid->versionlen=len-colon2-1;
	
EXIT:
	
	return ret;
}





int cachecontroltoi(u8* s, u32 l){
	u32 ret = -1;
	u32 p;
	
	char buf[1024];
	int buflen=1024;
	
	if(l >= buflen){
		return ret;
	}
	
	memcpy(&buf, s, l);
	buf[l]=0;
	
	//max-age=nn
	trimspaces(&s, &l);
	if(l >= 7 && caseinstringcmp(s, 7, (u8*)"max-age", 7) == 0){
		//search the =
		p = getchar((u8*)buf, strlen(buf), '=');
		if(p > 0){
			ret = atoi(buf+p+1);
		}
	}
	
	return ret;
}


