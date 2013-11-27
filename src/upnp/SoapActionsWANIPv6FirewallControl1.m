// **********************************************************************************
//
// BSD License.
// This file is part of upnpx.
//
// Copyright (c) 2010-2011, Bruno Keymolen, email: bruno.keymolen@gmail.com
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, 
// are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, 
// this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this 
// list of conditions and the following disclaimer in the documentation and/or other 
// materials provided with the distribution.
// Neither the name of "Bruno Keymolen" nor the names of its contributors may be 
// used to endorse or promote products derived from this software without specific 
// prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
// IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
// INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT 
// NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
// PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
// POSSIBILITY OF SUCH DAMAGE.
//
// **********************************************************************************



#import "SoapActionsWANIPv6FirewallControl1.h"

#import "OrderedDictionary.h"

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
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"IsWorking", nil];
    outputObjects = [NSArray arrayWithObjects:isworking, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"CheckPinholeWorking" parameters:parameters returnValues:output];
    return ret;
}



@end
