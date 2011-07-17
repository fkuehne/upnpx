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



#import "SoapActionsWANPOTSLinkConfig1.h"

#import "OrderedDictionary.h"

@implementation SoapActionsWANPOTSLinkConfig1


-(int)SetISPInfoWithNewISPPhoneNumber:(NSString*)newispphonenumber NewISPInfo:(NSString*)newispinfo NewLinkType:(NSString*)newlinktype{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewISPPhoneNumber", @"NewISPInfo", @"NewLinkType", nil];
    parameterObjects = [NSArray arrayWithObjects:newispphonenumber, newispinfo, newlinktype, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetISPInfo" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetCallRetryInfoWithNewNumberOfRetries:(NSString*)newnumberofretries NewDelayBetweenRetries:(NSString*)newdelaybetweenretries{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewNumberOfRetries", @"NewDelayBetweenRetries", nil];
    parameterObjects = [NSArray arrayWithObjects:newnumberofretries, newdelaybetweenretries, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetCallRetryInfo" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetISPInfoWithOutNewISPPhoneNumber:(NSMutableString*)newispphonenumber OutNewISPInfo:(NSMutableString*)newispinfo OutNewLinkType:(NSMutableString*)newlinktype{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewISPPhoneNumber", @"NewISPInfo", @"NewLinkType", nil];
    outputObjects = [NSArray arrayWithObjects:newispphonenumber, newispinfo, newlinktype, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetISPInfo" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetCallRetryInfoWithOutNewNumberOfRetries:(NSMutableString*)newnumberofretries OutNewDelayBetweenRetries:(NSMutableString*)newdelaybetweenretries{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewNumberOfRetries", @"NewDelayBetweenRetries", nil];
    outputObjects = [NSArray arrayWithObjects:newnumberofretries, newdelaybetweenretries, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetCallRetryInfo" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetFclassWithOutNewFclass:(NSMutableString*)newfclass{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewFclass", nil];
    outputObjects = [NSArray arrayWithObjects:newfclass, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetFclass" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetDataModulationSupportedWithOutNewDataModulationSupported:(NSMutableString*)newdatamodulationsupported{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewDataModulationSupported", nil];
    outputObjects = [NSArray arrayWithObjects:newdatamodulationsupported, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetDataModulationSupported" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetDataProtocolWithOutNewDataProtocol:(NSMutableString*)newdataprotocol{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewDataProtocol", nil];
    outputObjects = [NSArray arrayWithObjects:newdataprotocol, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetDataProtocol" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetDataCompressionWithOutNewDataCompression:(NSMutableString*)newdatacompression{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewDataCompression", nil];
    outputObjects = [NSArray arrayWithObjects:newdatacompression, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetDataCompression" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetPlusVTRCommandSupportedWithOutNewPlusVTRCommandSupported:(NSMutableString*)newplusvtrcommandsupported{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewPlusVTRCommandSupported", nil];
    outputObjects = [NSArray arrayWithObjects:newplusvtrcommandsupported, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetPlusVTRCommandSupported" parameters:parameters returnValues:output];
    return ret;
}



@end
