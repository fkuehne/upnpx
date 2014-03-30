//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import "SoapActionsCallManagement1.h"

#import "OrderedDictionary.h"

@implementation SoapActionsCallManagement1


-(int)AcceptCallWithTelCPName:(NSString*)telcpname SecretKey:(NSString*)secretkey TargetCallID:(NSString*)targetcallid MediaCapabilityInfo:(NSString*)mediacapabilityinfo CallMode:(NSString*)callmode{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"TelCPName", @"SecretKey", @"TargetCallID", @"MediaCapabilityInfo", @"CallMode"];
    parameterObjects = @[telcpname, secretkey, targetcallid, mediacapabilityinfo, callmode];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"AcceptCall" parameters:parameters returnValues:output];
    return ret;
}


-(int)AcceptModifyCallWithTelCPName:(NSString*)telcpname SecretKey:(NSString*)secretkey TargetCallID:(NSString*)targetcallid MediaCapabilityInfo:(NSString*)mediacapabilityinfo{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"TelCPName", @"SecretKey", @"TargetCallID", @"MediaCapabilityInfo"];
    parameterObjects = @[telcpname, secretkey, targetcallid, mediacapabilityinfo];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"AcceptModifyCall" parameters:parameters returnValues:output];
    return ret;
}


-(int)ChangeMonopolizerWithCurrentMonopolizer:(NSString*)currentmonopolizer SecretKey:(NSString*)secretkey TargetCallID:(NSString*)targetcallid NewMonopolizer:(NSString*)newmonopolizer{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"CurrentMonopolizer", @"SecretKey", @"TargetCallID", @"NewMonopolizer"];
    parameterObjects = @[currentmonopolizer, secretkey, targetcallid, newmonopolizer];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"ChangeMonopolizer" parameters:parameters returnValues:output];
    return ret;
}


-(int)ChangeTelCPNameWithCurrentTelCPName:(NSString*)currenttelcpname CurrentSecretKey:(NSString*)currentsecretkey NewTelCPName:(NSString*)newtelcpname OutNewSecretKey:(NSMutableString*)newsecretkey OutExpires:(NSMutableString*)expires{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"CurrentTelCPName", @"CurrentSecretKey", @"NewTelCPName"];
    parameterObjects = @[currenttelcpname, currentsecretkey, newtelcpname];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"NewSecretKey", @"Expires"];
    outputObjects = @[newsecretkey, expires];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"ChangeTelCPName" parameters:parameters returnValues:output];
    return ret;
}


-(int)ClearCallBackWithCallBackID:(NSString*)callbackid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"CallBackID"];
    parameterObjects = @[callbackid];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"ClearCallBack" parameters:parameters returnValues:output];
    return ret;
}


-(int)ClearCallLogs{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    ret = [self action:@"ClearCallLogs" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetCallBackInfoWithOutCallBackInfo:(NSMutableString*)callbackinfo{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"CallBackInfo"];
    outputObjects = @[callbackinfo];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetCallBackInfo" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetCallInfoWithTelCPName:(NSString*)telcpname SecretKey:(NSString*)secretkey TargetCallID:(NSString*)targetcallid OutCallInfoList:(NSMutableString*)callinfolist{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"TelCPName", @"SecretKey", @"TargetCallID"];
    parameterObjects = @[telcpname, secretkey, targetcallid];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"CallInfoList"];
    outputObjects = @[callinfolist];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetCallInfo" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetCallLogsWithOutCallLogs:(NSMutableString*)calllogs{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"CallLogs"];
    outputObjects = @[calllogs];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetCallLogs" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetMediaCapabilitiesWithTCMediaCapabilityInfo:(NSString*)tcmediacapabilityinfo OutSupportedMediaCapabilityInfo:(NSMutableString*)supportedmediacapabilityinfo{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"TCMediaCapabilityInfo"];
    parameterObjects = @[tcmediacapabilityinfo];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"SupportedMediaCapabilityInfo"];
    outputObjects = @[supportedmediacapabilityinfo];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetMediaCapabilities" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetTelephonyIdentityWithOutTelephonyIdentity:(NSMutableString*)telephonyidentity{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"TelephonyIdentity"];
    outputObjects = @[telephonyidentity];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetTelephonyIdentity" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetTelCPNameListWithOutTelCPNameList:(NSMutableString*)telcpnamelist{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"TelCPNameList"];
    outputObjects = @[telcpnamelist];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetTelCPNameList" parameters:parameters returnValues:output];
    return ret;
}


