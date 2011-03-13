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
#import "MediaServer1BasicObject.h"

@interface MediaServer1ItemObject : MediaServer1BasicObject {
	NSString *artist;
	NSString *album;
	NSString *date;
	NSString *genre;
	NSString *originalTrackNumber;
	NSString *uri;
	NSString *protocolInfo;
	NSString *frequency;
	NSString *audioChannels;
	NSString *size;
	NSString *duration;
	NSString *icon;
	NSString *bitrate;
	int durationInSeconds;
}

@property(retain, nonatomic) NSString *artist;
@property(retain, nonatomic) NSString *album;
@property(retain, nonatomic) NSString *date;
@property(retain, nonatomic) NSString *genre;
@property(retain, nonatomic) NSString *originalTrackNumber;
@property(retain, nonatomic) NSString *uri;
@property(retain, nonatomic) NSString *protocolInfo;
@property(retain, nonatomic) NSString *frequency;
@property(retain, nonatomic) NSString *audioChannels;
@property(retain, nonatomic) NSString *size;
@property(retain, nonatomic) NSString *duration;
@property(retain, nonatomic) NSString *icon;
@property(retain, nonatomic) NSString *bitrate;
@property(readwrite) int durationInSeconds;

@end
