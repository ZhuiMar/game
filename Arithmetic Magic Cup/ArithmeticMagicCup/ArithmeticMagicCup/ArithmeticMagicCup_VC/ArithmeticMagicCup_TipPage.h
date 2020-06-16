//
//  ArithmeticMagicCup_TipPage.h
//  ArithmeticMagicCup
//
//  Created by zy on 2020/4/23.
//  Copyright © 2020 qingmai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ArithmeticMagicCup_TipBlock) (void);

@interface ArithmeticMagicCup_TipPage : UIViewController

- (instancetype)initWithType:(NSInteger)type block:(ArithmeticMagicCup_TipBlock)block;

@end

NS_ASSUME_NONNULL_END
