//
//  ArithmeticMagicCup_CupItems.h
//  ArithmeticMagicCup
//
//  Created by zy on 2020/4/24.
//  Copyright © 2020 qingmai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ArithmeticMagicCup_CupItems;
@protocol ArithmeticMagicCup_CupItemsDelegate <NSObject>

- (void)clcikItem:(ArithmeticMagicCup_CupItems *)item right:(NSInteger)right;

@end

@interface ArithmeticMagicCup_CupItems : UIView

@property (weak, nonatomic) IBOutlet UIImageView *cup;

@property (weak, nonatomic) IBOutlet UIButton *ballOne;
@property (weak, nonatomic) IBOutlet UIButton *ballTwo;
@property (weak, nonatomic) IBOutlet UIButton *ballThree;
@property (weak, nonatomic) IBOutlet UIButton *ballFour;
@property (weak, nonatomic) IBOutlet UIButton *clickBtn;
@property (weak, nonatomic) IBOutlet UIView *rightView;

@property(nonatomic, weak)id<ArithmeticMagicCup_CupItemsDelegate>delegate;

@property (nonatomic, assign) NSInteger right;

+ (instancetype)getCupItemsWithLevel:(NSInteger)level;

@end

NS_ASSUME_NONNULL_END
