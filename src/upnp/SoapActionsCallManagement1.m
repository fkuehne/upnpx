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
    parameterKeys = [NSArray arrayWithObjects:@"TelCPName", @"SecretKey", @"TargetCallID", @"MediaCapabilityInfo", @"CallMode", nil];
    parameterObjects = [NSArray arrayWithObjects:telcpname, secretkey, targetcallid, mediacapabilityinfo, callmode, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"TelCPName", @"SecretKey", @"TargetCallID", @"MediaCapabilityInfo", nil];
    parameterObjects = [NSArray arrayWithObjects:telcpname, secretkey, targetcallid, mediacapabilityinfo, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"CurrentMonopolizer", @"SecretKey", @"TargetCallID", @"NewMonopolizer", nil];
    parameterObjects = [NSArray arrayWithObjects:currentmonopolizer, secretkey, targetcallid, newmonopolizer, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"CurrentTelCPName", @"CurrentSecretKey", @"NewTelCPName", nil];
    parameterObjects = [NSArray arrayWithObjects:currenttelcpname, currentsecretkey, newtelcpname, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewSecretKey", @"Expires", nil];
    outputObjects = [NSArray arrayWithObjects:newsecretkey, expires, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"CallBackID", nil];
    parameterObjects = [NSArray arrayWithObjects:callbackid, nil];
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
    outputKeys = [NSArray arrayWithObjects:@"CallBackInfo", nil];
    outputObjects = [NSArray arrayWithObjects:callbackinfo, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"TelCPName", @"SecretKey", @"TargetCallID", nil];
    parameterObjects = [NSArray arrayWithObjects:telcpname, secretkey, targetcallid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"CallInfoList", nil];
    outputObjects = [NSArray arrayWithObjects:callinfolist, nil];
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
    outputKeys = [NSArray arrayWithObjects:@"CallLogs", nil];
    outputObjects = [NSArray arrayWithObjects:calllogs, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"TCMediaCapabilityInfo", nil];
    parameterObjects = [NSArray arrayWithObjects:tcmediacapabilityinfo, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"SupportedMediaCapabilityInfo", nil];
    outputObjects = [NSArray arrayWithObjects:supportedmediacapabilityinfo, nil];
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
    outputKeys = [NSArray arrayWithObjects:@"TelephonyIdentity", nil];
    outputObjects = [NSArray arrayWithObjects:telephonyidentity, nil];
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
    outputKeys = [NSArray arrayWithObjects:@"TelCPNameList", nil];
    outputObjects = [NSArray arrayWithObjects:telcpnamelist, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"CalleeID", nil];
    parameterObjects = [NSArray arrayWithObjects:calleeid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"CallID", nil];
    outputObjects = [NSArray arrayWithObjects:callid, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"TelCPName", @"SecretKey", @"TargetCallID", @"MediaCapabilityInfo", nil];
    parameterObjects = [NSArray arrayWithObjects:telcpname, secretkey, targetcallid, mediacapabilityinfo, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"CalleeID", nil];
    parameterObjects = [NSArray arrayWithObjects:calleeid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"CallBackID", nil];
    outputObjects = [NSArray arrayWithObjects:callbackid, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"TelCPName", @"CurrentSecretKey", nil];
    parameterObjects = [NSArray arrayWithObjects:telcpname, currentsecretkey, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewSecretKey", @"Expires", nil];
    outputObjects = [NSArray arrayWithObjects:newsecretkey, expires, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"TelCPName", @"SecretKey", @"TargetCallID", @"RejectReason", nil];
    parameterObjects = [NSArray arrayWithObjects:telcpname, secretkey, targetcallid, rejectreason, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"TelCPName", @"SecretKey", @"CalleeID", @"CallPriority", @"MediaCapabilityInfo", @"CallMode", nil];
    parameterObjects = [NSArray arrayWithObjects:telcpname, secretkey, calleeid, callpriority, mediacapabilityinfo, callmode, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"CallID", nil];
    outputObjects = [NSArray arrayWithObjects:callid, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"TelCPName", @"SecretKey", @"TargetCallID", @"TCList", @"MediaCapabilityInfo", nil];
    parameterObjects = [NSArray arrayWithObjects:telcpname, secretkey, targetcallid, tclist, mediacapabilityinfo, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"TelCPName", @"SecretKey", @"CallID", nil];
    parameterObjects = [NSArray arrayWithObjects:telcpname, secretkey, callid, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"TelCPName", @"SecretKey", nil];
    parameterObjects = [NSArray arrayWithObjects:telcpname, secretkey, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"UnregisterTelCPName" parameters:parameters returnValues:output];
    return ret;
}



@end
