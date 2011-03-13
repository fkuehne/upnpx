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

#import "SSDPDB_ObjC.h"

#include "ssdpdb.h"
#include "ssdpdbobserver.h"
#include "ssdpdbdevice.h"
#include "upnp.h"
#include <vector>


/***
 * C/C++
 */

class SSDPDB_Observer_wrapper:public SSDPDBObserver{
public:
	SSDPDB_ObjC* mObjCObserver;
	SSDPDB_Observer_wrapper(SSDPDB_ObjC* observer){
		mObjCObserver = observer;
		UPNP::GetInstance()->GetSSDP()->GetDB()->AddObserver(this);
	}
	
	~SSDPDB_Observer_wrapper(){
		UPNP::GetInstance()->GetSSDP()->GetDB()->RemoveObserver(this);
	}
	
	int SSDPDBMessage(SSDPDBMsg* msg){	
		[mObjCObserver SSDPDBUpdate];
		return 0;
	}
private:	
	SSDPDB_Observer_wrapper(){}
};


/***
 * Obj-C
 */


@implementation SSDPDB_ObjC

@synthesize SSDPObjCDevices;

-(id)init
{
	if(![super init]){	
		return nil;
	}
	
	mMutex = [[NSRecursiveLock alloc] init];
	mObservers = [[NSMutableArray alloc] init];
	SSDPObjCDevices = [[NSMutableArray alloc] init]; 

	mWrapper = new SSDPDB_Observer_wrapper(self);
	return self;
}

-(void)dealloc{
	delete((SSDPDB_Observer_wrapper*)mWrapper);
	[mObservers removeAllObjects];
	[mObservers release];
	[SSDPObjCDevices removeAllObjects];
	[SSDPObjCDevices release];
	[mMutex release];
	[super dealloc];
}

-(void)lock{
	[mMutex lock];
}

-(void)unlock{
	[mMutex unlock];
}


-(int)startSSDP{
	return UPNP::GetInstance()->GetSSDP()->Start();
}

-(int)stopSSDP{
	return UPNP::GetInstance()->GetSSDP()->Stop();
}



-(int)searchSSDP{
	return UPNP::GetInstance()->GetSSDP()->Search();	
}


-(int)addObserver:(SSDPDB_ObjC_Observer*)obs{
	int ret = 0;
	[self lock];
	[mObservers addObject:obs];
	ret = [mObservers count];
	[self unlock];
	return ret;
}

-(int)removeObserver:(SSDPDB_ObjC_Observer*)obs{
	int ret = 0;
	[self lock];
	[mObservers removeObject:obs];
	ret = [mObservers count];
	[self unlock];
	return ret;
}

-(void)SSDPDBUpdate{
	[NSRunLoop currentRunLoop]; //Start our runloop
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	SSDPDB_ObjC_Observer *obs;
	
	//Inform the listeners
	NSEnumerator *listeners = [mObservers objectEnumerator];
	while((obs = [listeners nextObject])){
		[obs SSDPDBWillUpdate:self];
	}
	
	
	[self lock];
	[SSDPObjCDevices removeAllObjects];
	//Update the Obj-C Array	
	UPNP::GetInstance()->GetSSDP()->GetDB()->Lock();
	SSDPDBDevice* thisDevice;
	std::vector<SSDPDBDevice*> devices;
	std::vector<SSDPDBDevice*>::const_iterator it;
	devices = UPNP::GetInstance()->GetSSDP()->GetDB()->GetDevices();
	for(it=devices.begin();it<devices.end();it++){
		thisDevice = *it;
		SSDPDBDevice_ObjC* thisObjCDevice = [[SSDPDBDevice_ObjC alloc] initWithCPPDevice:thisDevice];
		[SSDPObjCDevices addObject:thisObjCDevice];
		[thisObjCDevice release];
	}
	UPNP::GetInstance()->GetSSDP()->GetDB()->Unlock();
	
	//Inform the listeners
	listeners = [mObservers objectEnumerator];
	while((obs = [listeners nextObject])){
		[obs SSDPDBUpdated:self];
	}
	[self unlock];
	
	
	[pool release];
}
@end



/**
 * Device class
 */
@implementation SSDPDBDevice_ObjC

@synthesize isdevice;
@synthesize isroot;
@synthesize isservice;
@synthesize uuid;
@synthesize urn;
@synthesize usn;
@synthesize type;
@synthesize version;
@synthesize host;
@synthesize location;	
@synthesize ip;
@synthesize port;


-(id)initWithCPPDevice:(void*)cppDevice{
	if(![super init]){	
		return nil;
	}
	SSDPDBDevice *dev = (SSDPDBDevice*)cppDevice;
	
	isdevice	= dev->isdevice==1?true:false;
	isroot		= dev->isroot==1?true:false;
	isservice	= dev->isservice==1?true:false;
	uuid		= [[NSString alloc] initWithCString:dev->uuid.c_str()];
	urn			= [[NSString alloc] initWithCString:dev->urn.c_str()];
	usn			= [[NSString alloc] initWithCString:dev->usn.c_str()];
	type		= [[NSString alloc] initWithCString:dev->type.c_str()];
	version		= [[NSString alloc] initWithCString:dev->version.c_str()];
	host		= [[NSString alloc] initWithCString:dev->host.c_str()];
	location	= [[NSString alloc] initWithCString:dev->location.c_str()];	
	ip			= dev->ip;
	port		= dev->port;
	
	return self;
}

-(void)dealloc{
	[uuid release];
	[urn release];
	[usn release];
	[type release];
	[version release];
	[host release];
	[location release];
	
	[super dealloc];
}


@end