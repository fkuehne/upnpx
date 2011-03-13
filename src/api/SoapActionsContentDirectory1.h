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
#import "SoapAction.h"

@interface SoapActionsContentDirectory1 : SoapAction {
    }

//SOAP

-(int)GetSearchCapabilitiesWithOutSearchCaps:(NSMutableString*)searchcaps;
-(int)GetSortCapabilitiesWithOutSortCaps:(NSMutableString*)sortcaps;
-(int)GetSystemUpdateIDWithOutId:(NSMutableString*)id;
-(int)BrowseWithObjectID:(NSString*)objectid BrowseFlag:(NSString*)browseflag Filter:(NSString*)filter StartingIndex:(NSString*)startingindex RequestedCount:(NSString*)requestedcount SortCriteria:(NSString*)sortcriteria OutResult:(NSMutableString*)result OutNumberReturned:(NSMutableString*)numberreturned OutTotalMatches:(NSMutableString*)totalmatches OutUpdateID:(NSMutableString*)updateid;
-(int)SearchWithContainerID:(NSString*)containerid SearchCriteria:(NSString*)searchcriteria Filter:(NSString*)filter StartingIndex:(NSString*)startingindex RequestedCount:(NSString*)requestedcount SortCriteria:(NSString*)sortcriteria OutResult:(NSMutableString*)result OutNumberReturned:(NSMutableString*)numberreturned OutTotalMatches:(NSMutableString*)totalmatches OutUpdateID:(NSMutableString*)updateid;
-(int)CreateObjectWithContainerID:(NSString*)containerid Elements:(NSString*)elements OutObjectID:(NSMutableString*)objectid OutResult:(NSMutableString*)result;
-(int)DestroyObjectWithObjectID:(NSString*)objectid;
-(int)UpdateObjectWithObjectID:(NSString*)objectid CurrentTagValue:(NSString*)currenttagvalue NewTagValue:(NSString*)newtagvalue;
-(int)ImportResourceWithSourceURI:(NSString*)sourceuri DestinationURI:(NSString*)destinationuri OutTransferID:(NSMutableString*)transferid;
-(int)ExportResourceWithSourceURI:(NSString*)sourceuri DestinationURI:(NSString*)destinationuri OutTransferID:(NSMutableString*)transferid;
-(int)StopTransferResourceWithTransferID:(NSString*)transferid;
-(int)GetTransferProgressWithTransferID:(NSString*)transferid OutTransferStatus:(NSMutableString*)transferstatus OutTransferLength:(NSMutableString*)transferlength OutTransferTotal:(NSMutableString*)transfertotal;
-(int)DeleteResourceWithResourceURI:(NSString*)resourceuri;
-(int)CreateReferenceWithContainerID:(NSString*)containerid ObjectID:(NSString*)objectid OutNewID:(NSMutableString*)newid;

@end
