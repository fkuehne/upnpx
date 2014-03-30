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



#import "SoapActionsWANDSLLinkConfig1.h"

#import "OrderedDictionary.h"

@implementation SoapActionsWANDSLLinkConfig1


-(int)SetDSLLinkTypeWithNewLinkType:(NSString*)newlinktype{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewLinkType", nil];
    parameterObjects = [NSArray arrayWithObjects:newlinktype, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetDSLLinkType" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetDSLLinkInfoWithOutNewLinkType:(NSMutableString*)newlinktype OutNewLinkStatus:(NSMutableString*)newlinkstatus{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewLinkType", @"NewLinkStatus", nil];
    outputObjects = [NSArray arrayWithObjects:newlinktype, newlinkstatus, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetDSLLinkInfo" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetAutoConfigWithOutNewAutoConfig:(NSMutableString*)newautoconfig{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewAutoConfig", nil];
    outputObjects = [NSArray arrayWithObjects:newautoconfig, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetAutoConfig" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetModulationTypeWithOutNewModulationType:(NSMutableString*)newmodulationtype{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewModulationType", nil];
    outputObjects = [NSArray arrayWithObjects:newmodulationtype, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetModulationType" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetDestinationAddressWithNewDestinationAddress:(NSString*)newdestinationaddress{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewDestinationAddress", nil];
    parameterObjects = [NSArray arrayWithObjects:newdestinationaddress, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetDestinationAddress" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetDestinationAddressWithOutNewDestinationAddress:(NSMutableString*)newdestinationaddress{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewDestinationAddress", nil];
    outputObjects = [NSArray arrayWithObjects:newdestinationaddress, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetDestinationAddress" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetATMEncapsulationWithNewATMEncapsulation:(NSString*)newatmencapsulation{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewATMEncapsulation", nil];
    parameterObjects = [NSArray arrayWithObjects:newatmencapsulation, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetATMEncapsulation" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetATMEncapsulationWithOutNewATMEncapsulation:(NSMutableString*)newatmencapsulation{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewATMEncapsulation", nil];
    outputObjects = [NSArray arrayWithObjects:newatmencapsulation, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetATMEncapsulation" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetFCSPreservedWithNewFCSPreserved:(NSString*)newfcspreserved{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewFCSPreserved", nil];
    parameterObjects = [NSArray arrayWithObjects:newfcspreserved, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetFCSPreserved" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetFCSPreservedWithOutNewFCSPreserved:(NSMutableString*)newfcspreserved{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewFCSPreserved", nil];
    outputObjects = [NSArray arrayWithObjects:newfcspreserved, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetFCSPreserved" parameters:parameters returnValues:output];
    return ret;
}



@end
