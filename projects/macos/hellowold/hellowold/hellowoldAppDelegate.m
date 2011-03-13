// ******************************************************************
//
// This file is part of UPnPX.
//
// UPnPX is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as 
// published by the Free Software Foundation, either version 3 of the 
// License, or (at your option) any later version.
//
// UPnPX is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with UPnPX.  If not, see <http://www.gnu.org/licenses/>.
//
// Copyright (C)2011, Bruno Keymolen, email: bruno.keymolen@gmail.com
//
// ******************************************************************


#import "hellowoldAppDelegate.h"
#import "UPnPManager.h"


@implementation hellowoldAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // UPnPX Helloworld Start
    [window setTitle:@"UPnPX HelloWorld"];
    
    //Get a reference to the UPnPDB via the UPnPManager
    mUPnPDB = [[UPnPManager GetInstance] DB];
   // [mUPnPDB 
}


//
// Interface UPnPDBObserver
//
-(void)UPnPDBWillUpdate:(UPnPDB*)sender{

}
-(void)UPnPDBUpdated:(UPnPDB*)sender{

}



@end
