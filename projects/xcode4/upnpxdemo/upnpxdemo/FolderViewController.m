//
//  FolderViewController.m
//  upnpxdemo
//
//  Created by Bruno Keymolen on 02/07/11.
//  Copyright 2011 Bruno Keymolen. All rights reserved.
//

#import "FolderViewController.h"

#import "MediaServerBasicObjectParser.h"
#import "MediaServer1ItemObject.h"
#import "MediaServer1ContainerObject.h"
#import "PlayBack.h"

@implementation FolderViewController

@synthesize titleLabel;



-(id)initWithMediaDevice:(MediaServer1Device*)device andHeader:(NSString*)header andRootId:(NSString*)rootId{
    self = [super init];
    
    if (self) {
        /* TODO: Properties are not retained. Possible issue? */
        m_device = device;
        m_rootId=rootId;
        m_title=header;
        
        m_playList = [[NSMutableArray alloc] init];
    }

    return self;
}


-(void)dealloc{
    [m_playList release];
    [super dealloc];
}



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    //Allocate NMSutableString's to read the results
    NSMutableString *outResult = [[NSMutableString alloc] init];
    NSMutableString *outNumberReturned = [[NSMutableString alloc] init];
    NSMutableString *outTotalMatches = [[NSMutableString alloc] init];
    NSMutableString *outUpdateID = [[NSMutableString alloc] init];
    
    [[m_device contentDirectory] BrowseWithObjectID:m_rootId BrowseFlag:@"BrowseDirectChildren" Filter:@"*" StartingIndex:@"0" RequestedCount:@"0" SortCriteria:@"+dc:title" OutResult:outResult OutNumberReturned:outNumberReturned OutTotalMatches:outTotalMatches OutUpdateID:outUpdateID];  
//    SoapActionsAVTransport1* _avTransport = [m_device avTransport];
//    SoapActionsConnectionManager1* _connectionManager = [m_device connectionManager];
    
    //The collections are returned as DIDL Xml in the string 'outResult'
    //upnpx provide a helper class to parse the DIDL Xml in usable MediaServer1BasicObject object
    //(MediaServer1ContainerObject and MediaServer1ItemObject)
    //Parse the return DIDL and store all entries as objects in the 'mediaObjects' array
    [m_playList removeAllObjects];
    NSData *didl = [outResult dataUsingEncoding:NSUTF8StringEncoding]; 
    MediaServerBasicObjectParser *parser = [[MediaServerBasicObjectParser alloc] initWithMediaObjectArray:m_playList itemsOnly:NO];
    [parser parseFromData:didl];
    [parser release];
    
    [outResult release];
    [outNumberReturned release];
    [outTotalMatches release];
    [outUpdateID release];
    
    
    self.navigationController.toolbarHidden = NO;
    
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0 , 11.0f, self.navigationController.view.frame.size.width, 21.0f)];
    [self.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.titleLabel setTextColor:[UIColor colorWithRed:255.0 green:255.0 blue:255.0 alpha:1.0]];
    
    if([[PlayBack GetInstance] renderer] == nil){
        [self.titleLabel setText:@"No Renderer Selected"];        
    }else{
        [self.titleLabel setText:[[[PlayBack GetInstance] renderer] friendlyName] ];
    }
    
    [self.titleLabel setTextAlignment:UITextAlignmentLeft];
    UIBarButtonItem *ttitle = [[UIBarButtonItem alloc] initWithCustomView:self.titleLabel];
    NSArray *items = [NSArray arrayWithObjects:ttitle, nil]; 
    self.toolbarItems = items; 
    [ttitle release];

    
    self.title = m_title;    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [m_playList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    MediaServer1BasicObject *item = [m_playList objectAtIndex:indexPath.row];
   [[cell textLabel] setText:[item title]];
    NSLog(@"[item title]:%@", [item title]);
    
    return cell;    
    
}



- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    MediaServer1BasicObject *item = [m_playList objectAtIndex:indexPath.row];
    if([item isContainer]){
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
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MediaServer1BasicObject *item = [m_playList objectAtIndex:indexPath.row];
    if([item isContainer]){
        MediaServer1ContainerObject *container = [m_playList objectAtIndex:indexPath.row];
        FolderViewController *targetViewController = [[[FolderViewController alloc] initWithMediaDevice:m_device andHeader:[container title] andRootId:[container objectID]] autorelease];
        [[self navigationController] pushViewController:targetViewController animated:YES];
    }else{
        MediaServer1ItemObject *item = [m_playList objectAtIndex:indexPath.row];

        MediaServer1ItemRes *resource = nil;		
        NSEnumerator *e = [[item resources] objectEnumerator];
        while((resource = (MediaServer1ItemRes*)[e nextObject])){
            NSLog(@"%@ - %d, %@, %d, %d, %d, %@", [item title], [resource bitrate], [resource duration], [resource nrAudioChannels], [resource size],  [resource durationInSeconds],  [resource protocolInfo] );
        }	    

        [[PlayBack GetInstance] Play:m_playList position:indexPath.row];
        
    }
}



@end
