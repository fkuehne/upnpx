//
//  RootViewController.m
//  upnpxdemo
//
//  Created by Bruno Keymolen on 28/05/11.
//  Copyright 2011 Bruno Keymolen. All rights reserved.
//

#import "RootViewController.h"
#import "UPnPManager.h"
#import "FolderViewController.h"
#import "PlayBack.h"

@interface RootViewController() <UPnPDBObserver>

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UPnPDB* db = [[UPnPManager GetInstance] DB];
    
    self.mDevices = [db rootDevices]; //BasicUPnPDevice
    
    [db addObserver:self];
    
    //Optional; set User Agent
    [[[UPnPManager GetInstance] SSDP] setUserAgentProduct:@"upnpxdemo/1.0" andOS:@"OSX"];
    
    
    //Search for UPnP Devices 
    [[[UPnPManager GetInstance] SSDP] searchSSDP];      
    
    self.title = @"upnpx demo - Xcode 7"; 
    self.navigationController.toolbarHidden = NO;


    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0 , 11.0f, self.navigationController.view.frame.size.width, 21.0f)];
    [self.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.titleLabel setTextColor:[UIColor blackColor]];
    [self.titleLabel setText:@""];
    [self.titleLabel setTextAlignment:NSTextAlignmentLeft];

    UIBarButtonItem *ttitle = [[UIBarButtonItem alloc] initWithCustomView:self.titleLabel];

    NSArray *items = @[ttitle]; 
    self.toolbarItems = items;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(reloadData)];
}

- (void)reloadData {
    [self.menuView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.mDevices.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    // Configure the cell.
    BasicUPnPDevice *device = self.mDevices[indexPath.row];
     [[cell textLabel] setText:[device friendlyName]];
    BOOL isMediaServer = [device.urn isEqualToString:@"urn:schemas-upnp-org:device:MediaServer:1"];
    cell.accessoryType = isMediaServer ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;

    NSLog(@"%ld %@, urn '%@'", (long)indexPath.row, [device friendlyName], device.urn);

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BasicUPnPDevice *device = self.mDevices[indexPath.row];
    if([[device urn] isEqualToString:@"urn:schemas-upnp-org:device:MediaServer:1"]){
        MediaServer1Device *server = (MediaServer1Device*)device;        
        FolderViewController *targetViewController = [[FolderViewController alloc] initWithMediaDevice:server andHeader:@"root" andRootId:@"0" ];
        [[self navigationController] pushViewController:targetViewController animated:YES];
        [[PlayBack GetInstance] setServer:server];
    }else if([[device urn] isEqualToString:@"urn:schemas-upnp-org:device:MediaRenderer:1"]){
        [self.titleLabel setText:[device friendlyName]];
        MediaRenderer1Device *render = (MediaRenderer1Device*)device;
        [[PlayBack GetInstance] setRenderer:render];
    }
}

#pragma mark - protocol UPnPDBObserver

-(void)UPnPDBWillUpdate:(UPnPDB*)sender {
    NSLog(@"UPnPDBWillUpdate %lu", (unsigned long)self.mDevices.count);
}

-(void)UPnPDBUpdated:(UPnPDB*)sender {
    NSLog(@"UPnPDBUpdated %lu", (unsigned long)self.mDevices.count);

    [self reloadData];
}

@end
