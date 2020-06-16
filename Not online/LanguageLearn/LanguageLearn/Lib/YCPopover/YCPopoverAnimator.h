//
//  YCPopoverAnimator.h
//  YCTransitionAnimation
//
//  Created by cyc on 2018/5/17.
//  Copyright © 2018years WellsCai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCPopoverMacro.h"


@interface YCPopoverAnimator : NSObject<UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate>
@property(nonatomic,assign)CGRect       presentedFrame;
+ (instancetype)popoverAnimatorWithStyle:(YCPopoverType )popoverType completeHandle:(YCCompleteHandle)completeHandle;

- (void)setCenterViewSize:(CGSize)size;
- (void)setBottomViewHeight:(CGFloat)height;

@end
