//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import "SoapActionsMediaManagement1.h"

#import "OrderedDictionary.h"

@implementation SoapActionsMediaManagement1


-(int)GetMediaCapabilitiesWithTSMediaCapabilityInfo:(NSString*)tsmediacapabilityinfo OutSupportedMediaCapabilityInfo:(NSMutableString*)supportedmediacapabilityinfo{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"TSMediaCapabilityInfo", nil];
    parameterObjects = [NSArray arrayWithObjects:tsmediacapabilityinfo, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"SupportedMediaCapabilityInfo", nil];
    outputObjects = [NSArray arrayWithObjects:supportedmediacapabilityinfo, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetMediaCapabilities" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetMediaSessionInfoWithTargetMediaSessionID:(NSString*)targetmediasessionid OutMediaSessionInfoList:(NSMutableString*)mediasessioninfolist{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"TargetMediaSessionID", nil];
    parameterObjects = [NSArray arrayWithObjects:targetmediasessionid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"MediaSessionInfoList", nil];
    outputObjects = [NSArray arrayWithObjects:mediasessioninfolist, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetMediaSessionInfo" parameters:parameters returnValues:output];
    return ret;
}


-(int)ModifyMediaSessionWithTargetMediaSessionID:(NSString*)targetmediasessionid NewMediaCapabilityInfo:(NSString*)newmediacapabilityinfo OutTCMediaCapabilityInfo:(NSMutableString*)tcmediacapabilityinfo{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"TargetMediaSessionID", @"NewMediaCapabilityInfo", nil];
    parameterObjects = [NSArray arrayWithObjects:targetmediasessionid, newmediacapabilityinfo, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"TCMediaCapabilityInfo", nil];
    outputObjects = [NSArray arrayWithObjects:tcmediacapabilityinfo, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"ModifyMediaSession" parameters:parameters returnValues:output];
    return ret;
}


-(int)StartMediaSessionWithTSMediaCapabilityInfo:(NSString*)tsmediacapabilityinfo OutMediaSessionID:(NSMutableString*)mediasessionid OutTCMediaCapabilityInfo:(NSMutableString*)tcmediacapabilityinfo{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"TSMediaCapabilityInfo", nil];
    parameterObjects = [NSArray arrayWithObjects:tsmediacapabilityinfo, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"MediaSessionID", @"TCMediaCapabilityInfo", nil];
    outputObjects = [NSArray arrayWithObjects:mediasessionid, tcmediacapabilityinfo, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"StartMediaSession" parameters:parameters returnValues:output];
    return ret;
}


-(int)StopMediaSessionWithTargetMediaSessionID:(NSString*)targetmediasessionid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"TargetMediaSessionID", nil];
    parameterObjects = [NSArray arrayWithObjects:targetmediasessionid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"StopMediaSession" parameters:parameters returnValues:output];
    return ret;
}



@end
