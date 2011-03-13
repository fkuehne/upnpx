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


#include "httpsession.h"
#include "tools.h"

HTTPSession::HTTPSession(char* srcip, unsigned short srcport){
	sourcePort = srcport;
	strcpy(sourceIP, (char*)srcip);
	firstData = true;
	
	sessionBuf = (char*)malloc(4096);
	sessionBufLen = 4096;
	currentFillLength = 0;
	mContentlength = -1;
}

HTTPSession::~HTTPSession(){
	free(sessionBuf);
}



int HTTPSession::AddData(unsigned char* buf, int len){
	int ret = 0;
	
	//Do we need more memory
	if(currentFillLength + len > sessionBufLen){
		if(sessionBufLen + 2048 > 8192){ //8k max
			return -9;
		}
		sessionBuf = (char*)realloc(sessionBuf, sessionBufLen + 2048);
		sessionBufLen = sessionBufLen + 2048;
	}
	
	//header ?
	if(firstData){
		ret = ParseHeader(buf, len);
		if(ret < 0){
			return ret;
		}
	}
	firstData = false;
	
	memcpy(&sessionBuf[currentFillLength], buf, len);
	currentFillLength = currentFillLength + len;
	
	//Complete ?
	if(mContentlength <= 0){
		return 0; //at the moment only CONTENT-LENGTH headers are supported, add also chunked-encoding; see UPnP architecture 4.3.2
	}
	
	if(currentFillLength >= mContentlength + mHeaderlength){
		mBody = sessionBuf + mHeaderlength;
		mBodyLen = currentFillLength - mHeaderlength;
		return 0;
	}
	
	return mContentlength + mHeaderlength - currentFillLength; //check todo
	
	
}


//modifies the buffer (!)
int HTTPSession::ParseHeader(unsigned char* buf, int len){
	u8* pos = buf;
	int poslen = len;
	int space = 0;
	int eol = 0;
	int colon = 0;
		
	//Parse http header
	//New request
	/* 
	 * Parse Request line
	 * method<space>path<space>version<cr><lf>
	 */
	//Method 
	space = getchar(pos, poslen, ' ');
	pos[space]=0;
	mMethod = (char*)pos;
	pos = pos + space + 1;
	poslen = (buf + len) - pos;
	
	
	//Path
	space = getchar(pos, poslen, ' ');
	pos[space]=0;
	mPath = (char*)pos;
	pos = pos + space + 1;
	poslen = (buf + len) - pos;
	
	//Version
	eol = getchar(pos, poslen, '\r');
	pos[eol]=0;
	mVersion = (char*)pos;
	pos = pos + eol + 2;
	poslen = (buf + len) - pos;
	
	
	
	/*
	 * Parse headers
	 */
	string headerName;
	string headerValue;
	mContentlength = -1;
	
	mHeaders.clear();
	
	while (true) {
		
		colon = getchar(pos, poslen, ':');
		eol = getchar(pos, poslen, '\r');
		
		if(eol < 0){
			break;
		}
		
		if(colon <= 0 || colon > eol){
			while(*pos == '\r' || *pos == '\n' || *pos == ' '){
				pos++;
				poslen--;
			}
			break; //end of header
		}
		
		pos[colon] = 0;
		pos[eol] = 0;
		
		char* pheadervalue = (char*)pos + colon + 1;
		int tmpeol = eol;
		
		
		//LR Trim the header values
		while(*pheadervalue == ' '){
			pheadervalue++;
		}
		while(pheadervalue[tmpeol-1] == ' '){
			pheadervalue[tmpeol-1] = 0;
			tmpeol--;
		}
		
		headerValue = pheadervalue; //(char*)pos + colon + 1;
		
		
		char* pheadername = (char*)pos; 
		int tmpcolon = colon;
		
		while(*pheadername == ' '){
			pheadername++;
		}
		while(pheadername[tmpcolon-1] == ' '){
			pheadername[tmpcolon-1] = 0;
			tmpcolon--;
		}

		headerName = pheadername; //(char*)pos;

		
		//Content length ?
		if( caseinstringcmp((u8*)pos, strlen((char*)pos), (u8*)"CONTENT-LENGTH", 14) == 0 ){
			mContentlength = atoi((char*)pos + colon + 1);
		}
		
		
		pos = pos + eol + 2;
		poslen = (buf + len) - pos;
		
		//add it to the map
		mHeaders[headerName] = headerValue;		
	}
	
	mHeaderlength = len - poslen;
	   
	return mHeaderlength;
	
}

	   

string* HTTPSession::GetMethod(){
	return &mMethod;
}
char* HTTPSession::GetSenderIP(){
	return sourceIP;
}
unsigned short HTTPSession::GetSenderPort(){
	return sourcePort;
}
string* HTTPSession::GetPath(){
	return &mPath;
}
string* HTTPSession::GetVersion(){
	return &mVersion;
}
map<string, string>* HTTPSession::GetHeaders(){
	return &mHeaders;
}
char* HTTPSession::GetBody(){
	return mBody;
}
int HTTPSession::GetBodyLen(){
	return mBodyLen;
}
