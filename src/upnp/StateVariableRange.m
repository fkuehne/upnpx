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

#import "StateVariableRange.h"


@implementation StateVariableRange

@synthesize min;
@synthesize max;

-(id)init{
	[super init];
	
	variableType = StateVariable_Type_Range;
	[self empty];
	
	return self;
}

-(void)dealloc{
	[super dealloc];
}

-(void)empty{
	[super empty];
	min = 0;
	max = 0;
}

-(int)setMinWithString:(NSString*)val{
	min = [val intValue];
	return min;
}

-(int)setMaxWithString:(NSString*)val{
	max = [val intValue];
	return max;
}

-(void)copyFromStateVariableRange:(StateVariableRange*)stateVar{
	[super copyFromStateVariable:(StateVariable*)stateVar];
	min = [stateVar min];
	max = [stateVar max];
}




@end
