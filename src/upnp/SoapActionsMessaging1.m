//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import "SoapActionsMessaging1.h"

#import "OrderedDictionary.h"

@implementation SoapActionsMessaging1


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


-(int)GetMessagingCapabilitiesWithOutSupportedCapabilities:(NSMutableString*)supportedcapabilities{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"SupportedCapabilities", nil];
    outputObjects = [NSArray arrayWithObjects:supportedcapabilities, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetMessagingCapabilities" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetNewMessagesWithOutNewMessages:(NSMutableString*)newmessages{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NewMessages", nil];
    outputObjects = [NSArray arrayWithObjects:newmessages, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetNewMessages" parameters:parameters returnValues:output];
    return ret;
}


-(int)SearchMessagesWithMessageClass:(NSString*)messageclass MessageFolder:(NSString*)messagefolder MessageStatus:(NSString*)messagestatus SessionID:(NSString*)sessionid OutMessageList:(NSMutableString*)messagelist{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"MessageClass", @"MessageFolder", @"MessageStatus", @"SessionID", nil];
    parameterObjects = [NSArray arrayWithObjects:messageclass, messagefolder, messagestatus, sessionid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"MessageList", nil];
    outputObjects = [NSArray arrayWithObjects:messagelist, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"SearchMessages" parameters:parameters returnValues:output];
    return ret;
}


-(int)ReadMessageWithMessageID:(NSString*)messageid OutMessageRequested:(NSMutableString*)messagerequested{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"MessageID", nil];
    parameterObjects = [NSArray arrayWithObjects:messageid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"MessageRequested", nil];
    outputObjects = [NSArray arrayWithObjects:messagerequested, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"ReadMessage" parameters:parameters returnValues:output];
    return ret;
}


-(int)SendMessageWithMessageToSend:(NSString*)messagetosend OutMessageID:(NSMutableString*)messageid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"MessageToSend", nil];
    parameterObjects = [NSArray arrayWithObjects:messagetosend, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"MessageID", nil];
    outputObjects = [NSArray arrayWithObjects:messageid, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"SendMessage" parameters:parameters returnValues:output];
    return ret;
}


-(int)DeleteMessageWithMessageID:(NSString*)messageid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"MessageID", nil];
    parameterObjects = [NSArray arrayWithObjects:messageid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"DeleteMessage" parameters:parameters returnValues:output];
    return ret;
}


-(int)CreateSessionWithSessionClass:(NSString*)sessionclass SessionRecipients:(NSString*)sessionrecipients Subject:(NSString*)subject SupportedContentType:(NSString*)supportedcontenttype OutSessionID:(NSMutableString*)sessionid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"SessionClass", @"SessionRecipients", @"Subject", @"SupportedContentType", nil];
    parameterObjects = [NSArray arrayWithObjects:sessionclass, sessionrecipients, subject, supportedcontenttype, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"SessionID", nil];
    outputObjects = [NSArray arrayWithObjects:sessionid, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"CreateSession" parameters:parameters returnValues:output];
    return ret;
}


-(int)ModifySessionWithSessionID:(NSString*)sessionid SessionRecipientsToAdd:(NSString*)sessionrecipientstoadd SessionRecipientsToRemove:(NSString*)sessionrecipientstoremove Subject:(NSString*)subject SupportedContentType:(NSString*)supportedcontenttype SessionClass:(NSString*)sessionclass{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"SessionID", @"SessionRecipientsToAdd", @"SessionRecipientsToRemove", @"Subject", @"SupportedContentType", @"SessionClass", nil];
    parameterObjects = [NSArray arrayWithObjects:sessionid, sessionrecipientstoadd, sessionrecipientstoremove, subject, supportedcontenttype, sessionclass, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"ModifySession" parameters:parameters returnValues:output];
    return ret;
}


-(int)AcceptSessionWithSessionID:(NSString*)sessionid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"SessionID", nil];
    parameterObjects = [NSArray arrayWithObjects:sessionid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"AcceptSession" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetSessionUpdatesWithOutSessionUpdates:(NSMutableString*)sessionupdates{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"SessionUpdates", nil];
    outputObjects = [NSArray arrayWithObjects:sessionupdates, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetSessionUpdates" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetSessionsWithSessionID:(NSString*)sessionid SessionClass:(NSString*)sessionclass SessionStatus:(NSString*)sessionstatus OutSessionsList:(NSMutableString*)sessionslist{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"SessionID", @"SessionClass", @"SessionStatus", nil];
    parameterObjects = [NSArray arrayWithObjects:sessionid, sessionclass, sessionstatus, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"SessionsList", nil];
    outputObjects = [NSArray arrayWithObjects:sessionslist, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetSessions" parameters:parameters returnValues:output];
    return ret;
}


-(int)JoinSessionWithSessionID:(NSString*)sessionid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"SessionID", nil];
    parameterObjects = [NSArray arrayWithObjects:sessionid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"JoinSession" parameters:parameters returnValues:output];
    return ret;
}


-(int)LeaveSessionWithSessionID:(NSString*)sessionid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"SessionID", nil];
    parameterObjects = [NSArray arrayWithObjects:sessionid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"LeaveSession" parameters:parameters returnValues:output];
    return ret;
}


-(int)CloseSessionWithSessionID:(NSString*)sessionid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"SessionID", nil];
    parameterObjects = [NSArray arrayWithObjects:sessionid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"CloseSession" parameters:parameters returnValues:output];
    return ret;
}


-(int)StartFileTransferWithFileInfoList:(NSString*)fileinfolist{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"FileInfoList", nil];
    parameterObjects = [NSArray arrayWithObjects:fileinfolist, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"StartFileTransfer" parameters:parameters returnValues:output];
    return ret;
}


-(int)CancelFileTransferWithSessionID:(NSString*)sessionid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"SessionID", nil];
    parameterObjects = [NSArray arrayWithObjects:sessionid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"CancelFileTransfer" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetFileTransferSessionWithSessionID:(NSString*)sessionid OutFileInfoList:(NSMutableString*)fileinfolist{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"SessionID", nil];
    parameterObjects = [NSArray arrayWithObjects:sessionid, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"FileInfoList", nil];
    outputObjects = [NSArray arrayWithObjects:fileinfolist, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetFileTransferSession" parameters:parameters returnValues:output];
    return ret;
}



@end
