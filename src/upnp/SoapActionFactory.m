// ******************************************************************
//
// This file is part of upnpx.
//
// upnpx is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as 
// published by the Free Software Foundation, either version 3 of the 
// License, or (at your option) any later version.
//
// upnpx is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with upnpx.  If not, see <http://www.gnu.org/licenses/>.
//
// Copyright (C)2011, Bruno Keymolen, email: bruno.keymolen@gmail.com
//
// ******************************************************************


#import "SoapActionFactory.h"

#import "SoapActionsAVTransport1.h"
#import "SoapActionsConnectionManager1.h"
#import "SoapActionsContentDirectory1.h"
#import "SoapActionsRenderingControl1.h"
#import "SoapActionsSwitchPower1.h"
#import "SoapActionsDimming1.h"
#import "SoapActionsWANIPConnection1.h"
#import "SoapActionsWANPPPConnection1.h"

@implementation SoapActionFactory


-(id)init{
	[super init];
	return self;
}


-(void)dealloc{
	
	[super dealloc];
}


-(SoapAction*)allocSoapWithURN:(NSString*)urn andBaseNSURL:(NSURL*)baseURL andControlURL:(NSString*)controlURL andEventURL:(NSString*)eventURL{
	SoapAction *soapaction = nil;
	
	if([urn isEqualToString:@"urn:schemas-upnp-org:service:AVTransport:1"]){

	
		soapaction = [[SoapActionsAVTransport1 alloc]
					  initWithActionURL:[NSURL URLWithString:controlURL relativeToURL:baseURL] 
					  eventURL:[NSURL URLWithString:eventURL relativeToURL:baseURL] 
					  upnpnamespace:urn
					 ];
		
		
	}else if([urn isEqualToString:@"urn:schemas-upnp-org:service:ConnectionManager:1"]){
		
		soapaction = [[SoapActionsConnectionManager1 alloc] 
					  initWithActionURL:[NSURL URLWithString:controlURL relativeToURL:baseURL] 
					  eventURL:[NSURL URLWithString:eventURL relativeToURL:baseURL] 
					  upnpnamespace:urn
					  ];
		

	}else if([urn isEqualToString:@"urn:schemas-upnp-org:service:ContentDirectory:1"]){

		soapaction = [[SoapActionsContentDirectory1 alloc] 
					  initWithActionURL:[NSURL URLWithString:controlURL relativeToURL:baseURL] 
					  eventURL:[NSURL URLWithString:eventURL relativeToURL:baseURL] 
					  upnpnamespace:urn
					  ];
		
	}else if([urn isEqualToString:@"urn:schemas-upnp-org:service:RenderingControl:1"]){

		soapaction = [[SoapActionsRenderingControl1 alloc]	
					  initWithActionURL:[NSURL URLWithString:controlURL relativeToURL:baseURL] 
					  eventURL:[NSURL URLWithString:eventURL relativeToURL:baseURL] 
					  upnpnamespace:urn
					  ];
		
	}else if([urn isEqualToString:@"urn:schemas-upnp-org:service:SwitchPower:1"]){		
		soapaction = [[SoapActionsSwitchPower1 alloc]	
					  initWithActionURL:[NSURL URLWithString:controlURL relativeToURL:baseURL] 
					  eventURL:[NSURL URLWithString:eventURL relativeToURL:baseURL] 
					  upnpnamespace:urn
					  ];

	}else if([urn isEqualToString:@"urn:schemas-upnp-org:service:Dimming:1"]){		
		soapaction = [[SoapActionsDimming1 alloc]	
					  initWithActionURL:[NSURL URLWithString:controlURL relativeToURL:baseURL] 
					  eventURL:[NSURL URLWithString:eventURL relativeToURL:baseURL] 
					  upnpnamespace:urn
					  ];

	}else if([urn isEqualToString:@"urn:schemas-upnp-org:service:WANIPConnection:1"]){		
		soapaction = [[SoapActionsWANIPConnection1 alloc]	
					  initWithActionURL:[NSURL URLWithString:controlURL relativeToURL:baseURL] 
					  eventURL:[NSURL URLWithString:eventURL relativeToURL:baseURL] 
					  upnpnamespace:urn
					  ];
	}else if([urn isEqualToString:@"urn:schemas-upnp-org:service:WANPPPConnection:1"]){		
		soapaction = [[SoapActionsWANPPPConnection1 alloc]	
					  initWithActionURL:[NSURL URLWithString:controlURL relativeToURL:baseURL] 
					  eventURL:[NSURL URLWithString:eventURL relativeToURL:baseURL] 
					  upnpnamespace:urn
					  ];
	}

	
	
	return soapaction;

}


@end
