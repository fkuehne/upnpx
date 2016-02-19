[Control](control.md) ← [Home](../) → [Presentation](presentation.md)

# upnpx Tutorial
## 5. Eventing

> UPnP specifications: _"Through eventing, control points listen to state changes in device(s)."_


### 1. Implement the Interface BasicUPnPServiceObserver

The `BasicUPnPServiceObserver` protocol is declared in [BasicUPnPService.h](../../src/api/BasicUPnPService.h#L43-L45).
```Objective-C
@protocol BasicUPnPServiceObserver
- (void)UPnPEvent:(BasicUPnPService*)sender events:(NSDictionary*)events;
@end
```


### 2. Register your Class as an Observer (be sure to do this only once)

The code snippet has been extracted from [`PlayBack.m`](../../projects/xcode7/upnpxdemo/upnpxdemo/PlayBack.m#L54-L58) of the [Xcode 7 example](../../projects/xcode7/upnpxdemo).
```Objective-C
if(renderer!=nil){
    if([[renderer avTransportService] isObserver:(BasicUPnPServiceObserver*)self] == NO){
        [[renderer avTransportService] addObserver:(BasicUPnPServiceObserver*)self]; 
    }
}
```


### 3. Receive the events

The code snippet has been extracted from [`PlayBack.m`](../../projects/xcode7/upnpxdemo/upnpxdemo/PlayBack.m#L115-L125) of the [Xcode 7 example](../../projects/xcode7/upnpxdemo).  
For detailed informations about _"AVTransport:1"_ service specifications please take a look at the [AVTransport:1 Service Template]([http://upnp.org/specs/av/UPnP-av-AVTransport-v1-Service.pdf] 
).

```Objective-C
//BasicUPnPServiceObserver
- (void)UPnPEvent:(BasicUPnPService*)sender events:(NSDictionary*)events {
    if(sender == [renderer avTransportService]){
        NSString *newState = events[@"TransportState"];
        
        if([newState isEqualToString:@"STOPPED"]){
            //Do your stuff, play next song etc...
            NSLog(@"Event: 'STOPPED', Play next track of playlist.");
           [self Play:pos+1]; //Next
        }
    }
}
```

[Control](control.md) ← [Home](../) → [Presentation](presentation.md)
