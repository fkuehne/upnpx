//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import "SoapActionsWANIPv6FirewallControl1.h"

@implementation SoapActionsWANIPv6FirewallControl1


-(int)GetFirewallStatusWithOutFirewallEnabled:(NSMutableString*)firewallenabled OutInboundPinholeAllowed:(NSMutableString*)inboundpinholeallowed{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"FirewallEnabled", @"InboundPinholeAllowed", nil];
    outputObjects = [NSArray arrayWithObjects:firewallenabled, inboundpinholeallowed, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetFirewallStatus" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetOutboundPinholeTimeoutWithRemoteHost:(NSString*)remotehost RemotePort:(NSString*)remoteport InternalClient:(NSString*)internalclient InternalPort:(NSString*)internalport Protocol:(NSString*)protocol OutOutboundPinholeTimeout:(NSMutableString*)outboundpinholetimeout{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"RemoteHost", @"RemotePort", @"InternalClient", @"InternalPort", @"Protocol", nil];
    parameterObjects = [NSArray arrayWithObjects:remotehost, remoteport, internalclient, internalport, protocol, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"OutboundPinholeTimeout", nil];
    outputObjects = [NSArray arrayWithObjects:outboundpinholetimeout, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetOutboundPinholeTimeout" parameters:parameters returnValues:output];
    return ret;
}


-(int)AddPinholeWithRemoteHost:(NSString*)remotehost RemotePort:(NSString*)remoteport InternalClient:(NSString*)internalclient InternalPort:(NSString*)internalport Protocol:(NSString*)protocol LeaseTime:(NSString*)leasetime OutUniqueID:(NSMutableString*)uniqueid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"RemoteHost", @"RemotePort", @"InternalClient", @"InternalPort", @"Protocol", @"LeaseTime", nil];
    parameterObjects = [NSArray arrayWithObjects:remotehost, remoteport, internalclient, internalport, protocol, leasetime, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"UniqueID", nil];
    outputObjects = [NSArray arrayWithObjects:uniqueid, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"AddPinhole" parameters:parameters returnValues:output];
    return ret;
}


-(int)UpdatePinholeWithUniqueID:(NSString*)uniqueid NewLeaseTime:(NSString*)newleasetime{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"UniqueID", @"NewLeaseTime", nil];
    parameterObjects = [NSArray arrayWithObjects:uniqueid, newleasetime, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"UpdatePinhole" parameters:parameters returnValues:output];
    return ret;
}


-(int)DeletePinholeWithUniqueID:(NSString*)uniqueid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"UniqueID", nil];
    parameterObjects = [NSArray arrayWithObjects:uniqueid, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"DeletePinhole" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetPinholePacketsWithUniqueID:(NSString*)uniqueid OutPinholePackets:(NSMutableString*)pinholepackets{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"UniqueID", nil];
    parameterObjects = [NSArray arrayWithObjects:uniqueid, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"PinholePackets", nil];
    outputObjects = [NSArray arrayWithObjects:pinholepackets, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetPinholePackets" parameters:parameters returnValues:output];
    return ret;
}


-(int)CheckPinholeWorkingWithUniqueID:(NSString*)uniqueid OutIsWorking:(NSMutableString*)isworking{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"UniqueID", nil];
    parameterObjects = [NSArray arrayWithObjects:uniqueid, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"IsWorking", nil];
    outputObjects = [NSArray arrayWithObjects:isworking, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"CheckPinholeWorking" parameters:parameters returnValues:output];
    return ret;
}



@end
