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


#import "DimmableLight1Device.h"


@implementation DimmableLight1Device

-(id)init{
	[super init];
	
	mSwitchPower = nil;
	mDimming = nil;

	return self;
}


-(void)dealloc{
	
	[mSwitchPower release];
	[mDimming release];
	
	[super dealloc];
}



-(BasicUPnPService*)switchPowerService{
	return [self getServiceForType:@"urn:schemas-upnp-org:service:SwitchPower:1"];
}

-(BasicUPnPService*)dimmingService{
	return [self getServiceForType:@"urn:schemas-upnp-org:service:Dimming:1"];
}



-(SoapActionsSwitchPower1*)switchPower{
	if(mSwitchPower == nil){	                                                                     
		mSwitchPower = (SoapActionsSwitchPower1*)[[self getServiceForType:@"urn:schemas-upnp-org:service:SwitchPower:1"] soap];
		[mSwitchPower retain];
	}
	
	return mSwitchPower;
}

-(SoapActionsDimming1*)dimming{
	if(mDimming == nil){	                                                                     
		mDimming = (SoapActionsDimming1*)[[self getServiceForType:@"urn:schemas-upnp-org:service:Dimming:1"] soap];
		[mDimming retain];
	}
	
	return mDimming;
}



@end
