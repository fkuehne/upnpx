// ******************************************************************
//
// This file is part of upnpx.
//
// upnpx is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as 
// published by the Free Software Foundation, either version 3 of the 
// License, or (at your option) any later version.
//
// upnpx is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with upnpx.  If not, see <http://www.gnu.org/licenses/>.
//
// Copyright (C)2011, Bruno Keymolen, email: bruno.keymolen@gmail.com
//
// ******************************************************************


/* WANConnectionDevice:1 Services (O:Optional/R:Required)
 *
 * WANPOTSLinkConfig:1			O for POTS modems
 * WANDSLLinkConfig:1			O for DSL modems
 * WANCableLinkConfig:1			O for Cable modems
 * WANEthernetLinkConfig:1		O for Ethernet attached modems
 * WANPPPConnection:1			R for modems that support PPP based connections
 * WANIPConnection:1			R for modems that support IP based connections
 *
 */


#import <Foundation/Foundation.h>
#import "BasicUPnPDevice.h"
#import "SoapActionsWANIPConnection1.h"
#import "SoapActionsWANPPPConnection1.h"


@interface WANConnection1Device : BasicUPnPDevice {
	SoapActionsWANIPConnection1 *mIPConnection;
	SoapActionsWANPPPConnection1 *mPPPConnection;
}

-(id)init;
-(void)dealloc;

-(SoapActionsWANIPConnection1*)ipConnection;
-(SoapActionsWANPPPConnection1*)pppConnection;

-(BasicUPnPService*)ipConnectionService;
-(BasicUPnPService*)pppConnectionService;



@end
