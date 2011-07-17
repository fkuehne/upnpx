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
    outputKeys = [NSArray arrayWithObjects:@"SupportedDataModels", nil];
    outputObjects = [NSArray arrayWithObjects:supporteddatamodels, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"StartingNode", @"SearchDepth", nil];
    parameterObjects = [NSArray arrayWithObjects:startingnode, searchdepth, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"Result", nil];
    outputObjects = [NSArray arrayWithObjects:result, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"StartingNode", @"SearchDepth", nil];
    parameterObjects = [NSArray arrayWithObjects:startingnode, searchdepth, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"Result", nil];
    outputObjects = [NSArray arrayWithObjects:result, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"Parameters", nil];
    parameterObjects = [NSArray arrayWithObjects:parameters, nil];
    parametersd = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"ParameterValueList", nil];
    outputObjects = [NSArray arrayWithObjects:parametervaluelist, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"StartingNode", @"Filter", nil];
    parameterObjects = [NSArray arrayWithObjects:startingnode, filter, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"ParameterValueList", nil];
    outputObjects = [NSArray arrayWithObjects:parametervaluelist, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"ParameterValueList", nil];
    parameterObjects = [NSArray arrayWithObjects:parametervaluelist, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"Status", nil];
    outputObjects = [NSArray arrayWithObjects:status, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"MultiInstanceName", @"ChildrenInitialization", nil];
    parameterObjects = [NSArray arrayWithObjects:multiinstancename, childreninitialization, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"InstanceIdentifier", @"Status", nil];
    outputObjects = [NSArray arrayWithObjects:instanceidentifier, status, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"InstanceIdentifier", nil];
    parameterObjects = [NSArray arrayWithObjects:instanceidentifier, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"Status", nil];
    outputObjects = [NSArray arrayWithObjects:status, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"Parameters", nil];
    parameterObjects = [NSArray arrayWithObjects:parameters, nil];
    parametersd = [NSDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"NodeAttributeValueList", nil];
    outputObjects = [NSArray arrayWithObjects:nodeattributevaluelist, nil];
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
    parameterKeys = [NSArray arrayWithObjects:@"NodeAttributeValueList", nil];
    parameterObjects = [NSArray arrayWithObjects:nodeattributevaluelist, nil];
    parameters = [OrderedDictionary dictionaryWithObjects:parameterObjects forKeys:parameterKeys];

    NSArray *outputObjects = nil;
    NSArray *outputKeys = nil;
    outputKeys = [NSArray arrayWithObjects:@"Status", nil];
    outputObjects = [NSArray arrayWithObjects:status, nil];
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
    outputKeys = [NSArray arrayWithObjects:@"StateVariableValue", nil];
    outputObjects = [NSArray arrayWithObjects:statevariablevalue, nil];
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
    outputKeys = [NSArray arrayWithObjects:@"StateVariableValue", nil];
    outputObjects = [NSArray arrayWithObjects:statevariablevalue, nil];
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
    outputKeys = [NSArray arrayWithObjects:@"StateVariableValue", nil];
    outputObjects = [NSArray arrayWithObjects:statevariablevalue, nil];
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
    outputKeys = [NSArray arrayWithObjects:@"StateVariableValue", nil];
    outputObjects = [NSArray arrayWithObjects:statevariablevalue, nil];
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
    outputKeys = [NSArray arrayWithObjects:@"StateVariableValue", nil];
    outputObjects = [NSArray arrayWithObjects:statevariablevalue, nil];
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
    outputKeys = [NSArray arrayWithObjects:@"StateVariableValue", nil];
    outputObjects = [NSArray arrayWithObjects:statevariablevalue, nil];
    output = [NSDictionary dictionaryWithObjects:outputObjects forKeys:outputKeys];

    ret = [self action:@"GetAttributeValuesUpdate" parameters:parameters returnValues:output];
    return ret;
}



@end
