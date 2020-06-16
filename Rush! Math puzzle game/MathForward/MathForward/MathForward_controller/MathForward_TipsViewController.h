//
//  MathForward_TipsViewController.h
//  MathForward
//
//  Created by luzhaoyang on 2020/4/21.
//  Copyright © 2020 teresa. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^MathForward_IKnowBlock) (void);

@interface MathForward_TipsViewController : UIViewController

- (instancetype)initIKnowTip:(NSInteger)tip know:(MathForward_IKnowBlock)iknow;

@end

NS_ASSUME_NONNULL_END
