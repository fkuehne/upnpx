//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import "SoapActionsDigitalSecurityCameraMotionImage1.h"

@implementation SoapActionsDigitalSecurityCameraMotionImage1


-(int)GetAvailableEncodingsWithOutRetAvailableEncodings:(NSMutableString*)retavailableencodings{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetAvailableEncodings", nil];
    outputObjects = [NSArray arrayWithObjects:retavailableencodings, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetAvailableEncodings" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetDefaultEncodingWithOutRetEncoding:(NSMutableString*)retencoding{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetEncoding", nil];
    outputObjects = [NSArray arrayWithObjects:retencoding, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetDefaultEncoding" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetDefaultEncodingWithReqEncoding:(NSString*)reqencoding{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"ReqEncoding", nil];
    parameterObjects = [NSArray arrayWithObjects:reqencoding, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetDefaultEncoding" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetAvailableCompressionLevelsWithOutRetAvailableCompressionLevels:(NSMutableString*)retavailablecompressionlevels{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetAvailableCompressionLevels", nil];
    outputObjects = [NSArray arrayWithObjects:retavailablecompressionlevels, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetAvailableCompressionLevels" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetDefaultCompressionLevelWithOutRetCompressionLevel:(NSMutableString*)retcompressionlevel{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetCompressionLevel", nil];
    outputObjects = [NSArray arrayWithObjects:retcompressionlevel, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetDefaultCompressionLevel" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetDefaultCompressionLevelWithReqCompressionLevel:(NSString*)reqcompressionlevel{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"ReqCompressionLevel", nil];
    parameterObjects = [NSArray arrayWithObjects:reqcompressionlevel, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetDefaultCompressionLevel" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetAvailableResolutionsWithOutRetAvailableResolutions:(NSMutableString*)retavailableresolutions{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetAvailableResolutions", nil];
    outputObjects = [NSArray arrayWithObjects:retavailableresolutions, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetAvailableResolutions" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetDefaultResolutionWithOutRetResolution:(NSMutableString*)retresolution{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetResolution", nil];
    outputObjects = [NSArray arrayWithObjects:retresolution, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetDefaultResolution" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetDefaultResolutionWithReqResolution:(NSString*)reqresolution{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"ReqResolution", nil];
    parameterObjects = [NSArray arrayWithObjects:reqresolution, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetDefaultResolution" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetVideoURLWithReqEncoding:(NSString*)reqencoding ReqCompression:(NSString*)reqcompression ReqResolution:(NSString*)reqresolution ReqMaxBandwidth:(NSString*)reqmaxbandwidth ReqTargetFrameRate:(NSString*)reqtargetframerate OutRetVideoURL:(NSMutableString*)retvideourl{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"ReqEncoding", @"ReqCompression", @"ReqResolution", @"ReqMaxBandwidth", @"ReqTargetFrameRate", nil];
    parameterObjects = [NSArray arrayWithObjects:reqencoding, reqcompression, reqresolution, reqmaxbandwidth, reqtargetframerate, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetVideoURL", nil];
    outputObjects = [NSArray arrayWithObjects:retvideourl, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetVideoURL" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetDefaultVideoURLWithOutRetVideoURL:(NSMutableString*)retvideourl{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetVideoURL", nil];
    outputObjects = [NSArray arrayWithObjects:retvideourl, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetDefaultVideoURL" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetVideoPresentationURLWithReqEncoding:(NSString*)reqencoding ReqCompression:(NSString*)reqcompression ReqResolution:(NSString*)reqresolution ReqMaxBandwidth:(NSString*)reqmaxbandwidth ReqTargetFrameRate:(NSString*)reqtargetframerate OutRetVideoPresentationURL:(NSMutableString*)retvideopresentationurl{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"ReqEncoding", @"ReqCompression", @"ReqResolution", @"ReqMaxBandwidth", @"ReqTargetFrameRate", nil];
    parameterObjects = [NSArray arrayWithObjects:reqencoding, reqcompression, reqresolution, reqmaxbandwidth, reqtargetframerate, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetVideoPresentationURL", nil];
    outputObjects = [NSArray arrayWithObjects:retvideopresentationurl, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetVideoPresentationURL" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetDefaultVideoPresentationURLWithOutRetVideoPresentationURL:(NSMutableString*)retvideopresentationurl{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetVideoPresentationURL", nil];
    outputObjects = [NSArray arrayWithObjects:retvideopresentationurl, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetDefaultVideoPresentationURL" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetMaxBandwidthWithReqMaxBandwidth:(NSString*)reqmaxbandwidth{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"ReqMaxBandwidth", nil];
    parameterObjects = [NSArray arrayWithObjects:reqmaxbandwidth, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetMaxBandwidth" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetMaxBandwidthWithOutRetMaxBandwidth:(NSMutableString*)retmaxbandwidth{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetMaxBandwidth", nil];
    outputObjects = [NSArray arrayWithObjects:retmaxbandwidth, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetMaxBandwidth" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetTargetFrameRateWithReqTargetFrameRate:(NSString*)reqtargetframerate{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"ReqTargetFrameRate", nil];
    parameterObjects = [NSArray arrayWithObjects:reqtargetframerate, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetTargetFrameRate" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetTargetFrameRateWithOutRetTargetFrameRate:(NSMutableString*)rettargetframerate{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetTargetFrameRate", nil];
    outputObjects = [NSArray arrayWithObjects:rettargetframerate, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetTargetFrameRate" parameters:parameters returnValues:output];
    return ret;
}



@end
