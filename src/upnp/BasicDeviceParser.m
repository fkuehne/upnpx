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


#import "BasicDeviceParser.h"

#define IDEALICONWIDTH 48
#define IDEALICONHEIGHT 48


@implementation BasicDeviceParser

@synthesize iconURL;
@synthesize iconWidth;
@synthesize iconHeight;
@synthesize iconMime;
@synthesize iconDepth;
@synthesize udn;
@synthesize friendlyName;


/****
 © 2002 Contributing Members of the UPnP™ Forum. All Rights Reserved.
 UPnP Basic: Device Template Version 1.01 2
 
 <?xml version="1.0"?>
 <root xmlns="urn:schemas-upnp-org:device-1-0">
	 <specVersion>
		 <major>1</major>
		 <minor>0</minor>
	 </specVersion>
	 <URLBase>base URL for all relative URLs</URLBase>
	 <device>
		 <deviceType>urn:schemas-upnp-org:device:Basic:1</deviceType>
		 <friendlyName>short user-friendly title</friendlyName>
		 <manufacturer>manufacturer name</manufacturer> 
		 <manufacturerURL>URL to manufacturer site</manufacturerURL>
		 <modelDescription>long user-friendly title</modelDescription>
		 <modelName>model name</modelName>
		 <modelNumber>model number</modelNumber>
		 <modelURL>URL to model site</modelURL>
		 <serialNumber>manufacturer's serial number</serialNumber>
		 <UDN>uuid:UUID</UDN>
		 <UPC>Universal Product Code</UPC>
		 <iconList>
			 <icon>
				 <mimetype>image/format</mimetype>
				 <width>horizontal pixels</width>
				 <height>vertical pixels</height>
				 <depth>color depth</depth>
				 <url>URL to icon</url>
			 </icon>
			 XML to declare other icons, if any, go here
		 </iconList>
		 <presentationURL>URL for presentation</presentationURL>
	 </device>
	 ...
	 <deviceList>
		<device>
			....
 </root>
 **/


-(id)initWithUPnPDevice:(BasicUPnPDevice*)upnpdevice{
    self = [super init];
    
    if (self) {
        /* TODO: set device as retain property */
        device = upnpdevice;
        [device retain];

        friendlyNameStack = [[NSMutableArray alloc] init];
        udnStack = [[NSMutableArray alloc] init];
        
        [self setIconURL:nil];
        [self setIconWidth:nil];
        [self setIconHeight:nil];
        [self setIconMime:nil];
        
        
        //Device is the root device
        [self addAsset:[NSArray arrayWithObjects: @"root", @"device", nil] callfunction:@selector(rootDevice:) functionObject:self setStringValueFunction:nil setStringValueObject:nil];
        [self addAsset:[NSArray arrayWithObjects: @"root", @"device", @"UDN", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setUdn:) setStringValueObject:self];
        [self addAsset:[NSArray arrayWithObjects: @"root", @"device", @"friendlyName", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setFriendlyName:) setStringValueObject:self];
        [self addAsset:[NSArray arrayWithObjects: @"root", @"device", @"iconList", @"icon", nil] callfunction:@selector(iconFound:) functionObject:self setStringValueFunction:nil setStringValueObject:nil];
        [self addAsset:[NSArray arrayWithObjects: @"root", @"device", @"iconList", @"icon", @"mimetype", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setIconMime:) setStringValueObject:self];
        [self addAsset:[NSArray arrayWithObjects: @"root", @"device", @"iconList", @"icon", @"width", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setIconWidth:) setStringValueObject:self];
        [self addAsset:[NSArray arrayWithObjects: @"root", @"device", @"iconList", @"icon", @"height", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setIconHeight:) setStringValueObject:self];
        [self addAsset:[NSArray arrayWithObjects: @"root", @"device", @"iconList", @"icon", @"depth", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setIconDepth:) setStringValueObject:self];
        [self addAsset:[NSArray arrayWithObjects: @"root", @"device", @"iconList", @"icon", @"url", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setIconURL:) setStringValueObject:self];

        [self addAsset:[NSArray arrayWithObjects: @"root", @"URLBase", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setBaseURLString:) setStringValueObject:device];

        //Device is an embedded device (embedded devices can include embedded devices)
        [self addAsset:[NSArray arrayWithObjects: @"*", @"device", @"deviceList", @"device", nil] callfunction:@selector(embeddedDevice:) functionObject:self setStringValueFunction:nil setStringValueObject:nil];
        [self addAsset:[NSArray arrayWithObjects: @"*", @"device", @"deviceList", @"device", @"UDN", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setUdn:) setStringValueObject:self];
        [self addAsset:[NSArray arrayWithObjects: @"*", @"device", @"deviceList", @"device", @"friendlyName", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setFriendlyName:) setStringValueObject:self];
    }
	
	return self;
}


