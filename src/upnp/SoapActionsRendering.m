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

#import "SoapActionsRendering.h"


@implementation SoapActionsRendering


-(id)initWithService:(BasicUPnPService*)service{
	[super initWithActionURL:[NSURL URLWithString:[service controlURL] relativeToURL:[service baseURL]] 
					eventURL:[NSURL URLWithString:[service eventURL] relativeToURL:[service baseURL]] 
			   upnpnamespace:@"urn:schemas-upnp-org:service:RenderingControl:1"];
	upnpservice = service;
	[upnpservice retain];
	
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
	NSDictionary *parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];
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
	NSDictionary *parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];
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
	NSDictionary *parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];
	
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
