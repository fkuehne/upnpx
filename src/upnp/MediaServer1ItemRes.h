//
//  MediaServer1ItemRes.h
//  upnpx
//
//  Created by Bruno Keymolen on 03/09/11.
//  Copyright 2011 Bruno Keymolen. All rights reserved.
//

#import <Foundation/Foundation.h>

//<res  
//
//      bitrate="24000" 
//      duration="0:03:16.000" 
//      nrAudioChannels="2" 
//      protocolInfo="http-get:*:audio/mpeg:DLNA.ORG_PN=MP3;DLNA.ORG_OP=01;DLNA.ORG_CI=0;DLNA.ORG_FLAGS=01500000000000000000000000000000" sampleFrequency="44100" 
//      size="4737165">
//
//      http://192.168.0.16:8895/resource/56/MEDIA_ITEM/MP3$0
//
//</res>

@interface MediaServer1ItemRes : NSObject {
    int bitrate;
    NSString *duration;
    int nrAudioChannels;
    NSString *protocolInfo;
    int size;
    int durationInSeconds;
}

-(void)dealloc;

@property(readwrite) int bitrate;
@property(retain, nonatomic) NSString *duration;
@property(readwrite) int nrAudioChannels;
@property(retain, nonatomic) NSString *protocolInfo;
@property(readwrite) int size;
@property(readwrite) int durationInSeconds;


@end
