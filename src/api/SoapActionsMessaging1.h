//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import <Foundation/Foundation.h>
#import "SoapAction.h"

@interface SoapActionsMessaging1 : SoapAction {
    }

//SOAP

-(int)GetTelephonyIdentityWithOutTelephonyIdentity:(NSMutableString*)telephonyidentity;
-(int)GetMessagingCapabilitiesWithOutSupportedCapabilities:(NSMutableString*)supportedcapabilities;
-(int)GetNewMessagesWithOutNewMessages:(NSMutableString*)newmessages;
-(int)SearchMessagesWithMessageClass:(NSString*)messageclass MessageFolder:(NSString*)messagefolder MessageStatus:(NSString*)messagestatus SessionID:(NSString*)sessionid OutMessageList:(NSMutableString*)messagelist;
-(int)ReadMessageWithMessageID:(NSString*)messageid OutMessageRequested:(NSMutableString*)messagerequested;
-(int)SendMessageWithMessageToSend:(NSString*)messagetosend OutMessageID:(NSMutableString*)messageid;
-(int)DeleteMessageWithMessageID:(NSString*)messageid;
-(int)CreateSessionWithSessionClass:(NSString*)sessionclass SessionRecipients:(NSString*)sessionrecipients Subject:(NSString*)subject SupportedContentType:(NSString*)supportedcontenttype OutSessionID:(NSMutableString*)sessionid;
-(int)ModifySessionWithSessionID:(NSString*)sessionid SessionRecipientsToAdd:(NSString*)sessionrecipientstoadd SessionRecipientsToRemove:(NSString*)sessionrecipientstoremove Subject:(NSString*)subject SupportedContentType:(NSString*)supportedcontenttype SessionClass:(NSString*)sessionclass;
-(int)AcceptSessionWithSessionID:(NSString*)sessionid;
-(int)GetSessionUpdatesWithOutSessionUpdates:(NSMutableString*)sessionupdates;
-(int)GetSessionsWithSessionID:(NSString*)sessionid SessionClass:(NSString*)sessionclass SessionStatus:(NSString*)sessionstatus OutSessionsList:(NSMutableString*)sessionslist;
-(int)JoinSessionWithSessionID:(NSString*)sessionid;
-(int)LeaveSessionWithSessionID:(NSString*)sessionid;
-(int)CloseSessionWithSessionID:(NSString*)sessionid;
-(int)StartFileTransferWithFileInfoList:(NSString*)fileinfolist;
-(int)CancelFileTransferWithSessionID:(NSString*)sessionid;
-(int)GetFileTransferSessionWithSessionID:(NSString*)sessionid OutFileInfoList:(NSMutableString*)fileinfolist;

@end
