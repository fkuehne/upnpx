// **********************************************************************************
//
// BSD License.
// This file is part of upnpx.
//
// Copyright (c) 2010-2011, Bruno Keymolen, email: bruno.keymolen@gmail.com
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, 
// are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, 
// this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this 
// list of conditions and the following disclaimer in the documentation and/or other 
// materials provided with the distribution.
// Neither the name of "Bruno Keymolen" nor the names of its contributors may be 
// used to endorse or promote products derived from this software without specific 
// prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
// IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
// INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT 
// NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
// PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
// POSSIBILITY OF SUCH DAMAGE.
//
// **********************************************************************************


#import "UPnPEvents.h"


@implementation ObserverEntry
@synthesize observer;
@synthesize timeout;
@synthesize subscriptiontime;
-(void)dealloc{
    [observer release];
	[super dealloc];
}

@end


@implementation UPnPEvents

-(id)init{
    self = [super init];
    
    if (self) {		
        mMutex = [[NSRecursiveLock alloc] init];
        mEventSubscribers = [[NSMutableDictionary alloc] init];
        parser =[[UPnPEventParser alloc] init];
        
        server = [[BasicHTTPServer_ObjC alloc] init];
        [server start];
        [server addObserver:(BasicHTTPServer_ObjC_Observer*)self];
        
        
	}

	return self;
}


-(void)dealloc{
	[mTimeoutTimer release];
    [server stop];
	[server release];
	[mEventSubscribers release];
	[parser release];
	[mMutex release];
	
	[super dealloc];
}

-(void)start{
    //Start the subscription timer
    mTimeoutTimer = [NSTimer timerWithTimeInterval:60.0 target:self selector:@selector(ManageSubscriptionTimeouts:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:mTimeoutTimer forMode:NSDefaultRunLoopMode];
}
-(void)stop{
    //Stop the subscription timer
    [mTimeoutTimer invalidate];
}



-(NSString*)Subscribe:(UPnPEvents_Observer*)subscriber{
	//Send Event subscription over HTTP
	NSString *retUUID = nil;	
	NSString *timeOut = nil;	
	
	//Construct the HTML SUBSCRIBE 
	NSMutableURLRequest* urlRequest=[NSMutableURLRequest requestWithURL:[subscriber GetUPnPEventURL]
															cachePolicy:NSURLRequestReloadIgnoringCacheData
														timeoutInterval:15.0];	


	
	NSString *callBack = [NSString stringWithFormat:@"<http://%@:%d/Event>", [server getIPAddress], [server getPort]];
	
	[urlRequest setValue:@"iOS UPnP/1.1 UPNPX/1.2.4" forHTTPHeaderField:@"USER-AGENT"];
	[urlRequest setValue:callBack forHTTPHeaderField:@"CALLBACK"];
	[urlRequest setValue:@"upnp:event" forHTTPHeaderField:@"NT"];
	[urlRequest setValue:@"Second-1800" forHTTPHeaderField:@"TIMEOUT"];
	
	//SUBSCRIBE (Synchronous)
	[urlRequest setHTTPMethod:@"SUBSCRIBE"];	
	
	NSHTTPURLResponse *urlResponse;
	
	[NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&urlResponse error:nil];
    
	if([urlResponse statusCode] == 200){
		NSDictionary *allReturnedHeaders = [urlResponse allHeaderFields];
		for(NSString* key in allReturnedHeaders){
			if([key caseInsensitiveCompare:@"SID"] == NSOrderedSame){
				retUUID = [NSString stringWithString:[allReturnedHeaders objectForKey:key]];
			}
			if([key caseInsensitiveCompare:@"TIMEOUT"] == NSOrderedSame){
				timeOut = [NSString stringWithString:[allReturnedHeaders objectForKey:key]];                
            }
		}		
	}
	
	//Add to the subscription Dictionary
	[mMutex lock];
	if(retUUID){
        ObserverEntry *en = [[ObserverEntry alloc] init];

        en.observer = subscriber;
        en.subscriptiontime = [[NSDate date]timeIntervalSince1970];
        
        NSRange r = [timeOut rangeOfString:@"Second-"];
        if(r.length > 0){
            en.timeout = [[timeOut substringFromIndex:r.location+r.length] intValue];
            if(en.timeout < 300)
                en.timeout = 300;
        }
        
		[mEventSubscribers setObject:en forKey:retUUID];
	}else{
		NSLog(@"Cannot subscribe for events, server return code : %ld", (long)[urlResponse statusCode]);
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
        UPnPEvents_Observer *thisObserver = nil;
        ObserverEntry *entry = [mEventSubscribers objectForKey:uuid];
        if(entry != nil){
            thisObserver = entry.observer;
            [thisObserver retain];
        }
		[mMutex unlock];
		if(thisObserver != nil){
            [thisObserver UPnPEvent:[parser events]];
            [thisObserver release];
        }
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


-(void)ManageSubscriptionTimeouts:(NSTimer*)timer{
    //NSLog(@"ManageSubscriptionTimeouts");
    double tm = [[NSDate date]timeIntervalSince1970];
    ObserverEntry *entry = nil;
    NSMutableArray *remove = [[NSMutableArray alloc] init];
    NSMutableArray *notify = [[NSMutableArray alloc] init];    
    [mMutex lock];
    NSString *uuid;
    for (uuid in mEventSubscribers) {
        entry = [mEventSubscribers objectForKey:uuid];
        if(tm - entry.subscriptiontime >= (double)(entry.timeout)){
            [remove addObject:uuid];
        }else if(tm - entry.subscriptiontime > (double)(entry.timeout/2)){
            [notify addObject:uuid];
        }
    }
    [mMutex unlock];
    
    //Send Notifications
    for (uuid in notify) {
        [mMutex lock];
        entry = [mEventSubscribers objectForKey:uuid];
        if(entry){
            [entry retain];
        }
        [mMutex unlock];
        if(entry){
            [[entry observer] SubscriptionTimerExpiresIn:(int)(tm - entry.subscriptiontime) timeoutSubscription:entry.timeout timeSubscription:entry.subscriptiontime];
            [entry release];
        }
    }

    //Remove
    for (uuid in remove) {
        [mMutex lock];
        [mEventSubscribers removeObjectForKey:uuid];
        [mMutex unlock];
    }
    
    [remove release];
    [notify release];
}


@end
