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


#import "BasicServiceParser.h"
#import "StateVariableRange.h"
#import "StateVariableList.h"
#import "StateVariable.h"

@implementation BasicServiceParser

@synthesize serviceType;
@synthesize descriptionURL;
@synthesize eventURL;
@synthesize controlURL;
@synthesize service;


-(id)initWithUPnPService:(BasicUPnPService*)upnpservice{
	[super init];
	service = upnpservice;
	[service retain];

	mStatevarCache = [[StateVariable alloc] init];
	mStatevarRangeCache = [[StateVariableRange alloc] init];
	mStatevarListCache = [[StateVariableList alloc] init];
	
	mCollectingStateVar = NO;
	
	return self;
}


-(void)dealloc{
	[mStatevarCache release];
	[mStatevarRangeCache release];
	[mStatevarListCache release];
	[service release];

	[super dealloc];
}



-(int)parse{
	int ret;
	
	/*
	 * 1. First parse the Device Description XML
	 */
	[self clearAllAssets];
	[self addAsset:[NSArray arrayWithObjects: @"root", @"URLBase", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setBaseURLString:) setStringValueObject:service];
	[self addAsset:[NSArray arrayWithObjects: @"*", @"device", @"serviceList", @"service", @"serviceType", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setServiceType:) setStringValueObject:self];
	[self addAsset:[NSArray arrayWithObjects: @"*", @"device", @"serviceList", @"service", @"SCPDURL", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setDescriptionURL:) setStringValueObject:self];
	[self addAsset:[NSArray arrayWithObjects: @"*", @"device", @"serviceList", @"service", @"controlURL", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setControlURL:) setStringValueObject:self];
	[self addAsset:[NSArray arrayWithObjects: @"*", @"device", @"serviceList", @"service", @"eventSubURL", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setEventURL:) setStringValueObject:self];
	[self addAsset:[NSArray arrayWithObjects: @"*", @"device", @"serviceList", @"service", nil] callfunction:@selector(serviceTag:) functionObject:self setStringValueFunction:nil setStringValueObject:nil];

	
	NSURL *descurl = [NSURL URLWithString:[[service ssdpdevice] location]];	
	ret = [super parseFromURL:descurl];
	
	if(ret < 0){
		return ret;
	}

	//Do we have a Base URL, if not creare one
	//Base URL
	if([service baseURLString] == nil){
		//Create one based on [device xmlLocation] 
		NSURL *loc = [NSURL URLWithString:[[service ssdpdevice] location] ];
		if(loc != nil){		
			[service setBaseURL:loc];
		}		
	}else{
		NSURL *loc = [NSURL URLWithString:[service baseURLString]];
		if(loc != nil){
			[service setBaseURL:loc];
		}				
	}
	
	
	
	/*
	 * 2. Parse the Service Description XML ([service descriptionURL])
	 */
	[self clearAllAssets];
	[self addAsset:[NSArray arrayWithObjects: @"scpd", @"serviceStateTable", @"stateVariable", nil] callfunction:@selector(stateVariable:) functionObject:self setStringValueFunction:nil setStringValueObject:nil];
	//fill our cache
	[self addAsset:[NSArray arrayWithObjects: @"scpd", @"serviceStateTable", @"stateVariable", @"name", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setName:) setStringValueObject:mStatevarCache];
	[self addAsset:[NSArray arrayWithObjects: @"scpd", @"serviceStateTable", @"stateVariable", @"dataType", nil] callfunction:nil functionObject:self setStringValueFunction:@selector(setDataTypeString:) setStringValueObject:mStatevarCache];

	[self addAsset:[NSArray arrayWithObjects: @"scpd", @"serviceStateTable", @"stateVariable", @"allowedValueRange", nil] callfunction:@selector(allowedValueRange:) functionObject:self setStringValueFunction:nil setStringValueObject:nil];
	[self addAsset:[NSArray arrayWithObjects: @"scpd", @"serviceStateTable", @"stateVariable", @"allowedValueRange", @"minimum", nil] callfunction:nil functionObject:self setStringValueFunction:@selector(setMinWithString:) setStringValueObject:mStatevarRangeCache];
	[self addAsset:[NSArray arrayWithObjects: @"scpd", @"serviceStateTable", @"stateVariable", @"allowedValueRange", @"maximum", nil] callfunction:nil functionObject:self setStringValueFunction:@selector(setMaxWithString:) setStringValueObject:mStatevarRangeCache];

	[self addAsset:[NSArray arrayWithObjects: @"scpd", @"serviceStateTable", @"stateVariable", @"allowedValueList", nil] callfunction:@selector(allowedValueList:) functionObject:self setStringValueFunction:nil setStringValueObject:nil];
	[self addAsset:[NSArray arrayWithObjects: @"scpd", @"serviceStateTable", @"stateVariable", @"allowedValueList", @"allowedValue", nil] callfunction:nil functionObject:self setStringValueFunction:@selector(setAllowedValue:) setStringValueObject:self];

		
	NSURL *serviceDescUrl = [NSURL URLWithString:[service descriptionURL] relativeToURL:[service baseURL] ];	
	ret = [super parseFromURL:serviceDescUrl];
		
	
	
	return ret;
}




