//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import <Foundation/Foundation.h>
#import "SoapAction.h"

@interface SoapActionsWANIPConnection2 : SoapAction {
    }

//SOAP

-(int)SetConnectionTypeWithNewConnectionType:(NSString*)newconnectiontype;
-(int)GetConnectionTypeInfoWithOutNewConnectionType:(NSMutableString*)newconnectiontype OutNewPossibleConnectionTypes:(NSMutableString*)newpossibleconnectiontypes;
-(int)RequestConnection;
-(int)RequestTermination;
-(int)ForceTermination;
-(int)SetAutoDisconnectTimeWithNewAutoDisconnectTime:(NSString*)newautodisconnecttime;
-(int)SetIdleDisconnectTimeWithNewIdleDisconnectTime:(NSString*)newidledisconnecttime;
-(int)SetWarnDisconnectDelayWithNewWarnDisconnectDelay:(NSString*)newwarndisconnectdelay;
-(int)GetStatusInfoWithOutNewConnectionStatus:(NSMutableString*)newconnectionstatus OutNewLastConnectionError:(NSMutableString*)newlastconnectionerror OutNewUptime:(NSMutableString*)newuptime;
-(int)GetAutoDisconnectTimeWithOutNewAutoDisconnectTime:(NSMutableString*)newautodisconnecttime;
-(int)GetIdleDisconnectTimeWithOutNewIdleDisconnectTime:(NSMutableString*)newidledisconnecttime;
-(int)GetWarnDisconnectDelayWithOutNewWarnDisconnectDelay:(NSMutableString*)newwarndisconnectdelay;
-(int)GetNATRSIPStatusWithOutNewRSIPAvailable:(NSMutableString*)newrsipavailable OutNewNATEnabled:(NSMutableString*)newnatenabled;
-(int)GetGenericPortMappingEntryWithNewPortMappingIndex:(NSString*)newportmappingindex OutNewRemoteHost:(NSMutableString*)newremotehost OutNewExternalPort:(NSMutableString*)newexternalport OutNewProtocol:(NSMutableString*)newprotocol OutNewInternalPort:(NSMutableString*)newinternalport OutNewInternalClient:(NSMutableString*)newinternalclient OutNewEnabled:(NSMutableString*)newenabled OutNewPortMappingDescription:(NSMutableString*)newportmappingdescription OutNewLeaseDuration:(NSMutableString*)newleaseduration;
-(int)GetSpecificPortMappingEntryWithNewRemoteHost:(NSString*)newremotehost NewExternalPort:(NSString*)newexternalport NewProtocol:(NSString*)newprotocol OutNewInternalPort:(NSMutableString*)newinternalport OutNewInternalClient:(NSMutableString*)newinternalclient OutNewEnabled:(NSMutableString*)newenabled OutNewPortMappingDescription:(NSMutableString*)newportmappingdescription OutNewLeaseDuration:(NSMutableString*)newleaseduration;
-(int)AddPortMappingWithNewRemoteHost:(NSString*)newremotehost NewExternalPort:(NSString*)newexternalport NewProtocol:(NSString*)newprotocol NewInternalPort:(NSString*)newinternalport NewInternalClient:(NSString*)newinternalclient NewEnabled:(NSString*)newenabled NewPortMappingDescription:(NSString*)newportmappingdescription NewLeaseDuration:(NSString*)newleaseduration;
-(int)DeletePortMappingWithNewRemoteHost:(NSString*)newremotehost NewExternalPort:(NSString*)newexternalport NewProtocol:(NSString*)newprotocol;
-(int)DeletePortMappingRangeWithNewStartPort:(NSString*)newstartport NewEndPort:(NSString*)newendport NewProtocol:(NSString*)newprotocol NewManage:(NSString*)newmanage;
-(int)GetExternalIPAddressWithOutNewExternalIPAddress:(NSMutableString*)newexternalipaddress;
-(int)GetListOfPortMappingsWithNewStartPort:(NSString*)newstartport NewEndPort:(NSString*)newendport NewProtocol:(NSString*)newprotocol NewManage:(NSString*)newmanage NewNumberOfPorts:(NSString*)newnumberofports OutNewPortListing:(NSMutableString*)newportlisting;
-(int)AddAnyPortMappingWithNewRemoteHost:(NSString*)newremotehost NewExternalPort:(NSString*)newexternalport NewProtocol:(NSString*)newprotocol NewInternalPort:(NSString*)newinternalport NewInternalClient:(NSString*)newinternalclient NewEnabled:(NSString*)newenabled NewPortMappingDescription:(NSString*)newportmappingdescription NewLeaseDuration:(NSString*)newleaseduration OutNewReservedPort:(NSMutableString*)newreservedport;

@end
