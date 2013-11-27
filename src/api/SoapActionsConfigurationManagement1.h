//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import <Foundation/Foundation.h>
#import "SoapAction.h"

@interface SoapActionsConfigurationManagement1 : SoapAction {
    }

//SOAP

-(int)GetSupportedDataModelsWithOutSupportedDataModels:(NSMutableString*)supporteddatamodels;
-(int)GetSupportedParametersWithStartingNode:(NSString*)startingnode SearchDepth:(NSString*)searchdepth OutResult:(NSMutableString*)result;
-(int)GetInstancesWithStartingNode:(NSString*)startingnode SearchDepth:(NSString*)searchdepth OutResult:(NSMutableString*)result;
-(int)GetValuesWithParameters:(NSString*)parameters OutParameterValueList:(NSMutableString*)parametervaluelist;
-(int)GetSelectedValuesWithStartingNode:(NSString*)startingnode Filter:(NSString*)filter OutParameterValueList:(NSMutableString*)parametervaluelist;
-(int)SetValuesWithParameterValueList:(NSString*)parametervaluelist OutStatus:(NSMutableString*)status;
-(int)CreateInstanceWithMultiInstanceName:(NSString*)multiinstancename ChildrenInitialization:(NSString*)childreninitialization OutInstanceIdentifier:(NSMutableString*)instanceidentifier OutStatus:(NSMutableString*)status;
-(int)DeleteInstanceWithInstanceIdentifier:(NSString*)instanceidentifier OutStatus:(NSMutableString*)status;
-(int)GetAttributesWithParameters:(NSString*)parameters OutNodeAttributeValueList:(NSMutableString*)nodeattributevaluelist;
-(int)SetAttributesWithNodeAttributeValueList:(NSString*)nodeattributevaluelist OutStatus:(NSMutableString*)status;
-(int)GetInconsistentStatusWithOutStateVariableValue:(NSMutableString*)statevariablevalue;
-(int)GetConfigurationUpdateWithOutStateVariableValue:(NSMutableString*)statevariablevalue;
-(int)GetCurrentConfigurationVersionWithOutStateVariableValue:(NSMutableString*)statevariablevalue;
-(int)GetSupportedDataModelsUpdateWithOutStateVariableValue:(NSMutableString*)statevariablevalue;
-(int)GetSupportedParametersUpdateWithOutStateVariableValue:(NSMutableString*)statevariablevalue;
-(int)GetAttributeValuesUpdateWithOutStateVariableValue:(NSMutableString*)statevariablevalue;

@end
