//
//  upnpxdemoAppDelegate.h
//  upnpxdemo
//
//  Created by Bruno Keymolen on 22/05/11.
//  Copyright Bruno Keymolen 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface upnpxdemoAppDelegate : NSObject <UIApplicationDelegate> {

    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

