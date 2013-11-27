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



#import "SoapActionsLANHostConfigManagement1.h"

#import "OrderedDictionary.h"

@implementation SoapActionsLANHostConfigManagement1


-(int)SetDHCPServerConfigurableWithNewDHCPServerConfigurable:(NSString*)newdhcpserverconfigurable{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewDHCPServerConfigurable", nil];
    parameterObjects = [NSArray arrayWithObjects:newdhcpserverconfigurable, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetDHCPServerConfigurable" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetDHCPServerConfigurableWithOutNewDHCPServerConfigurable:(NSMutableString*)newdhcpserverconfigurable{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewDHCPServerConfigurable", nil];
    outputObjects = [NSArray arrayWithObjects:newdhcpserverconfigurable, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetDHCPServerConfigurable" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetDHCPRelayWithNewDHCPRelay:(NSString*)newdhcprelay{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewDHCPRelay", nil];
    parameterObjects = [NSArray arrayWithObjects:newdhcprelay, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetDHCPRelay" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetDHCPRelayWithOutNewDHCPRelay:(NSMutableString*)newdhcprelay{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewDHCPRelay", nil];
    outputObjects = [NSArray arrayWithObjects:newdhcprelay, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetDHCPRelay" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetSubnetMaskWithNewSubnetMask:(NSString*)newsubnetmask{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewSubnetMask", nil];
    parameterObjects = [NSArray arrayWithObjects:newsubnetmask, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetSubnetMask" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetSubnetMaskWithOutNewSubnetMask:(NSMutableString*)newsubnetmask{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewSubnetMask", nil];
    outputObjects = [NSArray arrayWithObjects:newsubnetmask, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetSubnetMask" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetIPRouterWithNewIPRouters:(NSString*)newiprouters{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewIPRouters", nil];
    parameterObjects = [NSArray arrayWithObjects:newiprouters, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetIPRouter" parameters:parameters returnValues:output];
    return ret;
}


-(int)DeleteIPRouterWithNewIPRouters:(NSString*)newiprouters{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewIPRouters", nil];
    parameterObjects = [NSArray arrayWithObjects:newiprouters, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"DeleteIPRouter" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetIPRoutersListWithOutNewIPRouters:(NSMutableString*)newiprouters{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewIPRouters", nil];
    outputObjects = [NSArray arrayWithObjects:newiprouters, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetIPRoutersList" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetDomainNameWithNewDomainName:(NSString*)newdomainname{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewDomainName", nil];
    parameterObjects = [NSArray arrayWithObjects:newdomainname, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetDomainName" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetDomainNameWithOutNewDomainName:(NSMutableString*)newdomainname{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewDomainName", nil];
    outputObjects = [NSArray arrayWithObjects:newdomainname, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetDomainName" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetAddressRangeWithNewMinAddress:(NSString*)newminaddress NewMaxAddress:(NSString*)newmaxaddress{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewMinAddress", @"NewMaxAddress", nil];
    parameterObjects = [NSArray arrayWithObjects:newminaddress, newmaxaddress, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetAddressRange" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetAddressRangeWithOutNewMinAddress:(NSMutableString*)newminaddress OutNewMaxAddress:(NSMutableString*)newmaxaddress{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewMinAddress", @"NewMaxAddress", nil];
    outputObjects = [NSArray arrayWithObjects:newminaddress, newmaxaddress, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetAddressRange" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetReservedAddressWithNewReservedAddresses:(NSString*)newreservedaddresses{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewReservedAddresses", nil];
    parameterObjects = [NSArray arrayWithObjects:newreservedaddresses, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetReservedAddress" parameters:parameters returnValues:output];
    return ret;
}


-(int)DeleteReservedAddressWithNewReservedAddresses:(NSString*)newreservedaddresses{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewReservedAddresses", nil];
    parameterObjects = [NSArray arrayWithObjects:newreservedaddresses, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"DeleteReservedAddress" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetReservedAddressesWithOutNewReservedAddresses:(NSMutableString*)newreservedaddresses{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewReservedAddresses", nil];
    outputObjects = [NSArray arrayWithObjects:newreservedaddresses, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetReservedAddresses" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetDNSServerWithNewDNSServers:(NSString*)newdnsservers{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewDNSServers", nil];
    parameterObjects = [NSArray arrayWithObjects:newdnsservers, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetDNSServer" parameters:parameters returnValues:output];
    return ret;
}


-(int)DeleteDNSServerWithNewDNSServers:(NSString*)newdnsservers{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewDNSServers", nil];
    parameterObjects = [NSArray arrayWithObjects:newdnsservers, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"DeleteDNSServer" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetDNSServersWithOutNewDNSServers:(NSMutableString*)newdnsservers{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewDNSServers", nil];
    outputObjects = [NSArray arrayWithObjects:newdnsservers, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetDNSServers" parameters:parameters returnValues:output];
    return ret;
}



@end
