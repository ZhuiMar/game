//
//  MathForward_navigation.h
//  MathForward
//
//  Created by luzhaoyang on 2020/4/21.
//  Copyright © 2020 teresa. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^CRReturnBlock)(void);

@interface MathForward_navigation : UINavigationController

@property(nonatomic, copy) CRReturnBlock backBlock;

@end

NS_ASSUME_NONNULL_END
