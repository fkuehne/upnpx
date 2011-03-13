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


#import "MediaRenderer1Device.h"
#import "CocoaTools.h"

@implementation MediaRenderer1Device

@synthesize playList;


-(id)init{
	[super init];
	
	mAvTransport = nil;
	mRenderingControl = nil;
	mConnectionManager = nil;
	mProtocolInfoSink = nil;
	mProtocolInfoSource = nil;
	
	
	playList = [[MediaPlaylist alloc] init];
	
		
	//Try to load the playist (?)
	
	return self;
}


-(void)dealloc{
	
	[[self avTransportService] removeObserver:(BasicUPnPServiceObserver*)self];

	[mAvTransport release];
	[mRenderingControl release];
	[mConnectionManager release];
	[mProtocolInfoSink release];
	[mProtocolInfoSource release];
	[playList release];
	
	[super dealloc];
}


-(BasicUPnPService*)avTransportService{
	return [self getServiceForType:@"urn:schemas-upnp-org:service:AVTransport:1"];
}

-(BasicUPnPService*)renderingControlService{
	return [self getServiceForType:@"urn:schemas-upnp-org:service:RenderingControl:1"];
}

-(BasicUPnPService*)connectionManagerService{
	return [self getServiceForType:@"urn:schemas-upnp-org:service:ConnectionManager:1"];
}


-(SoapActionsAVTransport1*)avTransport{
	if(mAvTransport == nil){
		
		mAvTransport = (SoapActionsAVTransport1*)[[self getServiceForType:@"urn:schemas-upnp-org:service:AVTransport:1"] soap];
		[mAvTransport retain];
	}
	
	return mAvTransport;
}

-(SoapActionsRenderingControl1*)renderingControl{
	if(mRenderingControl == nil){
		mRenderingControl = (SoapActionsRenderingControl1*)[[self getServiceForType:@"urn:schemas-upnp-org:service:RenderingControl:1"] soap];
		[mRenderingControl retain];
	}
	
	return mRenderingControl;
}


-(SoapActionsConnectionManager1*)connectionManager{
	if(mConnectionManager == nil){
		mConnectionManager = (SoapActionsConnectionManager1*)[[self getServiceForType:@"urn:schemas-upnp-org:service:ConnectionManager:1"] soap];
		[mConnectionManager retain];
	}
	
	return mConnectionManager;
}


-(BOOL)supportProtocol:(NSString*)protocolInfo withCache:(BOOL)useCache{
	BOOL ret = NO;
	
	//Cache the protocolInfo
	if(useCache == YES && mProtocolInfoSink != nil && mProtocolInfoSource != nil){
		//Don't do soap
	}else{
		if(mProtocolInfoSink == nil){
			mProtocolInfoSink = [[NSMutableString alloc] init];
		}
		if(mProtocolInfoSource == nil){		
			mProtocolInfoSource = [[NSMutableString alloc] init];
		}
		[[self connectionManager] GetProtocolInfoWithOutSource:mProtocolInfoSource OutSink:mProtocolInfoSink];
	}
	
	//@TODO Implement the check ; See Intel PDF "Designing a UPnP av MediaRenderer, 5.3 Mime Types and File Extension Mappings
	NSLog(@"@TODO Implement the check ; See Intel PDF 'Designing a UPnP av MediaRenderer, 5.3 Mime Types and File Extension Mappings'");
	ret = TRUE;
	
	return ret;
}




-(int)play{
	
	[playList stop];
	
	if([[self avTransportService] isObserver:(BasicUPnPServiceObserver*)self] == NO){
		[[self avTransportService] addObserver:(BasicUPnPServiceObserver*)self]; //Lazy observer attach
	}
	
	
	//Set the device to play the current track 
	MediaServer1ItemObject* mediaItem = [playList GetCurrentTrackItem];
	
	//Metadata
	NSMutableString *metaData = [[NSMutableString alloc] init];
	NSMutableString *outTotalMatches = [[NSMutableString alloc] init];
	NSMutableString *outNumberReturned = [[NSMutableString alloc] init];		
	NSMutableString *outUpdateID = [[NSMutableString alloc] init];
	
	//Get the metadata, we need to supply it when playback
	[[[playList mediaServer] contentDirectory] BrowseWithObjectID:[mediaItem objectID] BrowseFlag:@"BrowseMetadata" Filter:@"*" StartingIndex:@"0" RequestedCount:@"1" SortCriteria:@"+dc:title" OutResult:metaData OutNumberReturned:outNumberReturned OutTotalMatches:outTotalMatches OutUpdateID:outUpdateID];
	
	NSLog(@"metaData:%@",metaData);
	
	[outTotalMatches release];
	[outUpdateID release];
	[outNumberReturned release];
	
	
	
	if([self supportProtocol:[mediaItem protocolInfo] withCache:YES] == YES){
		
		[[self avTransport] SetPlayModeWithInstanceID:@"0" NewPlayMode:@"NORMAL"];
		

//		[[self avTransport] StopWithInstanceID:@"0"]; //Causes the playlist to goto next	
		
//		[[self avTransport] SetNextAVTransportURIWithInstanceID:@"0" NextURI:[mediaItem uri] NextURIMetaData:[metaData XMLEscape] ]; 		
		[[self avTransport] SetAVTransportURIWithInstanceID:@"0" CurrentURI:[mediaItem uri] CurrentURIMetaData:[metaData XMLEscape] ]; 
		
		
		[[self avTransport] PlayWithInstanceID:@"0" Speed:@"1"];		
		NSLog(@"metaData XMLEscape:%@", [metaData XMLEscape]);
		
		
		
		
	}else{
		NSLog(@"Does not support protocol: %@", [mediaItem protocolInfo]);
	}	
	
	[metaData release];
	
	[playList play];
	
//	return [self changeState:MediaPlaylistState_Playing];
	return 0;
}



-(int)playWithMedia:(MediaServer1BasicObject*)media{

	
	[playList setTrackByID:[media objectID]];
	
	return [self play];
}



//BasicUPnPServiceObserver
-(void)UPnPEvent:(BasicUPnPService*)sender events:(NSDictionary*)events{
	NSLog(@"MediaRenderer1Device - BasicUPnPServiceObserver - UPnPEvent");
	if(sender == [self avTransportService]){
		NSString *newState = [events objectForKey:@"TransportState"];
	
		NSLog(@"newState=%@",newState);
		if([newState isEqualToString:@"STOPPED"]){
			int i = [playList nextTrack];
			if(i >= 0){
				[self play];
			}
		}
	}
}



@end
