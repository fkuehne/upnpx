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

#include "ssdpmessage.h"

SSDPMessage::SSDPMessage():mDB(NULL){
}

SSDPMessage::~SSDPMessage(){
	std::vector<SSDP_HTTP_HEADER*>::iterator it;
	for(it=mHeaderSignature.begin(); it<mHeaderSignature.end(); it++){
		free(*it);
	}
	mHeaderSignature.clear();
}



std::vector<SSDP_HTTP_HEADER*> SSDPMessage::GetHeaderSignature(){
	return mHeaderSignature;
}


u8 SSDPMessage::CanProcess(std::vector<SSDP_HTTP_HEADER*> msgheaders){
	u8 ret = 0;
	SSDP_HTTP_HEADER* hdrsig;
	SSDP_HTTP_HEADER* hdrmsg;
	u8 found = 0;
	u32 ftel = 0;
	std::vector<SSDP_HTTP_HEADER*>::const_iterator itsig;
	std::vector<SSDP_HTTP_HEADER*>::const_iterator itmsg;
	if(mHeaderSignature.size()<=0 || msgheaders.size() <= 0){
		goto EXIT;
	}
	for(itsig=mHeaderSignature.begin(); itsig<mHeaderSignature.end(); itsig++){
		hdrsig = (SSDP_HTTP_HEADER*)*itsig;
		found = 0;
		for(itmsg=msgheaders.begin(); itmsg<msgheaders.end(); itmsg++){
			hdrmsg = (SSDP_HTTP_HEADER*)*itmsg;
			if(caseinstringcmp(hdrmsg->fieldname, hdrmsg->fieldnamelen, hdrsig->fieldname, hdrsig->fieldnamelen) == 0 &&
			   ( hdrsig->fieldvaluelen == 0 || hdrmsg->fieldvaluelen == hdrsig->fieldvaluelen && memcmp(hdrmsg->fieldvalue, hdrsig->fieldvalue, hdrsig->fieldvaluelen) == 0))
			{
				found = 1;
				break;
			}
		}
		if(found==1){
			ftel++;
		}
	}	
	if(ftel == mHeaderSignature.size()){
		//All found
		ret = 1;
	}
EXIT:
	return ret;
}


int SSDPMessage::AddSignatureHeader(char* fieldname, char* fieldvalue){
	SSDP_HTTP_HEADER *thisHeader = (SSDP_HTTP_HEADER*)malloc(sizeof(SSDP_HTTP_HEADER));
	thisHeader->fieldname = (u8*)fieldname;
	thisHeader->fieldnamelen = strlen(fieldname);
	thisHeader->fieldvalue = (u8*)fieldvalue;
	thisHeader->fieldvaluelen = strlen(fieldvalue);
	mHeaderSignature.push_back(thisHeader);			
	return mHeaderSignature.size();
}


void SSDPMessage::SetDB(SSDPDB* db){
	mDB = db;
}

SSDPDB* SSDPMessage::GetDB(){
	return mDB;
}

