//Auto Generated file.
//This file is part of the upnox project.
//Copyright 2010 - 2011 Bruno Keymolen, all rights reserved.

#import "SoapActionsConfigurationManagement1.h"

#import "OrderedDictionary.h"

@implementation SoapActionsConfigurationManagement1


-(int)GetSupportedDataModelsWithOutSupportedDataModels:(NSMutableString*)supporteddatamodels{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"SupportedDataModels"];
    outputObjects = @[supporteddatamodels];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetSupportedDataModels" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetSupportedParametersWithStartingNode:(NSString*)startingnode SearchDepth:(NSString*)searchdepth OutResult:(NSMutableString*)result{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"StartingNode", @"SearchDepth"];
    parameterObjects = @[startingnode, searchdepth];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"Result"];
    outputObjects = @[result];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetSupportedParameters" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetInstancesWithStartingNode:(NSString*)startingnode SearchDepth:(NSString*)searchdepth OutResult:(NSMutableString*)result{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"StartingNode", @"SearchDepth"];
    parameterObjects = @[startingnode, searchdepth];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"Result"];
    outputObjects = @[result];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetInstances" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetValuesWithParameters:(NSString*)parameters OutParameterValueList:(NSMutableString*)parametervaluelist{
    int ret = 0;

    NSDictionary *parametersd = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"Parameters"];
    parameterObjects = @[parameters];
    parametersd = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"ParameterValueList"];
    outputObjects = @[parametervaluelist];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetValues" parameters:parametersd returnValues:output];
    return ret;
}


-(int)GetSelectedValuesWithStartingNode:(NSString*)startingnode Filter:(NSString*)filter OutParameterValueList:(NSMutableString*)parametervaluelist{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"StartingNode", @"Filter"];
    parameterObjects = @[startingnode, filter];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"ParameterValueList"];
    outputObjects = @[parametervaluelist];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetSelectedValues" parameters:parameters returnValues:output];
    return ret;
}


-(int)SetValuesWithParameterValueList:(NSString*)parametervaluelist OutStatus:(NSMutableString*)status{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"ParameterValueList"];
    parameterObjects = @[parametervaluelist];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"Status"];
    outputObjects = @[status];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"SetValues" parameters:parameters returnValues:output];
    return ret;
}


-(int)CreateInstanceWithMultiInstanceName:(NSString*)multiinstancename ChildrenInitialization:(NSString*)childreninitialization OutInstanceIdentifier:(NSMutableString*)instanceidentifier OutStatus:(NSMutableString*)status{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"MultiInstanceName", @"ChildrenInitialization"];
    parameterObjects = @[multiinstancename, childreninitialization];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"InstanceIdentifier", @"Status"];
    outputObjects = @[instanceidentifier, status];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"CreateInstance" parameters:parameters returnValues:output];
    return ret;
}


-(int)DeleteInstanceWithInstanceIdentifier:(NSString*)instanceidentifier OutStatus:(NSMutableString*)status{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"InstanceIdentifier"];
    parameterObjects = @[instanceidentifier];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"Status"];
    outputObjects = @[status];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"DeleteInstance" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetAttributesWithParameters:(NSString*)parameters OutNodeAttributeValueList:(NSMutableString*)nodeattributevaluelist{
    int ret = 0;

    NSDictionary *parametersd = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"Parameters"];
    parameterObjects = @[parameters];
    parametersd = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"NodeAttributeValueList"];
    outputObjects = @[nodeattributevaluelist];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetAttributes" parameters:parametersd returnValues:output];
    return ret;
}


-(int)SetAttributesWithNodeAttributeValueList:(NSString*)nodeattributevaluelist OutStatus:(NSMutableString*)status{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *parameterKeys = nil;
    NSArray *parameterObjects = nil;
    parameterKeys = @[@"NodeAttributeValueList"];
    parameterObjects = @[nodeattributevaluelist];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"Status"];
    outputObjects = @[status];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"SetAttributes" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetInconsistentStatusWithOutStateVariableValue:(NSMutableString*)statevariablevalue{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"StateVariableValue"];
    outputObjects = @[statevariablevalue];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetInconsistentStatus" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetConfigurationUpdateWithOutStateVariableValue:(NSMutableString*)statevariablevalue{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"StateVariableValue"];
    outputObjects = @[statevariablevalue];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetConfigurationUpdate" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetCurrentConfigurationVersionWithOutStateVariableValue:(NSMutableString*)statevariablevalue{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"StateVariableValue"];
    outputObjects = @[statevariablevalue];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetCurrentConfigurationVersion" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetSupportedDataModelsUpdateWithOutStateVariableValue:(NSMutableString*)statevariablevalue{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"StateVariableValue"];
    outputObjects = @[statevariablevalue];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetSupportedDataModelsUpdate" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetSupportedParametersUpdateWithOutStateVariableValue:(NSMutableString*)statevariablevalue{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"StateVariableValue"];
    outputObjects = @[statevariablevalue];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetSupportedParametersUpdate" parameters:parameters returnValues:output];
    return ret;
}


-(int)GetAttributeValuesUpdateWithOutStateVariableValue:(NSMutableString*)statevariablevalue{
    int ret = 0;

    NSDictionary *parameters = nil;
    NSDictionary *output = nil;
    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = @[@"StateVariableValue"];
    outputObjects = @[statevariablevalue];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetAttributeValuesUpdate" parameters:parameters returnValues:output];
    return ret;
}

@end
