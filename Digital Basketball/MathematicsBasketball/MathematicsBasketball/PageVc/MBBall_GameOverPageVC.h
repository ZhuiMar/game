//
//  MBBall_GameOverPageVC.h
//  MathematicsBasketball
//
//  Created by zy on 2020/5/26.
//  Copyright © 2020 zhongba. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^MBBallGameOverBlock) ();

@interface MBBall_GameOverPageVC : UIViewController

- (instancetype)initWithHome:(MBBallGameOverBlock)home again:(MBBallGameOverBlock)again score:(NSInteger)score;

@end

NS_ASSUME_NONNULL_END
