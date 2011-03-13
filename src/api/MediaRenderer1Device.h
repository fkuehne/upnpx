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
#import "BasicUPnPDevice.h"

#import "SoapActionsAVTransport1.h"
#import "SoapActionsRenderingControl1.h"
#import "SoapActionsConnectionManager1.h"

#import "MediaPlaylist.h"
#import "MediaServer1BasicObject.h"

/*
 * Services:
 * M - RenderingControl:1.0 
 * M - ConnectionManager:1.0 
 * O - AVTransport:1.0 
 */


@interface MediaRenderer1Device : BasicUPnPDevice <BasicUPnPServiceObserver> {
	SoapActionsAVTransport1 *mAvTransport;
	SoapActionsRenderingControl1 *mRenderingControl;
	SoapActionsConnectionManager1 *mConnectionManager;
	
	//Cache
	NSMutableString *mProtocolInfoSource;
	NSMutableString *mProtocolInfoSink;

	//Playlist
	MediaPlaylist *playList;
}

-(id)init;
-(void)dealloc;

-(SoapActionsAVTransport1*)avTransport;
-(SoapActionsRenderingControl1*)renderingControl;
-(SoapActionsConnectionManager1*)connectionManager;

-(BasicUPnPService*)avTransportService;
-(BasicUPnPService*)renderingControlService;
-(BasicUPnPService*)connectionManagerService;

-(BOOL)supportProtocol:(NSString*)protocolInfo withCache:(BOOL)useCache;


-(int)play;
-(int)playWithMedia:(MediaServer1BasicObject*)media;

@property(readonly) MediaPlaylist *playList;

//BasicUPnPServiceObserver
-(void)UPnPEvent:(BasicUPnPService*)sender events:(NSDictionary*)events;


@end
