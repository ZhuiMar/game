//
//  NMItemView.h
//  NumberOfMemory
//
//  Created by luzhaoyang on 2020/4/11.
//  Copyright © 2020 huadu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class NMItemView;
@protocol NMItemViewDelegate <NSObject>

- (void)clickLeftItemWithVaule:(NSInteger)vaule item:(NMItemView *)item;
- (void)clickRightItemWithVaule:(NSInteger)vaule item:(NMItemView *)item;

@end

@interface NMItemView : UIView

@property(nonatomic,weak) id<NMItemViewDelegate>delegate;

@property(nonatomic, strong)UIButton *bgBtn;
@property(nonatomic, strong)UIButton *coverBtn;

@property(nonatomic, assign)NSInteger value;
@property(nonatomic, copy)NSString *valueStr;


- (void)setView;

- (void)startAnimation;
- (void)stopAnimation;

- (void)showCover;
- (void)hiddenCover;

@end

NS_ASSUME_NONNULL_END