-(void)dealloc{
	[device release];
	[iconURL release];
	[iconWidth release];
	[iconHeight release];
	[iconMime release];
    [iconDepth release];
    [udn release];
    [friendlyName release];
    
	[friendlyNameStack release];
	[udnStack release];
		
	[super dealloc];
}


/**
 * XML
 */
-(int)parse{
	int ret=0;

	NSURL *descurl = [NSURL URLWithString:device.xmlLocation];	
    
	ret = [super parseFromURL:descurl];
	
	
	//Base URL
	if([device baseURLString] == nil){
		//Create one based on [device xmlLocation] 
		NSURL *loc = [NSURL URLWithString:[device xmlLocation]];
		if(loc != nil){
//			NSURL *base = [loc host];
			[device setBaseURL:loc];
		}		
	}else{
		NSURL *loc = [NSURL URLWithString:[device baseURLString]];
		if(loc != nil){
			[device setBaseURL:loc];
		}				
	}
	
	//load icon if any
	if(ret == 0 && iconURL != nil){
		NSURL *u = [NSURL URLWithString:iconURL relativeToURL:device.baseURL];
		NSData *imageData = [NSData dataWithContentsOfURL:u];
		UIImage *i = [UIImage imageWithData:imageData];
		[device setSmallIcon:i];
	}
	
	return ret;
}


//Parse Icon stuff, if any
-(void)iconFound:(NSString*)startStop{
	if([startStop isEqualToString:@"ElementStart"]){
		[self setIconURL:nil];
		[self setIconWidth:nil];
		[self setIconHeight:nil];
		[self setIconMime:nil];
	}else{
	
		if( iconMime != nil && 
		   ([iconMime rangeOfString:@"jpeg"].location != NSNotFound ||
			[iconMime rangeOfString:@"jpg"].location != NSNotFound ||
			[iconMime rangeOfString:@"tiff"].location != NSNotFound ||
			[iconMime rangeOfString:@"tif"].location != NSNotFound ||
			[iconMime rangeOfString:@"gif"].location != NSNotFound ||
			[iconMime rangeOfString:@"png"].location != NSNotFound ||
			[iconMime rangeOfString:@"bmp"].location != NSNotFound ||
			[iconMime rangeOfString:@"BMPf"].location != NSNotFound ||
			[iconMime rangeOfString:@"ico"].location != NSNotFound ||
			[iconMime rangeOfString:@"cur"].location != NSNotFound ||
			[iconMime rangeOfString:@"xbm"].location != NSNotFound) )
		{
			//we can handle this
			if( [device smallIconWidth] == 0 || [device smallIconHeight] == 0){
				device.smallIconWidth = [iconWidth intValue];
				device.smallIconHeight = [iconHeight intValue];
				[device setSmallIconURL:iconURL];			
			}else{
				if( (abs(IDEALICONHEIGHT - [device smallIconHeight]) > abs(IDEALICONHEIGHT - [iconHeight intValue])) ||
				    (abs(IDEALICONHEIGHT - [device smallIconHeight]) - 10 > abs(IDEALICONHEIGHT - [iconHeight intValue]) && [iconDepth intValue] > [device smallIconDepth]) )
				{
					device.smallIconWidth = [iconWidth intValue];
					device.smallIconHeight = [iconHeight intValue];
					device.smallIconDepth = [iconDepth intValue];
					[device setSmallIconURL:[NSString stringWithString:iconURL] ];			
					
				}
			}
			
		}
	
	}	

}


-(void)rootDevice:(NSString*)startStop{
	if([startStop isEqualToString:@"ElementStart"]){
	}else{ 
		//Was this the device we are looking for ?
		if([udn isEqualToString:[device uuid]]){
			//this is our device, copy the collected info to the [device] instance
			[device setUdn:udn];
			[device setFriendlyName:friendlyName];
		}
	}
}

-(void)embeddedDevice:(NSString*)startStop{
	if([startStop isEqualToString:@"ElementStart"]){
		[friendlyNameStack addObject:friendlyName];
		[udnStack addObject:udn];		
	}else{
		//Was this the device we are looking for ?
		if(udn){//@todo check this
			if([udn isEqualToString:[device uuid]]){
				//this is our device, copy the collected info to the [device] instance
				[device setFriendlyName:friendlyName];
				[device setUdn:udn];
			}
		}
        [self setUdn:[udnStack lastObject]];
        [self setFriendlyName:[friendlyNameStack lastObject]];
        
        [friendlyNameStack removeLastObject];
		[udnStack removeLastObject];        
	}
}



@end
