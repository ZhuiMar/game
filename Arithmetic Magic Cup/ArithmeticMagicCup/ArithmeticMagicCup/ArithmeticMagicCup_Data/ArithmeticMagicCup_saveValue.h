//
//  ArithmeticMagicCup_saveValue.h
//  ArithmeticMagicCup
//
//  Created by zy on 2020/5/12.
//  Copyright © 2020 qingmai. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ArithmeticMagicCup_SaveBlock)(ArithmeticMagicCup_MyCupModel *dict);

NS_ASSUME_NONNULL_BEGIN

@interface ArithmeticMagicCup_saveValue : NSObject


- (instancetype)initWithScoreBlcok:(ArithmeticMagicCup_SaveBlock)saveBlock;
- (void)setUiDefault;

@end

NS_ASSUME_NONNULL_END
