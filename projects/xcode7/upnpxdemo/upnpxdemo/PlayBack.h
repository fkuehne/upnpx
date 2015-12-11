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
    MediaRenderer1Device *__weak renderer;
    MediaServer1Device *server;
    NSMutableArray *playlist; //MediaServer1BasicObject (can be: MediaServer1ContainerObject, MediaServer1ItemObject)
    NSInteger pos;
}

+(PlayBack*)GetInstance;

-(void)setRenderer:(MediaRenderer1Device*)rend;
-(int)Play:(NSMutableArray*)playList position:(NSInteger)position;
-(int)Play:(NSInteger)position;

//BasicUPnPServiceObserver
-(void)UPnPEvent:(BasicUPnPService*)sender events:(NSDictionary*)events;

@property (strong) MediaServer1Device *server;
@property (weak, readonly) MediaRenderer1Device *renderer;
@property (strong) NSMutableArray *playlist;

@end

