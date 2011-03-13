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


#import "UPnPEvents.h"


@implementation UPnPEvents

-(id)init{
	[super init];
	
	mMutex = [[NSRecursiveLock alloc] init];
	mEventSubscribers = [[NSMutableDictionary alloc] init];
	parser =[[UPnPEventParser alloc] init];
	
	server = [[BasicHTTPServer_ObjC alloc] init];
	[server start];
	[server addObserver:(BasicHTTPServer_ObjC_Observer*)self];
	
	return self;
}


-(void)dealloc{
	[server stop];
	[server release];
	[mEventSubscribers release];
	[parser release];
	[mMutex release];
	
	[super dealloc];
}


-(NSString*)Subscribe:(UPnPEvents_Observer*)subscriber{
	//Send Event subscription over HTTP
	NSString *retUUID = nil;	
	
	//Construct the HTML SUBSCRIBE 
	NSMutableURLRequest* urlRequest=[NSMutableURLRequest requestWithURL:[subscriber GetUPnPEventURL]
															cachePolicy:NSURLRequestReloadIgnoringCacheData
														timeoutInterval:15.0];	


	
	NSString *callBack = [NSString stringWithFormat:@"<http://%@:%d/Event>", [server getIPAddress], [server getPort]];
	
	[urlRequest setValue:@"OSX/10.6 UPnP/1.1 Mediacloud/0.1" forHTTPHeaderField:@"USER-AGENT"];
	[urlRequest setValue:callBack forHTTPHeaderField:@"CALLBACK"];
	[urlRequest setValue:@"upnp:event" forHTTPHeaderField:@"NT"];
	[urlRequest setValue:@"Second-1800" forHTTPHeaderField:@"TIMEOUT"];
	
	//SUBSCRIBE (Synchronous)
	[urlRequest setHTTPMethod:@"SUBSCRIBE"];	
	
	NSHTTPURLResponse *urlResponse;
	NSData *resp = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&urlResponse error:nil];
	
	NSString *o = [[NSString alloc] initWithData:resp encoding: NSUTF8StringEncoding];
	NSLog( o );
	[o release];
	
	if([urlResponse statusCode] == 200){
		NSDictionary *allReturnedHeaders = [urlResponse allHeaderFields];
		for(NSString* key in allReturnedHeaders){
			if([key caseInsensitiveCompare:@"SID"] == NSOrderedSame){
				retUUID = [NSString stringWithString:[allReturnedHeaders objectForKey:key]];
				break;
			}
		}
		
	}

	
	//Add to the subscription Dictionary
	[mMutex lock];
	if(retUUID){
		[mEventSubscribers setObject:subscriber forKey:retUUID];
	}else{
		NSLog(@"Cannot subscribe for events, server return code : %ld", [urlResponse statusCode]);
	}
	[mMutex unlock];
	
	return retUUID;
}

-(void)UnSubscribe:(NSString*)uuid{
	[mMutex lock];
	[mEventSubscribers removeObjectForKey:uuid];
	[mMutex unlock];
}


/*
 * Incomming HTTP events
 * BasicHTTPServer_ObjC_Observer
 */
-(BOOL)canProcessMethod:(BasicHTTPServer_ObjC*)sender requestMethod:(NSString*)method{
	BOOL ret = NO;

	if([method caseInsensitiveCompare:@"NOTIFY"] == NSOrderedSame ){
		ret = YES;
	}
	
	return ret;
}

//Request / Response is always synchronized 
-(BOOL)request:(BasicHTTPServer_ObjC*)sender method:(NSString*)method path:(NSString*)path version:(NSString*)version headers:(NSDictionary*)headers body:(NSData*)body{
	BOOL ret = NO;
	
	NSString *uuid = [headers objectForKey:@"SID"];
	if(uuid == nil){
		return NO;
	}

	
	//Parse the return
	[parser reinit];
	
	
	//Check if the body ends with '0' zero's, MediaTomb does this and the parser does not like it, so cut 0's
	char zbuf[10];
	int cut = 0;
	if([body length] > 10){
		NSRange r;
		r.length = 10;
		r.location = [body length] - 10;
		[body getBytes:zbuf range:r];
		int x = 9;
		while(zbuf[x] == 0){
			x--;
			if(x<0){
				break;
			}
		}
		cut =  9-x;
	}
	
	
	NSString *bs = [[NSString alloc] initWithData:body encoding:NSUTF8StringEncoding ];
	NSLog(@"body=%@", bs);
	[bs release];
	
	int parserret;
	if(cut > 0){
		NSData *tmpbody = [[NSData alloc]  initWithBytes:[body bytes] length:[body length]-cut];
		parserret = [parser parseFromData:tmpbody];		 
		[tmpbody release];
	}else{
		parserret = [parser parseFromData:body];	
	}
	
	if(parserret == 0){
		//ok
		//		
		[mMutex lock];
		UPnPEvents_Observer *thisObserver = [mEventSubscribers objectForKey:uuid];
		[thisObserver retain];
		[mMutex unlock];
		
		[thisObserver UPnPEvent:[parser events]];
		[thisObserver release];
	}
	
	
	return ret;
}

//Request / Response is always synchronized 
-(BOOL)response:(BasicHTTPServer_ObjC*)sender returncode:(int*)returncode headers:(NSMutableDictionary*)retHeaders body:(NSMutableData*)retBody{
	BOOL ret = YES;
	
	
	[retBody setLength:0];
	[retHeaders removeAllObjects];
	*returncode = 200;
	
	
	return ret;
}

@end
