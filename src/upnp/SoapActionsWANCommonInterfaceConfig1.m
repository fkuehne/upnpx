//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import "SoapActionsWANCommonInterfaceConfig1.h"

#import "OrderedDictionary.h"

@implementation SoapActionsWANCommonInterfaceConfig1


-(int)SetEnabledForInternetWithNewEnabledForInternet:(NSString*)newenabledforinternet{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewEnabledForInternet", nil];
    parameterObjects = [NSArray arrayWithObjects:newenabledforinternet, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetEnabledForInternet" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetEnabledForInternetWithOutNewEnabledForInternet:(NSMutableString*)newenabledforinternet{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewEnabledForInternet", nil];
    outputObjects = [NSArray arrayWithObjects:newenabledforinternet, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetEnabledForInternet" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetCommonLinkPropertiesWithOutNewWANAccessType:(NSMutableString*)newwanaccesstype OutNewLayer1UpstreamMaxBitRate:(NSMutableString*)newlayer1upstreammaxbitrate OutNewLayer1DownstreamMaxBitRate:(NSMutableString*)newlayer1downstreammaxbitrate OutNewPhysicalLinkStatus:(NSMutableString*)newphysicallinkstatus{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewWANAccessType", @"NewLayer1UpstreamMaxBitRate", @"NewLayer1DownstreamMaxBitRate", @"NewPhysicalLinkStatus", nil];
    outputObjects = [NSArray arrayWithObjects:newwanaccesstype, newlayer1upstreammaxbitrate, newlayer1downstreammaxbitrate, newphysicallinkstatus, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetCommonLinkProperties" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetWANAccessProviderWithOutNewWANAccessProvider:(NSMutableString*)newwanaccessprovider{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewWANAccessProvider", nil];
    outputObjects = [NSArray arrayWithObjects:newwanaccessprovider, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetWANAccessProvider" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetMaximumActiveConnectionsWithOutNewMaximumActiveConnections:(NSMutableString*)newmaximumactiveconnections{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewMaximumActiveConnections", nil];
    outputObjects = [NSArray arrayWithObjects:newmaximumactiveconnections, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetMaximumActiveConnections" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetTotalBytesSentWithOutNewTotalBytesSent:(NSMutableString*)newtotalbytessent{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewTotalBytesSent", nil];
    outputObjects = [NSArray arrayWithObjects:newtotalbytessent, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetTotalBytesSent" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetTotalBytesReceivedWithOutNewTotalBytesReceived:(NSMutableString*)newtotalbytesreceived{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewTotalBytesReceived", nil];
    outputObjects = [NSArray arrayWithObjects:newtotalbytesreceived, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetTotalBytesReceived" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetTotalPacketsSentWithOutNewTotalPacketsSent:(NSMutableString*)newtotalpacketssent{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewTotalPacketsSent", nil];
    outputObjects = [NSArray arrayWithObjects:newtotalpacketssent, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetTotalPacketsSent" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetTotalPacketsReceivedWithOutNewTotalPacketsReceived:(NSMutableString*)newtotalpacketsreceived{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewTotalPacketsReceived", nil];
    outputObjects = [NSArray arrayWithObjects:newtotalpacketsreceived, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetTotalPacketsReceived" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetActiveConnectionWithNewActiveConnectionIndex:(NSString*)newactiveconnectionindex OutNewActiveConnDeviceContainer:(NSMutableString*)newactiveconndevicecontainer OutNewActiveConnectionServiceID:(NSMutableString*)newactiveconnectionserviceid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewActiveConnectionIndex", nil];
    parameterObjects = [NSArray arrayWithObjects:newactiveconnectionindex, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewActiveConnDeviceContainer", @"NewActiveConnectionServiceID", nil];
    outputObjects = [NSArray arrayWithObjects:newactiveconndevicecontainer, newactiveconnectionserviceid, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetActiveConnection" parameters:parameters returnValues:output];
    return ret;
}



@end
