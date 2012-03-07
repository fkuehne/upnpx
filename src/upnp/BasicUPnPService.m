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


#import "BasicUPnPService.h"
#import "BasicServiceParser.h"
#import "UPnPManager.h"


@implementation BasicUPnPService

@synthesize serviceType;
@synthesize baseURL;
@synthesize baseURLString;
@synthesize descriptionURL;
@synthesize eventURL;
@synthesize controlURL;
@synthesize ssdpdevice;
@synthesize stateVariables;
@synthesize urn;
@synthesize soap;
@synthesize isProcessed;
@synthesize isSupportForEvents;


-(id)initWithSSDPDevice:(SSDPDBDevice_ObjC*)device{
    self = [super init];
    
    if (self) {	
        NSLog(@"BasicUPnPService - initWithSSDPDevice - %@", [device urn] );
        
        mMutex = [[NSRecursiveLock alloc] init];

        /* TODO: device -> retain property */
        ssdpdevice = device;
        [device retain];

        [self setUrn:[device urn]];
        
        baseURLString = nil;
        baseURL = nil;	
        descriptionURL = nil;
        eventURL = nil;
        controlURL = nil;
        serviceType = nil;
        eventUUID = nil;
        
        isProcessed = NO;
        isSupportForEvents = NO;
        
        stateVariables = [[NSMutableDictionary alloc] init]; //StateVariable
        
        mObservers = [[NSMutableArray alloc] init];
        
        //We still need to initialze this class with information from the location URL given by the ssdp 'device'
        //this is done in 'process'
    }
	
	return self;
}

-(void)dealloc{
    NSLog(@"BasicUPnPService - dealloc - %@", [ssdpdevice urn]);

	if(eventUUID != nil){
		[[[UPnPManager GetInstance] upnpEvents] UnSubscribe:eventUUID ];
	}
	
	[mObservers release];
	[eventUUID release];
	[ssdpdevice release];
	[baseURL release];
	[descriptionURL release];
	[eventURL release];
	[controlURL release];		
	[serviceType release];		
	[baseURLString release];
    
	[stateVariables release];
	
    [urn release];
	[soap release];
	[mMutex release];
	
	baseURL = nil;
	descriptionURL = nil;
	eventURL = nil;
	controlURL = nil;		
	serviceType = nil;
	baseURLString = nil;
	urn = nil;
	eventUUID = nil;
	
	[super dealloc];
}


-(int)addObserver:(BasicUPnPServiceObserver*)obs{
	int ret = 0;
	
	[mMutex lock];
	[mObservers addObject:obs];
	ret = [mObservers count];
	[mMutex unlock];
	
	return ret;	
}

-(int)removeObserver:(BasicUPnPServiceObserver*)obs{
	int ret = 0;
	
	[mMutex lock];
	[mObservers removeObject:obs];
	ret = [mObservers count];
	[mMutex unlock];
	
	return ret;	
}

-(BOOL)isObserver:(BasicUPnPServiceObserver*)obs{
	BOOL ret = NO;
	[mMutex lock];
	ret = [mObservers containsObject:obs];
	[mMutex unlock];
	
	return ret;	
	
}


//Can be overriden by subclasses if they need ohter kind of parsing
-(int)process{
	int ret = 0;
	
	if(isProcessed == YES){
		return 1;
	}
	
	//We need to initialze this class with information from the location URL given by the ssdp 'ssdpdevice'
	BasicServiceParser *parser = [[BasicServiceParser alloc] initWithUPnPService:self];
	ret = [parser parse];
	[parser release];
	
	//Set the soap actions
	[soap release];
	if(ret == 0){
		soap = [[[UPnPManager GetInstance] soapFactory] allocSoapWithURN:urn andBaseNSURL:baseURL andControlURL:controlURL andEventURL:eventURL];
		//retain is not needed because we did alloc
		isProcessed = YES;
	}else{
		isProcessed = NO;
	}
	
	//Start listening for events
	if(eventURL){
		eventUUID = [[[UPnPManager GetInstance] upnpEvents] Subscribe:(UPnPEvents_Observer*)self]; 
		if(eventUUID != nil){
	//		NSLog(@"Service Subsrcibed for events; uuid:%@", eventUUID);
			[eventUUID retain];
			isSupportForEvents = YES;
		}
	}
	
	return ret;
}


//UPnPEvents_Observer
-(void)UPnPEvent:(NSDictionary*)events{
	BasicUPnPServiceObserver *obs = nil;
	
	[mMutex lock];
	NSEnumerator *listeners = [mObservers objectEnumerator];
	while(obs = [listeners nextObject]){
		[obs UPnPEvent:self events:events];
	}	
	[mMutex unlock];
}

-(NSURL*)GetUPnPEventURL{
	NSURL *ret = nil;
	if(eventURL){
		ret = [NSURL URLWithString:eventURL relativeToURL:baseURL];		
	}
	return ret;
}

-(void)SubscriptionTimerExpiresIn:(int)seconds timeoutSubscription:(int)timeout timeSubscription:(double)subscribed{

	//Re-Subscribe
	if(eventURL){
        NSString *oldUUID = eventUUID;
		eventUUID = [[[UPnPManager GetInstance] upnpEvents] Subscribe:(UPnPEvents_Observer*)self]; 		
        if(eventUUID != nil){
            //NSLog(@"Service Re-Subsrcibed for events; uuid:%@, old uuid:%@", eventUUID, oldUUID);
            //Unsubscribe old
            [[[UPnPManager GetInstance] upnpEvents] UnSubscribe:oldUUID];
            [oldUUID release];
			[eventUUID retain];
			isSupportForEvents = YES;
		}
	}
}
@end
