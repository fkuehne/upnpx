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


#import "BasicParserAsset.h"

@implementation BasicParserAsset


@synthesize path;
@synthesize function;
@synthesize functionObject;
@synthesize stringValueFunction;
@synthesize stringCache;
@synthesize stringValueObject;

-(id)initWithPath:(NSArray*)thePath setStringValueFunction:(SEL)theValueFunction setStringValueObject:(id)obj callFunction:(SEL)theFunction functionObject:(id)funcobj{
	[super init];
	
	path = thePath;
	[path retain];

	stringValueFunction = theValueFunction;
	stringValueObject = obj;
	function = theFunction;
	functionObject = funcobj;
	
		
	stringCache = [[NSMutableString alloc] init];
	
	return self;
}


-(void)dealloc{
	[path release];
	[stringCache release];
	[super dealloc];
}


@end
