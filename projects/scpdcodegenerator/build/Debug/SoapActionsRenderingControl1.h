//Auto Generated file.
//Copyright 2010 Bruno Keymolen, Arcanegra BVBA. All rights reserved.

#import <Foundation/Foundation.h>
#import "SoapAction.h"

@interface SoapActionsRenderingControl1 : SoapAction {
    }

//SOAP

-(int)ListPresetsWithInstanceID:(NSString*)instanceid OutCurrentPresetNameList:(NSMutableString*)currentpresetnamelist;
-(int)SelectPresetWithInstanceID:(NSString*)instanceid PresetName:(NSString*)presetname;
-(int)GetBrightnessWithInstanceID:(NSString*)instanceid OutCurrentBrightness:(NSMutableString*)currentbrightness;
-(int)SetBrightnessWithInstanceID:(NSString*)instanceid DesiredBrightness:(NSString*)desiredbrightness;
-(int)GetContrastWithInstanceID:(NSString*)instanceid OutCurrentContrast:(NSMutableString*)currentcontrast;
-(int)SetContrastWithInstanceID:(NSString*)instanceid DesiredContrast:(NSString*)desiredcontrast;
-(int)GetSharpnessWithInstanceID:(NSString*)instanceid OutCurrentSharpness:(NSMutableString*)currentsharpness;
-(int)SetSharpnessWithInstanceID:(NSString*)instanceid DesiredSharpness:(NSString*)desiredsharpness;
-(int)GetRedVideoGainWithInstanceID:(NSString*)instanceid OutCurrentRedVideoGain:(NSMutableString*)currentredvideogain;
-(int)SetRedVideoGainWithInstanceID:(NSString*)instanceid DesiredRedVideoGain:(NSString*)desiredredvideogain;
-(int)GetGreenVideoGainWithInstanceID:(NSString*)instanceid OutCurrentGreenVideoGain:(NSMutableString*)currentgreenvideogain;
-(int)SetGreenVideoGainWithInstanceID:(NSString*)instanceid DesiredGreenVideoGain:(NSString*)desiredgreenvideogain;
-(int)GetBlueVideoGainWithInstanceID:(NSString*)instanceid OutCurrentBlueVideoGain:(NSMutableString*)currentbluevideogain;
-(int)SetBlueVideoGainWithInstanceID:(NSString*)instanceid DesiredBlueVideoGain:(NSString*)desiredbluevideogain;
-(int)GetRedVideoBlackLevelWithInstanceID:(NSString*)instanceid OutCurrentRedVideoBlackLevel:(NSMutableString*)currentredvideoblacklevel;
-(int)SetRedVideoBlackLevelWithInstanceID:(NSString*)instanceid DesiredRedVideoBlackLevel:(NSString*)desiredredvideoblacklevel;
-(int)GetGreenVideoBlackLevelWithInstanceID:(NSString*)instanceid OutCurrentGreenVideoBlackLevel:(NSMutableString*)currentgreenvideoblacklevel;
-(int)SetGreenVideoBlackLevelWithInstanceID:(NSString*)instanceid DesiredGreenVideoBlackLevel:(NSString*)desiredgreenvideoblacklevel;
-(int)GetBlueVideoBlackLevelWithInstanceID:(NSString*)instanceid OutCurrentBlueVideoBlackLevel:(NSMutableString*)currentbluevideoblacklevel;
-(int)SetBlueVideoBlackLevelWithInstanceID:(NSString*)instanceid DesiredBlueVideoBlackLevel:(NSString*)desiredbluevideoblacklevel;
-(int)GetColorTemperatureWithInstanceID:(NSString*)instanceid OutCurrentColorTemperature:(NSMutableString*)currentcolortemperature;
-(int)SetColorTemperatureWithInstanceID:(NSString*)instanceid DesiredColorTemperature:(NSString*)desiredcolortemperature;
-(int)GetHorizontalKeystoneWithInstanceID:(NSString*)instanceid OutCurrentHorizontalKeystone:(NSMutableString*)currenthorizontalkeystone;
-(int)SetHorizontalKeystoneWithInstanceID:(NSString*)instanceid DesiredHorizontalKeystone:(NSString*)desiredhorizontalkeystone;
-(int)GetVerticalKeystoneWithInstanceID:(NSString*)instanceid OutCurrentVerticalKeystone:(NSMutableString*)currentverticalkeystone;
-(int)SetVerticalKeystoneWithInstanceID:(NSString*)instanceid DesiredVerticalKeystone:(NSString*)desiredverticalkeystone;
-(int)GetMuteWithInstanceID:(NSString*)instanceid Channel:(NSString*)channel OutCurrentMute:(NSMutableString*)currentmute;
-(int)SetMuteWithInstanceID:(NSString*)instanceid Channel:(NSString*)channel DesiredMute:(NSString*)desiredmute;
-(int)GetVolumeWithInstanceID:(NSString*)instanceid Channel:(NSString*)channel OutCurrentVolume:(NSMutableString*)currentvolume;
-(int)SetVolumeWithInstanceID:(NSString*)instanceid Channel:(NSString*)channel DesiredVolume:(NSString*)desiredvolume;
-(int)GetVolumeDBWithInstanceID:(NSString*)instanceid Channel:(NSString*)channel OutCurrentVolume:(NSMutableString*)currentvolume;
-(int)SetVolumeDBWithInstanceID:(NSString*)instanceid Channel:(NSString*)channel DesiredVolume:(NSString*)desiredvolume;
-(int)GetVolumeDBRangeWithInstanceID:(NSString*)instanceid Channel:(NSString*)channel OutMinValue:(NSMutableString*)minvalue OutMaxValue:(NSMutableString*)maxvalue;
-(int)GetLoudnessWithInstanceID:(NSString*)instanceid Channel:(NSString*)channel OutCurrentLoudness:(NSMutableString*)currentloudness;
-(int)SetLoudnessWithInstanceID:(NSString*)instanceid Channel:(NSString*)channel DesiredLoudness:(NSString*)desiredloudness;

@end
