//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import "SoapActionsLayer3Forwarding1.h"

@implementation SoapActionsLayer3Forwarding1


-(int)SetDefaultConnectionServiceWithNewDefaultConnectionService:(NSString*)newdefaultconnectionservice{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewDefaultConnectionService", nil];
    parameterObjects = [NSArray arrayWithObjects:newdefaultconnectionservice, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetDefaultConnectionService" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetDefaultConnectionServiceWithOutNewDefaultConnectionService:(NSMutableString*)newdefaultconnectionservice{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewDefaultConnectionService", nil];
    outputObjects = [NSArray arrayWithObjects:newdefaultconnectionservice, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetDefaultConnectionService" parameters:parameters returnValues:output];
    return ret;
}



@end
