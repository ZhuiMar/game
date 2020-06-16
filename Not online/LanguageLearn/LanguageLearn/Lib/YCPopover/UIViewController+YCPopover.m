//
//  UIViewController+YCPopover.m
//  YCTransitionAnimation
//
//  Created by cyc on 2018/5/17.
//  Copyright © 2018years WellsCai. All rights reserved.
//

#import "UIViewController+YCPopover.h"
#import <objc/runtime.h>

static const char popoverAnimatorKey;

@implementation UIViewController (YCPopover)

- (YCPopoverAnimator *)popoverAnimator{
    return objc_getAssociatedObject(self, &popoverAnimatorKey);
}
- (void)setPopoverAnimator:(YCPopoverAnimator *)popoverAnimator{
    objc_setAssociatedObject(self, &popoverAnimatorKey, popoverAnimator, OBJC_ASSOCIATION_RETAIN) ;
}


- (void)yc_bottomPresentController:(UIViewController *)vc presentedHeight:(CGFloat)height completeHandle:(YCCompleteHandle)completion{
    self.popoverAnimator = [YCPopoverAnimator popoverAnimatorWithStyle:YCPopoverTypeActionSheet completeHandle:completion];
    
    vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.transitioningDelegate = self.popoverAnimator;
    [self.popoverAnimator setBottomViewHeight:height];

    [self presentViewController:vc animated:YES completion:nil];
}

- (void)yc_centerPresentController:(UIViewController *)vc presentedSize:(CGSize)size completeHandle:(YCCompleteHandle)completion{
    self.popoverAnimator = [YCPopoverAnimator popoverAnimatorWithStyle:YCPopoverTypeAlert completeHandle:completion];
    [self.popoverAnimator setCenterViewSize:size];

    vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.transitioningDelegate = self.popoverAnimator;
    
    [self presentViewController:vc animated:YES completion:nil];
}

@end
