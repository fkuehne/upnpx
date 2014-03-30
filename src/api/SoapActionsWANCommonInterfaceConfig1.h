//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import <Foundation/Foundation.h>
#import "SoapAction.h"

@interface SoapActionsWANCommonInterfaceConfig1 : SoapAction {
    }

//SOAP

-(int)SetEnabledForInternetWithNewEnabledForInternet:(NSString*)newenabledforinternet;
-(int)GetEnabledForInternetWithOutNewEnabledForInternet:(NSMutableString*)newenabledforinternet;
-(int)GetCommonLinkPropertiesWithOutNewWANAccessType:(NSMutableString*)newwanaccesstype OutNewLayer1UpstreamMaxBitRate:(NSMutableString*)newlayer1upstreammaxbitrate OutNewLayer1DownstreamMaxBitRate:(NSMutableString*)newlayer1downstreammaxbitrate OutNewPhysicalLinkStatus:(NSMutableString*)newphysicallinkstatus;
-(int)GetWANAccessProviderWithOutNewWANAccessProvider:(NSMutableString*)newwanaccessprovider;
-(int)GetMaximumActiveConnectionsWithOutNewMaximumActiveConnections:(NSMutableString*)newmaximumactiveconnections;
-(int)GetTotalBytesSentWithOutNewTotalBytesSent:(NSMutableString*)newtotalbytessent;
-(int)GetTotalBytesReceivedWithOutNewTotalBytesReceived:(NSMutableString*)newtotalbytesreceived;
-(int)GetTotalPacketsSentWithOutNewTotalPacketsSent:(NSMutableString*)newtotalpacketssent;
-(int)GetTotalPacketsReceivedWithOutNewTotalPacketsReceived:(NSMutableString*)newtotalpacketsreceived;
-(int)GetActiveConnectionWithNewActiveConnectionIndex:(NSString*)newactiveconnectionindex OutNewActiveConnDeviceContainer:(NSMutableString*)newactiveconndevicecontainer OutNewActiveConnectionServiceID:(NSMutableString*)newactiveconnectionserviceid;

@end
