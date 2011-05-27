//Auto Generated file.
//Copyright 2010 Bruno Keymolen, Arcanegra BVBA. All rights reserved.

#import "SoapActionsConnectionManager1.h"

@implementation SoapActionsConnectionManager1


-(int)GetProtocolInfoWithOutSource:(NSMutableString*)source OutSink:(NSMutableString*)sink{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"Source", @"Sink", nil];
    outputObjects = [NSArray arrayWithObjects:source, sink, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetProtocolInfo" parameters:parameters returnValues:output];
    return ret;
}


-(int)PrepareForConnectionWithRemoteProtocolInfo:(NSString*)remoteprotocolinfo PeerConnectionManager:(NSString*)peerconnectionmanager PeerConnectionID:(NSString*)peerconnectionid Direction:(NSString*)direction OutConnectionID:(NSMutableString*)connectionid OutAVTransportID:(NSMutableString*)avtransportid OutRcsID:(NSMutableString*)rcsid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"RemoteProtocolInfo", @"PeerConnectionManager", @"PeerConnectionID", @"Direction", nil];
    parameterObjects = [NSArray arrayWithObjects:remoteprotocolinfo, peerconnectionmanager, peerconnectionid, direction, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"ConnectionID", @"AVTransportID", @"RcsID", nil];
    outputObjects = [NSArray arrayWithObjects:connectionid, avtransportid, rcsid, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"PrepareForConnection" parameters:parameters returnValues:output];
    return ret;
}


-(int)ConnectionCompleteWithConnectionID:(NSString*)connectionid{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"ConnectionID", nil];
    parameterObjects = [NSArray arrayWithObjects:connectionid, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    ret = [self action:@"ConnectionComplete" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetCurrentConnectionIDsWithOutConnectionIDs:(NSMutableString*)connectionids{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"ConnectionIDs", nil];
    outputObjects = [NSArray arrayWithObjects:connectionids, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetCurrentConnectionIDs" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetCurrentConnectionInfoWithConnectionID:(NSString*)connectionid OutRcsID:(NSMutableString*)rcsid OutAVTransportID:(NSMutableString*)avtransportid OutProtocolInfo:(NSMutableString*)protocolinfo OutPeerConnectionManager:(NSMutableString*)peerconnectionmanager OutPeerConnectionID:(NSMutableString*)peerconnectionid OutDirection:(NSMutableString*)direction OutStatus:(NSMutableString*)status{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = [NSArray arrayWithObjects:@"ConnectionID", nil];
    parameterObjects = [NSArray arrayWithObjects:connectionid, nil];
    parameters = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RcsID", @"AVTransportID", @"ProtocolInfo", @"PeerConnectionManager", @"PeerConnectionID", @"Direction", @"Status", nil];
    outputObjects = [NSArray arrayWithObjects:rcsid, avtransportid, protocolinfo, peerconnectionmanager, peerconnectionid, direction, status, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetCurrentConnectionInfo" parameters:parameters returnValues:output];
    return ret;
}



@end
