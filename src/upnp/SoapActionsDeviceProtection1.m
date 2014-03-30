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
    parameterKeys = [NSArray arrayWithObjects:@"ProtocolType", @"InMessage", nil];
    parameterObjects = [NSArray arrayWithObjects:protocoltype, inmessage, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"OutMessage", nil];
    outputObjects = [NSArray arrayWithObjects:outmessage, nil];
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
    outputKeys = [NSArray arrayWithObjects:@"ProtocolList", nil];
    outputObjects = [NSArray arrayWithObjects:protocollist, nil];
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
    outputKeys = [NSArray arrayWithObjects:@"RoleList", nil];
    outputObjects = [NSArray arrayWithObjects:rolelist, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"DeviceUDN", @"ServiceId", @"ActionName", nil];
    parameterObjects = [NSArray arrayWithObjects:deviceudn, serviceid, actionname, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RoleList", @"RestrictedRoleList", nil];
    outputObjects = [NSArray arrayWithObjects:rolelist, restrictedrolelist, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"ProtocolType", @"Name", nil];
    parameterObjects = [NSArray arrayWithObjects:protocoltype, name, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"Salt", @"Challenge", nil];
    outputObjects = [NSArray arrayWithObjects:salt, challenge, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"ProtocolType", @"Challenge", @"Authenticator", nil];
    parameterObjects = [NSArray arrayWithObjects:protocoltype, challenge, authenticator, nil];
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
    outputKeys = [NSArray arrayWithObjects:@"ACL", nil];
    outputObjects = [NSArray arrayWithObjects:acl, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"IdentityList", nil];
    parameterObjects = [NSArray arrayWithObjects:identitylist, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"IdentityListResult", nil];
    outputObjects = [NSArray arrayWithObjects:identitylistresult, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"Identity", nil];
    parameterObjects = [NSArray arrayWithObjects:identity, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"ProtocolType", @"Name", @"Stored", @"Salt", nil];
    parameterObjects = [NSArray arrayWithObjects:protocoltype, name, stored, salt, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"Identity", @"RoleList", nil];
    parameterObjects = [NSArray arrayWithObjects:identity, rolelist, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"Identity", @"RoleList", nil];
    parameterObjects = [NSArray arrayWithObjects:identity, rolelist, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"RemoveRolesForIdentity" parameters:parameters returnValues:output];
    return ret;
}



@end
