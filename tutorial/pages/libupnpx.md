#labels libupnpx.a
#sidebar TutorialIndex

== Use libupnpx in your own iPhone projects ==

<br>

<font color=red>*Note on Xcode 4 and XCode 3.2.6, 3.2.5*</font>

This page demonstrates how to add the library libupnp.a into an *Xcode 3.2.2* project. Linking against static libraries is somewhat changed in *Xcode 4* and *Xcode 3.2.6*, refer to online documentation to find the details of linking to a static library for your version of Xcode.

I can advise the following links:
 * _*Xcode 3.2.6*_ : [http://www.clintharris.net/2009/iphone-app-shared-libraries/ Easy, Modular Code Sharing Across iPhone Apps: Static Libraries and Cross-Project References]
 * _*Xcode 4*_ : [http://blog.carbonfive.com/2011/04/04/using-open-source-static-libraries-in-xcode-4 using-open-source-static-libraries-in-xcode-4] 



Basically, the same steps have to be done:
 * build upnpx
 * set the header paths to the API
 * link against the C++ Standard Libraries (stdc++) 
 * set the 'Other Linker Flags'  *-all_load*; see [http://developer.apple.com/library/mac/#qa/qa1490/_index.html here] for an explanation of this flag
 * link the libupnpx.a into your project. 

Check the project [http://code.google.com/p/upnpx/source/browse/#svn%2Ftrunk%2Fprojects%2Fxcode4%2Fupnpxdemo.xcworkspace upnpxdemo.xcworkspace] for an Xcode 4 project example.

Appart from the Initial project setup, there are no differences using the upnpx stack API between Xcode 3, XCode 3.2.6 and Xcode 4 projects or iPhone, iPad, iOS and Mac OS X targets. All examples should work in all environments and/or for all targets.

<br>


* Xcode 3.2.2 *

During the tutorial we use the project [http://code.google.com/p/upnpx/source/browse/#svn%2Ftrunk%2Fprojects%2Fxcode3%2Fupnpx%2Fupnpx.xcodeproj ./upnpx/projects/xcode3/upnpxdemo/upnpxdemo.xcodeproj] as example code.

This is a "Navigation Based" application and in order to link libupnpx.a with it the following steps where done:

<br><br>

*1. Create a navigation based application:*

http://upnpx.googlecode.com/svn/wiki/images/navapp.png

<br><br>

*2. Drag libupnpx.a to the frameworks folder of your project (do not choose copy when asked) *

http://upnpx.googlecode.com/svn/wiki/images/draglibupnpx.png

<br><br>

*3. Set the libupnpx header include paths*

http://upnpx.googlecode.com/svn/wiki/images/includepaths.png

<br><br>

*4. Link against stdc++ and set the [http://developer.apple.com/library/mac/#qa/qa1490/_index.html -all_load] linker flag*

http://upnpx.googlecode.com/svn/wiki/images/linkstdc.png

<br><br>

*5. Select a compatible scheme with the one used while building the libupnpx.a library*
   * example: "Simulator 3.2 | Debug

http://upnpx.googlecode.com/svn/wiki/images/scheme.png