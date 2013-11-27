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

@interface SoapActionsLANHostConfigManagement1 : SoapAction {
    }

//SOAP

-(int)SetDHCPServerConfigurableWithNewDHCPServerConfigurable:(NSString*)newdhcpserverconfigurable;
-(int)GetDHCPServerConfigurableWithOutNewDHCPServerConfigurable:(NSMutableString*)newdhcpserverconfigurable;
-(int)SetDHCPRelayWithNewDHCPRelay:(NSString*)newdhcprelay;
-(int)GetDHCPRelayWithOutNewDHCPRelay:(NSMutableString*)newdhcprelay;
-(int)SetSubnetMaskWithNewSubnetMask:(NSString*)newsubnetmask;
-(int)GetSubnetMaskWithOutNewSubnetMask:(NSMutableString*)newsubnetmask;
-(int)SetIPRouterWithNewIPRouters:(NSString*)newiprouters;
-(int)DeleteIPRouterWithNewIPRouters:(NSString*)newiprouters;
-(int)GetIPRoutersListWithOutNewIPRouters:(NSMutableString*)newiprouters;
-(int)SetDomainNameWithNewDomainName:(NSString*)newdomainname;
-(int)GetDomainNameWithOutNewDomainName:(NSMutableString*)newdomainname;
-(int)SetAddressRangeWithNewMinAddress:(NSString*)newminaddress NewMaxAddress:(NSString*)newmaxaddress;
-(int)GetAddressRangeWithOutNewMinAddress:(NSMutableString*)newminaddress OutNewMaxAddress:(NSMutableString*)newmaxaddress;
-(int)SetReservedAddressWithNewReservedAddresses:(NSString*)newreservedaddresses;
-(int)DeleteReservedAddressWithNewReservedAddresses:(NSString*)newreservedaddresses;
-(int)GetReservedAddressesWithOutNewReservedAddresses:(NSMutableString*)newreservedaddresses;
-(int)SetDNSServerWithNewDNSServers:(NSString*)newdnsservers;
-(int)DeleteDNSServerWithNewDNSServers:(NSString*)newdnsservers;
-(int)GetDNSServersWithOutNewDNSServers:(NSMutableString*)newdnsservers;

@end
