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


/*
 * States:
 * Stopped <-> Playing
 *
 */

#import "MediaPlaylist.h"
#import "MediaServerBasicObjectParser.h"
#import "CocoaTools.h"


@interface MediaPlaylist()
-(int)changeState:(MediaPlaylistState)newState;
@end

	
	

@implementation MediaPlaylist

@synthesize playList;
@synthesize currentTrack;
@synthesize mediaServer;
//@synthesize mediaRenderer;
@synthesize container;
@synthesize state;


-(id)init{
	[super init];
	state = MediaPlaylistState_NotInitialized;
	mObservers = [[NSMutableArray alloc] init];
	currentTrack = 0;
	playList = [[NSMutableArray alloc] init];
	mediaServer = nil;
	container = nil;
	
	return self;
}


-(void)dealloc{
	[mObservers removeAllObjects];
	[mObservers release];
	[playList removeAllObjects];
	[playList release];
	[mediaServer release];
	[container release];
//	[mediaRenderer release];
	
	[super dealloc];
}


-(int)addObserver:(MediaPlaylistObserver*)obs{
	int ret = 0;
	
	[mObservers addObject:obs];
	ret = [mObservers count];
	
	return ret;	
}


-(int)removeObserver:(MediaPlaylistObserver*)obs{
	int ret = 0;
	
	[mObservers removeObject:obs];
	ret = [mObservers count];
	
	return ret;	
}


-(int)loadWithMediaServer:(MediaServer1Device*)server forContainer:(MediaServer1ContainerObject*)selectedContainer{
	int ret = 0;
	
	//Sanity
	if(server == nil || selectedContainer == nil){
		return -1;
	}
	
	//Re-init
	[playList removeAllObjects];
	
	[mediaServer release];
	mediaServer = server;
	[mediaServer retain];
	
	[container release];
	container = selectedContainer;
	[container retain];
	
	
	
	//Browse the container & create the objects
	NSMutableString *outResult = [[NSMutableString alloc] init];
	NSMutableString *outNumberReturned = [[NSMutableString alloc] init];
	NSMutableString *outTotalMatches = [[NSMutableString alloc] init];
	NSMutableString *outUpdateID = [[NSMutableString alloc] init];
	
	
	ret = [[server contentDirectory] BrowseWithObjectID:[selectedContainer objectID] BrowseFlag:@"BrowseDirectChildren" Filter:@"*" StartingIndex:@"0" RequestedCount:@"0" SortCriteria:@"+dc:title" OutResult:outResult OutNumberReturned:outNumberReturned OutTotalMatches:outTotalMatches OutUpdateID:outUpdateID];
	if(ret != 0){
		return ret;
	}
	
	//Fill mediaObjects	
	//NSLog(@"outResult=%@", outResult);
	NSLog(@"outNumberReturned=%@", outNumberReturned);
	NSLog(@"outTotalMatches=%@", outTotalMatches);
	NSLog(@"outUpdateID=%@", outUpdateID);	

	//Parse the return DIDL and store all entries as objects in the 'mediaObjects' array
	NSData *didl = [outResult dataUsingEncoding:NSUTF8StringEncoding]; // NSASCIIStringEncoding
	MediaServerBasicObjectParser *parser = [[MediaServerBasicObjectParser alloc] initWithMediaObjectArray:playList itemsOnly:YES];
	[parser parseFromData:didl];
	[parser release];
	
	
	
	[outResult release];
	[outNumberReturned release];
	[outTotalMatches release];
	[outUpdateID release];
	
	currentTrack = 0;
	
	state = MediaPlaylistState_Stopped;
	
	return ret;
	
}


-(int)setTrackByNumber:(int)track{
	if([playList count] > track){		
		currentTrack = track;
	}else{
		return -1;
	}
	return currentTrack;
}

-(int)setTrackByID:(NSString*)objectID{
	MediaServer1ItemObject* lobj = nil;
	
	//Set the current track
	for(int t=0;t<[playList count];t++){
		lobj = [playList objectAtIndex:t];
		if( [[lobj objectID] isEqualToString:objectID]){
			currentTrack = t;
			break;
		}
	}
	
	return currentTrack;
}

-(int)nextTrack{
	if(state == MediaPlaylistState_Playing && [playList count] > currentTrack + 1){		
		currentTrack++;
	}else{
		return -1;
	}
	return currentTrack;
}

-(int)prevTrack{
	if(state == MediaPlaylistState_Playing && [playList count] > currentTrack - 1){		
		if(currentTrack > 0){
			currentTrack--;
		}
	}else{
		return -1;
	}
	return currentTrack;	
}


-(int)stop{
	return [self changeState:MediaPlaylistState_Stopped];
}


-(int)play{
	return [self changeState:MediaPlaylistState_Playing];
}


-(int)changeState:(MediaPlaylistState)newState{
	int ret = 0;
	
	MediaPlaylistState oldState = state;
	
	switch(state){
		//Stop - > Play
		case MediaPlaylistState_Stopped:
			if(newState == MediaPlaylistState_Playing){
				state = newState;
			}				
			break;
		//Play -> Stop
		case MediaPlaylistState_Playing:
			if(newState == MediaPlaylistState_Stopped){
				state = newState;
			}				
			break;
		case MediaPlaylistState_NotInitialized:
		default:
			ret = -1;
			break;
	}

	if(oldState != state){
		MediaPlaylistObserver *obs = nil;		
		NSEnumerator *listeners = [mObservers objectEnumerator];
		while(obs = [listeners nextObject]){
			[obs StateChanged:state];
		}	
	}
	return ret;
}
	
-(MediaServer1ItemObject*)GetCurrentTrackItem{
	MediaServer1ItemObject *ret  = nil;
	
	if([playList count] > currentTrack){
		ret = [playList objectAtIndex:currentTrack];
	}
	
	return ret;
}

@end
