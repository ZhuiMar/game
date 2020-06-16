
#import <UIKit/UIKit.h>
#import "YCPopoverMacro.h"

@interface YCPresentationController : UIPresentationController
@property(nonatomic,assign)CGSize           presentedSize;
@property(nonatomic,assign)CGFloat          presentedHeight;

@property(nonatomic,strong)UIView           *coverView;
@property(nonatomic,assign)YCPopoverType    popoverType;

@end
