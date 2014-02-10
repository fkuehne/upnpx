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


#import <Foundation/Foundation.h>
#import "SoapAction.h"

@interface SoapActionsAVTransport1 : SoapAction {
    }

//SOAP

-(int)SetAVTransportURIWithInstanceID:(NSString*)instanceid CurrentURI:(NSString*)currenturi CurrentURIMetaData:(NSString*)currenturimetadata;
-(int)SetNextAVTransportURIWithInstanceID:(NSString*)instanceid NextURI:(NSString*)nexturi NextURIMetaData:(NSString*)nexturimetadata;
-(int)GetMediaInfoWithInstanceID:(NSString*)instanceid OutNrTracks:(NSMutableString*)nrtracks OutMediaDuration:(NSMutableString*)mediaduration OutCurrentURI:(NSMutableString*)currenturi OutCurrentURIMetaData:(NSMutableString*)currenturimetadata OutNextURI:(NSMutableString*)nexturi OutNextURIMetaData:(NSMutableString*)nexturimetadata OutPlayMedium:(NSMutableString*)playmedium OutRecordMedium:(NSMutableString*)recordmedium OutWriteStatus:(NSMutableString*)writestatus;
-(int)GetTransportInfoWithInstanceID:(NSString*)instanceid OutCurrentTransportState:(NSMutableString*)currenttransportstate OutCurrentTransportStatus:(NSMutableString*)currenttransportstatus OutCurrentSpeed:(NSMutableString*)currentspeed;
-(int)GetPositionInfoWithInstanceID:(NSString*)instanceid OutTrack:(NSMutableString*)track OutTrackDuration:(NSMutableString*)trackduration OutTrackMetaData:(NSMutableString*)trackmetadata OutTrackURI:(NSMutableString*)trackuri OutRelTime:(NSMutableString*)reltime OutAbsTime:(NSMutableString*)abstime OutRelCount:(NSMutableString*)relcount OutAbsCount:(NSMutableString*)abscount;
-(int)GetDeviceCapabilitiesWithInstanceID:(NSString*)instanceid OutPlayMedia:(NSMutableString*)playmedia OutRecMedia:(NSMutableString*)recmedia OutRecQualityModes:(NSMutableString*)recqualitymodes;
-(int)GetTransportSettingsWithInstanceID:(NSString*)instanceid OutPlayMode:(NSMutableString*)playmode OutRecQualityMode:(NSMutableString*)recqualitymode;
-(int)StopWithInstanceID:(NSString*)instanceid;
-(int)PlayWithInstanceID:(NSString*)instanceid Speed:(NSString*)speed;
-(int)PauseWithInstanceID:(NSString*)instanceid;
-(int)RecordWithInstanceID:(NSString*)instanceid;
-(int)SeekWithInstanceID:(NSString*)instanceid Unit:(NSString*)unit Target:(NSString*)target;
-(int)NextWithInstanceID:(NSString*)instanceid;
-(int)PreviousWithInstanceID:(NSString*)instanceid;
-(int)SetPlayModeWithInstanceID:(NSString*)instanceid NewPlayMode:(NSString*)newplaymode;
-(int)SetRecordQualityModeWithInstanceID:(NSString*)instanceid NewRecordQualityMode:(NSString*)newrecordqualitymode;
-(int)GetCurrentTransportActionsWithInstanceID:(NSString*)instanceid OutActions:(NSMutableString*)actions;

@end
