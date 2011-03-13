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
	[super init];
	
	mMutex = [[NSRecursiveLock alloc] init];

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
	
	
	
	return self;
}

-(void)dealloc{
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
			NSLog(@"Service Subsrcibed for events; uuid:%@", eventUUID);
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


@end
