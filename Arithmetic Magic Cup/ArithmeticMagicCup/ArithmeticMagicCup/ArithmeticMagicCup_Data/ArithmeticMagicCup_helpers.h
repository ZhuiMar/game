//
//  ArithmeticMagicCup_helpers.h
//  ArithmeticMagicCup
//
//  Created by zy on 2020/5/12.
//  Copyright © 2020 qingmai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArithmeticMagicCup_helpers : NSObject

@property(nonatomic,strong) ArithmeticMagicCup_MyCupModel *model;

+ (instancetype)getHelper;
- (void)getDefaultCup;

@end

NS_ASSUME_NONNULL_END
