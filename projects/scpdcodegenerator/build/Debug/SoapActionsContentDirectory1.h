//Auto Generated file.
//Copyright 2010 Bruno Keymolen, Arcanegra BVBA. All rights reserved.

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
