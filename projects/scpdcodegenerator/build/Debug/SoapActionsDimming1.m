//Auto Generated file.
//Copyright 2010 Bruno Keymolen, Arcanegra BVBA. All rights reserved.

#import "SoapActionsDimming1.h"

@implementation SoapActionsDimming1


-(int)SetLoadLevelTargetWithnewLoadlevelTarget:(NSString*)newloadleveltarget{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"newLoadlevelTarget", nil];
    parameterObjects = [NSArray arrayWithObjects:newloadleveltarget, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetLoadLevelTarget" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetLoadLevelTargetWithOutGetLoadlevelTarget:(NSMutableString*)getloadleveltarget{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"GetLoadlevelTarget", nil];
    outputObjects = [NSArray arrayWithObjects:getloadleveltarget, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetLoadLevelTarget" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetLoadLevelStatusWithOutretLoadlevelStatus:(NSMutableString*)retloadlevelstatus{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"retLoadlevelStatus", nil];
    outputObjects = [NSArray arrayWithObjects:retloadlevelstatus, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetLoadLevelStatus" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetOnEffectLevelWithnewOnEffectLevel:(NSString*)newoneffectlevel{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"newOnEffectLevel", nil];
    parameterObjects = [NSArray arrayWithObjects:newoneffectlevel, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetOnEffectLevel" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetOnEffectWithnewOnEffect:(NSString*)newoneffect{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"newOnEffect", nil];
    parameterObjects = [NSArray arrayWithObjects:newoneffect, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetOnEffect" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetOnEffectParametersWithOutretOnEffect:(NSMutableString*)retoneffect OutretOnEffectLevel:(NSMutableString*)retoneffectlevel{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"retOnEffect", @"retOnEffectLevel", nil];
    outputObjects = [NSArray arrayWithObjects:retoneffect, retoneffectlevel, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetOnEffectParameters" parameters:parameters returnValues:output];
    return ret;
}


-(int)StepUp{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    ret = [self action:@"StepUp" parameters:parameters returnValues:output];
    return ret;
}


-(int)StepDown{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    ret = [self action:@"StepDown" parameters:parameters returnValues:output];
    return ret;
}


-(int)StartRampUp{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    ret = [self action:@"StartRampUp" parameters:parameters returnValues:output];
    return ret;
}


-(int)StartRampDown{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    ret = [self action:@"StartRampDown" parameters:parameters returnValues:output];
    return ret;
}


-(int)StopRamp{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    ret = [self action:@"StopRamp" parameters:parameters returnValues:output];
    return ret;
}


-(int)StartRampToLevelWithnewLoadLevelTarget:(NSString*)newloadleveltarget newRampTime:(NSString*)newramptime{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"newLoadLevelTarget", @"newRampTime", nil];
    parameterObjects = [NSArray arrayWithObjects:newloadleveltarget, newramptime, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"StartRampToLevel" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetStepDeltaWithnewStepDelta:(NSString*)newstepdelta{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"newStepDelta", nil];
    parameterObjects = [NSArray arrayWithObjects:newstepdelta, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetStepDelta" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetStepDeltaWithOutretStepDelta:(NSMutableString*)retstepdelta{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"retStepDelta", nil];
    outputObjects = [NSArray arrayWithObjects:retstepdelta, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetStepDelta" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetRampRateWithnewRampRate:(NSString*)newramprate{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"newRampRate", nil];
    parameterObjects = [NSArray arrayWithObjects:newramprate, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetRampRate" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetRampRateWithOutretRampRate:(NSMutableString*)retramprate{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"retRampRate", nil];
    outputObjects = [NSArray arrayWithObjects:retramprate, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetRampRate" parameters:parameters returnValues:output];
    return ret;
}


-(int)PauseRamp{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    ret = [self action:@"PauseRamp" parameters:parameters returnValues:output];
    return ret;
}


-(int)ResumeRamp{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    ret = [self action:@"ResumeRamp" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetIsRampingWithOutretIsRamping:(NSMutableString*)retisramping{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"retIsRamping", nil];
    outputObjects = [NSArray arrayWithObjects:retisramping, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetIsRamping" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetRampPausedWithOutretRampPaused:(NSMutableString*)retramppaused{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"retRampPaused", nil];
    outputObjects = [NSArray arrayWithObjects:retramppaused, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetRampPaused" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetRampTimeWithOutretRampTime:(NSMutableString*)retramptime{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"retRampTime", nil];
    outputObjects = [NSArray arrayWithObjects:retramptime, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetRampTime" parameters:parameters returnValues:output];
    return ret;
}



@end
