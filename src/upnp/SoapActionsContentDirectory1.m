// ******************************************************************
//
// MIT License.
// This file is part of upnpx.
//
// Copyright (c) 2010, 2011 Bruno Keymolen, email: bruno.keymolen@gmail.com
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
// ******************************************************************

#import "SoapActionsContentDirectory1.h"
#import "OrderedDictionary.h"

@implementation SoapActionsContentDirectory1


-(id)retain{
    return [super retain];
}
-(id)autorelease{
    return [super autorelease];
}


-(int)GetSearchCapabilitiesWithOutSearchCaps:(NSMutableString*)searchcaps{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"SearchCaps", nil];
    outputObjects = [NSArray arrayWithObjects:searchcaps, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetSearchCapabilities" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetSortCapabilitiesWithOutSortCaps:(NSMutableString*)sortcaps{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"SortCaps", nil];
    outputObjects = [NSArray arrayWithObjects:sortcaps, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetSortCapabilities" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetSystemUpdateIDWithOutId:(NSMutableString*)id{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"Id", nil];
    outputObjects = [NSArray arrayWithObjects:id, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetSystemUpdateID" parameters:parameters returnValues:output];
    return ret;
}


-(int)BrowseWithObjectID:(NSString*)objectid BrowseFlag:(NSString*)browseflag Filter:(NSString*)filter StartingIndex:(NSString*)startingindex RequestedCount:(NSString*)requestedcount SortCriteria:(NSString*)sortcriteria OutResult:(NSMutableString*)result OutNumberReturned:(NSMutableString*)numberreturned OutTotalMatches:(NSMutableString*)totalmatches OutUpdateID:(NSMutableString*)updateid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"ObjectID", @"BrowseFlag", @"Filter", @"StartingIndex", @"RequestedCount", @"SortCriteria", nil];
    parameterObjects = [NSArray arrayWithObjects:objectid, browseflag, filter, startingindex, requestedcount, sortcriteria, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"Result", @"NumberReturned", @"TotalMatches", @"UpdateID", nil];
    outputObjects = [NSArray arrayWithObjects:result, numberreturned, totalmatches, updateid, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"Browse" parameters:parameters returnValues:output];
    return ret;
}


-(int)SearchWithContainerID:(NSString*)containerid SearchCriteria:(NSString*)searchcriteria Filter:(NSString*)filter StartingIndex:(NSString*)startingindex RequestedCount:(NSString*)requestedcount SortCriteria:(NSString*)sortcriteria OutResult:(NSMutableString*)result OutNumberReturned:(NSMutableString*)numberreturned OutTotalMatches:(NSMutableString*)totalmatches OutUpdateID:(NSMutableString*)updateid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"ContainerID", @"SearchCriteria", @"Filter", @"StartingIndex", @"RequestedCount", @"SortCriteria", nil];
    parameterObjects = [NSArray arrayWithObjects:containerid, searchcriteria, filter, startingindex, requestedcount, sortcriteria, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"Result", @"NumberReturned", @"TotalMatches", @"UpdateID", nil];
    outputObjects = [NSArray arrayWithObjects:result, numberreturned, totalmatches, updateid, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"Search" parameters:parameters returnValues:output];
    return ret;
}


-(int)CreateObjectWithContainerID:(NSString*)containerid Elements:(NSString*)elements OutObjectID:(NSMutableString*)objectid OutResult:(NSMutableString*)result{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"ContainerID", @"Elements", nil];
    parameterObjects = [NSArray arrayWithObjects:containerid, elements, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"ObjectID", @"Result", nil];
    outputObjects = [NSArray arrayWithObjects:objectid, result, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"CreateObject" parameters:parameters returnValues:output];
    return ret;
}


-(int)DestroyObjectWithObjectID:(NSString*)objectid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"ObjectID", nil];
    parameterObjects = [NSArray arrayWithObjects:objectid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"DestroyObject" parameters:parameters returnValues:output];
    return ret;
}


-(int)UpdateObjectWithObjectID:(NSString*)objectid CurrentTagValue:(NSString*)currenttagvalue NewTagValue:(NSString*)newtagvalue{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"ObjectID", @"CurrentTagValue", @"NewTagValue", nil];
    parameterObjects = [NSArray arrayWithObjects:objectid, currenttagvalue, newtagvalue, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"UpdateObject" parameters:parameters returnValues:output];
    return ret;
}


-(int)ImportResourceWithSourceURI:(NSString*)sourceuri DestinationURI:(NSString*)destinationuri OutTransferID:(NSMutableString*)transferid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"SourceURI", @"DestinationURI", nil];
    parameterObjects = [NSArray arrayWithObjects:sourceuri, destinationuri, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"TransferID", nil];
    outputObjects = [NSArray arrayWithObjects:transferid, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"ImportResource" parameters:parameters returnValues:output];
    return ret;
}


-(int)ExportResourceWithSourceURI:(NSString*)sourceuri DestinationURI:(NSString*)destinationuri OutTransferID:(NSMutableString*)transferid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"SourceURI", @"DestinationURI", nil];
    parameterObjects = [NSArray arrayWithObjects:sourceuri, destinationuri, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"TransferID", nil];
    outputObjects = [NSArray arrayWithObjects:transferid, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"ExportResource" parameters:parameters returnValues:output];
    return ret;
}


-(int)StopTransferResourceWithTransferID:(NSString*)transferid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"TransferID", nil];
    parameterObjects = [NSArray arrayWithObjects:transferid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"StopTransferResource" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetTransferProgressWithTransferID:(NSString*)transferid OutTransferStatus:(NSMutableString*)transferstatus OutTransferLength:(NSMutableString*)transferlength OutTransferTotal:(NSMutableString*)transfertotal{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"TransferID", nil];
    parameterObjects = [NSArray arrayWithObjects:transferid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"TransferStatus", @"TransferLength", @"TransferTotal", nil];
    outputObjects = [NSArray arrayWithObjects:transferstatus, transferlength, transfertotal, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetTransferProgress" parameters:parameters returnValues:output];
    return ret;
}


-(int)DeleteResourceWithResourceURI:(NSString*)resourceuri{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"ResourceURI", nil];
    parameterObjects = [NSArray arrayWithObjects:resourceuri, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"DeleteResource" parameters:parameters returnValues:output];
    return ret;
}


-(int)CreateReferenceWithContainerID:(NSString*)containerid ObjectID:(NSString*)objectid OutNewID:(NSMutableString*)newid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"ContainerID", @"ObjectID", nil];
    parameterObjects = [NSArray arrayWithObjects:containerid, objectid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewID", nil];
    outputObjects = [NSArray arrayWithObjects:newid, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"CreateReference" parameters:parameters returnValues:output];
    return ret;
}



@end
