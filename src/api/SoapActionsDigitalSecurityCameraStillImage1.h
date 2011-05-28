//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import <Foundation/Foundation.h>
#import "SoapAction.h"

@interface SoapActionsDigitalSecurityCameraStillImage1 : SoapAction {
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
-(int)GetImageURLWithReqEncoding:(NSString*)reqencoding ReqCompression:(NSString*)reqcompression ReqResolution:(NSString*)reqresolution OutRetImageURL:(NSMutableString*)retimageurl;
-(int)GetDefaultImageURLWithOutRetImageURL:(NSMutableString*)retimageurl;
-(int)GetImagePresentationURLWithReqEncoding:(NSString*)reqencoding ReqCompression:(NSString*)reqcompression ReqResolution:(NSString*)reqresolution OutRetImagePresentationURL:(NSMutableString*)retimagepresentationurl;
-(int)GetDefaultImagePresentationURLWithOutRetImagePresentationURL:(NSMutableString*)retimagepresentationurl;

@end
