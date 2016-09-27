//
//  PlayBack.m
//  upnpxdemo
//
//  Created by Bruno Keymolen on 03/03/12.
//  Copyright 2012 Bruno Keymolen. All rights reserved.
//

#import "PlayBack.h"

static PlayBack *_playback = nil;

@implementation PlayBack

@synthesize renderer;
@synthesize server;
@synthesize playlist;

- (instancetype)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        pos = 0;
        renderer = nil;
        server = nil;
    }
    
    return self;
}


+(PlayBack*)GetInstance{
	if(_playback == nil){
		_playback = [[PlayBack alloc] init];
	}
	return _playback;
}

-(void)setRenderer:(MediaRenderer1Device*)rend{
    
    MediaRenderer1Device* old = renderer;
    
    //Remove the Old Observer, if any
    if(old!=nil){
         if([[old avTransportService] isObserver:(BasicUPnPServiceObserver*)self] == YES){
             [[old avTransportService] removeObserver:(BasicUPnPServiceObserver*)self]; 
         }
    }

    renderer = rend;

    //Add New Observer, if any
    if(renderer!=nil){
        if([[renderer avTransportService] isObserver:(BasicUPnPServiceObserver*)self] == NO){
            [[renderer avTransportService] addObserver:(BasicUPnPServiceObserver*)self]; 
        }
    }
    
    
}


-(int)Play:(NSMutableArray*)playList position:(NSInteger)position{
    [self setPlaylist:playList];
    
    //Lazy Observer attach
    if([[renderer avTransportService] isObserver:(BasicUPnPServiceObserver*)self] == NO){
        [[renderer avTransportService] addObserver:(BasicUPnPServiceObserver*)self]; 
    }
    
    //Play
    return [self Play:position];
}


-(int)Play:(NSInteger)position{
    //Do we have a Renderer & a playlist ?
    if(renderer == nil || playlist == nil){
        return -1;
    }
    
    if(position >= [playlist count]){
        position = 0; //Loop
    }
    
    pos = position;

    //Is it a Media1ServerItem ?
    if(![playlist[pos] isContainer]){
        MediaServer1ItemObject *item = playlist[pos];
        
        //A few things are missing here:
        // - Find the right URI based on MIME type, do this via: [item resources], also check render capabilities 
        // = The InstanceID is set to @"0", find the right one via: "ConnetionManager PrepareForConnection"
        
        
        //Find the right URI & Instance ID
        NSString *uri = [item uri];
        NSString *iid = @"0";
        
        
        //Play
        [[renderer avTransport] SetPlayModeWithInstanceID:iid NewPlayMode:@"NORMAL"];
        [[renderer avTransport] SetAVTransportURIWithInstanceID:iid CurrentURI:uri CurrentURIMetaData:@""];
        [[renderer avTransport] PlayWithInstanceID:iid Speed:@"1"];        
        
    }
    
    return 0;
}

#pragma mark - BasicUPnPServiceObserver

- (void)basicUPnPService:(BasicUPnPService *)service receivedEvents:(NSDictionary *)events {
    if (service == self.renderer.avTransportService) {
        NSString *newState = events[@"TransportState"];
        
        if ([newState isEqualToString:@"STOPPED"]) {
            // Do you stuff, play next song etc...
            NSLog(@"Event: 'STOPPED', Play next track of playlist.");
            [self Play:pos+1]; //Next
        }
    }
}

@end
