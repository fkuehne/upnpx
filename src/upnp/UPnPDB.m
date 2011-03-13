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

#import "UPnPDB.h"
#import "UPnPManager.h"



@interface UPnPDB()
-(BasicUPnPDevice*)addToDescriptionQueue:(SSDPDBDevice_ObjC*)ssdpdevice; 
@end

@implementation UPnPDB

@synthesize rootDevices;


-(id)initWithSSDP:(SSDPDB_ObjC*)ssdp{ 
	[super init];
	mSSDP = ssdp;
	mMutex = [[NSRecursiveLock alloc] init];
	rootDevices = [[NSMutableArray alloc] init]; //BasicUPnPDevice
	readyForDescription = [[NSMutableArray alloc] init]; //BasicUPnPDevice
	mObservers = [[NSMutableArray alloc] init];
	
	[mSSDP addObserver:(SSDPDB_ObjC_Observer*)self];
	
	mHTTPThread = [[NSThread alloc] initWithTarget:self selector:@selector(httpThread:) object:nil];
	[mHTTPThread start];
	
	return self;
}

-(void)dealloc{
	[mHTTPThread cancel];
	[mSSDP removeObserver:(SSDPDB_ObjC_Observer*)self];
	[rootDevices removeAllObjects];
	[rootDevices release];
	rootDevices = nil;
	[readyForDescription release];
	readyForDescription = nil;
	[mMutex release];
	mMutex = nil;
	[super dealloc];
}

-(void)lock{
	[mMutex lock];
}

-(void)unlock{
	[mMutex unlock];
}


-(int)addObserver:(UPnPDBObserver*)obs{
	int ret = 0;
	[self lock];
	[mObservers addObject:obs];
	ret = [mObservers count];
	[self unlock];
	return ret;
}

-(int)removeObserver:(UPnPDBObserver*)obs{
	int ret = 0;
	[self lock];
	[mObservers removeObject:obs];
	ret = [mObservers count];
	[self unlock];
	return ret;
}


/**
 * SSDPDB_ObjC_Observer
 */

//The SSDPObjCDevices array might change (this is sent before SSDPDBUpdated)
-(void)SSDPDBWillUpdate:(SSDPDB_ObjC*)sender{
	[self lock]; //Protect the rootDevices tree
//	NSLog(@"UPnPDB [SSDPDBWillUpdate - rootDevices count]=%d",[rootDevices count]);
}


//The SSDPObjCDevices array is updated
-(void)SSDPDBUpdated:(SSDPDB_ObjC*)sender{
	//NSLog(@"UPnPDB [ SSDPDBUpdated- rootDevices count]=%d",[rootDevices count]);
	
	/*
	 * Sync [sender SSDPObjCDevices] with rootDevices
	 */
	NSEnumerator *ssdpenum;
	NSEnumerator *rootenum;
	SSDPDBDevice_ObjC *ssdpdevice;
	BasicUPnPDevice *upnpdevice;
	//Flag all rootdevices as 'notfound'
	rootenum = [rootDevices objectEnumerator];
	while((upnpdevice = [rootenum nextObject])){
		upnpdevice.isFound=NO;
	}	
	BOOL found;
	
	//flag all devices still in ssdp as 'found'
	ssdpenum = [[sender SSDPObjCDevices] objectEnumerator];	
	while((ssdpdevice = [ssdpenum nextObject])){
	
		if(ssdpdevice.isroot == FALSE && ssdpdevice.isdevice == TRUE){// ssdpdevice.isroot == TRUE){ //@TODO; do something with the embedded devices (they have (or can have) another uuid)
			//Search it in our root devices
			if([rootDevices count] == 0){
				//add ssdp device to queue, an emty UPnP device is created and schedulled for description
				[self addToDescriptionQueue:ssdpdevice];
			}else{
				found = NO;
				rootenum = [rootDevices objectEnumerator];
				while((upnpdevice = [rootenum nextObject])){
					if( [ssdpdevice.usn compare:upnpdevice.usn] == NSOrderedSame ){
						upnpdevice.isFound=YES;
						found = YES;
						break;
					}
				}
				if(found == NO){
					//add ssdp device to queue, an emty UPnP device is created and schedulled for description
					[self addToDescriptionQueue:ssdpdevice];
				}
				
			}
		}
	}	
	
	//remove all non found devices
	NSMutableArray *discardedItems = [[NSMutableArray alloc] init];
	rootenum = [rootDevices objectEnumerator];
	while((upnpdevice = [rootenum nextObject])){
		if(upnpdevice.isFound==NO){
			[discardedItems addObject:upnpdevice];			
		}
	}	
	
	if([discardedItems count] > 0){
		//Inform the listeners so they know the rootDevices array might change
		UPnPDBObserver *obs;
		NSEnumerator *listeners = [mObservers objectEnumerator];
		while((obs = [listeners nextObject])){
			[obs UPnPDBWillUpdate:self];
		}		
		
		[rootDevices removeObjectsInArray:discardedItems];
		[discardedItems release];
		
		listeners = [mObservers objectEnumerator];
		while((obs = [listeners nextObject])){
			[obs UPnPDBUpdated:self];
		}		
		
		
	}	
	[self unlock];

}


