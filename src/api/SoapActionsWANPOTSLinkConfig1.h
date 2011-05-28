//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import <Foundation/Foundation.h>
#import "SoapAction.h"

@interface SoapActionsWANPOTSLinkConfig1 : SoapAction {
    }

//SOAP

-(int)SetISPInfoWithNewISPPhoneNumber:(NSString*)newispphonenumber NewISPInfo:(NSString*)newispinfo NewLinkType:(NSString*)newlinktype;
-(int)SetCallRetryInfoWithNewNumberOfRetries:(NSString*)newnumberofretries NewDelayBetweenRetries:(NSString*)newdelaybetweenretries;
-(int)GetISPInfoWithOutNewISPPhoneNumber:(NSMutableString*)newispphonenumber OutNewISPInfo:(NSMutableString*)newispinfo OutNewLinkType:(NSMutableString*)newlinktype;
-(int)GetCallRetryInfoWithOutNewNumberOfRetries:(NSMutableString*)newnumberofretries OutNewDelayBetweenRetries:(NSMutableString*)newdelaybetweenretries;
-(int)GetFclassWithOutNewFclass:(NSMutableString*)newfclass;
-(int)GetDataModulationSupportedWithOutNewDataModulationSupported:(NSMutableString*)newdatamodulationsupported;
-(int)GetDataProtocolWithOutNewDataProtocol:(NSMutableString*)newdataprotocol;
-(int)GetDataCompressionWithOutNewDataCompression:(NSMutableString*)newdatacompression;
-(int)GetPlusVTRCommandSupportedWithOutNewPlusVTRCommandSupported:(NSMutableString*)newplusvtrcommandsupported;

@end
