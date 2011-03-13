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


#import "WANConnection1Device.h"


@implementation WANConnection1Device


-(id)init{
	[super init];
	
	mIPConnection = nil;
	mPPPConnection = nil;
	
	return self;
}


-(void)dealloc{
	[mPPPConnection release];
	[mIPConnection release];
	
	[super dealloc];
}


-(BasicUPnPService*)ipConnectionService{
	return [self getServiceForType:@"urn:schemas-upnp-org:service:WANIPConnection:1"];
}


-(BasicUPnPService*)pppConnectionService{
	return [self getServiceForType:@"urn:schemas-upnp-org:service:WANPPPConnection:1"];
}


-(SoapActionsWANIPConnection1*)ipConnection{
	if(mIPConnection == nil){	                                                                     
		mIPConnection = (SoapActionsWANIPConnection1*)[[self getServiceForType:@"urn:schemas-upnp-org:service:WANIPConnection:1"] soap];
		[mIPConnection retain];
	}
	
	return mIPConnection;
}


-(SoapActionsWANPPPConnection1*)pppConnection{
	if(mPPPConnection == nil){	                                                                     
		mPPPConnection = (SoapActionsWANPPPConnection1*)[[self getServiceForType:@"urn:schemas-upnp-org:service:WANPPPConnection:1"] soap];
		[mPPPConnection retain];
	}
	
	return mPPPConnection;
}


@end
