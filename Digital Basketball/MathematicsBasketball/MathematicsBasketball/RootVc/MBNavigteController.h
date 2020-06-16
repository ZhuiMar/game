//
//  MBNavigteController.h
//  MathematicsBasketball
//
//  Created by zy on 2020/5/25.
//  Copyright © 2020 zhongba. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^MBBallBackBlock)(void);

@interface MBNavigteController : UINavigationController

@property(nonatomic, copy) MBBallBackBlock back;

@end

NS_ASSUME_NONNULL_END
