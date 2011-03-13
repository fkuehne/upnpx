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
#import "LastChangeParser.h"

@interface UPnPEventParser : BasicParser {
	NSMutableDictionary *events;
	NSString *elementValue;	
	LastChangeParser *lastChangeParser;
}

-(id)init;
-(void)dealloc;
-(void)propertyName:(NSString*)startStop;
-(void)lastChangeElement:(NSString*)startStop;
-(void)reinit;

@property(readonly)NSMutableDictionary *events;
@property(retain, nonatomic)NSString *elementValue;

@end
