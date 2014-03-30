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
    parameterKeys = @[@"NewEnabledForInternet"];
    parameterObjects = @[newenabledforinternet];
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
    outputKeys = @[@"NewEnabledForInternet"];
    outputObjects = @[newenabledforinternet];
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
    outputKeys = @[@"NewWANAccessType", @"NewLayer1UpstreamMaxBitRate", @"NewLayer1DownstreamMaxBitRate", @"NewPhysicalLinkStatus"];
    outputObjects = @[newwanaccesstype, newlayer1upstreammaxbitrate, newlayer1downstreammaxbitrate, newphysicallinkstatus];
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
    outputKeys = @[@"NewWANAccessProvider"];
    outputObjects = @[newwanaccessprovider];
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
    outputKeys = @[@"NewMaximumActiveConnections"];
    outputObjects = @[newmaximumactiveconnections];
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
    outputKeys = @[@"NewTotalBytesSent"];
    outputObjects = @[newtotalbytessent];
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
    outputKeys = @[@"NewTotalBytesReceived"];
    outputObjects = @[newtotalbytesreceived];
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
    outputKeys = @[@"NewTotalPacketsSent"];
    outputObjects = @[newtotalpacketssent];
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
    outputKeys = @[@"NewTotalPacketsReceived"];
    outputObjects = @[newtotalpacketsreceived];
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
    parameterKeys = @[@"NewActiveConnectionIndex"];
    parameterObjects = @[newactiveconnectionindex];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"NewActiveConnDeviceContainer", @"NewActiveConnectionServiceID"];
    outputObjects = @[newactiveconndevicecontainer, newactiveconnectionserviceid];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetActiveConnection" parameters:parameters returnValues:output];
    return ret;
}



@end
