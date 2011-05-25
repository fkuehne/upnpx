//
//  FolderView.h
//  upnpxdemo
//
//  Created by Bruno Keymolen on 24/05/11.
//  Copyright 2011 Bruno Keymolen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MediaServer1Device.h"


@interface FolderView : UITableViewController {
    NSString *m_rootId;
    NSString *m_title;
    MediaServer1Device *m_device;
    NSMutableArray *m_playList; //
}

-(id)initWithMediaDevice:(MediaServer1Device*)device andHeader:(NSString*)header andRootId:(NSString*)rootId;
-(void)dealloc;

@end
