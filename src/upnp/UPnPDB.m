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

#import "UPnPDB.h"
#import "UPnPManager.h"



@interface UPnPDB()
-(BasicUPnPDevice*)addToDescriptionQueue:(SSDPDBDevice_ObjC*)ssdpdevice;
@end

@implementation UPnPDB

@synthesize rootDevices;


-(id)initWithSSDP:(SSDPDB_ObjC*)ssdp{
    self = [super init];
    
    if (self) {
        // DO NOT retain, as it leads to a retain cycle: ssdp observers <--> upnpDB
        mSSDP = ssdp;
        //        mMutex = [[NSRecursiveLock alloc] init];
        //        mMutexRunning = [[NSRecursiveLock alloc] init];
        rootDevices = [[NSMutableArray alloc] init]; //BasicUPnPDevice
        readyForDescription = [[NSMutableArray alloc] init]; //BasicUPnPDevice
        mObservers = [[NSMutableArray alloc] init];
        
        [mSSDP addObserver:(SSDPDB_ObjC_Observer*)self];
        
        mHTTPThread = [[NSThread alloc] initWithTarget:self selector:@selector(httpThread:) object:nil];
        [mHTTPThread start];
	}

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
    if ([mMutex tryLock]) {
        [mObservers removeObject:obs];
        ret = [mObservers count];
        [self unlock];
    }
	return ret;
}


/**
 * SSDPDB_ObjC_Observer
 */

//The SSDPObjCDevices array might change (this is sent before SSDPDBUpdated)
-(void)SSDPDBWillUpdate:(SSDPDB_ObjC*)sender{
}
//	[self lock]; //Protect the rootDevices tree
////	NSLog(@"UPnPDB [SSDPDBWillUpdate - rootDevices count]=%d",[rootDevices count]);
//}


//The SSDPObjCDevices array is updated
-(void)SSDPDBUpdated:(SSDPDB_ObjC*)sender
{
	//NSLog(@"UPnPDB [ SSDPDBUpdated- rootDevices count]=%d",[rootDevices count]);
	
	/*
	 * Sync [sender SSDPObjCDevices] with rootDevices
	 */
    
    @synchronized(rootDevices)
    {
        //Flag all rootdevices as 'notfound'
        [rootDevices enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop) {
            BasicUPnPDevice *upnpdevice = (BasicUPnPDevice *)obj;
            upnpdevice.isFound = NO;
        }];
        
        //flag all devices still in ssdp as 'found'
        
        for (SSDPDBDevice_ObjC *ssdpdevice in [sender SSDPObjCDevices])
        {
            if(ssdpdevice.isroot == FALSE && ssdpdevice.isdevice == TRUE){// ssdpdevice.isroot == TRUE){ //@TODO; do something with the embedded devices (they have (or can have) another uuid)
                // look for upnpdevice in root devices
                NSUInteger index = [rootDevices indexOfObjectPassingTest:^BOOL(id obj, NSUInteger index, BOOL *stop){
                    BasicUPnPDevice *upnpdevice = (BasicUPnPDevice *)obj;
                    if ([ssdpdevice.usn isEqualToString:upnpdevice.usn])
                    {
                        upnpdevice.isFound = YES;
                        return *stop = YES;
                    }
                    return NO;
                }];
                
                if (index == NSNotFound)
                {
                    //add ssdp device to queue, an emty UPnP device is created and schedulled for description
                    [self addToDescriptionQueue:ssdpdevice];
                }
                
            }
        }
        
        
        //remove all non found devices
        NSMutableArray *discardedItems = [[NSMutableArray alloc] init];
        @synchronized(rootDevices)
        {
            for (BasicUPnPDevice *upnpdevice in rootDevices)
            {
                if(upnpdevice.isFound==NO){
                    [discardedItems addObject:upnpdevice];
                }
            }
            
        }
        
        if (discardedItems.count > 0)
        {
            for (UPnPDBObserver *obs in mObservers)
            {
                [obs UPnPDBWillUpdate:self];
            }
            
            @synchronized(rootDevices)
            {
                [rootDevices removeObjectsInArray:discardedItems];
            }
            
            
            for (UPnPDBObserver *obs in mObservers)
            {
                [obs UPnPDBUpdated:self];
            }
        }
        
        
        [discardedItems release];
    }
    
    
    
}


