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


#ifndef _HTTPSESSION_H
#define _HTTPSESSION_H

#include "osal.h"

#include <map>
#include <string>

using namespace std;

class HTTPSession{
private:
	char *sessionBuf;
	int sessionBufLen;
	int currentFillLength;
	map<string, string> sessionHeaders; //copy the strings into the map
	
	bool firstData;
	unsigned short sourcePort;
	char sourceIP[16];
	string mVersion;
	string mPath;
	string mMethod;
	char* mBody;
	int mBodyLen;
	int mContentlength;
	int mHeaderlength;
	
	map<string, string> mHeaders; 
	
public:
	HTTPSession(char* srcip, unsigned short srcport);
	~HTTPSession();

	//return the bytes still to receive
	//< 0 when error
	//0 if done
	int AddData(unsigned char* buf, int len);

	string* GetMethod();
	char* GetSenderIP();
	unsigned short GetSenderPort();
	string* GetPath();
	string*  GetVersion();
	map<string, string>* GetHeaders();
	char* GetBody();
	int GetBodyLen();
	
private:
	int ParseHeader(unsigned char* buf, int len);
};

#endif //_HTTPSESSION_H


