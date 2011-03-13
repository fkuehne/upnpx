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


#import <Foundation/Foundation.h>
#import "SSDPDB_ObjC.h"
#import "BasicUPnPDevice.h"
#include <pthread.h>


@class UPnPDBObserver, UPnPDB;

/**
 * Observers
 */
@protocol UPnPDBObserver
-(void)UPnPDBWillUpdate:(UPnPDB*)sender;
-(void)UPnPDBUpdated:(UPnPDB*)sender;
@end



@interface UPnPDB : NSObject <SSDPDB_ObjC_Observer>{
	NSMutableArray *readyForDescription; //BasicUPnPDevice (only some info is known)
	NSMutableArray *rootDevices; //BasicUPnPDevice (full info is known)
	NSRecursiveLock *mMutex;
	SSDPDB_ObjC *mSSDP;
	NSMutableArray *mObservers;
	NSThread *mHTTPThread;
	
}

-(id)initWithSSDP:(SSDPDB_ObjC*)ssdp; 
-(void)dealloc;
-(void)lock;
-(void)unlock;
-(void)httpThread:(id)argument;
-(int)addObserver:(UPnPDBObserver*)obs;
-(int)removeObserver:(UPnPDBObserver*)obs;
-(NSArray*)getSSDPServicesFor:(BasicUPnPDevice*)device; //Returns NSArray[SSDPDBDevice_ObjC*] devices
-(NSArray*)getSSDPServicesForUUID:(NSString*)uuid; //Returns NSArray[SSDPDBDevice_ObjC*] devices

@property(readonly, retain) NSMutableArray *rootDevices;

@end
