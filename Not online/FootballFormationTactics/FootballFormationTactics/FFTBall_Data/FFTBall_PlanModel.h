//
//  FFTBall_PlanModel.h
//  FootballFormationTactics
//
//  Created by zy on 2020/5/28.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import "RLMObject.h"
#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN

@interface FFTBall_PlanModel : RLMObject

@property NSString *isStr;
@property NSString *name;
@property NSString *date;
@property NSString *place;
@property NSString *image;

@end

NS_ASSUME_NONNULL_END
