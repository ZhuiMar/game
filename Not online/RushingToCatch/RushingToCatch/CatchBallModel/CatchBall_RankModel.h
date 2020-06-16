//
//  CatchBall_RankModel.h
//  RushingToCatch
//
//  Created by zy on 2020/6/1.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "RLMObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface CatchBall_RankModel : RLMObject

@property NSString *type;
@property NSString *time;
@property NSString *score;

@end

NS_ASSUME_NONNULL_END
