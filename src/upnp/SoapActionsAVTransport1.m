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

#import "SoapActionsAVTransport1.h"

#import "OrderedDictionary.h"

@implementation SoapActionsAVTransport1


-(int)SetAVTransportURIWithInstanceID:(NSString*)instanceid CurrentURI:(NSString*)currenturi CurrentURIMetaData:(NSString*)currenturimetadata{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"CurrentURI", @"CurrentURIMetaData", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, currenturi, currenturimetadata, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetAVTransportURI" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetNextAVTransportURIWithInstanceID:(NSString*)instanceid NextURI:(NSString*)nexturi NextURIMetaData:(NSString*)nexturimetadata{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"NextURI", @"NextURIMetaData", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, nexturi, nexturimetadata, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetNextAVTransportURI" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetMediaInfoWithInstanceID:(NSString*)instanceid OutNrTracks:(NSMutableString*)nrtracks OutMediaDuration:(NSMutableString*)mediaduration OutCurrentURI:(NSMutableString*)currenturi OutCurrentURIMetaData:(NSMutableString*)currenturimetadata OutNextURI:(NSMutableString*)nexturi OutNextURIMetaData:(NSMutableString*)nexturimetadata OutPlayMedium:(NSMutableString*)playmedium OutRecordMedium:(NSMutableString*)recordmedium OutWriteStatus:(NSMutableString*)writestatus{
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
    outputKeys = [NSArray arrayWithObjects:@"NrTracks", @"MediaDuration", @"CurrentURI", @"CurrentURIMetaData", @"NextURI", @"NextURIMetaData", @"PlayMedium", @"RecordMedium", @"WriteStatus", nil];
    outputObjects = [NSArray arrayWithObjects:nrtracks, mediaduration, currenturi, currenturimetadata, nexturi, nexturimetadata, playmedium, recordmedium, writestatus, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetMediaInfo" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetTransportInfoWithInstanceID:(NSString*)instanceid OutCurrentTransportState:(NSMutableString*)currenttransportstate OutCurrentTransportStatus:(NSMutableString*)currenttransportstatus OutCurrentSpeed:(NSMutableString*)currentspeed{
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
    outputKeys = [NSArray arrayWithObjects:@"CurrentTransportState", @"CurrentTransportStatus", @"CurrentSpeed", nil];
    outputObjects = [NSArray arrayWithObjects:currenttransportstate, currenttransportstatus, currentspeed, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetTransportInfo" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetPositionInfoWithInstanceID:(NSString*)instanceid OutTrack:(NSMutableString*)track OutTrackDuration:(NSMutableString*)trackduration OutTrackMetaData:(NSMutableString*)trackmetadata OutTrackURI:(NSMutableString*)trackuri OutRelTime:(NSMutableString*)reltime OutAbsTime:(NSMutableString*)abstime OutRelCount:(NSMutableString*)relcount OutAbsCount:(NSMutableString*)abscount{
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
    outputKeys = [NSArray arrayWithObjects:@"Track", @"TrackDuration", @"TrackMetaData", @"TrackURI", @"RelTime", @"AbsTime", @"RelCount", @"AbsCount", nil];
    outputObjects = [NSArray arrayWithObjects:track, trackduration, trackmetadata, trackuri, reltime, abstime, relcount, abscount, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetPositionInfo" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetDeviceCapabilitiesWithInstanceID:(NSString*)instanceid OutPlayMedia:(NSMutableString*)playmedia OutRecMedia:(NSMutableString*)recmedia OutRecQualityModes:(NSMutableString*)recqualitymodes{
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
    outputKeys = [NSArray arrayWithObjects:@"PlayMedia", @"RecMedia", @"RecQualityModes", nil];
    outputObjects = [NSArray arrayWithObjects:playmedia, recmedia, recqualitymodes, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetDeviceCapabilities" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetTransportSettingsWithInstanceID:(NSString*)instanceid OutPlayMode:(NSMutableString*)playmode OutRecQualityMode:(NSMutableString*)recqualitymode{
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
    outputKeys = [NSArray arrayWithObjects:@"PlayMode", @"RecQualityMode", nil];
    outputObjects = [NSArray arrayWithObjects:playmode, recqualitymode, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetTransportSettings" parameters:parameters returnValues:output];
    return ret;
}


-(int)StopWithInstanceID:(NSString*)instanceid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"Stop" parameters:parameters returnValues:output];
    return ret;
}


-(int)PlayWithInstanceID:(NSString*)instanceid Speed:(NSString*)speed{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"Speed", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, speed, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"Play" parameters:parameters returnValues:output];
    return ret;
}


-(int)PauseWithInstanceID:(NSString*)instanceid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"Pause" parameters:parameters returnValues:output];
    return ret;
}


-(int)RecordWithInstanceID:(NSString*)instanceid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"Record" parameters:parameters returnValues:output];
    return ret;
}


-(int)SeekWithInstanceID:(NSString*)instanceid Unit:(NSString*)unit Target:(NSString*)target{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"Unit", @"Target", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, unit, target, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"Seek" parameters:parameters returnValues:output];
    return ret;
}


-(int)NextWithInstanceID:(NSString*)instanceid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"Next" parameters:parameters returnValues:output];
    return ret;
}


-(int)PreviousWithInstanceID:(NSString*)instanceid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"Previous" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetPlayModeWithInstanceID:(NSString*)instanceid NewPlayMode:(NSString*)newplaymode{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"NewPlayMode", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, newplaymode, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetPlayMode" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetRecordQualityModeWithInstanceID:(NSString*)instanceid NewRecordQualityMode:(NSString*)newrecordqualitymode{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"NewRecordQualityMode", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceid, newrecordqualitymode, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetRecordQualityMode" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetCurrentTransportActionsWithInstanceID:(NSString*)instanceid OutActions:(NSMutableString*)actions{
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
    outputKeys = [NSArray arrayWithObjects:@"Actions", nil];
    outputObjects = [NSArray arrayWithObjects:actions, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetCurrentTransportActions" parameters:parameters returnValues:output];
    return ret;
}



@end
