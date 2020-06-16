//
//  CatchBall_Navigatetion.h
//  RushingToCatch
//
//  Created by zy on 2020/6/1.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^CatchBallNavigatetionBlock)(void);

@interface CatchBall_Navigatetion : UINavigationController

@property(nonatomic, copy) CatchBallNavigatetionBlock back;

@end

NS_ASSUME_NONNULL_END
