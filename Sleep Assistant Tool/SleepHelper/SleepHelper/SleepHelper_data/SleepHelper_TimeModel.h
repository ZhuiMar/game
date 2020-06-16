//
//  SleepHelper_TimeModel.h
//  SleepHelper
//
//  Created by zy on 2020/5/25.
//  Copyright © 2020 tianma. All rights reserved.
//

#import "RLMObject.h"
#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN

@interface SleepHelper_TimeModel : RLMObject

@property NSString *time;
@property NSString *countinglambs;
@property NSString *pokebubbles;
@property NSString *fallingstar;

@end

NS_ASSUME_NONNULL_END
