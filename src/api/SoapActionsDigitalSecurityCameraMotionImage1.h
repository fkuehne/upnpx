//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import <Foundation/Foundation.h>
#import "SoapAction.h"

@interface SoapActionsDigitalSecurityCameraMotionImage1 : SoapAction {
    }

//SOAP

-(int)GetAvailableEncodingsWithOutRetAvailableEncodings:(NSMutableString*)retavailableencodings;
-(int)GetDefaultEncodingWithOutRetEncoding:(NSMutableString*)retencoding;
-(int)SetDefaultEncodingWithReqEncoding:(NSString*)reqencoding;
-(int)GetAvailableCompressionLevelsWithOutRetAvailableCompressionLevels:(NSMutableString*)retavailablecompressionlevels;
-(int)GetDefaultCompressionLevelWithOutRetCompressionLevel:(NSMutableString*)retcompressionlevel;
-(int)SetDefaultCompressionLevelWithReqCompressionLevel:(NSString*)reqcompressionlevel;
-(int)GetAvailableResolutionsWithOutRetAvailableResolutions:(NSMutableString*)retavailableresolutions;
-(int)GetDefaultResolutionWithOutRetResolution:(NSMutableString*)retresolution;
-(int)SetDefaultResolutionWithReqResolution:(NSString*)reqresolution;
-(int)GetVideoURLWithReqEncoding:(NSString*)reqencoding ReqCompression:(NSString*)reqcompression ReqResolution:(NSString*)reqresolution ReqMaxBandwidth:(NSString*)reqmaxbandwidth ReqTargetFrameRate:(NSString*)reqtargetframerate OutRetVideoURL:(NSMutableString*)retvideourl;
-(int)GetDefaultVideoURLWithOutRetVideoURL:(NSMutableString*)retvideourl;
-(int)GetVideoPresentationURLWithReqEncoding:(NSString*)reqencoding ReqCompression:(NSString*)reqcompression ReqResolution:(NSString*)reqresolution ReqMaxBandwidth:(NSString*)reqmaxbandwidth ReqTargetFrameRate:(NSString*)reqtargetframerate OutRetVideoPresentationURL:(NSMutableString*)retvideopresentationurl;
-(int)GetDefaultVideoPresentationURLWithOutRetVideoPresentationURL:(NSMutableString*)retvideopresentationurl;
-(int)SetMaxBandwidthWithReqMaxBandwidth:(NSString*)reqmaxbandwidth;
-(int)GetMaxBandwidthWithOutRetMaxBandwidth:(NSMutableString*)retmaxbandwidth;
-(int)SetTargetFrameRateWithReqTargetFrameRate:(NSString*)reqtargetframerate;
-(int)GetTargetFrameRateWithOutRetTargetFrameRate:(NSMutableString*)rettargetframerate;

@end
