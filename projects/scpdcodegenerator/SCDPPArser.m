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


#import "SCDPPArser.h"




@implementation SCDPPArser

@synthesize actionName;
@synthesize thisArgumentName;
@synthesize thisArgumenStateVariable;
@synthesize thisArgumenDirection;


-(id)initWithXMLLocation:(NSString*)xmlLoc output:(NSString*)output{// nameSpace:(NSString*)ns{
	[super init];
	mXMLLoc = xmlLoc;
	[mXMLLoc retain];
	mOutput = output;
	[mOutput retain];
//	mNamespace = ns;
//	[mNamespace retain];
	
	actionArgumentListIn = [[NSMutableArray alloc] init];
	actionArgumentListOut = [[NSMutableArray alloc] init];
	
	header = [[NSMutableString alloc] init];
	source = [[NSMutableString alloc] init];

	
	[self empty];

	
	return self;
}

-(void)empty{
	[actionArgumentListIn removeAllObjects];
	[actionArgumentListOut removeAllObjects];
	actionName = nil;
	thisArgumentName = nil;
	thisArgumenStateVariable = nil;
	thisArgumenDirection = nil;
}


-(void)dealloc{
	[actionName release] ;
	[actionArgumentListIn release] ;
	[actionArgumentListOut release] ;
	[thisArgumentName release] ;
	[thisArgumenStateVariable release] ;
	[thisArgumenDirection release] ;

	[header release];
	[source release];
	
	[mXMLLoc release];
	[mOutput release];
//	[mNamespace release];
	
	[super dealloc];
}


-(int)parse{
	int ret = 0;
	
	[self clearAllAssets];

	[self addAsset:[NSArray arrayWithObjects: @"scpd", @"actionList", @"action", nil] callfunction:@selector(action:) functionObject:self setStringValueFunction:nil setStringValueObject:nil];
	[self addAsset:[NSArray arrayWithObjects: @"scpd", @"actionList", @"action", @"name", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setActionName:) setStringValueObject:self];

	[self addAsset:[NSArray arrayWithObjects: @"scpd", @"actionList", @"action", @"argumentList", @"argument", nil] callfunction:@selector(argument:) functionObject:self setStringValueFunction:nil setStringValueObject:nil];
	[self addAsset:[NSArray arrayWithObjects: @"scpd", @"actionList", @"action", @"argumentList", @"argument", @"name", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setThisArgumentName:) setStringValueObject:self];
	[self addAsset:[NSArray arrayWithObjects: @"scpd", @"actionList", @"action", @"argumentList", @"argument", @"direction", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setThisArgumenDirection:) setStringValueObject:self];
	[self addAsset:[NSArray arrayWithObjects: @"scpd", @"actionList", @"action", @"argumentList", @"argument", @"relatedStateVariable", nil] callfunction:nil functionObject:nil setStringValueFunction:@selector(setThisArgumenStateVariable:) setStringValueObject:self];
	
	
	NSString *headerName = [NSString stringWithFormat:@"SoapActions%@.h", mOutput];
	NSString *sourceName = [NSString stringWithFormat:@"SoapActions%@.m", mOutput];

	
	[header setString:@""];
	[source setString:@""];
	
	//Top
	[header appendString:@"//Auto Generated file.\r\n"];
	[header appendString:@"//This file is part of the upnox project.\r\n"];
	[header appendString:@"//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.\r\n\r\n"];
	[header appendString:@"#import <Foundation/Foundation.h>\r\n#import \"SoapAction.h\"\r\n#import \"OrderedDictionary.h\"\r\n"];

	[header appendString:@"\r\n"];

	[header appendFormat:@"@interface SoapActions%@ : SoapAction {\r\n    ", mOutput];
	[header appendString:@"}\r\n"];
	[header appendString:@"\r\n"];
	[header appendString:@"//SOAP\r\n"];

		
	[source appendString:@"//Auto Generated file.\r\n"];
	[source appendString:@"//This file is part of the upnox project.\r\n"];
	[source appendString:@"//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.\r\n\r\n"];
	[source appendFormat:@"#import \"%@\"\r\n\r\n", headerName];
	[source appendFormat:@"@implementation SoapActions%@\r\n\r\n", mOutput];
	
	

	//Body
	NSData *data = [NSData dataWithContentsOfFile:mXMLLoc];
	ret = [super parseFromData:data];
	
	
	//Footer
	[header appendString:@"\r\n\r\n@end\r\n"];
	[source appendString:@"\r\n\r\n@end\r\n"];
	
	
	NSLog(@"Header:\r\n%@", header);
	NSLog(@"Source:\r\n%@", source);
	
	//Write to files
	[header writeToFile:headerName atomically:YES];
	[source writeToFile:sourceName atomically:YES];
	
	
	return ret;
}


-(void)action:(NSString*)startStop{
	if([startStop isEqualToString:@"ElementStart"]){
		[self empty];
	}else{
		//We hava all action info, create code now
		NSLog(@"action done");
		[self createActionFuntion];
	}
}


