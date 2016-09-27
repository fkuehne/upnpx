//
//  FolderViewController.h
//  upnpxdemo
//
//  Created by Bruno Keymolen on 02/07/11.
//  Copyright 2011 Bruno Keymolen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MediaServer1Device.h"

@class MediaServer1BasicObject;

@interface FolderViewController : UITableViewController

@property(strong, nonatomic) NSString *m_rootId;
@property(strong, nonatomic) NSString *m_title;
@property(strong, nonatomic) MediaServer1Device *m_device;
@property(strong, nonatomic) NSMutableArray<MediaServer1BasicObject *> *m_playList;

@property(strong, nonatomic) UILabel *titleLabel;

-(instancetype)initWithMediaDevice:(MediaServer1Device*)device andHeader:(NSString*)header andRootId:(NSString*)rootId NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithStyle:(UITableViewStyle)style NS_UNAVAILABLE;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

@end
