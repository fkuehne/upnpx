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


#import "SoapAction.h"


@implementation SoapAction


-(id)initWithActionURL:(NSURL*)aUrl eventURL:(NSURL*)eUrl upnpnamespace:(NSString*)ns{
	[super initWithNamespaceSupport:YES];
	actionURL = aUrl;
	eventURL = eUrl;
	upnpNameSpace = ns;
	[actionURL retain];
	[eventURL retain];
	[upnpNameSpace retain];
	
	
	return self;
}

-(void)dealloc{
	[actionURL release];
	[eventURL release];
	[upnpNameSpace release];
	[super dealloc];
}




-(int)action:(NSString*)soapAction parameters:(NSDictionary*)parameters returnValues:(NSDictionary*)output{
	int len=0;
	int ret = 0;
	
	mOutput = output;//we need it as a member to fill it during parsing
	
	//SOAP Message to Send
	NSMutableString *body = [[NSMutableString alloc] init];
	[body appendString:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"];
	[body appendString:@"<s:Envelope s:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:s=\"http://schemas.xmlsoap.org/soap/envelope/\">"];
	[body appendString:@"<s:Body>"];
	[body appendFormat:@"<u:%@ xmlns:u=\"%@\">", soapAction, upnpNameSpace];
	for (id key in parameters) {		
		[body appendFormat:@"<%@>%@</%@>", key, [parameters objectForKey:key], key];
	}
	[body appendFormat:@"</u:%@>", soapAction];
	[body appendFormat:@"</s:Body></s:Envelope>"];
	len = [body length];

	//Construct the HTML POST 
	NSMutableURLRequest* urlRequest=[NSMutableURLRequest requestWithURL:actionURL
															cachePolicy:NSURLRequestReloadIgnoringCacheData
														timeoutInterval:15.0];
	
	[urlRequest setValue:[NSString stringWithFormat:@"\"%@#%@\"", upnpNameSpace, soapAction] forHTTPHeaderField:@"SOAPACTION"];
	[urlRequest setValue:[NSString stringWithFormat:@"%d", len] forHTTPHeaderField:@"CONTENT-LENGTH"];
	[urlRequest setValue:@"text/xml; charset=\"utf-8\"" forHTTPHeaderField:@"CONTENT-TYPE"];

	/*
	[urlRequest setValue:@"" forHTTPHeaderField:@"Accept-Language"];
	[urlRequest setValue:@"" forHTTPHeaderField:@"Accept-Encoding"];
	*/
	
	//POST (Synchronous)
	[urlRequest setHTTPMethod:@"POST"];	
	[urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]]; 
	
	
	
	NSHTTPURLResponse *urlResponse;
	NSData *resp = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&urlResponse error:nil];
	
	//Check the Server Return Code @TODO
	if([urlResponse statusCode] != 200){
		ret = 0-[urlResponse statusCode];	
		NSLog(@"Server Staus Code=%d", [urlResponse statusCode]);
		NSLog(@"Request=%@", body);
		NSString *rsp = [[NSString  alloc] initWithData:resp encoding:NSUTF8StringEncoding];
		NSLog(@"Response=%@", rsp);
		[rsp release];
	}else{
		ret = 0;
	}
	
	if(ret == 0 && [resp length] > 0 ){
		//Parse result
		//Clear the assets becuase the action can be re-used
		[self clearAllAssets];
		NSString *responseGroupTag = [NSString stringWithFormat:@"%@Response", soapAction];
		for (id key in output) {		
			[self addAsset:[NSArray arrayWithObjects: @"Envelope", @"Body", responseGroupTag, (NSString*)key, nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setStringValueForFoundAsset:) setStringValueObject:self];
		}
				
		//uShare Issues here, can not handle names like 'Bj~rk
		ret = [super parseFromData:resp]; 
		
	}	
	
	mOutput = nil;
	
	return ret;
}


-(void)setStringValueForFoundAsset:(NSString*)value{
	if(value != nil){
		//Check which asset is active in our stack
		BasicParserAsset* asset = [self getAssetForElementStack:mElementStack];
		if(asset != nil){
			NSString *elementName = [[asset path] lastObject];
			if(elementName != nil){
				NSMutableString *output = [mOutput objectForKey:elementName];
				if(output != nil){	
					[output setString:value];
				}
			}
		}
	}	
}



@end
