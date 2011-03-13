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


#import "MediaServer1Device.h"


@implementation MediaServer1Device



-(id)init{
	[super init];
	
	mAvTransport = nil;
	mConnectionManager = nil;
	mContentDirectory = nil;
	
	return self;
}


-(void)dealloc{
	
	[mAvTransport release];
	[mContentDirectory release];
	[mConnectionManager release];
	
	[super dealloc];
}


-(SoapActionsAVTransport1*)avTransport{
	if(mAvTransport == nil){
		mAvTransport = (SoapActionsAVTransport1*)[[self getServiceForType:@"urn:schemas-upnp-org:service:AVTransport:1"] soap];
		[mAvTransport retain];
	}
	
	return mAvTransport;
}

-(SoapActionsContentDirectory1*)contentDirectory{
	if(mContentDirectory == nil){
		mContentDirectory = (SoapActionsContentDirectory1*)[[self getServiceForType:@"urn:schemas-upnp-org:service:ContentDirectory:1"] soap];
		[mContentDirectory retain];
	}
	
	return mContentDirectory;
}


-(SoapActionsConnectionManager1*)connectionManager{
	if(mConnectionManager == nil){
		mConnectionManager = (SoapActionsConnectionManager1*)[[self getServiceForType:@"urn:schemas-upnp-org:service:ConnectionManager:1"] soap];
		[mConnectionManager retain];
	}
	
	return mConnectionManager;
}


-(BasicUPnPService*)avTransportService{
	return [self getServiceForType:@"urn:schemas-upnp-org:service:AVTransport:1"];
}


-(BasicUPnPService*)connectionManagerService{
	return [self getServiceForType:@"urn:schemas-upnp-org:service:ConnectionManager:1"];
}

-(BasicUPnPService*)contentDirectoryService{
	return [self getServiceForType:@"urn:schemas-upnp-org:service:ContentDirectory:1"];
}



@end
