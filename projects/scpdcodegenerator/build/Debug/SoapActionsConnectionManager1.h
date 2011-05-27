//Auto Generated file.
//Copyright 2010 Bruno Keymolen, Arcanegra BVBA. All rights reserved.

#import <Foundation/Foundation.h>
#import "SoapAction.h"

@interface SoapActionsConnectionManager1 : SoapAction {
    }

//SOAP

-(int)GetProtocolInfoWithOutSource:(NSMutableString*)source OutSink:(NSMutableString*)sink;
-(int)PrepareForConnectionWithRemoteProtocolInfo:(NSString*)remoteprotocolinfo PeerConnectionManager:(NSString*)peerconnectionmanager PeerConnectionID:(NSString*)peerconnectionid Direction:(NSString*)direction OutConnectionID:(NSMutableString*)connectionid OutAVTransportID:(NSMutableString*)avtransportid OutRcsID:(NSMutableString*)rcsid;
-(int)ConnectionCompleteWithConnectionID:(NSString*)connectionid;
-(int)GetCurrentConnectionIDsWithOutConnectionIDs:(NSMutableString*)connectionids;
-(int)GetCurrentConnectionInfoWithConnectionID:(NSString*)connectionid OutRcsID:(NSMutableString*)rcsid OutAVTransportID:(NSMutableString*)avtransportid OutProtocolInfo:(NSMutableString*)protocolinfo OutPeerConnectionManager:(NSMutableString*)peerconnectionmanager OutPeerConnectionID:(NSMutableString*)peerconnectionid OutDirection:(NSMutableString*)direction OutStatus:(NSMutableString*)status;

@end
