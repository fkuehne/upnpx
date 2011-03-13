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


#import "BasicHTTPServer_ObjC.h"

#include "basichttpserver.h"
#include "basichttpobserver.h"



class BasicHTTPObserver_wrapper:public BasicHTTPObserver {
private:	
	BasicHTTPServer_ObjC* mObjCServer;
	BasicHTTPServer *mCPPServer;
	NSArray *mObjCObservers;
	
public:
	BasicHTTPObserver_wrapper(BasicHTTPServer_ObjC* objcServer){
		mObjCServer = objcServer;
		mObjCObservers = [objcServer getObservers]; //BasicHTTPServer_ObjC_Observer
		mCPPServer = new BasicHTTPServer(52809);
		mCPPServer->AddObserver(this);
	}
	
	~BasicHTTPObserver_wrapper(){
		mCPPServer->RemoveObserver(this);
		delete(mCPPServer);
	}
	
	BasicHTTPServer* GetServer(){
		return mCPPServer;
	}
	
	int Start(){
		return mCPPServer->Start();
	}
	
	int Stop(){
		return mCPPServer->Stop();	
	}

	//Observer functions
	bool CanProcessMethod(string *method){
		[NSRunLoop currentRunLoop]; //Start our runloop
		
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
		
		BOOL ret;
		BasicHTTPServer_ObjC_Observer *obs = nil;
		NSString *request = [[NSString alloc] initWithCString:method->c_str()];
		
		NSEnumerator *obsenum = [mObjCObservers objectEnumerator];	
		while((obs = [obsenum nextObject])){
			ret = [obs canProcessMethod:mObjCServer requestMethod:request];
		}		
		
		[request release];

		[pool drain];
		
		return (ret==YES?true:false);
	}
	
	bool Request(char *senderIP, unsigned short senderPort, string *method, string *path, string *version, map<string, string> *headers, char *body, int bodylen){
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

		BOOL ret;
		NSString *oMethod = [[NSString alloc] initWithCString:method->c_str()];
		NSString *oPath = [[NSString alloc] initWithCString:path->c_str()];
		NSString *oVersion = [[NSString alloc] initWithCString:version->c_str()];
		NSMutableDictionary *oHeaders = [[NSMutableDictionary alloc] init];
		map<string,string>::const_iterator it;
		NSString *header = nil;
		NSString *value = nil;
		for ( it=headers->begin() ; it != headers->end(); it++ ){
			header = [[NSString alloc] initWithCString:(*it).first.c_str()];
			value = [[NSString alloc] initWithCString:(*it).second.c_str()];
			NSString *upperHeader = [header uppercaseString];
			[oHeaders setObject:value forKey:upperHeader];
			[value release];
			[header release];
		}
		NSData *oBody = nil;
		if(bodylen >= 0){
			oBody = [[NSData alloc] initWithBytes:body length:bodylen];
		}
		
		BasicHTTPServer_ObjC_Observer *obs = nil;
		NSEnumerator *obsenum = [mObjCObservers objectEnumerator];	
		while((obs = [obsenum nextObject])){
			ret = [obs request:mObjCServer method:oMethod path:oPath version:oVersion headers:oHeaders body:oBody];
		}	
		
		[oMethod release];
		[oPath release];
		[oVersion release];
		[oHeaders release];
		[oBody release];
		
		[pool release];
		
		return (ret==YES?true:false);
	}
	
	
	
	bool Response(int *returncode, map<string, string> *headers, char **body, int *bodylen){
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

		BOOL ret;

		int oReturnCode;
		NSMutableDictionary *oHeaders = [[NSMutableDictionary alloc] init];
		NSMutableData *oBody = [[NSMutableData alloc] init];
		
		headers->clear();
		
		string value;
		string name;
		
		BasicHTTPServer_ObjC_Observer *obs = nil;
		if([mObjCObservers count] > 0){
			//Only the first observer can respond
			obs = [mObjCObservers objectAtIndex:0];	
			
			oReturnCode = -1;
			[oHeaders removeAllObjects];
			[oBody setLength:0];
			ret = [obs response:mObjCServer returncode:&oReturnCode headers:oHeaders body:oBody];
			if(ret == YES){
				*returncode = oReturnCode;
				*bodylen = [oBody length];
				if(*bodylen > 0){
					*body = (char*)malloc([oBody length]); //must be deleted by the caller (!!!)
					memcpy(*body, [oBody bytes], [oBody length]);
				}
				for(id key in oHeaders){
					value = [(NSString*)[oHeaders objectForKey:key] cStringUsingEncoding: NSASCIIStringEncoding];
					name = [(NSString*)key cStringUsingEncoding: NSASCIIStringEncoding];
					(*headers)[name] = value;
				}
			}
		}	
		
		[pool release];
		
		return (ret==YES?true:false);
	}
	
private:	
};



@implementation BasicHTTPServer_ObjC


-(id)init{
	[super init];
	
	mObservers = [[NSMutableArray alloc] init];
	httpServerWrapper = new BasicHTTPObserver_wrapper(self);
	
	return self;
}

-(void)dealloc{
	[self stop];
	delete((BasicHTTPObserver_wrapper*)httpServerWrapper);
	[mObservers release];
	
	[super dealloc];
}

-(int)start{
	return ((BasicHTTPObserver_wrapper*)httpServerWrapper)->Start();
}

-(int)stop{
	return ((BasicHTTPObserver_wrapper*)httpServerWrapper)->Stop();
}

-(void)addObserver:(BasicHTTPServer_ObjC_Observer*)observer{
	[mObservers addObject:observer];
}

-(void)removeObserver:(BasicHTTPServer_ObjC_Observer*)observer{
	[mObservers removeObject:observer];
}

-(NSMutableArray*)getObservers{
	return mObservers;
}



-(NSString*)getIPAddress{
	char *ip = ((BasicHTTPObserver_wrapper*)httpServerWrapper)->GetServer()->GetSocketServer()->getServerIPAddress();
	
	return [NSString stringWithCString:ip encoding:NSASCIIStringEncoding];
}

-(unsigned short)getPort{
	return ((BasicHTTPObserver_wrapper*)httpServerWrapper)->GetServer()->GetSocketServer()->getServerPort();
}




@end

