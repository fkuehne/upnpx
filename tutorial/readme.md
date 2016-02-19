# upnpx Tutorial

## Preamble

This tutorial isn't the original of the **upnpx** project, it is an complete rewrite/reformat by Frank Gregor (<phranck@cocoanaut.com>), because the [original upnpx Wiki](https://code.google.com/p/upnpx/wiki/tutorial) on Google Code has been archived by someone and is broken/unsusable right now. If you are using **upnpx** and want to contribute to this documentation feel free to contact me.

## Tutorial Overview

Good UPnP documentation is available at the [project website](http://upnp.org).

The complete architecture is described in detail in the [UPNP Device Architecture Document](http://upnp.org/specs/arch/UPnP-arch-DeviceArchitecture-v2.0.pdf).  
A UPnP session exist of several steps: 
 1. [Addressing](pages/addressing.md)  
 _"Through addressing, devices and control points get a network address"_
 2. [Discovery](pages/discovery.md)  
 _"Through discovery, control points find interesting device(s)"_
 3. [Description](pages/description.md)  
 _"...the control point MUST retrieve a description of the device..."_
 4. [Control](pages/control.md)  
 _"Through control, control points invoke actions on devices and poll for values."_
 5. [Eventing](pages/eventing.md)  
 _"Through eventing, control points listen to state changes in device(s)."_
 6. [Presentation](pages/presentation.md)

**upnpx** is an implementation of the [UPnP Specifications](http://upnp.org/specs/arch/UPnP-arch-DeviceArchitecture-v2.0.pdf) and has API functions for the different steps. This tutorial give simple examples how to use the **upnpx** API in order to build your own UPnP Control Point.

This tutorial handles the 6 individual steps and starts at [Addressing](pages/addressing.md).

## New UPnP devices

Sometimes you may need to add a new UPnP ready device to let **upnpx** give support for. See the tutorial for how to [add a new device](pages/new-device.md) to the **upnpx** stack.

## Compatibility

**upnpx** has been proofed in a number of projects. Please take a look at the [compatibility page](pages/compatibility.md).

## Building static libupnpx.a library

Before using the library you have to build the **upnpx** static library `libupnpx.a`. Jump to the [build upnpx](pages/build-upnpx.md) page to get an insight.

