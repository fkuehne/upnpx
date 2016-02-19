[Discovery](discovery.md) ← [Home](../) → [Control](control.md)

# upnpx Tutorial
## 3. Description

> UPnP specifications: _"For the control point to learn more about the device and its capabilities, or to interact with the device, the control point **MUST retrieve a description** of the device and its capabilities from the URL provided by the device in the discovery message."_

**upnpx** does the description step in the background so that integrators do not have to deal with it. 
The [`BasicUPnPDevice`](../../src/api/BasicUPnPDevice.h) pointers we get from the [`UPnPDB`](../../src/api/UPnPDB.h) during [Device Discovery](discovery.md) already contains the device description and capabilities. **upnpx** did the necessary HTTP requests and parsed the Device and Service Description XML's for all 'known' Devices found during the **SSDP** Discovery. 

Check the Factory [`DeviceFactory.m`](../../src/upnp/DeviceFactory.m) for a list of current supported devices. This list can quite easily be extended with the help of the automated code generator [`scpdcodegenerator.xcodeproj`](../../projects/scpdcodegenerator) which takes **scdp** XML descriptions, from the UPnP standard, as input. See the tutorial to [add a new device](new-device.md).

Since the `UPnPDB` only returns the device base class [`BasicUPnPDevice.h`](../../src/api/BasicUPnPDevice.h) you need to implement a little logic to get access to the higher level device classes. The trick is to check the type and to cast the base class. See the following code (extract from the example's [`RootViewController`](../../projects/xcode7/upnpxdemo/upnpxdemo/RootViewController.m#L89-L97)):

```Objective-C
//In this example we are interested in MediaServer1Devices
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BasicUPnPDevice *device = mDevices[indexPath.row];
    if([[device urn] isEqualToString:@"urn:schemas-upnp-org:device:MediaServer:1"]){
        MediaServer1Device *server = (MediaServer1Device*)device;        
        FolderViewController *targetViewController = [[FolderViewController alloc] initWithMediaDevice:server andHeader:@"root" andRootId:@"0" ];
        [[self navigationController] pushViewController:targetViewController animated:YES];
        [[PlayBack GetInstance] setServer:server];
    }
}
```

For detailed informations about such a specialized UPnP device class take a look at the [MediaServer1Device](../../src/api/MediaServer1Device.h).

This step is in fact quite easy, all you have to know it that upnpx give you instances of Devices, including description and capabilities, in the form of `BasicUPnPDevice` base classes and that you need to cast them to the actual device class in order to be ready for the next step. 


[Discovery](discovery.md) ← [Home](../) → [Control](control.md)
