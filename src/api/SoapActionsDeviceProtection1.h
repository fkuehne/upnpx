//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import <Foundation/Foundation.h>
#import "SoapAction.h"

@interface SoapActionsDeviceProtection1 : SoapAction {
    }

//SOAP

-(int)SendSetupMessageWithProtocolType:(NSString*)protocoltype InMessage:(NSString*)inmessage OutOutMessage:(NSMutableString*)outmessage;
-(int)GetSupportedProtocolsWithOutProtocolList:(NSMutableString*)protocollist;
-(int)GetAssignedRolesWithOutRoleList:(NSMutableString*)rolelist;
-(int)GetRolesForActionWithDeviceUDN:(NSString*)deviceudn ServiceId:(NSString*)serviceid ActionName:(NSString*)actionname OutRoleList:(NSMutableString*)rolelist OutRestrictedRoleList:(NSMutableString*)restrictedrolelist;
-(int)GetUserLoginChallengeWithProtocolType:(NSString*)protocoltype Name:(NSString*)name OutSalt:(NSMutableString*)salt OutChallenge:(NSMutableString*)challenge;
-(int)UserLoginWithProtocolType:(NSString*)protocoltype Challenge:(NSString*)challenge Authenticator:(NSString*)authenticator;
-(int)UserLogout;
-(int)GetACLDataWithOutACL:(NSMutableString*)acl;
-(int)AddIdentityListWithIdentityList:(NSString*)identitylist OutIdentityListResult:(NSMutableString*)identitylistresult;
-(int)RemoveIdentityWithIdentity:(NSString*)identity;
-(int)SetUserLoginPasswordWithProtocolType:(NSString*)protocoltype Name:(NSString*)name Stored:(NSString*)stored Salt:(NSString*)salt;
-(int)AddRolesForIdentityWithIdentity:(NSString*)identity RoleList:(NSString*)rolelist;
-(int)RemoveRolesForIdentityWithIdentity:(NSString*)identity RoleList:(NSString*)rolelist;

@end
