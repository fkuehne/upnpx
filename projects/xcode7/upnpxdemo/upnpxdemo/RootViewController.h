//
//  RootViewController.h
//  upnpxdemo
//
//  Created by Bruno Keymolen on 28/05/11.
//  Copyright 2011 Bruno Keymolen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UPnPDB.h"

@interface RootViewController : UITableViewController <UPnPDBObserver>

@property(strong, nonatomic) NSArray<BasicUPnPDevice *> *mDevices;

@property(weak, nonatomic) IBOutlet UITableView *menuView;
@property(strong, nonatomic) UILabel *titleLabel;

@end
