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


#ifndef _TOOLS_H_
#define _TOOLS_H_

#include "osal.h"

#define UUID_LEN 36

void hexdump(u8* buf, u32 len);
int createUUID(char uuid[UUID_LEN]);
u8* lefttrim(u8* buf, u32 len);
u32 righttrim(u8* buf, u32 len);
int caseinstringcmp(u8* string1, u32 len1, u8* string2, u32 len2);
void trimspaces(u8** buf, u32* len);
int getchar(u8* buf, u32 len, char c);
int getchar(u8* buf, u32 len, char c, int seq);


#endif //_TOOLS_H_