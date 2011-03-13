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




@interface MediaServerBasicObjectParser : BasicParser {
	NSMutableArray *mediaObjects;	
	
	//Generic
	NSString *mediaID;
	NSString *mediaTitle;
	NSString *mediaClass;
	NSString *parentID;
	
	//Container
	NSString *childCount;
	NSString *albumArt;
	
	//Item	
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
	
	
}

-(id)initWithMediaObjectArray:(NSMutableArray*)mediaObjectsArray;
-(id)initWithMediaObjectArray:(NSMutableArray*)mediaObjectsArray itemsOnly:(BOOL)onlyItems;
-(void)dealloc;

-(void)container:(NSString*)startStop;
-(void)item:(NSString*)startStop;
-(void)empty;

@property(retain, nonatomic) NSString *mediaTitle;
@property(retain, nonatomic) NSString *mediaClass;
@property(retain, nonatomic) NSString *mediaID;
@property(retain, nonatomic) NSString *parentID;
@property(retain, nonatomic) NSString *childCount;
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
@property(retain, nonatomic) NSString *albumArt;



@end
