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



#import "SoapActionsWANIPConnection2.h"

#import "OrderedDictionary.h"

@implementation SoapActionsWANIPConnection2


-(int)SetConnectionTypeWithNewConnectionType:(NSString*)newconnectiontype{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewConnectionType", nil];
    parameterObjects = [NSArray arrayWithObjects:newconnectiontype, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetConnectionType" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetConnectionTypeInfoWithOutNewConnectionType:(NSMutableString*)newconnectiontype OutNewPossibleConnectionTypes:(NSMutableString*)newpossibleconnectiontypes{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewConnectionType", @"NewPossibleConnectionTypes", nil];
    outputObjects = [NSArray arrayWithObjects:newconnectiontype, newpossibleconnectiontypes, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetConnectionTypeInfo" parameters:parameters returnValues:output];
    return ret;
}


-(int)RequestConnection{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    ret = [self action:@"RequestConnection" parameters:parameters returnValues:output];
    return ret;
}


-(int)RequestTermination{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    ret = [self action:@"RequestTermination" parameters:parameters returnValues:output];
    return ret;
}


-(int)ForceTermination{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    ret = [self action:@"ForceTermination" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetAutoDisconnectTimeWithNewAutoDisconnectTime:(NSString*)newautodisconnecttime{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewAutoDisconnectTime", nil];
    parameterObjects = [NSArray arrayWithObjects:newautodisconnecttime, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetAutoDisconnectTime" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetIdleDisconnectTimeWithNewIdleDisconnectTime:(NSString*)newidledisconnecttime{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewIdleDisconnectTime", nil];
    parameterObjects = [NSArray arrayWithObjects:newidledisconnecttime, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetIdleDisconnectTime" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetWarnDisconnectDelayWithNewWarnDisconnectDelay:(NSString*)newwarndisconnectdelay{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewWarnDisconnectDelay", nil];
    parameterObjects = [NSArray arrayWithObjects:newwarndisconnectdelay, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetWarnDisconnectDelay" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetStatusInfoWithOutNewConnectionStatus:(NSMutableString*)newconnectionstatus OutNewLastConnectionError:(NSMutableString*)newlastconnectionerror OutNewUptime:(NSMutableString*)newuptime{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewConnectionStatus", @"NewLastConnectionError", @"NewUptime", nil];
    outputObjects = [NSArray arrayWithObjects:newconnectionstatus, newlastconnectionerror, newuptime, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetStatusInfo" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetAutoDisconnectTimeWithOutNewAutoDisconnectTime:(NSMutableString*)newautodisconnecttime{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewAutoDisconnectTime", nil];
    outputObjects = [NSArray arrayWithObjects:newautodisconnecttime, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetAutoDisconnectTime" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetIdleDisconnectTimeWithOutNewIdleDisconnectTime:(NSMutableString*)newidledisconnecttime{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewIdleDisconnectTime", nil];
    outputObjects = [NSArray arrayWithObjects:newidledisconnecttime, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetIdleDisconnectTime" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetWarnDisconnectDelayWithOutNewWarnDisconnectDelay:(NSMutableString*)newwarndisconnectdelay{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewWarnDisconnectDelay", nil];
    outputObjects = [NSArray arrayWithObjects:newwarndisconnectdelay, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetWarnDisconnectDelay" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetNATRSIPStatusWithOutNewRSIPAvailable:(NSMutableString*)newrsipavailable OutNewNATEnabled:(NSMutableString*)newnatenabled{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewRSIPAvailable", @"NewNATEnabled", nil];
    outputObjects = [NSArray arrayWithObjects:newrsipavailable, newnatenabled, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetNATRSIPStatus" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetGenericPortMappingEntryWithNewPortMappingIndex:(NSString*)newportmappingindex OutNewRemoteHost:(NSMutableString*)newremotehost OutNewExternalPort:(NSMutableString*)newexternalport OutNewProtocol:(NSMutableString*)newprotocol OutNewInternalPort:(NSMutableString*)newinternalport OutNewInternalClient:(NSMutableString*)newinternalclient OutNewEnabled:(NSMutableString*)newenabled OutNewPortMappingDescription:(NSMutableString*)newportmappingdescription OutNewLeaseDuration:(NSMutableString*)newleaseduration{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewPortMappingIndex", nil];
    parameterObjects = [NSArray arrayWithObjects:newportmappingindex, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewRemoteHost", @"NewExternalPort", @"NewProtocol", @"NewInternalPort", @"NewInternalClient", @"NewEnabled", @"NewPortMappingDescription", @"NewLeaseDuration", nil];
    outputObjects = [NSArray arrayWithObjects:newremotehost, newexternalport, newprotocol, newinternalport, newinternalclient, newenabled, newportmappingdescription, newleaseduration, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetGenericPortMappingEntry" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetSpecificPortMappingEntryWithNewRemoteHost:(NSString*)newremotehost NewExternalPort:(NSString*)newexternalport NewProtocol:(NSString*)newprotocol OutNewInternalPort:(NSMutableString*)newinternalport OutNewInternalClient:(NSMutableString*)newinternalclient OutNewEnabled:(NSMutableString*)newenabled OutNewPortMappingDescription:(NSMutableString*)newportmappingdescription OutNewLeaseDuration:(NSMutableString*)newleaseduration{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewRemoteHost", @"NewExternalPort", @"NewProtocol", nil];
    parameterObjects = [NSArray arrayWithObjects:newremotehost, newexternalport, newprotocol, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewInternalPort", @"NewInternalClient", @"NewEnabled", @"NewPortMappingDescription", @"NewLeaseDuration", nil];
    outputObjects = [NSArray arrayWithObjects:newinternalport, newinternalclient, newenabled, newportmappingdescription, newleaseduration, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetSpecificPortMappingEntry" parameters:parameters returnValues:output];
    return ret;
}


-(int)AddPortMappingWithNewRemoteHost:(NSString*)newremotehost NewExternalPort:(NSString*)newexternalport NewProtocol:(NSString*)newprotocol NewInternalPort:(NSString*)newinternalport NewInternalClient:(NSString*)newinternalclient NewEnabled:(NSString*)newenabled NewPortMappingDescription:(NSString*)newportmappingdescription NewLeaseDuration:(NSString*)newleaseduration{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewRemoteHost", @"NewExternalPort", @"NewProtocol", @"NewInternalPort", @"NewInternalClient", @"NewEnabled", @"NewPortMappingDescription", @"NewLeaseDuration", nil];
    parameterObjects = [NSArray arrayWithObjects:newremotehost, newexternalport, newprotocol, newinternalport, newinternalclient, newenabled, newportmappingdescription, newleaseduration, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"AddPortMapping" parameters:parameters returnValues:output];
    return ret;
}


-(int)DeletePortMappingWithNewRemoteHost:(NSString*)newremotehost NewExternalPort:(NSString*)newexternalport NewProtocol:(NSString*)newprotocol{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewRemoteHost", @"NewExternalPort", @"NewProtocol", nil];
    parameterObjects = [NSArray arrayWithObjects:newremotehost, newexternalport, newprotocol, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"DeletePortMapping" parameters:parameters returnValues:output];
    return ret;
}


-(int)DeletePortMappingRangeWithNewStartPort:(NSString*)newstartport NewEndPort:(NSString*)newendport NewProtocol:(NSString*)newprotocol NewManage:(NSString*)newmanage{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewStartPort", @"NewEndPort", @"NewProtocol", @"NewManage", nil];
    parameterObjects = [NSArray arrayWithObjects:newstartport, newendport, newprotocol, newmanage, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"DeletePortMappingRange" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetExternalIPAddressWithOutNewExternalIPAddress:(NSMutableString*)newexternalipaddress{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewExternalIPAddress", nil];
    outputObjects = [NSArray arrayWithObjects:newexternalipaddress, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetExternalIPAddress" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetListOfPortMappingsWithNewStartPort:(NSString*)newstartport NewEndPort:(NSString*)newendport NewProtocol:(NSString*)newprotocol NewManage:(NSString*)newmanage NewNumberOfPorts:(NSString*)newnumberofports OutNewPortListing:(NSMutableString*)newportlisting{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewStartPort", @"NewEndPort", @"NewProtocol", @"NewManage", @"NewNumberOfPorts", nil];
    parameterObjects = [NSArray arrayWithObjects:newstartport, newendport, newprotocol, newmanage, newnumberofports, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewPortListing", nil];
    outputObjects = [NSArray arrayWithObjects:newportlisting, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetListOfPortMappings" parameters:parameters returnValues:output];
    return ret;
}


-(int)AddAnyPortMappingWithNewRemoteHost:(NSString*)newremotehost NewExternalPort:(NSString*)newexternalport NewProtocol:(NSString*)newprotocol NewInternalPort:(NSString*)newinternalport NewInternalClient:(NSString*)newinternalclient NewEnabled:(NSString*)newenabled NewPortMappingDescription:(NSString*)newportmappingdescription NewLeaseDuration:(NSString*)newleaseduration OutNewReservedPort:(NSMutableString*)newreservedport{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewRemoteHost", @"NewExternalPort", @"NewProtocol", @"NewInternalPort", @"NewInternalClient", @"NewEnabled", @"NewPortMappingDescription", @"NewLeaseDuration", nil];
    parameterObjects = [NSArray arrayWithObjects:newremotehost, newexternalport, newprotocol, newinternalport, newinternalclient, newenabled, newportmappingdescription, newleaseduration, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewReservedPort", nil];
    outputObjects = [NSArray arrayWithObjects:newreservedport, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"AddAnyPortMapping" parameters:parameters returnValues:output];
    return ret;
}



@end
