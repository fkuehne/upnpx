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


#import <Foundation/Foundation.h>
#import "SSDPDB_ObjC.h"
#import "UPnPDB.h"
#import "ServiceFactory.h"
#import "DeviceFactory.h"
#import "SoapActionFactory.h"
#import "MediaRenderer1Device.h"
#import "UPnPEvents.h"
#import "MediaPlaylist.h"


@interface UPnPManager : NSObject {
	SSDPDB_ObjC *SSDP;
	UPnPDB *DB;
	ServiceFactory* serviceFactory;
	DeviceFactory* deviceFactory;
	SoapActionFactory* soapFactory;
	UPnPEvents *upnpEvents;

	MediaRenderer1Device *defaultMediaRenderer1;	
	MediaPlaylist *defaultPlaylist;
}

+(UPnPManager*)GetInstance;
-(id)init;
-(void)dealloc;

@property(readonly) SSDPDB_ObjC *SSDP;
@property(readonly) UPnPDB *DB;
@property(readonly) ServiceFactory* serviceFactory;
@property(readonly) DeviceFactory* deviceFactory;
@property(readonly) SoapActionFactory* soapFactory;
@property(retain, nonatomic) MediaRenderer1Device *defaultMediaRenderer1;
@property(readonly) UPnPEvents *upnpEvents;
@property(readonly) MediaPlaylist *defaultPlaylist;


@end
