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

#import "SoapActionsRendering.h"


#import "OrderedDictionary.h"

@implementation SoapActionsRendering


-(id)initWithService:(BasicUPnPService*)service{
    self = [super initWithActionURL:[NSURL URLWithString:[service controlURL] relativeToURL:[service baseURL]] 
                           eventURL:[NSURL URLWithString:[service eventURL] relativeToURL:[service baseURL]] 
                      upnpnamespace:@"urn:schemas-upnp-org:service:RenderingControl:1"];
    
    if (self) {
        /* TODO: set upnpservice as retain property */
        upnpservice = service;
        [upnpservice retain];
	}
    
	return self;
}

-(void)dealloc{
	[upnpservice release];
	
	[super dealloc];
}

-(int)getVolume{
	return [self getVolumeForInstance:0 andChannel:@"Master"];
}

-(int)getVolumeForInstance:(int)instanceID  andChannel:(NSString*)channel{
	int ret = 0;
	
	NSMutableString *currentVolumeString = [[NSMutableString alloc] init]; 
	
	NSArray *parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"Channel", nil];
	NSArray *parameterObjects = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", instanceID], channel, nil];	
	NSDictionary *parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];
	NSArray *outputKeys = [NSArray arrayWithObjects:@"CurrentVolume", nil];
	NSArray *outputObjects = [NSArray arrayWithObjects:currentVolumeString, nil];	
	NSDictionary *output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];
	
	ret = [self action:@"GetVolume" parameters:parameters returnValues:output];

	if(ret == 0){
		//Cast the return to a int
		ret = [currentVolumeString intValue];
	}
	[currentVolumeString release];
	
	return ret;
}




-(int)getVolumeDB{
	return [self getVolumeDBForInstance:0 andChannel:@"Master"];
}

-(int)getVolumeDBForInstance:(int)instanceID  andChannel:(NSString*)channel{
	int ret = 0;
	
	NSMutableString *currentVolumeString = [[NSMutableString alloc] init]; 
	
	NSArray *parameterKeys = [NSArray arrayWithObjects:@"InstanceID", @"Channel", nil];
	NSArray *parameterObjects = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", instanceID], channel, nil];	
	NSDictionary *parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];
	NSArray *outputKeys = [NSArray arrayWithObjects:@"CurrentVolume", nil];
	NSArray *outputObjects = [NSArray arrayWithObjects:currentVolumeString, nil];	
	NSDictionary *output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];
	
	ret = [self action:@"GetVolumeDB" parameters:parameters returnValues:output];
	
	if(ret == 0){
		//Cast the return to a int
		ret = [currentVolumeString intValue];
	}
	[currentVolumeString release];
	
	return ret;
}


-(int)listPesets:(NSMutableString*)presetsRet{
	return [self listPresetsForInstance:0 presetsOut:presetsRet];
}

-(int)listPresetsForInstance:(int)instanceID presetsOut:(NSMutableString*)presetsRet{
	int ret = 0;
	
	NSMutableString *currentPresetString = [[NSMutableString alloc] init]; 	
	NSArray *parameterKeys		= [NSArray arrayWithObjects:@"InstanceID",									nil];
	NSArray *parameterObjects	= [NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", instanceID],  nil];		
	NSDictionary *parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];
	
	NSArray *outputKeys			= [NSArray arrayWithObjects:@"CurrentPresetNameList",	nil];
	NSArray *outputObjects		= [NSArray arrayWithObjects:currentPresetString,		nil];	
	NSDictionary *output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];
	
	ret = [self action:@"ListPresets" parameters:parameters returnValues:output];
	
	if(ret == 0){
		if(presetsRet != nil){
			[presetsRet setString:currentPresetString];
		}
	}
	[currentPresetString release];
	
	return ret;
}



@end
