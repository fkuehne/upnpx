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

#import "MediaServerBasicObjectParser.h"
#import "MediaServer1BasicObject.h"
#import "MediaServer1ContainerObject.h"
#import "MediaServer1ItemObject.h"
#import "CocoaTools.h"

@implementation MediaServerBasicObjectParser

@synthesize mediaTitle;
@synthesize mediaClass;
@synthesize mediaID;
@synthesize parentID;
@synthesize childCount;
@synthesize artist;
@synthesize album;
@synthesize date;
@synthesize genre;
@synthesize originalTrackNumber;
@synthesize uri;
@synthesize protocolInfo;
@synthesize frequency;
@synthesize audioChannels;
@synthesize size;
@synthesize duration;
@synthesize icon;
@synthesize bitrate;
@synthesize albumArt;




/*
 <container id="7" parentID="0" restricted="1" childCount="6">
	 <dc:title>Audio</dc:title>
	 <upnp:class>object.container</upnp:class>
 </container>
 
 
 <item id="27934" parentID="27933" restricted="0">
	 <dc:title>01-Mis-Shapes.mp3</dc:title>
	 <upnp:class>object.item.audioItem.musicTrack</upnp:class>
	 <upnp:artist>Pulp</upnp:artist>
	 <upnp:album>Different Class</upnp:album>
	 <dc:date>1995-01-01</dc:date>
	 <upnp:genre>Rock</upnp:genre>
	 <upnp:originalTrackNumber>1</upnp:originalTrackNumber>
	 <res protocolInfo="http-get:*:audio/mpeg:*" sampleFrequency="48000" nrAudioChannels="2">http://192.168.123.15:49152/content/media/object_id=27934&amp;res_id=0&amp;ext=.mp3</res>
 </item>
 */


/**
 * All Objects; Items + Containers
 */
-(id)initWithMediaObjectArray:(NSMutableArray*)mediaObjectsArray{
	return [self initWithMediaObjectArray:mediaObjectsArray itemsOnly:NO];
}


-(id)initWithMediaObjectArray:(NSMutableArray*)mediaObjectsArray itemsOnly:(BOOL)onlyItems{
	
	[super initWithNamespaceSupport:YES];
	
	mediaObjects = mediaObjectsArray;
	[mediaObjects retain];


	//Container
	if(onlyItems == NO){
		[self addAsset:[NSArray arrayWithObjects: @"DIDL-Lite", @"container", nil] callfunction:@selector(container:) functionObject:self setStringValueFunction:nil setStringValueObject:nil];
		[self addAsset:[NSArray arrayWithObjects: @"DIDL-Lite", @"container", @"title", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setMediaTitle:) setStringValueObject:self];
		[self addAsset:[NSArray arrayWithObjects: @"DIDL-Lite", @"container", @"class", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setMediaClass:) setStringValueObject:self];
		[self addAsset:[NSArray arrayWithObjects: @"DIDL-Lite", @"container", @"albumArtURI", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setAlbumArt:) setStringValueObject:self];
	}
	
	
	//Item
	[self addAsset:[NSArray arrayWithObjects: @"DIDL-Lite", @"item", nil] callfunction:@selector(item:) functionObject:self setStringValueFunction:nil setStringValueObject:nil];
	[self addAsset:[NSArray arrayWithObjects: @"DIDL-Lite", @"item", @"title", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setMediaTitle:) setStringValueObject:self];
	[self addAsset:[NSArray arrayWithObjects: @"DIDL-Lite", @"item", @"class", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setMediaClass:) setStringValueObject:self];
	[self addAsset:[NSArray arrayWithObjects: @"DIDL-Lite", @"item", @"artist", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setArtist:) setStringValueObject:self];
	[self addAsset:[NSArray arrayWithObjects: @"DIDL-Lite", @"item", @"album", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setAlbum:) setStringValueObject:self];
	[self addAsset:[NSArray arrayWithObjects: @"DIDL-Lite", @"item", @"date", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setDate:) setStringValueObject:self];
	[self addAsset:[NSArray arrayWithObjects: @"DIDL-Lite", @"item", @"genre", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setGenre:) setStringValueObject:self];
	[self addAsset:[NSArray arrayWithObjects: @"DIDL-Lite", @"item", @"originalTrackNumber", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setOriginalTrackNumber:) setStringValueObject:self];
	[self addAsset:[NSArray arrayWithObjects: @"DIDL-Lite", @"item", @"albumArtURI", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setAlbumArt:) setStringValueObject:self];

	[self addAsset:[NSArray arrayWithObjects: @"DIDL-Lite", @"item", @"res",  nil] callfunction:@selector(res:) functionObject:self setStringValueFunction:@selector(setUri:) setStringValueObject:self];

	return self;
}





