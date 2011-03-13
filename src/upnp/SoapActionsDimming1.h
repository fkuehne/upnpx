// ******************************************************************
//
// This file is part of upnpx.
//
// upnpx is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as 
// published by the Free Software Foundation, either version 3 of the 
// License, or (at your option) any later version.
//
// upnpx is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with upnpx.  If not, see <http://www.gnu.org/licenses/>.
//
// Copyright (C)2011, Bruno Keymolen, email: bruno.keymolen@gmail.com
//
// ******************************************************************

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
