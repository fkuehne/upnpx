//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import <Foundation/Foundation.h>
#import "SoapAction.h"

@interface SoapActionsWANDSLLinkConfig1 : SoapAction {
    }

//SOAP

-(int)SetDSLLinkTypeWithNewLinkType:(NSString*)newlinktype;
-(int)GetDSLLinkInfoWithOutNewLinkType:(NSMutableString*)newlinktype OutNewLinkStatus:(NSMutableString*)newlinkstatus;
-(int)GetAutoConfigWithOutNewAutoConfig:(NSMutableString*)newautoconfig;
-(int)GetModulationTypeWithOutNewModulationType:(NSMutableString*)newmodulationtype;
-(int)SetDestinationAddressWithNewDestinationAddress:(NSString*)newdestinationaddress;
-(int)GetDestinationAddressWithOutNewDestinationAddress:(NSMutableString*)newdestinationaddress;
-(int)SetATMEncapsulationWithNewATMEncapsulation:(NSString*)newatmencapsulation;
-(int)GetATMEncapsulationWithOutNewATMEncapsulation:(NSMutableString*)newatmencapsulation;
-(int)SetFCSPreservedWithNewFCSPreserved:(NSString*)newfcspreserved;
-(int)GetFCSPreservedWithOutNewFCSPreserved:(NSMutableString*)newfcspreserved;

@end
