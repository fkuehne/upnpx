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

#include "ssdpdb.h"

#include <unistd.h>

SSDPDB::SSDPDB(){
	int ret;
	
	ret = pthread_mutexattr_init(&mMutexAccessAttr);
	STAT(ret);
	ret = pthread_mutexattr_settype(&mMutexAccessAttr, PTHREAD_MUTEX_RECURSIVE);
	STAT(ret);
	ret = pthread_mutex_init(&mMutexAccess, &mMutexAccessAttr);
 	STAT(ret);
    ret = pthread_mutex_init(&mMutexRunning, NULL);
    STAT(ret);
		

EXIT:	
	if(ret != 0){
		printf("SSDPDB Error\n");
	}	
}

SSDPDB::~SSDPDB(){
    pthread_mutex_destroy(&mMutexRunning);
	pthread_mutex_destroy(&mMutexAccess);
	pthread_mutexattr_destroy(&mMutexAccessAttr);
}
					

int SSDPDB::Start(){
	int ret = 0;
	pthread_attr_t  attr;
	
	//Start the cache control thread
	ret = pthread_attr_init(&attr);
	STAT(ret);
	ret = pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);
	STAT(ret);
	ret = pthread_create(&mCacheControlThread, &attr, SSDPDB::sCacheControlLoop, (void*)this);		
	pthread_attr_destroy(&attr);
EXIT:
	return ret;
}

int SSDPDB::Stop(){
	mRun = 0;
    
    // wait for the thread to finish
    //pthread_mutex_lock(&mMutexRunning);
    //pthread_mutex_unlock(&mMutexRunning);
    
	return 0;
}


void SSDPDB::Lock(){
	pthread_mutex_lock(&mMutexAccess);
}

void SSDPDB::Unlock(){
	pthread_mutex_unlock(&mMutexAccess);
}


SSDPDBDevice* SSDPDB::InsertDevice(u8* usn, u32 usnlen){
	SSDPDBDevice* thisdevice = new SSDPDBDevice();
	thisdevice->usn.assign((const char*)usn, (size_t)usnlen);
	
	Lock();
	mDevices.push_back(thisdevice);
	Unlock();
	
	return thisdevice;
}

int SSDPDB::DeleteDevice(u8* usn, u32 usnlen){
	int tel = 0;
	SSDPDBDevice* thisdevice = NULL;
	int updated = 0;
	
	Lock();
	int i=0;
	while(i<mDevices.size()){
		thisdevice = mDevices[i];
		if( (thisdevice->usn.length() == usnlen &&  memcmp(thisdevice->usn.c_str(), usn, usnlen) == 0) ){
			mDevices.erase(mDevices.begin()+i);		
			delete(thisdevice);
			updated++;
		}else{
			i++;
		}
	}			
	Unlock();

	if(updated > 0){
		DeviceUpdate(NULL);
	}
	
	return tel;	
}

int SSDPDB::DeleteAllDevices()
{
    int tel = 0;
	SSDPDBDevice* thisdevice = NULL;
	int updated = 0;
	
	Lock();
	int i=0;
	while(i<mDevices.size()){
		thisdevice = mDevices[i];
        mDevices.erase(mDevices.begin()+i);
        delete(thisdevice);
        updated++;
	}
	Unlock();
    
	if(updated > 0){
		DeviceUpdate(NULL);
	}
	
	return tel;
}


int SSDPDB::DeleteDevicesByUuid(u8* uuid, u32 uuidlen){
	int tel = 0;
	SSDPDBDevice* thisdevice = NULL;
	int updated = 0;
	
	Lock();
	int i=0;
	while(i<mDevices.size()){
		thisdevice = mDevices[i];
        mDevices.erase(mDevices.begin()+i);
        delete(thisdevice);
        updated++;
	}			
	Unlock();
	
	if(updated > 0){
		DeviceUpdate(NULL);
	}
	
	return tel;	
}


