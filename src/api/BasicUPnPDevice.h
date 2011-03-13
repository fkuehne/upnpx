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
#import "BasicUPnPService.h"


#import "iphoneport.h"

@interface BasicUPnPDevice : NSObject {
@private	
	bool isRoot;
	bool isFound;
	double lastUpdated;
	NSMutableDictionary *services;  //Key=urn string, Object=BasicUPnPService 
	NSString *uuid;	
	NSString *type;
	
	NSString *xmlLocation;
	NSURL *baseURL;
	NSString *baseURLString;
	NSString *friendlyName;
	NSString *udn;
	NSString *usn;
	NSString *urn;
	UIImage *smallIcon;
	int smallIconHeight;
	int smallIconWidth;
	int smallIconDepth;
	NSString *smallIconURL;
	
}

-(id)init;
-(id)initWithSSDPDevice:(SSDPDBDevice_ObjC*)ssdp;
-(void)dealloc;
-(int)loadDeviceDescriptionFromXML;
-(BasicUPnPService*)getServiceForType:(NSString*)serviceUrn;
-(NSMutableDictionary*)getServices; //BasicUPnPService[]

@property(readonly) bool isRoot;
@property(readwrite) bool isFound;
@property(readwrite) double lastUpdated;
@property(readonly) NSString *uuid;
@property(readonly) NSString *type;
@property(readonly) NSString *xmlLocation;
@property(readwrite, retain) NSURL *baseURL;
@property(readwrite, retain) NSString *baseURLString;
@property(readwrite, retain) NSString *friendlyName;
@property(readwrite, retain) NSString *udn;
@property(readwrite, retain) NSString *usn;
@property(readwrite, retain) NSString *urn;
@property(readwrite, retain) UIImage *smallIcon;
@property(readwrite) int smallIconHeight;
@property(readwrite) int smallIconWidth;
@property(readwrite) int smallIconDepth;
@property(readwrite, retain) NSString *smallIconURL;




@end
