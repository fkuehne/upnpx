//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import "SoapActionsInputConfig1.h"

#import "OrderedDictionary.h"

@implementation SoapActionsInputConfig1


-(int)GetInputCapabilityWithOutSupportedCapabilities:(NSMutableString*)supportedcapabilities{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"SupportedCapabilities", nil];
    outputObjects = [NSArray arrayWithObjects:supportedcapabilities, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetInputCapability" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetInputConnectionListWithOutCurrentConnectionList:(NSMutableString*)currentconnectionlist{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"CurrentConnectionList", nil];
    outputObjects = [NSArray arrayWithObjects:currentconnectionlist, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetInputConnectionList" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetInputSessionWithSelectedCapability:(NSString*)selectedcapability ReceiverInfo:(NSString*)receiverinfo PeerDeviceInfo:(NSString*)peerdeviceinfo ConnectionInfo:(NSString*)connectioninfo OutSessionID:(NSMutableString*)sessionid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"SelectedCapability", @"ReceiverInfo", @"PeerDeviceInfo", @"ConnectionInfo", nil];
    parameterObjects = [NSArray arrayWithObjects:selectedcapability, receiverinfo, peerdeviceinfo, connectioninfo, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"SessionID", nil];
    outputObjects = [NSArray arrayWithObjects:sessionid, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"SetInputSession" parameters:parameters returnValues:output];
    return ret;
}


-(int)StartInputSessionWithSessionID:(NSString*)sessionid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"SessionID", nil];
    parameterObjects = [NSArray arrayWithObjects:sessionid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"StartInputSession" parameters:parameters returnValues:output];
    return ret;
}


-(int)StopInputsessionWithSessionID:(NSString*)sessionid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"SessionID", nil];
    parameterObjects = [NSArray arrayWithObjects:sessionid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"StopInputsession" parameters:parameters returnValues:output];
    return ret;
}


-(int)SwitchInputSessionWithSessionID:(NSString*)sessionid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"SessionID", nil];
    parameterObjects = [NSArray arrayWithObjects:sessionid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SwitchInputSession" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetMultiInputModeWithNewMultiInputMode:(NSString*)newmultiinputmode{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"NewMultiInputMode", nil];
    parameterObjects = [NSArray arrayWithObjects:newmultiinputmode, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetMultiInputMode" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetMonopolizedSenderWithOwnerDeviceInfo:(NSString*)ownerdeviceinfo OwnedSessionID:(NSString*)ownedsessionid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"OwnerDeviceInfo", @"OwnedSessionID", nil];
    parameterObjects = [NSArray arrayWithObjects:ownerdeviceinfo, ownedsessionid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"SetMonopolizedSender" parameters:parameters returnValues:output];
    return ret;
}



@end
