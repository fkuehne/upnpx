//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

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
