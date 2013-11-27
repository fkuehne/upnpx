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
    self = [super initWithNamespaceSupport:YES];
    
    if (self) {	
        events = [[NSMutableDictionary alloc] init];	

        lastChangeParser = nil;
        
        //Device is the root device
        [self addAsset:[NSArray arrayWithObjects: @"propertyset", @"property", @"LastChange", nil] callfunction:@selector(lastChangeElement:) functionObject:self setStringValueFunction:@selector(setElementValue:) setStringValueObject:self];
        [self addAsset:[NSArray arrayWithObjects: @"propertyset", @"property", @"*", nil] callfunction:@selector(propertyName:) functionObject:self setStringValueFunction:@selector(setElementValue:) setStringValueObject:self];
    }

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
