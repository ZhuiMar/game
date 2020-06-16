//
//  ArithmeticMagicCup_OverVC.h
//  ArithmeticMagicCup
//
//  Created by zy on 2020/4/24.
//  Copyright © 2020 qingmai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ArithmeticMagicCup_Over)(void);

@interface ArithmeticMagicCup_OverVC : UIViewController

- (instancetype)initWithState:(NSInteger)state home:(ArithmeticMagicCup_Over)home again:(ArithmeticMagicCup_Over)again;

@end

NS_ASSUME_NONNULL_END