-(void)argument:(NSString*)startStop{
	if([startStop isEqualToString:@"ElementStart"]){
	}else{
		//We hava all action info, create code now
		NSLog(@"argument done");
		if([thisArgumenDirection isEqualToString:@"in"]){
			[actionArgumentListIn addObject:thisArgumentName];
		}else{
			[actionArgumentListOut addObject:thisArgumentName];		
		}
	}
}




-(void)createActionFuntion{
	NSMutableString *o = [[NSMutableString alloc] init];
	NSMutableString *h = [[NSMutableString alloc] init];
	int x = 0;
	int s = 0;
	
	
	//-(int)listPresetsWithInstance:(NSString*)instanceID presetsOut:(NSMutableString*)presetsRet{
	[o appendFormat:@"\r\n-(int)%@", actionName];
	if([actionArgumentListIn count] > 0){
		[o appendFormat:@"With%@:(NSString*)%@", [actionArgumentListIn objectAtIndex:0], [(NSString*)[actionArgumentListIn objectAtIndex:0] lowercaseString]];
		if([actionArgumentListIn count] > 1){
			for(x=1;x<[actionArgumentListIn count];x++){
				[o appendFormat:@" %@:(NSString*)%@", [actionArgumentListIn objectAtIndex:x], [(NSString*)[actionArgumentListIn objectAtIndex:x] lowercaseString]];	
			}
		}
	}
	if([actionArgumentListOut count] > 0){
		s = 0;
		if([actionArgumentListIn count] == 0){
			[o appendFormat:@"WithOut%@:(NSMutableString*)%@", [actionArgumentListOut objectAtIndex:0], [(NSString*)[actionArgumentListOut objectAtIndex:0] lowercaseString]];
			s = 1;
		}		
		if([actionArgumentListOut count] > s){
			for(x=s;x<[actionArgumentListOut count];x++){
				[o appendFormat:@" Out%@:(NSMutableString*)%@", [actionArgumentListOut objectAtIndex:x], [(NSString*)[actionArgumentListOut objectAtIndex:x] lowercaseString]];	
			}
		}		
	}
	[h appendFormat:@"%@;", o];
	
	[o appendString:@"{\r\n    "];
	[o appendString:@"int ret = 0;\r\n\r\n    "];

	
	[o appendString:@"NSDictionary *parameters = nil;\r\n    "];
	[o appendString:@"NSDictionary *output = nil;\r\n    "];
	
	
	if([actionArgumentListIn count] > 0){
		[o appendString:@"NSArray *parameterKeys = nil;\r\n    "];
		[o appendString:@"NSArray *parameterObjects = nil;\r\n    "];

		//	NSArray *parameterKeys		= [NSArray arrayWithObjects:@"InstanceID",	nil];	
		[o appendString:@"parameterKeys = [NSArray arrayWithObjects:"];
		for(x=0;x<[actionArgumentListIn count];x++){
			[o appendFormat:@"@\"%@\", ",	[actionArgumentListIn objectAtIndex:x]];
		}
		[o appendString: @"nil];\r\n    "];
		//NSArray *parameterObjects	= [NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", instanceID],  nil];	
		[o appendString:@"parameterObjects = [NSArray arrayWithObjects:"];
		for(x=0;x<[actionArgumentListIn count];x++){
			[o appendFormat:@"%@, ",	[(NSString*)[actionArgumentListIn objectAtIndex:x] lowercaseString]];
		}
		[o appendString: @"nil];\r\n    "];
		[o appendString: @"parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];\r\n\r\n    "];
	}		
	
	if([actionArgumentListOut count] > 0){
		[o appendString:@"NSArray *outputObjects = nil;\r\n    "];
		[o appendString:@"NSArray *outputKeys = nil;\r\n    "];	

		//NSArray *outputKeys			= [NSArray arrayWithObjects:@"CurrentPresetNameList",	nil];
		[o appendString:@"outputKeys = [NSArray arrayWithObjects:"];
		for(x=0;x<[actionArgumentListOut count];x++){
			[o appendFormat:@"@\"%@\", ",	[actionArgumentListOut objectAtIndex:x]];
		}
		[o appendString: @"nil];\r\n    "];		
		//NSArray *outputObjects		= [NSArray arrayWithObjects:currentPresetString,		nil];	
		[o appendString:@"outputObjects = [NSArray arrayWithObjects:"];
		for(x=0;x<[actionArgumentListOut count];x++){
			[o appendFormat:@"%@, ",	[(NSString*)[actionArgumentListOut objectAtIndex:x] lowercaseString]];
		}
		[o appendString: @"nil];\r\n    "];
		[o appendString: @"output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];\r\n\r\n    "];
	}
	
	[o appendFormat:@"ret = [self action:@\"%@\" parameters:parameters returnValues:output];\r\n    ", actionName];
	[o appendString: @"return ret;\r\n"];
	[o appendString: @"}\r\n\r\n"];
	
	
	
	NSLog(@"%@", h);
	NSLog(@"%@", o);
	
	[header appendString:h];
	[source appendString:o];
	
	[o release];
	[h release];
}



@end
