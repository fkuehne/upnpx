//Auto Generated file.
//Copyright 2010 Bruno Keymolen, Arcanegra BVBA. All rights reserved.

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
