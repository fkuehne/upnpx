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

@class BasicHTTPServer_ObjC_Observer, BasicHTTPServer_ObjC;

/**
 * Interface
 */
@protocol BasicHTTPServer_ObjC_Observer
//Methods to hook into the HTTP Server
-(BOOL)canProcessMethod:(BasicHTTPServer_ObjC*)sender requestMethod:(NSString*)method;
-(BOOL)request:(BasicHTTPServer_ObjC*)sender method:(NSString*)method path:(NSString*)path version:(NSString*)version headers:(NSDictionary*)headers body:(NSData*)body;
-(BOOL)response:(BasicHTTPServer_ObjC*)sender returncode:(int*)returncode headers:(NSMutableDictionary*)headers body:(NSMutableData*)body;
@end



@interface BasicHTTPServer_ObjC : NSObject {
@private
	void* httpServerWrapper;
	NSMutableArray *mObservers; //BasicHTTPServer_ObjC_Observer
}


-(id)init;
-(void)dealloc;
-(int)start;
-(int)stop;
-(void)addObserver:(BasicHTTPServer_ObjC_Observer*)observer;
-(void)removeObserver:(BasicHTTPServer_ObjC_Observer*)observer;
-(NSMutableArray*)getObservers;
-(NSString*)getIPAddress;
-(unsigned short)getPort;

@end
