//
//  FolderViewController.h
//  upnpxdemo
//
//  Created by Bruno Keymolen on 02/07/11.
//  Copyright 2011 Bruno Keymolen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MediaServer1Device.h"

@interface FolderViewController : UITableViewController {
    NSString *m_rootId;
    NSString *m_title;
    MediaServer1Device *m_device;
    NSMutableArray *m_playList; //MediaServer1BasicObject (can be: MediaServer1ContainerObject, MediaServer1ItemObject)
    UILabel *titleLabel;
}

@property (strong) UILabel *titleLabel;

-(instancetype)initWithMediaDevice:(MediaServer1Device*)device andHeader:(NSString*)header andRootId:(NSString*)rootId NS_DESIGNATED_INITIALIZER;

@end
