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


#import "DeviceFactory.h"

//Specific devices
#import "MediaRenderer1Device.h"
#import "MediaServer1Device.h"
#import "BinaryLight1Device.h"
#import "DimmableLight1Device.h"
#import "WANConnection1Device.h"

@implementation DeviceFactory


-(id)init{
	[super init];
	return self;
}


-(void)dealloc{
	
	[super dealloc];
}


-(BasicUPnPDevice*)allocDeviceForSSDPDevice:(SSDPDBDevice_ObjC*)ssdp{
	BasicUPnPDevice* device = nil;	
	
	if([[ssdp urn] isEqualToString:@"urn:schemas-upnp-org:device:MediaRenderer:1"]){
		device =  [[MediaRenderer1Device alloc] initWithSSDPDevice:ssdp];
	}else if([[ssdp urn] isEqualToString:@"urn:schemas-upnp-org:device:MediaServer:1"]){
		device =  [[MediaServer1Device alloc] initWithSSDPDevice:ssdp];
	}else if([[ssdp urn] isEqualToString:@"urn:schemas-upnp-org:device:BinaryLight:1"]){
		device =  [[BinaryLight1Device alloc] initWithSSDPDevice:ssdp];
	}else if([[ssdp urn] isEqualToString:@"urn:schemas-upnp-org:device:DimmableLight:1"]){
		device =  [[DimmableLight1Device alloc] initWithSSDPDevice:ssdp];
	}else if([[ssdp urn] isEqualToString:@"urn:schemas-upnp-org:device:WANConnectionDevice:1"]){
		device =  [[WANConnection1Device alloc] initWithSSDPDevice:ssdp];
	}else{
		device =  [[BasicUPnPDevice alloc] initWithSSDPDevice:ssdp];
	}
	
	return device;
}

@end
