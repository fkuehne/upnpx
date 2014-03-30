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

-(void)lock;
-(void)unlock;
-(void)httpThread:(id)argument;
-(int)addObserver:(UPnPDBObserver*)obs;
-(int)removeObserver:(UPnPDBObserver*)obs;
-(NSArray*)getSSDPServicesFor:(BasicUPnPDevice*)device; //Returns NSArray[SSDPDBDevice_ObjC*] devices
-(NSArray*)getSSDPServicesForUUID:(NSString*)uuid; //Returns NSArray[SSDPDBDevice_ObjC*] devices

@property(readonly, retain) NSMutableArray *rootDevices;

@end
