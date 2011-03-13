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

@class SSDPDB_ObjC, SSDPDB_ObjC_Observer, SSDPDBDevice_ObjC;

/**
 * Interface
 */
@protocol SSDPDB_ObjC_Observer
-(void)SSDPDBUpdated:(SSDPDB_ObjC*)sender;
-(void)SSDPDBWillUpdate:(SSDPDB_ObjC*)sender;
@end


/**
 * DB Class
 */
@interface SSDPDB_ObjC : NSObject {
@public
	NSMutableArray *mObservers;
@private
	void* mWrapper;
	NSRecursiveLock *mMutex;
	NSMutableArray *SSDPObjCDevices;
}


-(id)init;
-(void)dealloc;

-(void)lock;
-(void)unlock;

-(int)startSSDP;
-(int)stopSSDP;
-(int)searchSSDP;
-(int)addObserver:(SSDPDB_ObjC_Observer*)obs;
-(int)removeObserver:(SSDPDB_ObjC_Observer*)obs;
-(void)SSDPDBUpdate;

@property(readonly, retain) NSMutableArray *SSDPObjCDevices;

@end

/**
 * Device class
 */
@interface SSDPDBDevice_ObjC : NSObject {
@private
	bool isdevice;
	bool isroot;
	bool isservice;
	NSString *uuid;
	NSString *urn;
	NSString *usn;
	NSString *type;
	NSString *version;
	NSString *host;
	NSString *location;	
	
	unsigned int ip;
	unsigned short port;
}

-(id)initWithCPPDevice:(void*)cppDevice;
-(void)dealloc;

@property(readonly) bool isdevice;
@property(readonly) bool isroot;
@property(readonly) bool isservice;
@property(readonly) NSString *uuid;
@property(readonly) NSString *urn;
@property(readonly) NSString *usn;
@property(readonly) NSString *type;
@property(readonly) NSString *version;
@property(readonly) NSString *host;
@property(readonly) NSString *location;	
@property(readonly) unsigned int ip;	
@property(readonly) unsigned short port;

@end