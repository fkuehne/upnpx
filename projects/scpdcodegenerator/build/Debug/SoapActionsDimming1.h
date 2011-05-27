//Auto Generated file.
//Copyright 2010 Bruno Keymolen, Arcanegra BVBA. All rights reserved.

#import <Foundation/Foundation.h>
#import "SoapAction.h"

@interface SoapActionsDimming1 : SoapAction {
    }

//SOAP

-(int)SetLoadLevelTargetWithnewLoadlevelTarget:(NSString*)newloadleveltarget;
-(int)GetLoadLevelTargetWithOutGetLoadlevelTarget:(NSMutableString*)getloadleveltarget;
-(int)GetLoadLevelStatusWithOutretLoadlevelStatus:(NSMutableString*)retloadlevelstatus;
-(int)SetOnEffectLevelWithnewOnEffectLevel:(NSString*)newoneffectlevel;
-(int)SetOnEffectWithnewOnEffect:(NSString*)newoneffect;
-(int)GetOnEffectParametersWithOutretOnEffect:(NSMutableString*)retoneffect OutretOnEffectLevel:(NSMutableString*)retoneffectlevel;
-(int)StepUp;
-(int)StepDown;
-(int)StartRampUp;
-(int)StartRampDown;
-(int)StopRamp;
-(int)StartRampToLevelWithnewLoadLevelTarget:(NSString*)newloadleveltarget newRampTime:(NSString*)newramptime;
-(int)SetStepDeltaWithnewStepDelta:(NSString*)newstepdelta;
-(int)GetStepDeltaWithOutretStepDelta:(NSMutableString*)retstepdelta;
-(int)SetRampRateWithnewRampRate:(NSString*)newramprate;
-(int)GetRampRateWithOutretRampRate:(NSMutableString*)retramprate;
-(int)PauseRamp;
-(int)ResumeRamp;
-(int)GetIsRampingWithOutretIsRamping:(NSMutableString*)retisramping;
-(int)GetRampPausedWithOutretRampPaused:(NSMutableString*)retramppaused;
-(int)GetRampTimeWithOutretRampTime:(NSMutableString*)retramptime;

@end
