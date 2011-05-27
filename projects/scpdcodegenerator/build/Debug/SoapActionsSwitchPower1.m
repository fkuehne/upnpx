//Auto Generated file.
//Copyright 2010 Bruno Keymolen, Arcanegra BVBA. All rights reserved.

#import "SoapActionsSwitchPower1.h"

@implementation SoapActionsSwitchPower1


-(int)SetTargetWithnewTargetValue:(NSString*)newtargetvalue{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"newTargetValue", nil];
    parameterObjects = [NSArray arrayWithObjects:newtargetvalue, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetTarget" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetTargetWithOutRetTargetValue:(NSMutableString*)rettargetvalue{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetTargetValue", nil];
    outputObjects = [NSArray arrayWithObjects:rettargetvalue, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetTarget" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetStatusWithOutResultStatus:(NSMutableString*)resultstatus{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"ResultStatus", nil];
    outputObjects = [NSArray arrayWithObjects:resultstatus, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetStatus" parameters:parameters returnValues:output];
    return ret;
}



@end
