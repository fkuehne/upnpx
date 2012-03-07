//
//  PlayBack.h
//  upnpxdemo
//
//  Created by Bruno Keymolen on 03/03/12.
//  Copyright 2012 Bruno Keymolen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MediaRenderer1Device.h"
#import "MediaServer1Device.h"
#import "BasicUPnPService.h"

@interface PlayBack : NSObject <BasicUPnPServiceObserver> {
    MediaRenderer1Device *renderer;
    MediaServer1Device *server;
    NSMutableArray *playlist; //MediaServer1BasicObject (can be: MediaServer1ContainerObject, MediaServer1ItemObject)
    int pos;
}

+(PlayBack*)GetInstance;

-(void)setRenderer:(MediaRenderer1Device*)rend;
-(int)Play:(NSMutableArray*)playList position:(int)position;
-(int)Play:(int)position;

//BasicUPnPServiceObserver
-(void)UPnPEvent:(BasicUPnPService*)sender events:(NSDictionary*)events;

@property (retain) MediaServer1Device *server;
@property (readonly) MediaRenderer1Device *renderer;
@property (retain) NSMutableArray *playlist;

@end

