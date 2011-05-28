//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import "SoapActionsWANCableLinkConfig1.h"

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
