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



#import "SoapActionsWANCableLinkConfig1.h"

#import "OrderedDictionary.h"

@implementation SoapActionsWANCableLinkConfig1


-(int)GetCableLinkConfigInfoWithOutNewCableLinkConfigState:(NSMutableString*)newcablelinkconfigstate OutNewLinkType:(NSMutableString*)newlinktype{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewCableLinkConfigState", @"NewLinkType", nil];
    outputObjects = [NSArray arrayWithObjects:newcablelinkconfigstate, newlinktype, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetCableLinkConfigInfo" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetDownstreamFrequencyWithOutNewDownstreamFrequency:(NSMutableString*)newdownstreamfrequency{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewDownstreamFrequency", nil];
    outputObjects = [NSArray arrayWithObjects:newdownstreamfrequency, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetDownstreamFrequency" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetDownstreamModulationWithOutNewDownstreamModulation:(NSMutableString*)newdownstreammodulation{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewDownstreamModulation", nil];
    outputObjects = [NSArray arrayWithObjects:newdownstreammodulation, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetDownstreamModulation" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetUpstreamFrequencyWithOutNewUpstreamFrequency:(NSMutableString*)newupstreamfrequency{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewUpstreamFrequency", nil];
    outputObjects = [NSArray arrayWithObjects:newupstreamfrequency, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetUpstreamFrequency" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetUpstreamModulationWithOutNewUpstreamModulation:(NSMutableString*)newupstreammodulation{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewUpstreamModulation", nil];
    outputObjects = [NSArray arrayWithObjects:newupstreammodulation, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetUpstreamModulation" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetUpstreamChannelIDWithOutNewUpstreamChannelID:(NSMutableString*)newupstreamchannelid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewUpstreamChannelID", nil];
    outputObjects = [NSArray arrayWithObjects:newupstreamchannelid, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetUpstreamChannelID" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetUpstreamPowerLevelWithOutNewUpstreamPowerLevel:(NSMutableString*)newupstreampowerlevel{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewUpstreamPowerLevel", nil];
    outputObjects = [NSArray arrayWithObjects:newupstreampowerlevel, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetUpstreamPowerLevel" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetBPIEncryptionEnabledWithOutNewBPIEncryptionEnabled:(NSMutableString*)newbpiencryptionenabled{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewBPIEncryptionEnabled", nil];
    outputObjects = [NSArray arrayWithObjects:newbpiencryptionenabled, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetBPIEncryptionEnabled" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetConfigFileWithOutNewConfigFile:(NSMutableString*)newconfigfile{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewConfigFile", nil];
    outputObjects = [NSArray arrayWithObjects:newconfigfile, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetConfigFile" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetTFTPServerWithOutNewTFTPServer:(NSMutableString*)newtftpserver{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewTFTPServer", nil];
    outputObjects = [NSArray arrayWithObjects:newtftpserver, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetTFTPServer" parameters:parameters returnValues:output];
    return ret;
}



@end
