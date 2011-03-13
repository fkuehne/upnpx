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
	[super init];
	//NSLog(@"BasicUPnPDevice - init");
	services = [[NSMutableDictionary alloc] init]; //Key=urn string, Object=BasicUPnPService 
	lastUpdated = [NSDate timeIntervalSinceReferenceDate];
	smallIconWidth = 0;
	smallIconHeight = 0;
	baseURL = nil;
	baseURLString = nil;
	
	return self;
}

-(id)initWithSSDPDevice:(SSDPDBDevice_ObjC*)ssdp{
	[self init];
	
	isRoot = ssdp.isroot;
	uuid = ssdp.uuid;
	[uuid retain];
	usn = ssdp.usn;
	[usn retain];
	urn = ssdp.urn;
	[urn retain];
	type = [NSString stringWithFormat:@"%@:%@", ssdp.type, ssdp.version];
	[type retain];
	xmlLocation = ssdp.location;
	[xmlLocation retain];
	
	return self;
}

-(void)dealloc{
	NSLog(@"BasicUPnPDevice - dealloc");
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
NSLog(@"toAdd [upnpService urn] = >%@<", [upnpService urn]);			
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
