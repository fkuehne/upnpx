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


#include "basichttpserver.h"
#include "tools.h"
#include "osal.h"


BasicHTTPServer::BasicHTTPServer(unsigned short prefferedPort){
	mServer = new SocketServer(prefferedPort); 		   
	mServer->AddObserver(this);
}


BasicHTTPServer::~BasicHTTPServer(){
	delete(mServer);
}

SocketServer* BasicHTTPServer::GetSocketServer(){
	return mServer;
}


int BasicHTTPServer::Start(){
	return mServer->Start();
}

int BasicHTTPServer::Stop(){
	return mServer->Stop();
}

int BasicHTTPServer::AddObserver(BasicHTTPObserver *observer){
	RemoveObserver(observer);
	mObservers.push_back(observer);
	return 0;	
}


int BasicHTTPServer::RemoveObserver(BasicHTTPObserver *observer){
	int found = 0;
	int tel = 0;
	std::vector<BasicHTTPObserver*>::iterator it;
	for(it=mObservers.begin(); it<mObservers.end(); it++){
		if(observer == *it){
			//Remove this one and stop
			found = 1;
			break;
		}
		tel++;
	}
	if(found){
		mObservers.erase(mObservers.begin()+tel);
	}
	return 0;	
}




/**
 * SocketServerObserver
 */
int BasicHTTPServer::DataReceived(struct sockaddr_in *sender, int len, unsigned char *buf){
	//u8* pos = buf;
	//int poslen = len;

	int ret = 0;
	//int contentlength = 0;
	
	
	//Sender
	char senderIP[16]; 
	unsigned short senderPort;
	
	char* t = inet_ntoa(sender->sin_addr);
	strcpy(senderIP, t);
	senderPort = ntohs(sender->sin_port);
	
	
	
	char idbuf[25];
	sprintf(idbuf, "%s:%d", senderIP, senderPort);
	string sessionID = idbuf;
	
	//Do we have a session still open for this ?
	HTTPSession* thisSession = mSessions[sessionID];
	
	if(thisSession == NULL){
		//No, create
		thisSession = new HTTPSession(senderIP, senderPort);
		mSessions[sessionID] = thisSession;		
	}
	ret = thisSession->AddData(buf, len);	
	
	//Session has all data, send it to the observers
	if(ret == 0){
		//Session complete
		mSessions.erase(sessionID);
		
		//Inform the observers
		std::vector<BasicHTTPObserver*>::iterator observerIterator;
		for(observerIterator=mObservers.begin(); observerIterator<mObservers.end(); observerIterator++){
			
			if( ((BasicHTTPObserver*)*observerIterator)->CanProcessMethod(thisSession->GetMethod()) == true){
				((BasicHTTPObserver*)*observerIterator)->Request(thisSession->GetSenderIP(), thisSession->GetSenderPort(), thisSession->GetMethod(), thisSession->GetPath(), thisSession->GetVersion(), thisSession->GetHeaders(), (char*)thisSession->GetBody(), thisSession->GetBodyLen());
			}
			
			std::vector<SocketServerObserver*>::iterator observerIterator;
		}					
		
		delete(thisSession);
	}
	
	
		
	return ret;
}

int BasicHTTPServer::DataToSend(int *len, unsigned char **buf){
	
	if(mObservers.size() == 0){
	//	*len = 0;
		return -1;
	}
	
	//Only the first observer can send responses
	BasicHTTPObserver *observer = mObservers[0];
	
	map<string, string> headers;
	int returnCode;
	char* body = NULL;
	int bodyLen;	
	
	bool bret = observer->Response(&returnCode, &headers, &body, &bodyLen);

	if(body){
		free(body);
	}
	
	if(!bret){
		return -9;
	}

	
	//Constuct the http
	*buf = (unsigned char*)malloc(1024);
	
	//Request line	
	if(returnCode == 200){
		sprintf((char*)*buf, "HTTP/1.1 200 OK\r\n\r\n");
		*len = strlen((char*)*buf);
		return *len;
	}
	
	return -1; //not implemented
}


