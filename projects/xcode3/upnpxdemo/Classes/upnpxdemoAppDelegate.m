//
//  upnpxdemoAppDelegate.m
//  upnpxdemo
//
//  Created by Bruno Keymolen on 22/05/11.
//  Copyright Bruno Keymolen 2011. All rights reserved.
//

#import "upnpxdemoAppDelegate.h"
#import "RootViewController.h"


@implementation upnpxdemoAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
    
    
    
    
	return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

