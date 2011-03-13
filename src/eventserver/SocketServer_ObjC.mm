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


#import "SocketServer_ObjC.h"
#import "socketserver.h"
#include "socketServerobserver.h"



class SocketServerObserver_wrapper:public SocketServerObserver{
private:	
	SocketServer_ObjC* mObjCObserver;
	SocketServer *mServer;
	
public:
	SocketServerObserver_wrapper(SocketServer_ObjC* observer, SocketServer *server){
		mObjCObserver = observer;
		mServer = server;
		mServer->AddObserver(this);
	}
	
	~SocketServerObserver_wrapper(){
		mServer->RemoveObserver(this);
	}
	
	int DataReceived(struct sockaddr_in *sender, int len, unsigned char *buf){
		[NSRunLoop currentRunLoop]; //Start our runloop
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

		
		unsigned short port = sender->sin_port;
		NSString *ip = [[NSString alloc]  initWithCString:inet_ntoa(sender->sin_addr)];
	
		[pool release];
		
		return [mObjCObserver dataIn:buf length:len fromIP:ip fromPort:port];
	}

	int DataToSend(int *len, unsigned char **buf){
		return -1; //no data to send
	}
	
private:	
	SocketServerObserver_wrapper(){}
};



@implementation SocketServer_ObjC

-(id)init{
	[super init];	

	mCppSocketServer = new SocketServer(42809);
	mCppSocketServerObserverWrapper = new SocketServerObserver_wrapper(self, (SocketServer*)mCppSocketServer);

	return self;
}
	
-(void)dealloc{
	((SocketServer*)mCppSocketServer)->Stop();
	delete((SocketServer*)mCppSocketServer);
	delete((SocketServerObserver_wrapper*)mCppSocketServerObserverWrapper);
	
	[super dealloc];
}

-(void)start{
	((SocketServer*)mCppSocketServer)->Start();	
}

-(void)stop{
	((SocketServer*)mCppSocketServer)->Stop();
}


-(NSString*)getIPAddress{
	char *ip = ((SocketServer*)mCppSocketServer)->getServerIPAddress();
	
	return [NSString stringWithCString:ip encoding:NSASCIIStringEncoding];
}

-(unsigned short)getPort{
	return ((SocketServer*)mCppSocketServer)->getServerPort();
}


-(void)addObserver:(SocketServer_ObjC_Observer*)obs{
	[mObservers addObject:obs];
}

-(void)removeObserver:(SocketServer_ObjC_Observer*)obs{
	[mObservers removeObject:obs];
}


-(int)dataIn:(unsigned char*)data length:(int)len fromIP:(NSString*)ipAddress fromPort:(unsigned short)port{
	int ret  = -1;

	SocketServer_ObjC_Observer* obs;
	
	NSEnumerator *obsenum = [mObservers objectEnumerator];	
	while(obs = [obsenum nextObject]){
		[obs DataIn:self withData:data andLen:len fromSource:ipAddress];
	}			
	

	return ret;
}


@end
