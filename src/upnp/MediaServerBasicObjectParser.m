// **********************************************************************************
//
// BSD License.
// This file is part of upnpx.
//
// Copyright (c) 2010-2011, Bruno Keymolen, email: bruno.keymolen@gmail.com
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, 
// are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, 
// this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this 
// list of conditions and the following disclaimer in the documentation and/or other 
// materials provided with the distribution.
// Neither the name of "Bruno Keymolen" nor the names of its contributors may be 
// used to endorse or promote products derived from this software without specific 
// prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
// IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
// INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT 
// NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
// PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
// POSSIBILITY OF SUCH DAMAGE.
//
// **********************************************************************************

#import "MediaServerBasicObjectParser.h"
#import "MediaServer1BasicObject.h"
#import "MediaServer1ContainerObject.h"
#import "MediaServer1ItemObject.h"
#import "CocoaTools.h"
#import "OrderedDictionary.h"
#import "MediaServer1ItemRes.h"

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
    self = [super initWithNamespaceSupport:YES];
    
    if (self) {
        uriCollection = [[OrderedDictionary alloc] init];
        resources = [[NSMutableArray alloc] init];
        
        /* TODO: mediaObjects -> retain property */
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
    }
    
	return self;
}





-(void)dealloc{
	[mediaTitle release];
	[mediaClass release];
	[mediaID release];
	[parentID release];
	[childCount release];
	[artist release];
	[album release];
	[date release];
	[genre release];
	[originalTrackNumber release];
	[uri release];
    [protocolInfo release];
	[frequency release];
	[audioChannels release];
	[size release];
	[duration release];
	[icon release];
	[bitrate release];
	[albumArt release];

    [uriCollection release];
    [resources release];
    [mediaObjects release];
   
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
    
    
    [resources removeAllObjects];
    [uriCollection removeAllObjects];
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
        [media setUriCollection:uriCollection];
                
        MediaServer1ItemRes *resource = nil;		
        NSEnumerator *e = [resources objectEnumerator];
        while((resource = [e nextObject])){
            [media addRes:resource];
        }	    
        [resources removeAllObjects];

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
		
        
        //Add to the recource connection, there can be multiple resources per media item 
        MediaServer1ItemRes *r = [[MediaServer1ItemRes alloc] init];
        [r setBitrate: [bitrate intValue]];
        [r setDuration: duration];
        [r setNrAudioChannels: [audioChannels intValue]];
        [r setProtocolInfo: protocolInfo];
        [r setSize: [size intValue]];
        [r setDurationInSeconds:[duration HMS2Seconds]];
        
        [resources addObject:r];      
        [r release];
        
	}else{
        [uriCollection setObject:uri forKey:protocolInfo]; //@todo: we overwrite uri's with same protocol info
	}
}

-(void)setUri:(NSString*)s{
    [uri release];
    uri = s;
    [uri retain];
}



@end
