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

#import <Foundation/Foundation.h>
#import "SoapAction.h"

@interface SoapActionsWANPPPConnection1 : SoapAction {
    }

//SOAP

-(int)SetConnectionTypeWithNewConnectionType:(NSString*)newconnectiontype;
-(int)GetConnectionTypeInfoWithOutNewConnectionType:(NSMutableString*)newconnectiontype OutNewPossibleConnectionTypes:(NSMutableString*)newpossibleconnectiontypes;
-(int)ConfigureConnectionWithNewUserName:(NSString*)newusername NewPassword:(NSString*)newpassword;
-(int)RequestConnection;
-(int)RequestTermination;
-(int)ForceTermination;
-(int)SetAutoDisconnectTimeWithNewAutoDisconnectTime:(NSString*)newautodisconnecttime;
-(int)SetIdleDisconnectTimeWithNewIdleDisconnectTime:(NSString*)newidledisconnecttime;
-(int)SetWarnDisconnectDelayWithNewWarnDisconnectDelay:(NSString*)newwarndisconnectdelay;
-(int)GetStatusInfoWithOutNewConnectionStatus:(NSMutableString*)newconnectionstatus OutNewLastConnectionError:(NSMutableString*)newlastconnectionerror OutNewUptime:(NSMutableString*)newuptime;
-(int)GetLinkLayerMaxBitRatesWithOutNewUpstreamMaxBitRate:(NSMutableString*)newupstreammaxbitrate OutNewDownstreamMaxBitRate:(NSMutableString*)newdownstreammaxbitrate;
-(int)GetPPPEncryptionProtocolWithOutNewPPPEncryptionProtocol:(NSMutableString*)newpppencryptionprotocol;
-(int)GetPPPCompressionProtocolWithOutNewPPPCompressionProtocol:(NSMutableString*)newpppcompressionprotocol;
-(int)GetPPPAuthenticationProtocolWithOutNewPPPAuthenticationProtocol:(NSMutableString*)newpppauthenticationprotocol;
-(int)GetUserNameWithOutNewUserName:(NSMutableString*)newusername;
-(int)GetPasswordWithOutNewPassword:(NSMutableString*)newpassword;
-(int)GetAutoDisconnectTimeWithOutNewAutoDisconnectTime:(NSMutableString*)newautodisconnecttime;
-(int)GetIdleDisconnectTimeWithOutNewIdleDisconnectTime:(NSMutableString*)newidledisconnecttime;
-(int)GetWarnDisconnectDelayWithOutNewWarnDisconnectDelay:(NSMutableString*)newwarndisconnectdelay;
-(int)GetNATRSIPStatusWithOutNewRSIPAvailable:(NSMutableString*)newrsipavailable OutNewNATEnabled:(NSMutableString*)newnatenabled;
-(int)GetGenericPortMappingEntryWithNewPortMappingIndex:(NSString*)newportmappingindex OutNewRemoteHost:(NSMutableString*)newremotehost OutNewExternalPort:(NSMutableString*)newexternalport OutNewProtocol:(NSMutableString*)newprotocol OutNewInternalPort:(NSMutableString*)newinternalport OutNewInternalClient:(NSMutableString*)newinternalclient OutNewEnabled:(NSMutableString*)newenabled OutNewPortMappingDescription:(NSMutableString*)newportmappingdescription OutNewLeaseDuration:(NSMutableString*)newleaseduration;
-(int)GetSpecificPortMappingEntryWithNewRemoteHost:(NSString*)newremotehost NewExternalPort:(NSString*)newexternalport NewProtocol:(NSString*)newprotocol OutNewInternalPort:(NSMutableString*)newinternalport OutNewInternalClient:(NSMutableString*)newinternalclient OutNewEnabled:(NSMutableString*)newenabled OutNewPortMappingDescription:(NSMutableString*)newportmappingdescription OutNewLeaseDuration:(NSMutableString*)newleaseduration;
-(int)AddPortMappingWithNewRemoteHost:(NSString*)newremotehost NewExternalPort:(NSString*)newexternalport NewProtocol:(NSString*)newprotocol NewInternalPort:(NSString*)newinternalport NewInternalClient:(NSString*)newinternalclient NewEnabled:(NSString*)newenabled NewPortMappingDescription:(NSString*)newportmappingdescription NewLeaseDuration:(NSString*)newleaseduration;
-(int)DeletePortMappingWithNewRemoteHost:(NSString*)newremotehost NewExternalPort:(NSString*)newexternalport NewProtocol:(NSString*)newprotocol;
-(int)GetExternalIPAddressWithOutNewExternalIPAddress:(NSMutableString*)newexternalipaddress;

@end
