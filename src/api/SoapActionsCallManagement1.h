//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import <Foundation/Foundation.h>
#import "SoapAction.h"

@interface SoapActionsCallManagement1 : SoapAction {
    }

//SOAP

-(int)AcceptCallWithTelCPName:(NSString*)telcpname SecretKey:(NSString*)secretkey TargetCallID:(NSString*)targetcallid MediaCapabilityInfo:(NSString*)mediacapabilityinfo CallMode:(NSString*)callmode;
-(int)AcceptModifyCallWithTelCPName:(NSString*)telcpname SecretKey:(NSString*)secretkey TargetCallID:(NSString*)targetcallid MediaCapabilityInfo:(NSString*)mediacapabilityinfo;
-(int)ChangeMonopolizerWithCurrentMonopolizer:(NSString*)currentmonopolizer SecretKey:(NSString*)secretkey TargetCallID:(NSString*)targetcallid NewMonopolizer:(NSString*)newmonopolizer;
-(int)ChangeTelCPNameWithCurrentTelCPName:(NSString*)currenttelcpname CurrentSecretKey:(NSString*)currentsecretkey NewTelCPName:(NSString*)newtelcpname OutNewSecretKey:(NSMutableString*)newsecretkey OutExpires:(NSMutableString*)expires;
-(int)ClearCallBackWithCallBackID:(NSString*)callbackid;
-(int)ClearCallLogs;
-(int)GetCallBackInfoWithOutCallBackInfo:(NSMutableString*)callbackinfo;
-(int)GetCallInfoWithTelCPName:(NSString*)telcpname SecretKey:(NSString*)secretkey TargetCallID:(NSString*)targetcallid OutCallInfoList:(NSMutableString*)callinfolist;
-(int)GetCallLogsWithOutCallLogs:(NSMutableString*)calllogs;
-(int)GetMediaCapabilitiesWithTCMediaCapabilityInfo:(NSString*)tcmediacapabilityinfo OutSupportedMediaCapabilityInfo:(NSMutableString*)supportedmediacapabilityinfo;
-(int)GetTelephonyIdentityWithOutTelephonyIdentity:(NSMutableString*)telephonyidentity;
-(int)GetTelCPNameListWithOutTelCPNameList:(NSMutableString*)telcpnamelist;
-(int)InitiateCallWithCalleeID:(NSString*)calleeid OutCallID:(NSMutableString*)callid;
-(int)ModifyCallWithTelCPName:(NSString*)telcpname SecretKey:(NSString*)secretkey TargetCallID:(NSString*)targetcallid MediaCapabilityInfo:(NSString*)mediacapabilityinfo;
-(int)RegisterCallBackWithCalleeID:(NSString*)calleeid OutCallBackID:(NSMutableString*)callbackid;
-(int)RegisterTelCPNameWithTelCPName:(NSString*)telcpname CurrentSecretKey:(NSString*)currentsecretkey OutNewSecretKey:(NSMutableString*)newsecretkey OutExpires:(NSMutableString*)expires;
-(int)RejectCallWithTelCPName:(NSString*)telcpname SecretKey:(NSString*)secretkey TargetCallID:(NSString*)targetcallid RejectReason:(NSString*)rejectreason;
-(int)StartCallWithTelCPName:(NSString*)telcpname SecretKey:(NSString*)secretkey CalleeID:(NSString*)calleeid CallPriority:(NSString*)callpriority MediaCapabilityInfo:(NSString*)mediacapabilityinfo CallMode:(NSString*)callmode OutCallID:(NSMutableString*)callid;
-(int)StartMediaTransferWithTelCPName:(NSString*)telcpname SecretKey:(NSString*)secretkey TargetCallID:(NSString*)targetcallid TCList:(NSString*)tclist MediaCapabilityInfo:(NSString*)mediacapabilityinfo;
-(int)StopCallWithTelCPName:(NSString*)telcpname SecretKey:(NSString*)secretkey CallID:(NSString*)callid;
-(int)UnregisterTelCPNameWithTelCPName:(NSString*)telcpname SecretKey:(NSString*)secretkey;

@end
