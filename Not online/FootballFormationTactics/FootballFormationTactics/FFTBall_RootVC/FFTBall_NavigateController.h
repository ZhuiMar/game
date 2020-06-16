//
//  FFTBall_NavigateController.h
//  FootballFormationTactics
//
//  Created by zy on 2020/5/27.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^FFTBallBackBlock)(void);

@interface FFTBall_NavigateController : UINavigationController

@property(nonatomic, copy) FFTBallBackBlock back;

@end

NS_ASSUME_NONNULL_END
