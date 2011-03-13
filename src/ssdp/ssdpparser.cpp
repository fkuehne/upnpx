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


#include "ssdpparser.h"
#include "tools.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

//Message implementations
#include "ssdpnotifyalive.h"
#include "ssdpnotifybye.h"
#include "ssdpnotifyupdate.h"
#include "ssdpsearchreq.h"
#include "ssdpsearchresp.h"

#define SSDP_START_NOTIFY	"NOTIFY * HTTP/1.1"
#define SSDP_START_MSEARCH	"M-SEARCH * HTTP/1.1"
#define SSDP_START_HTTP		"HTTP/1.1 200 OK"



SSDPParser::SSDPParser(SSDPDB* db):mType(SSDP_TYPE_UNKNOWN){
    mDB = db;
	
	/*
	 * Register all implemented message types
	 */
	SSDPMessage* msg;
	msg = new SSDPNotifyAlive();
	msg->SetDB(mDB);
	mMessages.push_back(msg);
	
	msg = new SSDPNotifyBye();
	msg->SetDB(mDB);
	mMessages.push_back(msg);
	
	msg = new SSDPNotifyUpdate();	
	msg->SetDB(mDB);
	mMessages.push_back(msg);
	
	msg = new SSDPSearchReq();
	msg->SetDB(mDB);
	mMessages.push_back(msg);
	
	msg = new SSDPSearchResp();
	msg->SetDB(mDB);
	mMessages.push_back(msg);
}

SSDPParser::~SSDPParser(){
	std::vector<SSDP_HTTP_HEADER*>::iterator it;
	for(it=mHeaders.begin(); it<mHeaders.end(); it++){
		free(*it);
	}
	mHeaders.clear();

	std::vector<SSDPMessage*>::iterator itmsg;
	for(itmsg=mMessages.begin(); itmsg<mMessages.end(); itmsg++){
		delete(*itmsg);
	}
	mMessages.clear();
}


int SSDPParser::ReInit(){
	//Clear all headers of previous session (if any)
	if(mHeaders.size() > 0){
		std::vector<SSDP_HTTP_HEADER*>::iterator it;
		for(it=mHeaders.begin(); it<mHeaders.end(); it++){
			free(*it);
		}
		mHeaders.clear();
	}
	
	
	//ReInit all messages
	if(mMessages.size() > 0){
		std::vector<SSDPMessage*>::const_iterator itmsg;
		for(itmsg=mMessages.begin(); itmsg<mMessages.end(); itmsg++){
			((SSDPMessage*)*itmsg)->ReInit();
		}
	}
	
	//Clear all members
	mType = SSDP_TYPE_UNKNOWN;
	
	
	return 0;
}

int SSDPParser::Parse(struct sockaddr* sender, u8* buf, u32 len){
	int linelen;
	u8* pos = buf;
	u32 restlen = len;
	u8* newpos;
	u32 newlen;
	u32 colon;
	int ret = 0;
	
	SSDPMessage* msg;
	std::vector<SSDPMessage*>::const_iterator itmsg;
	

	while( (linelen = ReadLine(pos, restlen, &newpos, &newlen)) > 0 ){
		if(mType == SSDP_TYPE_UNKNOWN){
			//Parse the first line and define the type
			if( linelen==strlen(SSDP_START_NOTIFY) && memcmp(pos, SSDP_START_NOTIFY, strlen(SSDP_START_NOTIFY)) == 0){
				mType = SSDP_TYPE_NOTIFY;
			}else if( linelen==strlen(SSDP_START_MSEARCH) && memcmp(pos, SSDP_START_MSEARCH, strlen(SSDP_START_MSEARCH)) == 0){
				mType = SSDP_TYPE_MSEARCH;
			}else if( linelen==strlen(SSDP_START_HTTP) && memcmp(pos, SSDP_START_HTTP, strlen(SSDP_START_HTTP)) == 0){
				mType = SSDP_TYPE_HTTP;
			}else{
				//unknown
				goto EXIT;
			}
		}else{
			//Read the headers
			//Find the first colon, that is the end of the field name, the rest is the field value
			colon = 0;
			while(pos[colon] != ':' && colon < linelen){
				colon++;
			}
		
			//Add the header to our collection
			SSDP_HTTP_HEADER *thisHeader = (SSDP_HTTP_HEADER*)malloc(sizeof(SSDP_HTTP_HEADER));
			thisHeader->fieldname = pos;
			thisHeader->fieldnamelen = colon;
			thisHeader->fieldvalue = lefttrim(pos+colon+1, linelen-colon-1);
			thisHeader->fieldvaluelen = linelen-(thisHeader->fieldvalue - pos);
			//Trim spaces
			trimspaces(&(thisHeader->fieldname), &(thisHeader->fieldnamelen));
			trimspaces(&(thisHeader->fieldvalue), &(thisHeader->fieldvaluelen));
			mHeaders.push_back(thisHeader);			
		}
				
		pos = newpos;
		restlen = newlen;
	}
	
	//We have all headers + type, search the message who can process it
	for(itmsg=mMessages.begin(); itmsg<mMessages.end(); itmsg++){
		msg = (SSDPMessage*)*itmsg;
		
		if(msg->GetType() == mType){
			if(msg->CanProcess(mHeaders) == 1){
				ret = msg->Process(sender, mHeaders);
				if(ret != 1){ //0=ok,-1=error,1=not for me, continue...
					break;
				}
			}
		}
	}
	
EXIT:	
	return ret;
}


SSDP_TYPE SSDPParser::GetType(){
	return mType;
}
		

/**
 * Private
 */


int SSDPParser::ReadLine(u8 *buf, u32 len, u8 **restbuf, u32 *restlen){
	int ret = 0;
	
	//Search the \r\n
	u8 *pos = buf;
	while((pos < (u8*)(buf+(len-1)) ) && (*pos != '\r' && *(pos+1) != '\n')){
		pos++;
	}
	// \r\n or eof
	if(pos > buf){
		pos++;
		pos++;
		*restlen = (buf+len)-pos;
		*restbuf = pos;
		ret = (pos-buf)-2;
	}else{
		ret = -1; //eof
	}
	
	return ret;
}



