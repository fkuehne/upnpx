//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import <Foundation/Foundation.h>
#import "SoapAction.h"

@interface SoapActionsMediaManagement1 : SoapAction {
    }

//SOAP

-(int)GetMediaCapabilitiesWithTSMediaCapabilityInfo:(NSString*)tsmediacapabilityinfo OutSupportedMediaCapabilityInfo:(NSMutableString*)supportedmediacapabilityinfo;
-(int)GetMediaSessionInfoWithTargetMediaSessionID:(NSString*)targetmediasessionid OutMediaSessionInfoList:(NSMutableString*)mediasessioninfolist;
-(int)ModifyMediaSessionWithTargetMediaSessionID:(NSString*)targetmediasessionid NewMediaCapabilityInfo:(NSString*)newmediacapabilityinfo OutTCMediaCapabilityInfo:(NSMutableString*)tcmediacapabilityinfo;
-(int)StartMediaSessionWithTSMediaCapabilityInfo:(NSString*)tsmediacapabilityinfo OutMediaSessionID:(NSMutableString*)mediasessionid OutTCMediaCapabilityInfo:(NSMutableString*)tcmediacapabilityinfo;
-(int)StopMediaSessionWithTargetMediaSessionID:(NSString*)targetmediasessionid;

@end
