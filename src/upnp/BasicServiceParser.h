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
#import "BasicParser.h"
#import "BasicUPnPService.h"
#import "StateVariable.h"
#import "StateVariableRange.h"
#import "StateVariableList.h"

@interface BasicServiceParser : BasicParser {	
	BasicUPnPService* service;
	
	NSString *descriptionURL;
	NSString *eventURL;
	NSString *controlURL;
	NSString *serviceType;
	BOOL mCollectingStateVar;
	
	StateVariableType mCachedType;
	StateVariableList *mStatevarListCache;
	StateVariableRange *mStatevarRangeCache;
	StateVariable *mStatevarCache;

}

-(id)initWithUPnPService:(BasicUPnPService*)upnpservice;
-(int)parse;
-(void)dealloc;
-(void)serviceTag:(NSString*)startStop;
-(void)stateVariable:(NSString*)startStop;
-(void)setAllowedValue:(NSString*)value;
			
@property (readonly, retain) BasicUPnPService* service;

//Keep a local copy because there are mutiple services found during parsing
@property (readwrite, retain) NSString* descriptionURL;
@property (readwrite, retain) NSString* eventURL;
@property (readwrite, retain) NSString* controlURL;
@property (readwrite, retain) NSString* serviceType;

@end
