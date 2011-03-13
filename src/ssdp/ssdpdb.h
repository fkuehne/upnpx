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


#ifndef _SSDPDB_H
#define _SSDPDB_H

#include "ssdptools.h"
#include <vector>
#include "ssdpdbdevice.h"
#include "ssdpdbobserver.h"
#include <pthread.h>

using namespace std;


#define CACHE_CONTROL_TIMEOUT 30

class SSDPDB{
public:
	SSDPDB();
	~SSDPDB();

	int Start();
	int Stop();
	
	int AddObserver(SSDPDBObserver* obs);	
	int RemoveObserver(SSDPDBObserver* obs);	
	
	SSDPDBDevice* GetDevice(u8* usn, u32 usnlen);
	SSDPDBDevice* InsertDevice(u8* usn, u32 usnlen);
	int DeleteDevice(u8* usn, u32 usnlen);
	int DeleteDevicesByUuid(u8* uuid, u32 uuidlen);	
	vector<SSDPDBDevice*> GetDevices();

	void Lock();
	void Unlock();
	void DeviceUpdate(SSDPDBDevice* device);
	void ServiceUpdate(SSDPDBDevice* service);
	int UpdateCacheControl(u8* uuid, u32 uuidlen, int cachecontrol);
private:
	vector<SSDPDBDevice*> mDevices;
	vector<SSDPDBObserver*> mObservers;
	pthread_mutexattr_t mMutexAccessAttr;
	pthread_mutex_t mMutexAccess;
	pthread_t mCacheControlThread;
	int CacheControlLoop();
	u8 mRun;
private:
	SSDPDB(const SSDPDB &src);
	SSDPDB& operator= (const SSDPDB &src);		
private:
	static void* sCacheControlLoop(void* data);
};


#endif //_SSDPDB_H