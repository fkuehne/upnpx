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

- (id)init
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

    [rend retain];
    renderer = rend;
    [old release];

    //Add New Observer, if any
    if(renderer!=nil){
        if([[renderer avTransportService] isObserver:(BasicUPnPServiceObserver*)self] == NO){
            [[renderer avTransportService] addObserver:(BasicUPnPServiceObserver*)self]; 
        }
    }
    
    
}


-(int)Play:(NSMutableArray*)playList position:(int)position{
    [self setPlaylist:playList];
    
    //Lazy Observer attach
    if([[renderer avTransportService] isObserver:(BasicUPnPServiceObserver*)self] == NO){
        [[renderer avTransportService] addObserver:(BasicUPnPServiceObserver*)self]; 
    }
    
    //Play
    return [self Play:position];
}


-(int)Play:(int)position{
    //Do we have a Renderer & a playlist ?
    if(renderer == nil || playlist == nil){
        return -1;
    }
    
    if(position >= [playlist count]){
        position = 0; //Loop
    }
    
    pos = position;

    //Is it a Media1ServerItem ?
    if(![[playlist objectAtIndex:pos] isContainer]){
        MediaServer1ItemObject *item = [playlist objectAtIndex:pos];
        
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


//BasicUPnPServiceObserver
-(void)UPnPEvent:(BasicUPnPService*)sender events:(NSDictionary*)events{
    if(sender == [renderer avTransportService]){
        NSString *newState = [events objectForKey:@"TransportState"];
        
        if([newState isEqualToString:@"STOPPED"]){
            //Do your stuff, play next song etc...
            NSLog(@"Event: 'STOPPED', Play next track of playlist.");
           [self Play:pos+1]; //Next
        }
    }
}






@end
