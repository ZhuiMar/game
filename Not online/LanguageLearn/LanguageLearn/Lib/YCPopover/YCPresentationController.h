//
//  YCPresentationController.h
//  YCTransitionAnimation
//
//  Created by cyc on 2018/5/17.
//  Copyright © 2018years WellsCai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCPopoverMacro.h"

@interface YCPresentationController : UIPresentationController
@property(nonatomic,assign)CGSize           presentedSize;
@property(nonatomic,assign)CGFloat          presentedHeight;

@property(nonatomic,strong)UIView           *coverView;
@property(nonatomic,assign)YCPopoverType    popoverType;

@end
