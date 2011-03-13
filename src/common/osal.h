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


#ifndef _OSAL_H
#define _OSAL_H

#include <sys/types.h>
#include <sys/socket.h>
#include <errno.h>


/**
 * Data types
 */
#define u8 unsigned char
#define u16 unsigned short
#define u32 unsigned int

#define s8 signed char
#define s16 signed short
#define s32 signed int



/**
 * Sockets
 */
#define SOCKET int
#define INVALID_SOCKET -1
#define SOCKET_ERROR -1


/**
 * Functions
 */
//#define systimeinseconds (int)CFAbsoluteTimeGetCurrent()
#define systimeinseconds time(NULL)

/**
 *
 */
#define STATVAL(ret, excepted, jump) if(ret != excepted){printf("stat error, ret=%d, excepted=%d, errno=%d, line=%d, %s:%s\n", ret, excepted, errno, __LINE__, __FILE__, __FUNCTION__);goto jump; }
#define STAT(ret) STATVAL(ret, 0, EXIT)
#define STATNVAL(ret, notexcepted, jump)if(ret == notexcepted){printf("stat error, ret=%d, not excepted=%d, errno=%d, line=%d, %s:%s\n", ret, notexcepted, errno, __LINE__, __FILE__, __FUNCTION__);goto jump; }

#endif //_OSAL_H