//
//  RootViewController.h
//  upnpxdemo
//
//  Created by Bruno Keymolen on 22/05/11.
//  Copyright Bruno Keymolen 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UPnPDB.h"

@interface RootViewController : UITableViewController <UPnPDBObserver>{
    UITableView *menuView;

	NSArray *mDevices; //BasicUPnPDevice*
}

@property (assign) IBOutlet UITableView *menuView;

//protocol UPnPDBObserver
-(void)UPnPDBWillUpdate:(UPnPDB*)sender;
-(void)UPnPDBUpdated:(UPnPDB*)sender;


@end
