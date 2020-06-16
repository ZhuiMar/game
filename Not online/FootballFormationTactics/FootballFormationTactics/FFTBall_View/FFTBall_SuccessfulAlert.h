//
//  FFTBall_SuccessfulAlert.h
//  FootballFormationTactics
//
//  Created by zy on 2020/5/29.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^FFTBall_SuccessfulAlertBlock) (void);

@interface FFTBall_SuccessfulAlert : UIViewController

- (instancetype)initWithCancel:(FFTBall_SuccessfulAlertBlock)cancel newAc:(FFTBall_SuccessfulAlertBlock)newAc;

@end


NS_ASSUME_NONNULL_END
