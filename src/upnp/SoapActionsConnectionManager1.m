// ******************************************************************
//
// MIT License.
// This file is part of upnpx.
//
// Copyright (c) 2010, 2011 Bruno Keymolen, email: bruno.keymolen@gmail.com
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
// ******************************************************************

#import "SoapActionsConnectionManager1.h"

#import "OrderedDictionary.h"

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
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

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
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"RcsID", @"AVTransportID", @"ProtocolInfo", @"PeerConnectionManager", @"PeerConnectionID", @"Direction", @"Status", nil];
    outputObjects = [NSArray arrayWithObjects:rcsid, avtransportid, protocolinfo, peerconnectionmanager, peerconnectionid, direction, status, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetCurrentConnectionInfo" parameters:parameters returnValues:output];
    return ret;
}



@end
