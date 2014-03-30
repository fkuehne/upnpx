// ******************************************************************
//
// MIT License.
// This file is part of upnpx.
//
// Copyright (c) 2010, 2011 Bruno Keymolen, email: bruno.keymolen@gmail.com
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
// ******************************************************************

#import "SoapActionsDimming1.h"

#import "OrderedDictionary.h"

@implementation SoapActionsDimming1


-(int)SetLoadLevelTargetWithnewLoadlevelTarget:(NSString*)newloadleveltarget{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"newLoadlevelTarget"];
    parameterObjects = @[newloadleveltarget];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetLoadLevelTarget" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetLoadLevelTargetWithOutGetLoadlevelTarget:(NSMutableString*)getloadleveltarget{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"GetLoadlevelTarget"];
    outputObjects = @[getloadleveltarget];
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
    outputKeys = @[@"retLoadlevelStatus"];
    outputObjects = @[retloadlevelstatus];
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
    parameterKeys = @[@"newOnEffectLevel"];
    parameterObjects = @[newoneffectlevel];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetOnEffectLevel" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetOnEffectWithnewOnEffect:(NSString*)newoneffect{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"newOnEffect"];
    parameterObjects = @[newoneffect];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetOnEffect" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetOnEffectParametersWithOutretOnEffect:(NSMutableString*)retoneffect OutretOnEffectLevel:(NSMutableString*)retoneffectlevel{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"retOnEffect", @"retOnEffectLevel"];
    outputObjects = @[retoneffect, retoneffectlevel];
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
    parameterKeys = @[@"newLoadLevelTarget", @"newRampTime"];
    parameterObjects = @[newloadleveltarget, newramptime];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"StartRampToLevel" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetStepDeltaWithnewStepDelta:(NSString*)newstepdelta{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"newStepDelta"];
    parameterObjects = @[newstepdelta];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetStepDelta" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetStepDeltaWithOutretStepDelta:(NSMutableString*)retstepdelta{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"retStepDelta"];
    outputObjects = @[retstepdelta];
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
    parameterKeys = @[@"newRampRate"];
    parameterObjects = @[newramprate];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetRampRate" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetRampRateWithOutretRampRate:(NSMutableString*)retramprate{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"retRampRate"];
    outputObjects = @[retramprate];
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
    outputKeys = @[@"retIsRamping"];
    outputObjects = @[retisramping];
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
    outputKeys = @[@"retRampPaused"];
    outputObjects = @[retramppaused];
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
    outputKeys = @[@"retRampTime"];
    outputObjects = @[retramptime];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetRampTime" parameters:parameters returnValues:output];
    return ret;
}



@end