-(int)InitiateCallWithCalleeID:(NSString*)calleeid OutCallID:(NSMutableString*)callid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"CalleeID"];
    parameterObjects = @[calleeid];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"CallID"];
    outputObjects = @[callid];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"InitiateCall" parameters:parameters returnValues:output];
    return ret;
}


-(int)ModifyCallWithTelCPName:(NSString*)telcpname SecretKey:(NSString*)secretkey TargetCallID:(NSString*)targetcallid MediaCapabilityInfo:(NSString*)mediacapabilityinfo{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"TelCPName", @"SecretKey", @"TargetCallID", @"MediaCapabilityInfo"];
    parameterObjects = @[telcpname, secretkey, targetcallid, mediacapabilityinfo];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"ModifyCall" parameters:parameters returnValues:output];
    return ret;
}


-(int)RegisterCallBackWithCalleeID:(NSString*)calleeid OutCallBackID:(NSMutableString*)callbackid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"CalleeID"];
    parameterObjects = @[calleeid];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"CallBackID"];
    outputObjects = @[callbackid];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"RegisterCallBack" parameters:parameters returnValues:output];
    return ret;
}


-(int)RegisterTelCPNameWithTelCPName:(NSString*)telcpname CurrentSecretKey:(NSString*)currentsecretkey OutNewSecretKey:(NSMutableString*)newsecretkey OutExpires:(NSMutableString*)expires{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"TelCPName", @"CurrentSecretKey"];
    parameterObjects = @[telcpname, currentsecretkey];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"NewSecretKey", @"Expires"];
    outputObjects = @[newsecretkey, expires];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"RegisterTelCPName" parameters:parameters returnValues:output];
    return ret;
}


-(int)RejectCallWithTelCPName:(NSString*)telcpname SecretKey:(NSString*)secretkey TargetCallID:(NSString*)targetcallid RejectReason:(NSString*)rejectreason{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"TelCPName", @"SecretKey", @"TargetCallID", @"RejectReason"];
    parameterObjects = @[telcpname, secretkey, targetcallid, rejectreason];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"RejectCall" parameters:parameters returnValues:output];
    return ret;
}


-(int)StartCallWithTelCPName:(NSString*)telcpname SecretKey:(NSString*)secretkey CalleeID:(NSString*)calleeid CallPriority:(NSString*)callpriority MediaCapabilityInfo:(NSString*)mediacapabilityinfo CallMode:(NSString*)callmode OutCallID:(NSMutableString*)callid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"TelCPName", @"SecretKey", @"CalleeID", @"CallPriority", @"MediaCapabilityInfo", @"CallMode"];
    parameterObjects = @[telcpname, secretkey, calleeid, callpriority, mediacapabilityinfo, callmode];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"CallID"];
    outputObjects = @[callid];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"StartCall" parameters:parameters returnValues:output];
    return ret;
}


-(int)StartMediaTransferWithTelCPName:(NSString*)telcpname SecretKey:(NSString*)secretkey TargetCallID:(NSString*)targetcallid TCList:(NSString*)tclist MediaCapabilityInfo:(NSString*)mediacapabilityinfo{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"TelCPName", @"SecretKey", @"TargetCallID", @"TCList", @"MediaCapabilityInfo"];
    parameterObjects = @[telcpname, secretkey, targetcallid, tclist, mediacapabilityinfo];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"StartMediaTransfer" parameters:parameters returnValues:output];
    return ret;
}


-(int)StopCallWithTelCPName:(NSString*)telcpname SecretKey:(NSString*)secretkey CallID:(NSString*)callid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"TelCPName", @"SecretKey", @"CallID"];
    parameterObjects = @[telcpname, secretkey, callid];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"StopCall" parameters:parameters returnValues:output];
    return ret;
}


-(int)UnregisterTelCPNameWithTelCPName:(NSString*)telcpname SecretKey:(NSString*)secretkey{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"TelCPName", @"SecretKey"];
    parameterObjects = @[telcpname, secretkey];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"UnregisterTelCPName" parameters:parameters returnValues:output];
    return ret;
}

@end
