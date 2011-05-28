//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import <Foundation/Foundation.h>
#import "SoapAction.h"

@interface SoapActionsWANCableLinkConfig1 : SoapAction {
    }

//SOAP

-(int)GetCableLinkConfigInfoWithOutNewCableLinkConfigState:(NSMutableString*)newcablelinkconfigstate OutNewLinkType:(NSMutableString*)newlinktype;
-(int)GetDownstreamFrequencyWithOutNewDownstreamFrequency:(NSMutableString*)newdownstreamfrequency;
-(int)GetDownstreamModulationWithOutNewDownstreamModulation:(NSMutableString*)newdownstreammodulation;
-(int)GetUpstreamFrequencyWithOutNewUpstreamFrequency:(NSMutableString*)newupstreamfrequency;
-(int)GetUpstreamModulationWithOutNewUpstreamModulation:(NSMutableString*)newupstreammodulation;
-(int)GetUpstreamChannelIDWithOutNewUpstreamChannelID:(NSMutableString*)newupstreamchannelid;
-(int)GetUpstreamPowerLevelWithOutNewUpstreamPowerLevel:(NSMutableString*)newupstreampowerlevel;
-(int)GetBPIEncryptionEnabledWithOutNewBPIEncryptionEnabled:(NSMutableString*)newbpiencryptionenabled;
-(int)GetConfigFileWithOutNewConfigFile:(NSMutableString*)newconfigfile;
-(int)GetTFTPServerWithOutNewTFTPServer:(NSMutableString*)newtftpserver;

@end
