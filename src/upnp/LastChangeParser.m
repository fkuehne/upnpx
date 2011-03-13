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


#import "LastChangeParser.h"


@implementation LastChangeParser

-(id)initWithEventDictionary:(NSMutableDictionary*)foundEvents{
	[super init];
	
	events = foundEvents;
	[events retain];
	
	[self addAsset:[NSArray arrayWithObjects: @"Event", @"InstanceID", nil] callfunction:@selector(propertyName:) functionObject:self setStringValueFunction:nil setStringValueObject:nil];
	[self addAsset:[NSArray arrayWithObjects: @"Event", @"InstanceID", @"*", nil] callfunction:@selector(propertyName:) functionObject:self setStringValueFunction:nil setStringValueObject:nil];

	
	return self;
}

-(void)dealloc{
	[super dealloc];
}


-(void)propertyName:(NSString*)startStop{
	if([startStop isEqualToString:@"ElementStart"]){
	}else{
		NSLog(@"element:%@", currentElementName );
		
		//Element name
		NSString *name = [[NSString alloc] initWithString:currentElementName];
		//Element value
		NSString *value = [elementAttributeDict objectForKey:@"val"];
		//Add
		if(name != nil && value != nil){
			[events setObject:value forKey:name];
		}
		
		[name release];
	}
}

@end
