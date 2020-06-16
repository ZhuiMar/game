

#import <UIKit/UIKit.h>
#import "YCPopoverMacro.h"
#import "YCPopoverAnimator.h"

@interface UIViewController (YCPopover)
@property(nonatomic,strong)YCPopoverAnimator        *popoverAnimator;

- (void)yc_bottomPresentController:(UIViewController *)vc presentedHeight:(CGFloat)height completeHandle:(YCCompleteHandle)completion;

- (void)yc_centerPresentController:(UIViewController *)vc presentedSize:(CGSize)size completeHandle:(YCCompleteHandle)completion;


@end
