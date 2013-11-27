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



#import "SoapActionsDigitalSecurityCameraMotionImage1.h"

#import "OrderedDictionary.h"

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
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
