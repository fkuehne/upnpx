//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import "SoapActionsWANPOTSLinkConfig1.h"

@implementation SoapActionsWANPOTSLinkConfig1


-(int)SetISPInfoWithNewISPPhoneNumber:(NSString*)newispphonenumber NewISPInfo:(NSString*)newispinfo NewLinkType:(NSString*)newlinktype{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewISPPhoneNumber", @"NewISPInfo", @"NewLinkType", nil];
    parameterObjects = [NSArray arrayWithObjects:newispphonenumber, newispinfo, newlinktype, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
