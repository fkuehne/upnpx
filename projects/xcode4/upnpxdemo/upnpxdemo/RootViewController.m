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

@implementation RootViewController

@synthesize menuView;
@synthesize titleLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UPnPDB* db = [[UPnPManager GetInstance] DB];
    
    mDevices = [db rootDevices]; //BasicUPnPDevice
    [mDevices retain];
    
    [db addObserver:(UPnPDBObserver*)self];
    
    //Optional; set User Agent
    [[[UPnPManager GetInstance] SSDP] setUserAgentProduct:@"upnpxdemo/1.0" andOS:@"OSX"];
    
    
    //Search for UPnP Devices 
    [[[UPnPManager GetInstance] SSDP] searchSSDP];      
    
    self.title = @"upnpx demo - Xcode 4"; 
    self.navigationController.toolbarHidden = NO;


    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0 , 11.0f, self.navigationController.view.frame.size.width, 21.0f)];
    [self.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.titleLabel setTextColor:[UIColor colorWithRed:255.0 green:255.0 blue:255.0 alpha:1.0]];
    [self.titleLabel setText:@""];
    [self.titleLabel setTextAlignment:UITextAlignmentLeft];

    UIBarButtonItem *ttitle = [[UIBarButtonItem alloc] initWithCustomView:self.titleLabel];

    NSArray *items = [NSArray arrayWithObjects:ttitle, nil]; 
    self.toolbarItems = items; 
    [ttitle release];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [mDevices count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    // Configure the cell.
    BasicUPnPDevice *device = [mDevices objectAtIndex:indexPath.row];
     [[cell textLabel] setText:[device friendlyName]];
    
    NSLog(@"%d %@", indexPath.row, [device friendlyName]);
    
    return cell;
}


-(UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    BasicUPnPDevice *device = [mDevices objectAtIndex:indexPath.row];
    if([[device urn] isEqualToString:@"urn:schemas-upnp-org:device:MediaServer:1"]){
        return UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return UITableViewCellAccessoryNone;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BasicUPnPDevice *device = [mDevices objectAtIndex:indexPath.row];
    if([[device urn] isEqualToString:@"urn:schemas-upnp-org:device:MediaServer:1"]){
        MediaServer1Device *server = (MediaServer1Device*)device;        
        FolderViewController *targetViewController = [[[FolderViewController alloc] initWithMediaDevice:server andHeader:@"root" andRootId:@"0" ] autorelease];
        [[self navigationController] pushViewController:targetViewController animated:YES];
        [[PlayBack GetInstance] setServer:server];
    }else if([[device urn] isEqualToString:@"urn:schemas-upnp-org:device:MediaRenderer:1"]){
        [self.titleLabel setText:[device friendlyName]];
        MediaRenderer1Device *render = (MediaRenderer1Device*)device;
        [[PlayBack GetInstance] setRenderer:render];
    }
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [super dealloc];
}




//protocol UPnPDBObserver
-(void)UPnPDBWillUpdate:(UPnPDB*)sender{
    NSLog(@"UPnPDBWillUpdate %d", [mDevices count]);
}

-(void)UPnPDBUpdated:(UPnPDB*)sender{
    NSLog(@"UPnPDBUpdated %d", [mDevices count]);
    [menuView performSelectorOnMainThread : @ selector(reloadData) withObject:nil waitUntilDone:YES];
}

@end
