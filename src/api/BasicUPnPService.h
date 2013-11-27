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