SSDPDBDevice* SSDPDB::GetDevice(u8* usn, u32 usnlen){
	SSDPDBDevice *result = NULL;
	SSDPDBDevice *thisdevice = NULL;
	
	if(mDevices.size() <= 0){
		return NULL;
	}
	
	vector<SSDPDBDevice*>::const_iterator it;
	it=mDevices.begin();
	while(it < mDevices.end()){
		thisdevice = *it; 
		if( (thisdevice->usn.length() == usnlen &&  memcmp(thisdevice->usn.c_str(), usn, usnlen) == 0) ){
			result = thisdevice;
			break;
		}
		it++;
	}
	
	return result;
}




vector<SSDPDBDevice*> SSDPDB::GetDevices(){
	return mDevices;
}



int SSDPDB::AddObserver(SSDPDBObserver* observer){
	RemoveObserver(observer);
	mObservers.push_back(observer);
	return 0;
}

int SSDPDB::RemoveObserver(SSDPDBObserver* observer){
	u8 found = 0;
	int tel = 0;
	std::vector<SSDPDBObserver*>::iterator it;
	for(it=mObservers.begin(); it<mObservers.end(); it++){
		if(observer == *it){
			//Remove this one and stop
			found = 1;
			break;
		}
		tel++;
	}
	if(found){
		mObservers.erase(mObservers.begin()+tel);
	}
	return 0;
	
}


void SSDPDB::DeviceUpdate(SSDPDBDevice* device){
	SSDPDBMsg msg;
	std::vector<SSDPDBObserver*>::iterator it;
	msg.type = SSDPDBMsg_DeviceUpdate;
	for(it=mObservers.begin(); it<mObservers.end(); it++){
		((SSDPDBObserver*)*it)->SSDPDBMessage(&msg);
	}
}

void SSDPDB::ServiceUpdate(SSDPDBDevice* service){
	SSDPDBMsg msg;
	std::vector<SSDPDBObserver*>::iterator it;
	msg.type = SSDPDBMsg_ServiceUpdate;
	for(it=mObservers.begin(); it<mObservers.end(); it++){
		((SSDPDBObserver*)*it)->SSDPDBMessage(&msg);
	}
}


int SSDPDB::UpdateCacheControl(u8* uuid, u32 uuidlen, int cachecontrol){
	int tel = 0;
	SSDPDBDevice* thisdevice = NULL;

	Lock();
	vector<SSDPDBDevice*>::const_iterator it;
	it=mDevices.begin();
	while(it < mDevices.end()){
		thisdevice = *it; 
		if( (thisdevice->uuid.length() == uuidlen &&  memcmp(thisdevice->uuid.c_str(), uuid, uuidlen) == 0) ){
			thisdevice->cachecontrol = cachecontrol;
			thisdevice->lastupdate = systimeinseconds;
			tel++;
		}
		it++;
	}
	Unlock();

	return tel;
}

	
int SSDPDB::CacheControlLoop(){
	mRun = 1;
	SSDPDBDevice* thisdevice = NULL;
	vector<SSDPDBDevice*>::iterator it;
	int nows;
	u8 updated;
    
    // grab the lock
    pthread_mutex_lock(&mMutexRunning);
    
	while(mRun){		
		sleep(CACHE_CONTROL_TIMEOUT);
		
		Lock();
		updated = 0;
		nows = time(NULL);
		int i=0;
		while(i<mDevices.size()){
			thisdevice = mDevices[i];
			if(thisdevice->lastupdate + thisdevice->cachecontrol <= nows){
				mDevices.erase(mDevices.begin()+i);		
				delete(thisdevice);
				updated++;
			}else{
				i++;
			}
		}				
		Unlock();
		
		if(updated > 0){
			DeviceUpdate(NULL);
		}
	}
    
    // release the lock
    pthread_mutex_unlock(&mMutexRunning);
	
	return 0;
}
	
	
	
void* SSDPDB::sCacheControlLoop(void* data){
	SSDPDB* pthis = (SSDPDB*)data;
	pthis->CacheControlLoop();
	return NULL;
}