-(void)dealloc{
	[mediaClass release];
	[mediaTitle release];
	[mediaID release];
	[parentID release];
	[childCount release];
	[artist release];
	[album release];
	[date release];
	[genre release];
	[originalTrackNumber release];
	[uri release];
	[frequency release];
	[audioChannels release];
	[size release];
	[duration release];
	[bitrate release];
	[icon release];
	[albumArt release];
	
	[super dealloc];
}


-(void)empty{
	[self setMediaClass:@""];
	[self setMediaTitle:@""];
	[self setMediaID:@""];
	[self setArtist:@""];
	[self setAlbum:@""];
	[self setDate:nil];
	[self setGenre:@""];
	[self setAlbumArt:nil];
	[self setDuration:nil];
}


-(void)container:(NSString*)startStop{
	if([startStop isEqualToString:@"ElementStart"]){
		//Clear
		[self empty];
		
		//Get the attributes
		[self setMediaID:[elementAttributeDict objectForKey:@"id"]];
		[self setParentID:[elementAttributeDict objectForKey:@"parentID"]];
		[self setChildCount:[elementAttributeDict objectForKey:@"childCount"]];
		
	}else{
		MediaServer1ContainerObject *media = [[MediaServer1ContainerObject alloc] init];

		[media setIsContainer:YES];
 
		[media setObjectID:mediaID];
		[media setParentID:parentID];
		[media setTitle:mediaTitle];	
		[media setObjectClass:mediaClass];
		[media setChildCount:childCount];
		[media setAlbumArt:albumArt];
		
		[mediaObjects addObject:media];

		[media release];

	}
}


-(void)item:(NSString*)startStop{
	if([startStop isEqualToString:@"ElementStart"]){
		//Clear
		[self empty];

		//Get the attributes
		[self setMediaID:[elementAttributeDict objectForKey:@"id"]];
		[self setParentID:[elementAttributeDict objectForKey:@"parentID"]];
	}else{
		MediaServer1ItemObject *media = [[MediaServer1ItemObject alloc] init];
		
		[media setIsContainer:NO];
		
		[media setObjectID:mediaID];
		[media setParentID:parentID];
		[media setTitle:mediaTitle];	
		[media setArtist:artist];	
		[media setAlbum:album];	
		[media setDate:date];	
		[media setGenre:genre];	
		[media setOriginalTrackNumber:originalTrackNumber];	
		[media setUri:uri];	
		[media setProtocolInfo:protocolInfo];	
		[media setFrequency:frequency];	
		[media setAudioChannels:audioChannels];	
		[media setSize:size];
		[media setDuration:duration];
		[media setDurationInSeconds:[duration HMS2Seconds]];
		[media setBitrate:bitrate];
		[media setIcon:icon]; //REMOVE THIS ?
		[media setAlbumArt:albumArt];
	
		[mediaObjects addObject:media];
		
		[media release];
	}
}


-(void)res:(NSString*)startStop{
	if([startStop isEqualToString:@"ElementStart"]){
		//Get the attributes
		[self setProtocolInfo:[elementAttributeDict objectForKey:@"protocolInfo"]];
		[self setFrequency:[elementAttributeDict objectForKey:@"sampleFrequency"]];
		[self setAudioChannels:[elementAttributeDict objectForKey:@"nrAudioChannels"]];
		
		[self setSize:[elementAttributeDict objectForKey:@"size"]];
		[self setDuration:[elementAttributeDict objectForKey:@"duration"]];
		[self setBitrate:[elementAttributeDict objectForKey:@"bitrate"]];
		
		[self setIcon:[elementAttributeDict objectForKey:@"icon"]];
		if(icon != nil){
			NSLog(@"!!!!!!!!!!!!!!!!! ICON !!!!!!!!!!!!!!!!!!!!!");
		}
		
		
		
	}else{
	}
}

@end
