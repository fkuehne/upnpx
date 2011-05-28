//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import <Foundation/Foundation.h>
#import "SoapAction.h"

@interface SoapActionsWANIPv6FirewallControl1 : SoapAction {
    }

//SOAP

-(int)GetFirewallStatusWithOutFirewallEnabled:(NSMutableString*)firewallenabled OutInboundPinholeAllowed:(NSMutableString*)inboundpinholeallowed;
-(int)GetOutboundPinholeTimeoutWithRemoteHost:(NSString*)remotehost RemotePort:(NSString*)remoteport InternalClient:(NSString*)internalclient InternalPort:(NSString*)internalport Protocol:(NSString*)protocol OutOutboundPinholeTimeout:(NSMutableString*)outboundpinholetimeout;
-(int)AddPinholeWithRemoteHost:(NSString*)remotehost RemotePort:(NSString*)remoteport InternalClient:(NSString*)internalclient InternalPort:(NSString*)internalport Protocol:(NSString*)protocol LeaseTime:(NSString*)leasetime OutUniqueID:(NSMutableString*)uniqueid;
-(int)UpdatePinholeWithUniqueID:(NSString*)uniqueid NewLeaseTime:(NSString*)newleasetime;
-(int)DeletePinholeWithUniqueID:(NSString*)uniqueid;
-(int)GetPinholePacketsWithUniqueID:(NSString*)uniqueid OutPinholePackets:(NSMutableString*)pinholepackets;
-(int)CheckPinholeWorkingWithUniqueID:(NSString*)uniqueid OutIsWorking:(NSMutableString*)isworking;

@end
