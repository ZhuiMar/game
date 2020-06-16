//
//  SetModel.h
//  MyPlan
//
//  Created by  luzhaoyang on 2020/3/28.
//  Copyright © 2020 yunxi. All rights reserved.
//

#import "RLMObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface SetModel : RLMObject

@property NSString *type;
@property NSString *weight;
@property NSString *targetWeight;
@property NSString *days;

@end

NS_ASSUME_NONNULL_END
