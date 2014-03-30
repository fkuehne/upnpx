//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import "SoapActionsDeviceProtection1.h"

#import "OrderedDictionary.h"

@implementation SoapActionsDeviceProtection1


-(int)SendSetupMessageWithProtocolType:(NSString*)protocoltype InMessage:(NSString*)inmessage OutOutMessage:(NSMutableString*)outmessage{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"ProtocolType", @"InMessage"];
    parameterObjects = @[protocoltype, inmessage];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"OutMessage"];
    outputObjects = @[outmessage];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"SendSetupMessage" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetSupportedProtocolsWithOutProtocolList:(NSMutableString*)protocollist{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"ProtocolList"];
    outputObjects = @[protocollist];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetSupportedProtocols" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetAssignedRolesWithOutRoleList:(NSMutableString*)rolelist{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"RoleList"];
    outputObjects = @[rolelist];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetAssignedRoles" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetRolesForActionWithDeviceUDN:(NSString*)deviceudn ServiceId:(NSString*)serviceid ActionName:(NSString*)actionname OutRoleList:(NSMutableString*)rolelist OutRestrictedRoleList:(NSMutableString*)restrictedrolelist{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"DeviceUDN", @"ServiceId", @"ActionName"];
    parameterObjects = @[deviceudn, serviceid, actionname];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"RoleList", @"RestrictedRoleList"];
    outputObjects = @[rolelist, restrictedrolelist];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetRolesForAction" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetUserLoginChallengeWithProtocolType:(NSString*)protocoltype Name:(NSString*)name OutSalt:(NSMutableString*)salt OutChallenge:(NSMutableString*)challenge{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"ProtocolType", @"Name"];
    parameterObjects = @[protocoltype, name];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"Salt", @"Challenge"];
    outputObjects = @[salt, challenge];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetUserLoginChallenge" parameters:parameters returnValues:output];
    return ret;
}


-(int)UserLoginWithProtocolType:(NSString*)protocoltype Challenge:(NSString*)challenge Authenticator:(NSString*)authenticator{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"ProtocolType", @"Challenge", @"Authenticator"];
    parameterObjects = @[protocoltype, challenge, authenticator];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"UserLogin" parameters:parameters returnValues:output];
    return ret;
}


-(int)UserLogout{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    ret = [self action:@"UserLogout" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetACLDataWithOutACL:(NSMutableString*)acl{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"ACL"];
    outputObjects = @[acl];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetACLData" parameters:parameters returnValues:output];
    return ret;
}


-(int)AddIdentityListWithIdentityList:(NSString*)identitylist OutIdentityListResult:(NSMutableString*)identitylistresult{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"IdentityList"];
    parameterObjects = @[identitylist];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"IdentityListResult"];
    outputObjects = @[identitylistresult];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"AddIdentityList" parameters:parameters returnValues:output];
    return ret;
}


-(int)RemoveIdentityWithIdentity:(NSString*)identity{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"Identity"];
    parameterObjects = @[identity];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"RemoveIdentity" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetUserLoginPasswordWithProtocolType:(NSString*)protocoltype Name:(NSString*)name Stored:(NSString*)stored Salt:(NSString*)salt{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"ProtocolType", @"Name", @"Stored", @"Salt"];
    parameterObjects = @[protocoltype, name, stored, salt];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetUserLoginPassword" parameters:parameters returnValues:output];
    return ret;
}


-(int)AddRolesForIdentityWithIdentity:(NSString*)identity RoleList:(NSString*)rolelist{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"Identity", @"RoleList"];
    parameterObjects = @[identity, rolelist];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"AddRolesForIdentity" parameters:parameters returnValues:output];
    return ret;
}


-(int)RemoveRolesForIdentityWithIdentity:(NSString*)identity RoleList:(NSString*)rolelist{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"Identity", @"RoleList"];
    parameterObjects = @[identity, rolelist];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"RemoveRolesForIdentity" parameters:parameters returnValues:output];
    return ret;
}



@end
