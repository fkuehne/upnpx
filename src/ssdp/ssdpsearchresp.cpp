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
// NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;LOSS OF USE, DATA, OR 
// PROFITS;OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
// POSSIBILITY OF SUCH DAMAGE.
//
// **********************************************************************************


#include "ssdpsearchresp.h"

SSDPSearchResp::SSDPSearchResp(){
    AddSignatureHeader((char*)"CACHE-CONTROL", (char*)"");
    AddSignatureHeader((char*)"EXT", (char*)"");
    AddSignatureHeader((char*)"LOCATION", (char*)"");
    AddSignatureHeader((char*)"SERVER", (char*)"");
    AddSignatureHeader((char*)"ST", (char*)"");
    AddSignatureHeader((char*)"USN", (char*)"");
    /*
    AddSignatureHeader("BOOTID.UPNP.ORG", "");
     */
}

void SSDPSearchResp::ReInit(){
}


int SSDPSearchResp::Process(struct sockaddr* sender, std::vector<SSDP_HTTP_HEADER*> msgheaders){
    u8* usn;
    int usnlen;
    int ret;
    u8* val;
    int vallen;
    int cache;
    SSDPDBDevice *device;
    //SSDPDBService *service;
    ssdpuuid uuid;



    //Get the Device USN (Unique Service Name)
    ret=GetHeaderValueFromCollection(msgheaders, (u8*)"USN", 3, &usn, &usnlen);
    if(ret != 0 || usnlen<=0){
        ret = -1;
        goto EXIT;
    }

    ret = ParseUSN(usn, usnlen, &uuid);
    if(ret < 0){
        goto EXIT;//Unknown format
    }


    mDB->Lock();


    //Device or service update

    //Is the device already registered ?
    device = mDB->GetDevice(usn, usnlen);

    GetHeaderValueFromCollection(msgheaders, (u8*)"CACHE-CONTROL", 13, &val, &vallen);
    cache = cachecontroltoi(val, vallen);

    if(device == NULL && cache >= 0){ //cachecontrol is mandatory, if not formatted well we ignore all to avoid conflicts with the db cleanup
        device = mDB->InsertDevice(usn, usnlen);
        memcpy(&(device->ip), (u8*)sender->sa_data+2, 4);
        memcpy(&(device->port), sender->sa_data, 2);
        device->port = ntohs(device->port);

        //uuid
        device->uuid.assign((const char*)uuid.uuid, uuid.uuidlen);
        device->isroot = uuid.isrootdevice;
        device->isdevice = uuid.isdevice;
        device->isservice = uuid.isservice;
        device->type.assign((const char*)uuid.type, uuid.typelen);
        if(!device->isroot){
            device->urn.assign((const char*)uuid.fullurn, uuid.fullurnlen);
            device->version.assign((const char*)uuid.version, uuid.versionlen);
        }
        //host
        GetHeaderValueFromCollection(msgheaders, (u8*)"HOST", 4, &val, &vallen);
        device->host.assign((const char*)val, vallen);
        //Location
        GetHeaderValueFromCollection(msgheaders, (u8*)"LOCATION", 8, &val, &vallen);
        device->location.assign((const char*)val, vallen);


        //Workaround for MusicPal bug
        int wrongloc = device->location.find("://127.0.0.1");
        if(wrongloc > 0){
            //replace 127.0.0.1 with source ip address
            char ipbuf[255];
            sprintf(ipbuf, "://%d.%d.%d.%d", (unsigned char)((char*)&(device->ip))[0], (unsigned char)((char*)&(device->ip))[1], (unsigned char)((char*)&(device->ip))[2], (unsigned char)((char*)&(device->ip))[3] );
            device->location.replace(wrongloc, 12, ipbuf);
        }
        //end workaround

        //Workaround for another MusicPal bug
        int wrongdev = device->urn.find("schemas-upnp-org:device:RenderingControl:1");
        if(wrongdev > 0){
            //replace schemas-upnp-org:device:RenderingControl:1 with schemas-upnp-org:service:RenderingControl:1
            char buf[] = "schemas-upnp-org:service:RenderingControl:1";
            device->urn.replace(wrongdev, sizeof(buf), buf);
        }
        //end workaround


        //Inform the observers
        if(uuid.isdevice || uuid.isrootdevice){
            mDB->DeviceUpdate(device);
        }else if(uuid.isservice){
            mDB->ServiceUpdate(device);
        }

    }

    //always update cache control
    if(device != NULL && cache >= 0){
        mDB->UpdateCacheControl(uuid.uuid, uuid.uuidlen, cache);
    }

    //printf("%s\n", device->uuid.c_str());

    mDB->Unlock();


EXIT:
    return ret;
}