//
//  CPScoreModel.h
//  ComparePlanes
//
//  Created by luzhaoyang on 2020/4/17.
//  Copyright © 2020 qingxiriver. All rights reserved.
//

#import "RLMObject.h"
#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN

@interface CPScoreModel : RLMObject

@property NSString *cp_type;
@property NSString *cp_level;
@property NSString *cp_score;

@end

NS_ASSUME_NONNULL_END