-(void)serviceTag:(NSString*)startStop{
	if([startStop isEqualToString:@"ElementStop"]){
		//Is our cached servicetype the same as the one in the ssdp description, if so we can initialize the upnp service object
		if([serviceType compare:[[service ssdpdevice] urn] ] == NSOrderedSame){
			//found, copy
			[service setServiceType:serviceType];
			[service setDescriptionURL:descriptionURL];
			[service setControlURL:controlURL];
			[service setEventURL:eventURL];
		}
	}
	
}


-(void)stateVariable:(NSString*)startStop{
	if([startStop isEqualToString:@"ElementStart"]){
		mCollectingStateVar = YES;
		//clear our cache
		mCachedType = StateVariable_Type_Simple;
		[mStatevarCache empty];
		[mStatevarListCache empty];
		[mStatevarRangeCache empty];
	}else{
		mCollectingStateVar = NO;
		//add to the BasicUPnPService NSMutableDictionary *stateVariables; 
		switch(mCachedType){
			case StateVariable_Type_Simple:
				{
					StateVariable *new = [[StateVariable alloc] init]; 
					[new copyFromStateVariable:mStatevarCache];
					[[service stateVariables] setObject:new forKey:[new name]  ];
					[new release];
				}
				break;
			case StateVariable_Type_List:
				{	
					StateVariableList *new = [[StateVariableList alloc] init];
					[new copyFromStateVariableList:mStatevarListCache];
					[[service stateVariables] setObject:new forKey:[new name]  ];
					[new release];
				}
				break;
			case StateVariable_Type_Range:
				{
					StateVariableRange *new = [[StateVariableRange alloc] init];
					[new copyFromStateVariableRange:mStatevarRangeCache];
					[[service stateVariables] setObject:new forKey:[new name]  ];
					[new release];
				}
				break;
		}
	}
}


-(void)allowedValueRange:(NSString*)startStop{
	if([startStop isEqualToString:@"ElementStart"]){
		//Copy from mStatevarCache 
		[mStatevarRangeCache copyFromStateVariable:mStatevarCache];
		mCachedType = StateVariable_Type_Range;
	}else{
		//Stop
	}
}


-(void)allowedValueList:(NSString*)startStop{
	if([startStop isEqualToString:@"ElementStart"]){
		//Copy from mStatevarCache 
		[mStatevarListCache copyFromStateVariable:mStatevarCache];
		mCachedType = StateVariable_Type_List;
	}else{
		//Stop
	}
}

-(void)setAllowedValue:(NSString*)value{
	[[mStatevarListCache list] addObject:value]; 
}


@end
