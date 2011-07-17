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



#import "SoapActionsDigitalSecurityCameraSettings1.h"

#import "OrderedDictionary.h"

@implementation SoapActionsDigitalSecurityCameraSettings1


-(int)SetAutomaticWhiteBalanceWithNewAutomaticWhiteBalance:(NSString*)newautomaticwhitebalance{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewAutomaticWhiteBalance", nil];
    parameterObjects = [NSArray arrayWithObjects:newautomaticwhitebalance, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetAutomaticWhiteBalance" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetAutomaticWhiteBalanceWithOutRetAutomaticWhiteBalance:(NSMutableString*)retautomaticwhitebalance{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetAutomaticWhiteBalance", nil];
    outputObjects = [NSArray arrayWithObjects:retautomaticwhitebalance, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetAutomaticWhiteBalance" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetFixedWhiteBalanceWithNewFixedWhiteBalance:(NSString*)newfixedwhitebalance{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewFixedWhiteBalance", nil];
    parameterObjects = [NSArray arrayWithObjects:newfixedwhitebalance, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetFixedWhiteBalance" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetFixedWhiteBalanceWithOutRetFixedWhiteBalance:(NSMutableString*)retfixedwhitebalance{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetFixedWhiteBalance", nil];
    outputObjects = [NSArray arrayWithObjects:retfixedwhitebalance, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetFixedWhiteBalance" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetAvailableRotationsWithOutRetAvailableRotations:(NSMutableString*)retavailablerotations{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetAvailableRotations", nil];
    outputObjects = [NSArray arrayWithObjects:retavailablerotations, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetAvailableRotations" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetDefaultRotationWithNewRotation:(NSString*)newrotation{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewRotation", nil];
    parameterObjects = [NSArray arrayWithObjects:newrotation, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetDefaultRotation" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetDefaultRotationWithOutRetRotation:(NSMutableString*)retrotation{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetRotation", nil];
    outputObjects = [NSArray arrayWithObjects:retrotation, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetDefaultRotation" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetBrightnessWithNewBrightness:(NSString*)newbrightness{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewBrightness", nil];
    parameterObjects = [NSArray arrayWithObjects:newbrightness, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetBrightness" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetBrightnessWithOutRetBrightness:(NSMutableString*)retbrightness{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetBrightness", nil];
    outputObjects = [NSArray arrayWithObjects:retbrightness, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetBrightness" parameters:parameters returnValues:output];
    return ret;
}


-(int)IncreaseBrightness{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    ret = [self action:@"IncreaseBrightness" parameters:parameters returnValues:output];
    return ret;
}


-(int)DecreaseBrightness{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    ret = [self action:@"DecreaseBrightness" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetColorSaturationWithNewColorSaturation:(NSString*)newcolorsaturation{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewColorSaturation", nil];
    parameterObjects = [NSArray arrayWithObjects:newcolorsaturation, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetColorSaturation" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetColorSaturationWithOutRetColorSaturation:(NSMutableString*)retcolorsaturation{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetColorSaturation", nil];
    outputObjects = [NSArray arrayWithObjects:retcolorsaturation, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetColorSaturation" parameters:parameters returnValues:output];
    return ret;
}


-(int)IncreaseColorSaturation{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    ret = [self action:@"IncreaseColorSaturation" parameters:parameters returnValues:output];
    return ret;
}


-(int)DecreaseColorSaturation{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    ret = [self action:@"DecreaseColorSaturation" parameters:parameters returnValues:output];
    return ret;
}



@end
