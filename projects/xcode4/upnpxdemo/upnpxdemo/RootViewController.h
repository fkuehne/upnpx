//
//  RootViewController.h
//  upnpxdemo
//
//  Created by Bruno Keymolen on 28/05/11.
//  Copyright 2011 Bruno Keymolen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UPnPDB.h"

@interface RootViewController : UITableViewController <UPnPDBObserver>{
    UITableView *menuView;
    NSArray *mDevices; //BasicUPnPDevice*
    UILabel *titleLabel;
}

@property (assign) IBOutlet UITableView *menuView;
@property (retain) UILabel *titleLabel;

//protocol UPnPDBObserver
-(void)UPnPDBWillUpdate:(UPnPDB*)sender;
-(void)UPnPDBUpdated:(UPnPDB*)sender;


@end
