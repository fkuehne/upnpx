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


#include "tools.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void hexdump(u8* buf, u32 len){
	for(u32 pos=0;pos<len;pos++){
		printf("%02x ", buf[pos]);
		if(pos%32 == 0 && pos !=0){
			printf("\n");
		}
	}
   printf("\n");
}



int createUUID(char uuid[UUID_LEN]){
	static u8 _rand_init = 0;
	static char randstate[2048];
	if(_rand_init == 0){
		initstate(time(NULL), randstate, 2048);
		setstate(randstate);
		_rand_init = 1;
	}
	
	u32 r[8];
	for(int x=0;x<8;x++){
		r[x] = random();
	}
	//Make repres
	//Fix this
	sprintf(uuid, "%02X%02X%02X%02X-%02X%02X-%02X%02X-%02X%02X%02X%02X%02X%02X", r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7]);

	return 0;
}


u8* lefttrim(u8* buf, u32 len){
	if(len==0){
		return buf;
	}
	u8* pos = buf;
	while(pos<=(buf+len) && *pos==' '){
		pos++;
	}
	return pos;
}

u32 righttrim(u8* buf, u32 len){
	if(len==0){
		return len;
	}
	u8* pos = buf+len-1;
	while(pos>=buf && *pos==' '){
		pos--;
	}
	return (pos-buf)+1;
}


int caseinstringcmp(u8* string1, u32 len1, u8* string2, u32 len2){
	u8 ret = 0;
	
	if(len1 == len2){
		for(int tel=0;tel<len1;tel++){
			if( (string1[tel] >= 'A' && string1[tel]<='Z') || (string1[tel] >= 'a' && string1[tel]<='z') ){
				if( (string1[tel] == string2[tel]) || (string1[tel]+32 == string2[tel]) || (string1[tel]-32 == string2[tel]) ){
					//equal
				}else{
					if(string1[tel] > string2[tel]){
						ret = 1;					
					}else if(string1[tel] < string2[tel]){
						ret = -1;
					}
				}				
			}else{
				if(string1[tel] > string2[tel]){
					ret = 1;					
				}else if(string1[tel] < string2[tel]){
					ret = -1;
				}
			}
			if(ret != 0){
				break;
			}
		}
	}else{
		ret = -1;
	}
	
	return ret;
}

void trimspaces(u8** buf, u32* len){
	u8 *b = *buf;
	u32 l = *len;
	//left
	b = lefttrim(*buf, *len);
	l = l - (b - *buf);
	//right
	l = righttrim(b, l);
	
	*buf = b;
	*len = l;
}


int getchar(u8* buf, u32 len, char c){
	int ret = -1;
	for(int x=0;x<len;x++){
		if(buf[x]==c){
			ret=x;
			break;
		}
	}
	return ret;
}

int getchar(u8* buf, u32 len, char c, int seq){
	int ret = -1;
	int found=0;
	for(int x=0;x<len;x++){
		if(buf[x]==c){
			found++;
			if(found==seq){
				ret=x;
				break;
			}
		}
	}
	return ret;
}