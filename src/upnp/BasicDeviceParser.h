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
#import "BasicUPnPDevice.h"
#import "BasicParser.h"

@interface BasicDeviceParser : BasicParser {
	BasicUPnPDevice *device;
	NSString* iconURL;
	NSString* iconWidth;
	NSString* iconHeight;
	NSString* iconMime;	
	NSString* iconDepth;			
	
	NSMutableArray* friendlyNameStack;
	NSMutableArray* udnStack;

	NSString* friendlyName;
	NSString* udn;

	
}

-(id)initWithUPnPDevice:(BasicUPnPDevice*)upnpdevice;
-(int)parse;
-(void)iconFound:(NSString*)startStop;
-(void)embeddedDevice:(NSString*)startStop;
-(void)rootDevice:(NSString*)startStop;


@property (readwrite, retain) NSString* iconURL;
@property (readwrite, retain) NSString* iconWidth;
@property (readwrite, retain) NSString* iconHeight;
@property (readwrite, retain) NSString* iconMime;
@property (readwrite, retain) NSString* iconDepth;

@property (readwrite, retain) NSString* udn;
@property (readwrite, retain) NSString* friendlyName;


@end
