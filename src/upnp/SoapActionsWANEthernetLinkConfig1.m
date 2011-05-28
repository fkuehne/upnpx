//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import "SoapActionsWANEthernetLinkConfig1.h"

@implementation SoapActionsWANEthernetLinkConfig1


-(int)GetEthernetLinkStatusWithOutNewEthernetLinkStatus:(NSMutableString*)newethernetlinkstatus{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewEthernetLinkStatus", nil];
    outputObjects = [NSArray arrayWithObjects:newethernetlinkstatus, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetEthernetLinkStatus" parameters:parameters returnValues:output];
    return ret;
}



@end
