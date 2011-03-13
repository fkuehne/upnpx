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

@class SocketServer_ObjC, SocketServer_ObjC_Observer;

/**
 * Interface
 */
@protocol SocketServer_ObjC_Observer
-(void)DataIn:(SocketServer_ObjC*)sender withData:(unsigned char*)data andLen:(int)len fromSource:(id)src;
@end



@interface SocketServer_ObjC : NSObject {
//@public
	
@private
	NSMutableArray *mObservers; //SocketServer_ObjC_Observer
	void* mCppSocketServer;	
	void *mCppSocketServerObserverWrapper;
}


-(id)init;
-(void)dealloc;
-(void)start;
-(void)stop;
-(void)addObserver:(SocketServer_ObjC_Observer*)obs;
-(void)removeObserver:(SocketServer_ObjC_Observer*)obs;
-(NSString*)getIPAddress;
-(unsigned short)getPort;
-(int)dataIn:(unsigned char*)data length:(int)len fromIP:(NSString*)ipAddress fromPort:(unsigned short)port;

@end
