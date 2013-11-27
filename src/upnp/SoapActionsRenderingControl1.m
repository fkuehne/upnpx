// ******************************************************************
//
// MIT License.
// This file is part of upnpx.
//
// Copyright (c) 2010, 2011 Bruno Keymolen, email: bruno.keymolen@gmail.com
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
// ******************************************************************

#import "SoapActionsRenderingControl1.h"

#import "OrderedDictionary.h"

@implementation SoapActionsRenderingControl1


-(int)ListPresetsWithInstanceID:(NSString*)instanceid OutCurrentPresetNameList:(NSMutableString*)currentpresetnamelist{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"CurrentPresetNameList", nil];
    outputObjects = [NSArray arrayWithObjects:currentpresetnamelist, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"ListPresets" parameters:parameters returnValues:output];
    return ret;
}


-(int)SelectPresetWithInstanceID:(NSString*)instanceid PresetName:(NSString*)presetname{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"PresetName", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, presetname, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SelectPreset" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetBrightnessWithInstanceID:(NSString*)instanceid OutCurrentBrightness:(NSMutableString*)currentbrightness{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"CurrentBrightness", nil];
    outputObjects = [NSArray arrayWithObjects:currentbrightness, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetBrightness" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetBrightnessWithInstanceID:(NSString*)instanceid DesiredBrightness:(NSString*)desiredbrightness{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"DesiredBrightness", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, desiredbrightness, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetBrightness" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetContrastWithInstanceID:(NSString*)instanceid OutCurrentContrast:(NSMutableString*)currentcontrast{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"CurrentContrast", nil];
    outputObjects = [NSArray arrayWithObjects:currentcontrast, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetContrast" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetContrastWithInstanceID:(NSString*)instanceid DesiredContrast:(NSString*)desiredcontrast{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"DesiredContrast", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, desiredcontrast, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetContrast" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetSharpnessWithInstanceID:(NSString*)instanceid OutCurrentSharpness:(NSMutableString*)currentsharpness{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"CurrentSharpness", nil];
    outputObjects = [NSArray arrayWithObjects:currentsharpness, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetSharpness" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetSharpnessWithInstanceID:(NSString*)instanceid DesiredSharpness:(NSString*)desiredsharpness{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"DesiredSharpness", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, desiredsharpness, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetSharpness" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetRedVideoGainWithInstanceID:(NSString*)instanceid OutCurrentRedVideoGain:(NSMutableString*)currentredvideogain{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"CurrentRedVideoGain", nil];
    outputObjects = [NSArray arrayWithObjects:currentredvideogain, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetRedVideoGain" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetRedVideoGainWithInstanceID:(NSString*)instanceid DesiredRedVideoGain:(NSString*)desiredredvideogain{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"DesiredRedVideoGain", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, desiredredvideogain, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetRedVideoGain" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetGreenVideoGainWithInstanceID:(NSString*)instanceid OutCurrentGreenVideoGain:(NSMutableString*)currentgreenvideogain{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"CurrentGreenVideoGain", nil];
    outputObjects = [NSArray arrayWithObjects:currentgreenvideogain, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetGreenVideoGain" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetGreenVideoGainWithInstanceID:(NSString*)instanceid DesiredGreenVideoGain:(NSString*)desiredgreenvideogain{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"DesiredGreenVideoGain", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, desiredgreenvideogain, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetGreenVideoGain" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetBlueVideoGainWithInstanceID:(NSString*)instanceid OutCurrentBlueVideoGain:(NSMutableString*)currentbluevideogain{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"CurrentBlueVideoGain", nil];
    outputObjects = [NSArray arrayWithObjects:currentbluevideogain, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetBlueVideoGain" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetBlueVideoGainWithInstanceID:(NSString*)instanceid DesiredBlueVideoGain:(NSString*)desiredbluevideogain{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"DesiredBlueVideoGain", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, desiredbluevideogain, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetBlueVideoGain" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetRedVideoBlackLevelWithInstanceID:(NSString*)instanceid OutCurrentRedVideoBlackLevel:(NSMutableString*)currentredvideoblacklevel{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"CurrentRedVideoBlackLevel", nil];
    outputObjects = [NSArray arrayWithObjects:currentredvideoblacklevel, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetRedVideoBlackLevel" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetRedVideoBlackLevelWithInstanceID:(NSString*)instanceid DesiredRedVideoBlackLevel:(NSString*)desiredredvideoblacklevel{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"DesiredRedVideoBlackLevel", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, desiredredvideoblacklevel, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetRedVideoBlackLevel" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetGreenVideoBlackLevelWithInstanceID:(NSString*)instanceid OutCurrentGreenVideoBlackLevel:(NSMutableString*)currentgreenvideoblacklevel{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"CurrentGreenVideoBlackLevel", nil];
    outputObjects = [NSArray arrayWithObjects:currentgreenvideoblacklevel, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetGreenVideoBlackLevel" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetGreenVideoBlackLevelWithInstanceID:(NSString*)instanceid DesiredGreenVideoBlackLevel:(NSString*)desiredgreenvideoblacklevel{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"DesiredGreenVideoBlackLevel", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, desiredgreenvideoblacklevel, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetGreenVideoBlackLevel" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetBlueVideoBlackLevelWithInstanceID:(NSString*)instanceid OutCurrentBlueVideoBlackLevel:(NSMutableString*)currentbluevideoblacklevel{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"CurrentBlueVideoBlackLevel", nil];
    outputObjects = [NSArray arrayWithObjects:currentbluevideoblacklevel, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetBlueVideoBlackLevel" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetBlueVideoBlackLevelWithInstanceID:(NSString*)instanceid DesiredBlueVideoBlackLevel:(NSString*)desiredbluevideoblacklevel{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"DesiredBlueVideoBlackLevel", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, desiredbluevideoblacklevel, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetBlueVideoBlackLevel" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetColorTemperatureWithInstanceID:(NSString*)instanceid OutCurrentColorTemperature:(NSMutableString*)currentcolortemperature{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"CurrentColorTemperature", nil];
    outputObjects = [NSArray arrayWithObjects:currentcolortemperature, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetColorTemperature" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetColorTemperatureWithInstanceID:(NSString*)instanceid DesiredColorTemperature:(NSString*)desiredcolortemperature{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"DesiredColorTemperature", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, desiredcolortemperature, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetColorTemperature" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetHorizontalKeystoneWithInstanceID:(NSString*)instanceid OutCurrentHorizontalKeystone:(NSMutableString*)currenthorizontalkeystone{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"CurrentHorizontalKeystone", nil];
    outputObjects = [NSArray arrayWithObjects:currenthorizontalkeystone, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetHorizontalKeystone" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetHorizontalKeystoneWithInstanceID:(NSString*)instanceid DesiredHorizontalKeystone:(NSString*)desiredhorizontalkeystone{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"DesiredHorizontalKeystone", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, desiredhorizontalkeystone, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetHorizontalKeystone" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetVerticalKeystoneWithInstanceID:(NSString*)instanceid OutCurrentVerticalKeystone:(NSMutableString*)currentverticalkeystone{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"CurrentVerticalKeystone", nil];
    outputObjects = [NSArray arrayWithObjects:currentverticalkeystone, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetVerticalKeystone" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetVerticalKeystoneWithInstanceID:(NSString*)instanceid DesiredVerticalKeystone:(NSString*)desiredverticalkeystone{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"DesiredVerticalKeystone", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, desiredverticalkeystone, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetVerticalKeystone" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetMuteWithInstanceID:(NSString*)instanceid Channel:(NSString*)channel OutCurrentMute:(NSMutableString*)currentmute{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"Channel", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, channel, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"CurrentMute", nil];
    outputObjects = [NSArray arrayWithObjects:currentmute, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetMute" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetMuteWithInstanceID:(NSString*)instanceid Channel:(NSString*)channel DesiredMute:(NSString*)desiredmute{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"Channel", @"DesiredMute", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, channel, desiredmute, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetMute" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetVolumeWithInstanceID:(NSString*)instanceid Channel:(NSString*)channel OutCurrentVolume:(NSMutableString*)currentvolume{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"Channel", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, channel, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"CurrentVolume", nil];
    outputObjects = [NSArray arrayWithObjects:currentvolume, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetVolume" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetVolumeWithInstanceID:(NSString*)instanceid Channel:(NSString*)channel DesiredVolume:(NSString*)desiredvolume{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"Channel", @"DesiredVolume", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, channel, desiredvolume, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetVolume" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetVolumeDBWithInstanceID:(NSString*)instanceid Channel:(NSString*)channel OutCurrentVolume:(NSMutableString*)currentvolume{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"Channel", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, channel, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"CurrentVolume", nil];
    outputObjects = [NSArray arrayWithObjects:currentvolume, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetVolumeDB" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetVolumeDBWithInstanceID:(NSString*)instanceid Channel:(NSString*)channel DesiredVolume:(NSString*)desiredvolume{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"Channel", @"DesiredVolume", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, channel, desiredvolume, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetVolumeDB" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetVolumeDBRangeWithInstanceID:(NSString*)instanceid Channel:(NSString*)channel OutMinValue:(NSMutableString*)minvalue OutMaxValue:(NSMutableString*)maxvalue{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"Channel", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, channel, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"MinValue", @"MaxValue", nil];
    outputObjects = [NSArray arrayWithObjects:minvalue, maxvalue, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetVolumeDBRange" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetLoudnessWithInstanceID:(NSString*)instanceid Channel:(NSString*)channel OutCurrentLoudness:(NSMutableString*)currentloudness{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"Channel", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, channel, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"CurrentLoudness", nil];
    outputObjects = [NSArray arrayWithObjects:currentloudness, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetLoudness" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetLoudnessWithInstanceID:(NSString*)instanceid Channel:(NSString*)channel DesiredLoudness:(NSString*)desiredloudness{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"Channel", @"DesiredLoudness", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, channel, desiredloudness, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetLoudness" parameters:parameters returnValues:output];
    return ret;
}



@end
