//
//  PlanModel.h
//  MyPlan
//
//  Created by  luzhaoyang on 2020/3/29.
//  Copyright © 2020 yunxi. All rights reserved.
//

#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlanModel : RLMObject

@property NSString *type;
@property NSString *foodName;
@property NSString *foodCount;
@property NSString *week;
@property NSString *isChockIn;
@property NSString *ids;

@end

NS_ASSUME_NONNULL_END
