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
#import "MediaServer1Device.h"
//#import "MediaRenderer1Device.h"
#import "MediaServer1ContainerObject.h"
#import "MediaServer1ItemObject.h"


@class MediaPlaylistObserver, MediaPlaylist;

typedef enum MediaPlaylistState{
	MediaPlaylistState_NotInitialized = 0,
	MediaPlaylistState_Stopped,
	MediaPlaylistState_Playing
}MediaPlaylistState;


/**
 * Observer
 */
@protocol MediaPlaylistObserver
-(int)NewTrack:(MediaServer1ItemObject*)track;
-(void)StateChanged:(MediaPlaylistState)state;
@end



/**
 * Class
 */
@interface MediaPlaylist : NSObject {
	NSMutableArray *playList; //MediaServer1ItemObject[]
	int currentTrack;
	MediaServer1Device* mediaServer;
//	MediaRenderer1Device* mediaRenderer;
	MediaServer1ContainerObject* container;
	NSMutableArray *mObservers; //MediaPlaylistObserver[]
	MediaPlaylistState state;
}

-(id)init;
-(void)dealloc;
-(int)addObserver:(MediaPlaylistObserver*)obs;
-(int)removeObserver:(MediaPlaylistObserver*)obs;
-(int)loadWithMediaServer:(MediaServer1Device*)server forContainer:(MediaServer1ContainerObject*)selectedContainer;

-(int)stop;
-(int)play;
-(int)nextTrack;
-(int)prevTrack;
-(int)setTrackByNumber:(int)track;
-(int)setTrackByID:(NSString*)objectID; 
-(MediaServer1ItemObject*)GetCurrentTrackItem;

@property(readonly) NSMutableArray *playList;
@property(readonly) int currentTrack;
@property(readonly) MediaServer1Device* mediaServer;
@property(readonly) MediaServer1ContainerObject* container;
@property(readonly) MediaPlaylistState state;
//@property(readwrite, retain) MediaRenderer1Device* mediaRenderer;


@end
