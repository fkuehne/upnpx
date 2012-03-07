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


#import "MediaRenderer1Device.h"
#import "CocoaTools.h"

@implementation MediaRenderer1Device

@synthesize playList;


-(id)init{
    self = [super init];
    
    if (self) {	
        mAvTransport = nil;
        mRenderingControl = nil;
        mConnectionManager = nil;
        mProtocolInfoSink = nil;
        mProtocolInfoSource = nil;
        
        
        playList = [[MediaPlaylist alloc] init];
        
            
        //Try to load the playist (?)
	}
    
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
	//NSLog(@"@TODO Implement the check ; See Intel PDF 'Designing a UPnP av MediaRenderer, 5.3 Mime Types and File Extension Mappings'");
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
	
	
	[outTotalMatches release];
	[outUpdateID release];
	[outNumberReturned release];
	
	
	
	if([self supportProtocol:[mediaItem protocolInfo] withCache:YES] == YES){
		
		[[self avTransport] SetPlayModeWithInstanceID:@"0" NewPlayMode:@"NORMAL"];
		

//		[[self avTransport] StopWithInstanceID:@"0"]; //Causes the playlist to goto next	
//		[[self avTransport] SetNextAVTransportURIWithInstanceID:@"0" NextURI:[mediaItem uri] NextURIMetaData:[metaData XMLEscape] ]; 		
		[[self avTransport] SetAVTransportURIWithInstanceID:@"0" CurrentURI:[mediaItem uri] CurrentURIMetaData:[metaData XMLEscape] ]; 
		
		
		[[self avTransport] PlayWithInstanceID:@"0" Speed:@"1"];		
		
		
		
		
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
	if(sender == [self avTransportService]){
		NSString *newState = [events objectForKey:@"TransportState"];
	
		if([newState isEqualToString:@"STOPPED"]){
			int i = [playList nextTrack];
			if(i >= 0){
				[self play];
			}
		}
	}
}



@end
