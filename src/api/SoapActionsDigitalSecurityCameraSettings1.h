//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import <Foundation/Foundation.h>
#import "SoapAction.h"

@interface SoapActionsDigitalSecurityCameraSettings1 : SoapAction {
    }

//SOAP

-(int)SetAutomaticWhiteBalanceWithNewAutomaticWhiteBalance:(NSString*)newautomaticwhitebalance;
-(int)GetAutomaticWhiteBalanceWithOutRetAutomaticWhiteBalance:(NSMutableString*)retautomaticwhitebalance;
-(int)SetFixedWhiteBalanceWithNewFixedWhiteBalance:(NSString*)newfixedwhitebalance;
-(int)GetFixedWhiteBalanceWithOutRetFixedWhiteBalance:(NSMutableString*)retfixedwhitebalance;
-(int)GetAvailableRotationsWithOutRetAvailableRotations:(NSMutableString*)retavailablerotations;
-(int)SetDefaultRotationWithNewRotation:(NSString*)newrotation;
-(int)GetDefaultRotationWithOutRetRotation:(NSMutableString*)retrotation;
-(int)SetBrightnessWithNewBrightness:(NSString*)newbrightness;
-(int)GetBrightnessWithOutRetBrightness:(NSMutableString*)retbrightness;
-(int)IncreaseBrightness;
-(int)DecreaseBrightness;
-(int)SetColorSaturationWithNewColorSaturation:(NSString*)newcolorsaturation;
-(int)GetColorSaturationWithOutRetColorSaturation:(NSMutableString*)retcolorsaturation;
-(int)IncreaseColorSaturation;
-(int)DecreaseColorSaturation;

@end
