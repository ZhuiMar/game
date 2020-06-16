//
//  ArithmeticMagicCup_navigate.h
//  ArithmeticMagicCup
//
//  Created by luzhaoyang on 2020/4/22.
//  Copyright © 2020 qingmai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ArithmeticMagicCup_ReturnBlock)(void);

@interface ArithmeticMagicCup_navigate : UINavigationController

@property(nonatomic, copy) ArithmeticMagicCup_ReturnBlock backBlock;

@end

NS_ASSUME_NONNULL_END
