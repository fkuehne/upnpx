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


#import "LastChangeParser.h"


@implementation LastChangeParser

-(id)initWithEventDictionary:(NSMutableDictionary*)foundEvents{
    self = [super init];
    
    if (self) {
        /* TODO: events -> retain property */
        events = foundEvents;
        [events retain];
        
        [self addAsset:[NSArray arrayWithObjects: @"Event", @"InstanceID", nil] callfunction:@selector(propertyName:) functionObject:self setStringValueFunction:nil setStringValueObject:nil];
        [self addAsset:[NSArray arrayWithObjects: @"Event", @"InstanceID", @"*", nil] callfunction:@selector(propertyName:) functionObject:self setStringValueFunction:nil setStringValueObject:nil];
    }
	
	return self;
}

-(void)dealloc{
	[super dealloc];
}


-(void)propertyName:(NSString*)startStop{
	if([startStop isEqualToString:@"ElementStart"]){
	}else{		
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
