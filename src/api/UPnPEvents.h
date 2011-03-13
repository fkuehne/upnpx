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
#import "BasicHTTPServer_ObjC.h"
#import "UPnPEventParser.h"

@class UPnPEvents_Observer;

//Observer
@protocol UPnPEvents_Observer
-(void)UPnPEvent:(NSDictionary*)events;
-(NSURL*)GetUPnPEventURL;
@end



@interface UPnPEvents : NSObject <BasicHTTPServer_ObjC_Observer> {
	NSMutableDictionary *mEventSubscribers; //uuid, observer
	BasicHTTPServer_ObjC *server;
	UPnPEventParser *parser;
	NSRecursiveLock *mMutex;
}

-(id)init;
-(void)dealloc;

-(NSString*)Subscribe:(UPnPEvents_Observer*)subscriber;
-(void)UnSubscribe:(NSString*)uuid;


//BasicHTTPServer_ObjC_Observer
-(BOOL)canProcessMethod:(BasicHTTPServer_ObjC*)sender requestMethod:(NSString*)method;
-(BOOL)request:(BasicHTTPServer_ObjC*)sender method:(NSString*)method path:(NSString*)path version:(NSString*)version headers:(NSDictionary*)headers body:(NSData*)body;
-(BOOL)response:(BasicHTTPServer_ObjC*)sender returncode:(int*)returncode headers:(NSMutableDictionary*)headers body:(NSMutableData*)body;

@end
