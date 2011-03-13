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


#import "StateVariable.h"


@implementation StateVariable

@synthesize variableType;
@synthesize dataType;
@synthesize name;
@synthesize dataTypeString;


-(id)init{
	[super init];
	
	variableType = StateVariable_Type_Simple;
	[self empty];
	
	return self;
}

-(void)dealloc{
	
	[dataTypeString release];
	[name release];
	
	[super dealloc];
}


-(void)empty{
	[self setDataTypeString:nil];
	dataType: StateVariable_DataType_Unknown;
}


-(void)setDataTypeString:(NSString*)value{
	[dataTypeString release];
	dataTypeString = value;
	[dataTypeString retain];

	if([dataTypeString isEqualToString:@"ui1"]){
		dataType = StateVariable_DataType_Integer;
	}else if([dataTypeString isEqualToString:@"ui2"]){
		dataType = StateVariable_DataType_Integer;
	}else if([dataTypeString isEqualToString:@"ui4"]){
		dataType = StateVariable_DataType_Integer;
	}else if([dataTypeString isEqualToString:@"i1"]){
		dataType = StateVariable_DataType_Integer;
	}else if([dataTypeString isEqualToString:@"i2"]){
		dataType = StateVariable_DataType_Integer;
	}else if([dataTypeString isEqualToString:@"i4"]){
		dataType = StateVariable_DataType_Integer;
	}else if([dataTypeString isEqualToString:@"int"]){
		dataType = StateVariable_DataType_Integer;
	}else if([dataTypeString isEqualToString:@"r4"]){
		dataType = StateVariable_DataType_Integer;
	}else if([dataTypeString isEqualToString:@"r8"]){
		dataType = StateVariable_DataType_Integer;
	}else if([dataTypeString isEqualToString:@"number"]){
		dataType = StateVariable_DataType_Integer;
	}else if([dataTypeString isEqualToString:@"fixed14.4"]){
		dataType = StateVariable_DataType_Integer;
	}else if([dataTypeString isEqualToString:@"float"]){
		dataType = StateVariable_DataType_Integer;
	}else if([dataTypeString isEqualToString:@"boolean"]){
		dataType = StateVariable_DataType_Integer;
	}else if([dataTypeString isEqualToString:@"char"]){
		dataType = StateVariable_DataType_String;
	}else if([dataTypeString isEqualToString:@"string"]){
		dataType = StateVariable_DataType_String;
	}else{
		dataType = StateVariable_DataType_Unknown;
	}//complete the list
		
}
		
-(void)copyFromStateVariable:(StateVariable*)stateVar{
	[self setName:[NSString stringWithString:[stateVar name]]];
	dataType = [stateVar dataType];
	[self setDataTypeString:[NSString stringWithString:[stateVar dataTypeString]]];
}
	


@end
