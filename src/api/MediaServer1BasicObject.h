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


@interface MediaServer1BasicObject : NSObject {
	
	NSString *objectID;
	NSString *parentID;
	NSString *objectClass;
	NSString *title;
	NSString *albumArt;
	
	BOOL isContainer;
}

-(id)init;
-(void)dealloc;


@property (retain, nonatomic)NSString *objectID;
@property (retain, nonatomic)NSString *parentID;
@property (retain, nonatomic)NSString *title;
@property (retain, nonatomic)NSString *objectClass;
@property (readwrite)BOOL isContainer;
@property(retain, nonatomic) NSString *albumArt;

@end