-(BasicUPnPDevice*)addToDescriptionQueue:(SSDPDBDevice_ObjC*)ssdpdevice{
    
    
	BasicUPnPDevice *upnpdevice = nil;
	
    @synchronized(readyForDescription)
    {
        NSUInteger index = [readyForDescription indexOfObjectPassingTest:^BOOL(id obj, NSUInteger index, BOOL *stop){
            BasicUPnPDevice *upnpdevice = (BasicUPnPDevice *)obj;
            if ([ssdpdevice.usn isEqualToString:upnpdevice.usn])
            {
                upnpdevice.isFound = YES;
                return *stop = YES;
            }
            return NO;
        }];
        
        if (index == NSNotFound)
        {
            //new one, add to queue
            //this is the only place we create BacicUPnP (or derived classes) devices
            upnpdevice = [[[UPnPManager GetInstance] deviceFactory] allocDeviceForSSDPDevice:ssdpdevice];
            if (readyForDescription != nil)
            {
                [readyForDescription addObject:upnpdevice];
            }
            
            [upnpdevice release];
        }
        
    }
    
    //	NSEnumerator *descenum = [readyForDescription objectEnumerator];
    //	while((upnpdevice = [descenum nextObject])){
    //		if( [ssdpdevice.usn compare:upnpdevice.usn] == NSOrderedSame ){
    //			found = YES;
    //			break;
    //		}
    //	}
    //
    //	if(found == NO){
    //		//new one, add to queue
    //		//this is the only place we create BacicUPnP (or derived classes) devices
    //		upnpdevice = [[[UPnPManager GetInstance] deviceFactory] allocDeviceForSSDPDevice:ssdpdevice];
    //		[readyForDescription addObject:upnpdevice];
    //		[upnpdevice release];
    //		//Signal the description load thread
    //	}
    //
    
	
	return upnpdevice; //carefull, it is possible upnpevice will be deleted before the caller can use it
}




//return SSDPDBDevice_ObjC[]
-(NSArray*)getSSDPServicesFor:(BasicUPnPDevice*)device{
	
    NSMutableArray *services = [[[NSMutableArray alloc] init] autorelease];
    
    @synchronized(mObservers){
        [mSSDP lock];
        
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
    }
	
	
	
	return services;
}

//return SSDPDBDevice_ObjC[] services
-(NSArray*)getSSDPServicesForUUID:(NSString*)uuid{
    
    NSMutableArray *services = [[[NSMutableArray alloc] init] autorelease];
    
    @synchronized(mObservers)
    {
        [mSSDP lock];
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
    }
	
    
	
	return services;
}


-(void)stopThread
{
    mRun = 0;
    [mHTTPThread cancel];
    
    // wait for thread to finish
    //[mMutexRunning lock];
    //[mMutexRunning unlock];
}

//Thread
-(void)httpThread:(id)argument{
    
    mRun = 1;
    
    while(mRun){
        @autoreleasepool {
            
            BasicUPnPDevice *upnpdevice = nil;
            
            @synchronized(self){
                while (readyForDescription.count > 0)
                {
                    
                    upnpdevice = [readyForDescription objectAtIndex:0];
                    
                    if ([NSThread currentThread].isCancelled)
                    {
                        return;
                    }
                    else if (upnpdevice == nil)
                    {
                        continue;
                    }
                    
                    //fill the upnpdevice with info from the XML
                    int ret = [upnpdevice loadDeviceDescriptionFromXML];
                    if(ret == 0 && ![NSThread currentThread].isCancelled)
                    {
                        //                        [self lock];
                        //NSLog(@"httpThread upnpdevice, location=%@", [upnpdevice xmlLocation]);
                        
                        //Inform the listeners so they know the rootDevices array might change
                        
                        if ([NSThread currentThread].isCancelled)
                        {
                            return;
                        }
                        
                        for (UPnPDBObserver *obs in mObservers)
                        {
                            [obs UPnPDBWillUpdate:self];
                        }
                        
                        if ([NSThread currentThread].isCancelled)
                        {
                            return;
                        }
                        
                        //This is the only place we add devices to the rootdevices
                        if (upnpdevice != nil && rootDevices != nil)
                        {
                            [rootDevices addObject:upnpdevice];
                        }
                        
                        
                        if ([NSThread currentThread].isCancelled)
                        {
                            return;
                        }
                        
                        for (UPnPDBObserver *obs in mObservers)
                        {
                            [obs UPnPDBUpdated:self];
                        }

                        
                    }
                    [readyForDescription removeObjectAtIndex:0];
                    
                }
                
            }
            
        }
        
        if (![NSThread currentThread].isCancelled)
        {
            sleep(1); //Wait and get signalled @TODO
        }
        
    }
    
	
}



@end
