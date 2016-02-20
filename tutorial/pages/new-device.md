[Home](../)

# upnpx Tutorial
## Add a new device to the upnpx stack

**upnpx** has built in support for a number of devices and services, but it is possible you just need another one because new specifications are released or the device was not added from the start.

 * Check the [`DeviceFactory.m`](../../src/upnp/DeviceFactory.m#L53) to get the latest list of built-in Devices, for Services check the source tree.

Although it is possible to work with unknown devices and service through the Base classes [`BasicUPnPDevice.h`](../../src/api/BasicUPnPDevice.h) and [`BasicUPnPService.h`](../../src/api/BasicUPnPService.h) it is adviced to add full support for your new device to the stack. This will save you work in the long run. 

Part of the source tree is the project [scpdcodegenerator](../../projects/scpdcodegenerator) which is a command line tool made to generate the service Soap Action classes from the XML descriptions.

The following section explains the steps to add a new device.


## Example: Add the DigitalSecurityCamera device

### 1. Check the specifications and find the Services used by the [DigitalSecurityCamera:1](http://www.upnp.org/specs/ha/UPnP-ha-DigitalSecurityCamera-v1-Device.pdf)

From the specifications we learn that the **DigitalSecurityCamera:1** has the following services:
 * [DigitalSecurityCameraStillImage:1](http://www.upnp.org/specs/ha/UPnP-ha-StillImage-v1-Service.pdf)
 * [DigitalSecurityCameraSettings:1](http://upnp.org/specs/ha/UPnP-ha-Settings-v1-Service.pdf)
 * [DigitalSecurityCameraMotionImage:1](http://www.upnp.org/specs/ha/UPnP-ha-MotionImage-v1-Service.pdf)


### 2. For all Services: Get the Service descriptions in section ***3. XML Service Description*** and save them in XML files. 

Often the XML files are released as well so that saves the copy. For this example we now have the following XML files with service descriptions:
 * `DigitalSecurityCameraStillImage1.xml`
 * `DigitalSecurityCameraSettings1.xml`
 * `DigitalSecurityCameraMotionImage1.xml`


### 3. Use [scpdcodegenerator](../../projects/scpdcodegenerator) to create the Service Classes with the Soap Actions:

```Shell
./scpdcodegenerator DigitalSecurityCameraStillImage1.xml DigitalSecurityCameraStillImage1
./scpdcodegenerator DigitalSecurityCameraSettings1.xml DigitalSecurityCameraSettings1
./scpdcodegenerator DigitalSecurityCameraMotionImage1.xml DigitalSecurityCameraMotionImage1 


iMac:upnpx bruno$ ls -al *.m *.h
-rw-r--r--@ 1 bruno  staff   2189 May 26 23:37 SoapActionsDigitalSecurityCameraMotionImage1.h
-rw-r--r--@ 1 bruno  staff  11774 May 26 23:37 SoapActionsDigitalSecurityCameraMotionImage1.m
-rw-r--r--@ 1 bruno  staff   1334 May 26 23:33 SoapActionsDigitalSecurityCameraSettings1.h
-rw-r--r--@ 1 bruno  staff   7784 May 26 23:33 SoapActionsDigitalSecurityCameraSettings1.m
-rw-r--r--@ 1 bruno  staff   1682 May 26 23:31 SoapActionsDigitalSecurityCameraStillImage1.h
-rw-r--r--@ 1 bruno  staff   9060 May 26 23:31 SoapActionsDigitalSecurityCameraStillImage1.m
iMac:upnpx bruno$ 
```

**Check if the tool does not report an error, if this happens check and correct the XML file.**  


### 4. Put the Generated files in the upnpx project:

 * Copy the header-files to the API:  
   * `./upnpx/src/api/`
 * Copy the definition files (.m) to the upnp folder:  
   * `./upnpx/src/upnp/`
 * Add the files to the upnpx project. 


### 5. Create the following files:

 * `../../src/api/DigitalSecurityCamera1Device.h`
 * `../../src/upnp/DigitalSecurityCamera1Device.m`

And add them to the upnpx project.

Write the code for those 2 files. The most convenient way is to copy/paste the code of `MediaServer1Device` and change the services with the ones that belong to your new device (the ones you just created).

#### Example:
 * [`DigitalSecurityCamera1Device.h`](../../src/api/DigitalSecurityCamera1Device.h)
 * [`DigitalSecurityCamera1Device.m`](../../src/api/DigitalSecurityCamera1Device.m)


### 6. Add the new device to the Device Factory

 * Check the device urn; for our example, you find it in the device template specifications under **2.1. Device Type**: `urn:schemas-upnp-org:device:DigitalSecurityCamera:1`
 * Add the Device to the [`DeviceFactory.m`](../../src/upnp/DeviceFactory.m)

```Objective-C
...
} else if([[ssdp urn] isEqualToString:@"urn:schemas-upnp-org:device:DigitalSecurityCamera:1"]) {
      device = [[DigitalSecurityCamera1Device alloc] initWithSSDPDevice:ssdp];
}
...
```

*Congratulations, You are done!*  
The device should be ready to be used. If you think the device you created is a useful addition to the upnpx stack and you want it to be part of the open-source project, please email at: Bruno Keymolen (<bruno.keymolen@gmail.com>). 