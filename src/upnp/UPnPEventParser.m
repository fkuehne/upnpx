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

/*
 <e:propertyset xmlns:e="urn:schemas-upnp-org:event-1-0">
	<e:property>
		<SystemUpdateID>0</SystemUpdateID>
		<ContainerUpdateIDs>0,4</ContainerUpdateIDs>
	</e:property>
 </e:propertyset>
*/

#import "UPnPEventParser.h"


@implementation UPnPEventParser

@synthesize events;
@synthesize elementValue;

-(id)init{
	[super initWithNamespaceSupport:YES];

	events = [[NSMutableDictionary alloc] init];	

	lastChangeParser = nil;
	
	//Device is the root device
	[self addAsset:[NSArray arrayWithObjects: @"propertyset", @"property", @"LastChange", nil] callfunction:@selector(lastChangeElement:) functionObject:self setStringValueFunction:@selector(setElementValue:) setStringValueObject:self];
	[self addAsset:[NSArray arrayWithObjects: @"propertyset", @"property", @"*", nil] callfunction:@selector(propertyName:) functionObject:self setStringValueFunction:@selector(setElementValue:) setStringValueObject:self];

	return self;
}


-(void)dealloc{
	[lastChangeParser release];
	[elementValue release];
	[events release];
	[super dealloc];
}


-(void)reinit{
	[events removeAllObjects];
}



-(void)propertyName:(NSString*)startStop{
	if([startStop isEqualToString:@"ElementStart"]){
	}else{
		NSLog(@"element:%@, value:%@", currentElementName, elementValue );
		
		//Element name
		NSString *name = [[NSString alloc] initWithString:currentElementName];
		//Element value
		NSString *value = [[NSString alloc] initWithString:elementValue];
		//Add
		[events setObject:value forKey:name];
		
		[name release];
		[value release];
	}
}

-(void)lastChangeElement:(NSString*)startStop{
	if(lastChangeParser == nil){
		lastChangeParser = [[LastChangeParser alloc] initWithEventDictionary:events];
	}

	if([startStop isEqualToString:@"ElementStart"]){
	}else{	
		//NSLog(@"LastChange - element:%@, value:%@", currentElementName, elementValue );
		//Parse LastChange
		NSData *lastChange = [elementValue dataUsingEncoding:NSUTF8StringEncoding]; 
		
		int ret = [lastChangeParser parseFromData:lastChange];
		if(ret != 0){
			NSLog(@"Something went wrong during LastChange parsing");
		}
	}
}



@end
