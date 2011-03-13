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


#import "UPnPManager.h"


static UPnPManager *_upnpmanager = nil;

@implementation UPnPManager

@synthesize SSDP;
@synthesize DB;
@synthesize serviceFactory;
@synthesize deviceFactory;
@synthesize soapFactory;
@synthesize upnpEvents;
@synthesize defaultMediaRenderer1;
@synthesize defaultPlaylist;

+(UPnPManager*)GetInstance{
	if(_upnpmanager == nil){
		_upnpmanager = [[UPnPManager alloc] init];
	}
	return _upnpmanager;
}

-(id)init{
	[super init];
	
	upnpEvents = [[UPnPEvents alloc] init];
	soapFactory = [[SoapActionFactory alloc] init];
	serviceFactory = [[ServiceFactory alloc] init];
	deviceFactory = [[DeviceFactory alloc] init];
	SSDP = [[SSDPDB_ObjC alloc] init];
	DB = [[UPnPDB alloc] initWithSSDP:SSDP]; 
	defaultPlaylist = [[MediaPlaylist alloc] init];

		

	[SSDP startSSDP];
	
	return self;
}

-(void)dealloc{
	[SSDP stopSSDP];
	[SSDP release];
	[DB release];
	[serviceFactory release];
	[deviceFactory release];
	[soapFactory release];
	[upnpEvents release];
	[defaultPlaylist release];
	
	[super dealloc];
}


@end