-(BasicUPnPDevice*)addToDescriptionQueue:(SSDPDBDevice_ObjC*)ssdpdevice{
	[self lock];

	BasicUPnPDevice *upnpdevice;
	BOOL found = NO;
	
	NSEnumerator *descenum = [readyForDescription objectEnumerator];
	while((upnpdevice = [descenum nextObject])){
		if( [ssdpdevice.usn compare:upnpdevice.usn] == NSOrderedSame ){
			found = YES;
			break;
		}
	}	
	
	if(found == NO){
		//new one, add to queue
		//this is the only place we create BacicUPnP (or derived classes) devices
		upnpdevice = [[[UPnPManager GetInstance] deviceFactory] allocDeviceForSSDPDevice:ssdpdevice];
		[readyForDescription addObject:upnpdevice];
		[upnpdevice release];
		//Signal the description load thread 
	}
	
	[self unlock];
	
	return upnpdevice; //carefull, it is possible upnpevice will be deleted before the caller can use it
}




//return SSDPDBDevice_ObjC[]
-(NSArray*)getSSDPServicesFor:(BasicUPnPDevice*)device{
	[self lock];
	[mSSDP lock];
	NSMutableArray *services = [[[NSMutableArray alloc] init] autorelease];
	
	SSDPDBDevice_ObjC *ssdpdevice;
	NSEnumerator *ssdpenum = [[mSSDP SSDPObjCDevices] objectEnumerator];	
	while((ssdpdevice = [ssdpenum nextObject])){
		if([ssdpdevice isservice] == 1){
			if( [[ssdpdevice uuid] isEqual:[device uuid]]){
				[services addObject:ssdpdevice]; //change string to service
			}
		}
	}
	
	[mSSDP unlock];
	[self unlock];
	
	return services;
}

//return SSDPDBDevice_ObjC[] services
-(NSArray*)getSSDPServicesForUUID:(NSString*)uuid{
	[self lock];
	[mSSDP lock];
	NSMutableArray *services = [[[NSMutableArray alloc] init] autorelease];
	
	SSDPDBDevice_ObjC *ssdpdevice;
	NSEnumerator *ssdpenum = [[mSSDP SSDPObjCDevices] objectEnumerator];	
	while((ssdpdevice = [ssdpenum nextObject])){
		if([ssdpdevice isservice] == 1){
			if( [uuid isEqual:[ssdpdevice uuid]]){
				[services addObject:ssdpdevice]; //change string to service
			}
		}
	}
	
	[mSSDP unlock];
	[self unlock];
	
	return services;
}




//Thread
-(void)httpThread:(id)argument{
	NSAutoreleasePool *pool;
	
	while(1){
		pool = [[NSAutoreleasePool alloc] init];
		if([readyForDescription count] > 0){
		//	NSLog(@"process queue httpThread:(id)argument, %d", [readyForDescription count]);
			BasicUPnPDevice *upnpdevice;
			//NSEnumerator *descenum = [readyForDescription objectEnumerator];
			//while(upnpdevice = [descenum nextObject]){
			while( [readyForDescription count] > 0){
				upnpdevice = [readyForDescription objectAtIndex:0];
				//fill the upnpdevice with info from the XML
				int ret = [upnpdevice loadDeviceDescriptionFromXML];
				if(ret == 0){
					[self lock];
					//NSLog(@"httpThread upnpdevice, location=%@", [upnpdevice xmlLocation]);
					
					//Inform the listeners so they know the rootDevices array might change
					UPnPDBObserver *obs;
					NSEnumerator *listeners = [mObservers objectEnumerator];
					while((obs = [listeners nextObject])){
						[obs UPnPDBWillUpdate:self];
					}	
					
					//This is the only place we add devices to the rootdevices
					[rootDevices addObject:upnpdevice];

							
					listeners = [mObservers objectEnumerator];
					while((obs = [listeners nextObject])){
						[obs UPnPDBUpdated:self];
					}		
					
					
					[self unlock];
				}
				[readyForDescription removeObjectAtIndex:0];
				
			}				
		}
		[pool release];
		sleep(2); //Wait and get signalled @TODO
	}	
}



@end
