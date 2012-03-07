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
    self = [super init];
    
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
