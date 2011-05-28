//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import "SoapActionsDigitalSecurityCameraSettings1.h"

@implementation SoapActionsDigitalSecurityCameraSettings1


-(int)SetAutomaticWhiteBalanceWithNewAutomaticWhiteBalance:(NSString*)newautomaticwhitebalance{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewAutomaticWhiteBalance", nil];
    parameterObjects = [NSArray arrayWithObjects:newautomaticwhitebalance, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
