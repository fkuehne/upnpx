//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import "SoapActionsDigitalSecurityCameraStillImage1.h"

@implementation SoapActionsDigitalSecurityCameraStillImage1


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


-(int)GetImageURLWithReqEncoding:(NSString*)reqencoding ReqCompression:(NSString*)reqcompression ReqResolution:(NSString*)reqresolution OutRetImageURL:(NSMutableString*)retimageurl{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"ReqEncoding", @"ReqCompression", @"ReqResolution", nil];
    parameterObjects = [NSArray arrayWithObjects:reqencoding, reqcompression, reqresolution, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetImageURL", nil];
    outputObjects = [NSArray arrayWithObjects:retimageurl, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetImageURL" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetDefaultImageURLWithOutRetImageURL:(NSMutableString*)retimageurl{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetImageURL", nil];
    outputObjects = [NSArray arrayWithObjects:retimageurl, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetDefaultImageURL" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetImagePresentationURLWithReqEncoding:(NSString*)reqencoding ReqCompression:(NSString*)reqcompression ReqResolution:(NSString*)reqresolution OutRetImagePresentationURL:(NSMutableString*)retimagepresentationurl{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"ReqEncoding", @"ReqCompression", @"ReqResolution", nil];
    parameterObjects = [NSArray arrayWithObjects:reqencoding, reqcompression, reqresolution, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetImagePresentationURL", nil];
    outputObjects = [NSArray arrayWithObjects:retimagepresentationurl, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetImagePresentationURL" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetDefaultImagePresentationURLWithOutRetImagePresentationURL:(NSMutableString*)retimagepresentationurl{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RetImagePresentationURL", nil];
    outputObjects = [NSArray arrayWithObjects:retimagepresentationurl, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetDefaultImagePresentationURL" parameters:parameters returnValues:output];
    return ret;
}



@end
