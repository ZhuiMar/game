//
//  BuoyMath_LifeBuoyView.h
//  BuoyMathematics
//
//  Created by zy on 2020/4/26.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BuoyMath_LifeBuoyViewDelegate <NSObject>

- (void)clickItemAction;

@end

@interface BuoyMath_LifeBuoyView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *buoyFive;
@property (weak, nonatomic) IBOutlet UIImageView *buoyFour;
@property (weak, nonatomic) IBOutlet UIImageView *bouyThree;
@property (weak, nonatomic) IBOutlet UIImageView *bouyTwo;
@property (weak, nonatomic) IBOutlet UIImageView *bouyOne;

@property (nonatomic,weak) id<BuoyMath_LifeBuoyViewDelegate>delegate;
@property (nonatomic,assign) NSInteger value;
@property (nonatomic,assign) BOOL isCanClick;

+ (instancetype)getBouyViewWithLevel:(NSInteger)level;

- (NSInteger)setBouyCount;

@end

NS_ASSUME_NONNULL_END
