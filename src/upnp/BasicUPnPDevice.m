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


#import "BasicUPnPDevice.h"
#import "UPnPManager.h"
#import "BasicDeviceParser.h"
#import "ServiceFactory.h"

@interface BasicUPnPDevice()
	-(void)syncServices;
@end


@implementation BasicUPnPDevice

@synthesize isRoot;
@synthesize isFound;
@synthesize uuid;
@synthesize lastUpdated;
@synthesize xmlLocation;
@synthesize baseURL;
@synthesize baseURLString;
@synthesize friendlyName;
@synthesize udn;
@synthesize usn;
@synthesize urn;
@synthesize smallIcon;
@synthesize smallIconWidth;
@synthesize smallIconHeight;
@synthesize smallIconURL;
@synthesize smallIconDepth;
@synthesize type;


-(id)init{
    self = [super init];
    
    if (self) {
        //NSLog(@"BasicUPnPDevice - init");
        services = [[NSMutableDictionary alloc] init]; //Key=urn string, Object=BasicUPnPService 
        lastUpdated = [NSDate timeIntervalSinceReferenceDate];
        smallIconWidth = 0;
        smallIconHeight = 0;
        baseURL = nil;
        baseURLString = nil;
	}
    
	return self;
}

-(id)initWithSSDPDevice:(SSDPDBDevice_ObjC*)ssdp{
	[self init];
	
	isRoot = ssdp.isroot;
	uuid = ssdp.uuid;
	[uuid retain];
    [self setUsn:ssdp.usn];
    [self setUrn:ssdp.urn];
	type = [NSString stringWithFormat:@"%@:%@", ssdp.type, ssdp.version];
	[type retain];
	xmlLocation = ssdp.location;
	[xmlLocation retain];
	
	return self;
}

-(void)dealloc{
    
    [services removeAllObjects];
	[services release];
	services = nil;
    
	[uuid release];
	[xmlLocation release];
	[baseURL release];
	[baseURLString release];
	[friendlyName release];
	[udn release];
	[usn release];
	[urn release];
	[smallIcon release];
	[type release];
    [smallIconURL release];
    
	[super dealloc];
}

-(int)loadDeviceDescriptionFromXML{
	int ret = 0;
	if(xmlLocation == nil || [xmlLocation length] < 5){
		return -1;
	}
		
	BasicDeviceParser *parser = [[BasicDeviceParser alloc] initWithUPnPDevice:self];
	ret = [parser parse];
	[parser release];
	
	
	return ret;
}



-(void)syncServices{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    //Sync 'services'
	SSDPDBDevice_ObjC *ssdpService = nil;
	BasicUPnPService *upnpService = nil;
	NSArray *ssdpservices = [[[UPnPManager GetInstance] DB] getSSDPServicesForUUID:uuid]; //SSDPDBDevice_ObjC[]

	NSMutableDictionary *toRemove = [[NSMutableDictionary alloc] initWithDictionary:services];
	NSMutableDictionary *toAdd = [[NSMutableDictionary alloc] init];
	
	for(int x=0;x<[ssdpservices count];x++){
		ssdpService = [ssdpservices objectAtIndex:x];
		upnpService = [services objectForKey:[ssdpService urn]];
		if(upnpService == nil){
			//We don't have the service, create a new one
			upnpService = [[[UPnPManager GetInstance] serviceFactory] allocServiceForSSDPService:ssdpService];
			//we delay initialization of the service until we need it [upnpService process];  
			[toAdd setObject:upnpService forKey:[upnpService urn]];
            [upnpService release];
		}else{
			//remove from toremove
			[toRemove removeObjectForKey:[ssdpService urn]];
		}
	}
	//toAdd and toRemove are filled now, first remove services if needed
	NSString *key;
	for (key in toRemove) {
		[services removeObjectForKey:key];
	}	
	for (key in toAdd) {
		[services setObject:[toAdd objectForKey:key] forKey:key];
	}
	
	[toRemove release];
	[toAdd release];
    [pool release];
}

-(NSMutableDictionary*)getServices{ //BasicUPnPService[]
	[self syncServices];	
	return services;
}

-(BasicUPnPService*)getServiceForType:(NSString*)serviceUrn{
	BasicUPnPService *thisService = nil;
	
	[self syncServices];	
		
	//Get service
	thisService = [services objectForKey:serviceUrn];
	if(thisService != nil){
		[thisService process]; //can be called several times, we need to be sure it is done
	}
	
	return thisService;
}





@end
