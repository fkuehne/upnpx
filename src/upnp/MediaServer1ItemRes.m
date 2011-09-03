//
//  MediaServer1ItemRes.m
//  upnpx
//
//  Created by Bruno Keymolen on 03/09/11.
//  Copyright 2011 Bruno Keymolen. All rights reserved.
//

#import "MediaServer1ItemRes.h"



@implementation MediaServer1ItemRes

@synthesize bitrate;
@synthesize duration;
@synthesize nrAudioChannels;
@synthesize protocolInfo;
@synthesize size;
@synthesize durationInSeconds;

-(void)dealloc{
    [duration release];
    [protocolInfo release];
    [super dealloc];
}

@end
