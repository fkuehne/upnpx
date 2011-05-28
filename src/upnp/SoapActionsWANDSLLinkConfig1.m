//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import "SoapActionsWANDSLLinkConfig1.h"

@implementation SoapActionsWANDSLLinkConfig1


-(int)SetDSLLinkTypeWithNewLinkType:(NSString*)newlinktype{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewLinkType", nil];
    parameterObjects = [NSArray arrayWithObjects:newlinktype, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
