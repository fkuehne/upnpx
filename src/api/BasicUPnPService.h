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
#import "StateVariable.h"
#import "SoapAction.h"
#import "UPnPEvents.h"

@class BasicUPnPServiceObserver, BasicUPnPService;

@protocol BasicUPnPServiceObserver
-(void)UPnPEvent:(BasicUPnPService*)sender events:(NSDictionary*)events;
@end


@interface BasicUPnPService : NSObject <UPnPEvents_Observer> {
	SSDPDBDevice_ObjC *ssdpdevice;
	
	BOOL isProcessed;
	BOOL isSupportForEvents;
	
	NSString *baseURLString;
	NSURL *baseURL;
	NSString *descriptionURL;
	NSString *eventURL;
	NSString *controlURL;
	NSString *serviceType;
	SoapAction *soap;
	
	NSString *urn;
	NSString *eventUUID;
	
	NSMutableDictionary *stateVariables; //StateVariable
	NSMutableArray *mObservers; //BasicUPnPServiceObserver
	
	NSRecursiveLock *mMutex;
}


-(id)initWithSSDPDevice:(SSDPDBDevice_ObjC*)device;
-(void)dealloc;

-(int)addObserver:(BasicUPnPServiceObserver*)obs;
-(int)removeObserver:(BasicUPnPServiceObserver*)obs;
-(BOOL)isObserver:(BasicUPnPServiceObserver*)obs;


//Process is called by the ServiceFactory after basic parsing is done and succeeded
//The BasicUPnPService (this) members are set with the right values
//Further processing is service dependent and must be handled by the derived classes 
//The return value must be 0 when implenented
-(int)process; //in C++ this should be a pure virtual function



@property (readwrite, retain) NSURL* baseURL;
@property (readwrite, retain) NSString* baseURLString;
@property (readwrite, retain) NSString* descriptionURL;
@property (readwrite, retain) NSString* eventURL;
@property (readwrite, retain) NSString* controlURL;
@property (readwrite, retain) NSString* serviceType;
@property (readonly, retain) SSDPDBDevice_ObjC *ssdpdevice;
@property (readonly) NSMutableDictionary *stateVariables;
@property (readonly) SoapAction *soap;
@property (readwrite, retain) NSString* urn;
@property (readwrite) BOOL isProcessed;
@property (readwrite) BOOL isSupportForEvents;

@end
