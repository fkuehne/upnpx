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


#import "CocoaTools.h"

@implementation NSString(AcranegraExtentions)

-(NSString*)XMLUnEscape{
	if([self length] < 2){
		return self;
	}
	
	NSString *returnStr = nil;

	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	returnStr = [ self stringByReplacingOccurrencesOfString:@"&amp;" withString: @"&"  ];	
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"&#x27;" withString:@"'"];	
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"&#x39;" withString:@"'"];	
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"&#x92;" withString:@"'"];
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"&#x96;" withString:@"'"];
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"&#10;" withString:@"\n"];
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"&#13;" withString:@"\r"];
	
	returnStr = [ [ NSString alloc ] initWithString:returnStr];
	
	[pool release];
	
	[returnStr autorelease]; 

	return returnStr;
}


-(NSString*)XMLEscape{
	if([self length] < 2){
		return self;
	}
	
	NSString *returnStr = nil;
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	//First remove all eventually escape codes because it makes it impossible to distinguish during unescape
	returnStr = [ self stringByReplacingOccurrencesOfString:@"&amp;" withString: @"."  ];	
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"&quot;" withString:@"."];
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"&#x27;" withString:@"."];	
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"&#x39;" withString:@"."];	
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"&#x92;" withString:@"."];
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"&#x96;" withString:@"."];
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"&gt;" withString:@"."];
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"&lt;" withString:@"."];
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"&#10;" withString:@"."];
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"&#13;" withString:@"."];
	
	//Escape
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"&" withString: @"&amp;"  ];	
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"];
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"'" withString:@"&#x27;"];	
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@">" withString:@"&gt;"];
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"<" withString:@"&lt;"];
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"\n" withString:@"&#10;"];
	returnStr = [ returnStr stringByReplacingOccurrencesOfString:@"\r" withString:@"&#13;"];
	
	returnStr = [ [ NSString alloc ] initWithString:returnStr];
	
	[pool release];
	
	[returnStr autorelease]; 
	
	return returnStr;
}



//hh:mm:ss -> seconds
-(int)HMS2Seconds{
	int s = 0;
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	NSArray *items = [self componentsSeparatedByString:@":"];
	if([items count] == 3){
		//hh
		s = s + [(NSString*)[items objectAtIndex:0] intValue] * 60 * 60;		
		//mm
		s = s + [(NSString*)[items objectAtIndex:1] intValue] * 60;
		//ss
		s = s + [(NSString*)[items objectAtIndex:2] intValue];
	}
	
	[pool release];

	return s;
}

//seconds -> hh:mm:ss 
+(NSString*)Seconds2HMS:(int)seconds{
	NSString *ret = nil;
	if(seconds > 0){
		int hh = (int) (seconds / 60 / 60);
		int mm = (int) ((seconds / 60) %  60 );
		int ss = (int) (seconds % 60 );
		ret = [NSString stringWithFormat:@"%.2d:%.2d:%.2d", hh, mm, ss];
	}else{
		ret = @"00:00:00";
	}
	
	return ret;	
}


@end




@implementation CocoaTools

@end
