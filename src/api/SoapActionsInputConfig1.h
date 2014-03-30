//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import <Foundation/Foundation.h>
#import "SoapAction.h"

@interface SoapActionsInputConfig1 : SoapAction {
    }

//SOAP

-(int)GetInputCapabilityWithOutSupportedCapabilities:(NSMutableString*)supportedcapabilities;
-(int)GetInputConnectionListWithOutCurrentConnectionList:(NSMutableString*)currentconnectionlist;
-(int)SetInputSessionWithSelectedCapability:(NSString*)selectedcapability ReceiverInfo:(NSString*)receiverinfo PeerDeviceInfo:(NSString*)peerdeviceinfo ConnectionInfo:(NSString*)connectioninfo OutSessionID:(NSMutableString*)sessionid;
-(int)StartInputSessionWithSessionID:(NSString*)sessionid;
-(int)StopInputsessionWithSessionID:(NSString*)sessionid;
-(int)SwitchInputSessionWithSessionID:(NSString*)sessionid;
-(int)SetMultiInputModeWithNewMultiInputMode:(NSString*)newmultiinputmode;
-(int)SetMonopolizedSenderWithOwnerDeviceInfo:(NSString*)ownerdeviceinfo OwnedSessionID:(NSString*)ownedsessionid;

@end
