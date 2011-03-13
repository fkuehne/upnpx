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



typedef enum StateVariableType{
	StateVariable_Type_Unknown = 0,
	StateVariable_Type_Simple,
	StateVariable_Type_List,
	StateVariable_Type_Range	
}StateVariableType;

typedef enum StateVariableDataType{
	StateVariable_DataType_Unknown = 0,
	StateVariable_DataType_String,
	StateVariable_DataType_Integer	
}StateVariableDataType;



@interface StateVariable : NSObject {
	StateVariableType variableType;
	StateVariableDataType dataType;
	NSString *name;
	NSString *dataTypeString;
}


-(id)init;
-(void)dealloc;
-(void)empty;
-(void)setDataTypeString:(NSString*)value;
-(void)copyFromStateVariable:(StateVariable*)stateVar;

@property(readwrite) StateVariableType variableType;
@property(readonly) StateVariableDataType dataType;
@property(retain, nonatomic) NSString *name;
@property(readonly) NSString *dataTypeString;


@end
