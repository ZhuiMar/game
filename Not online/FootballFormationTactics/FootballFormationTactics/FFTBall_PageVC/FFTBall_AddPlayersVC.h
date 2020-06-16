//
//  FFTBall_AddPlayersVC.h
//  FootballFormationTactics
//
//  Created by zy on 2020/5/28.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^FFTBall_AddPlayersBlock) (NSInteger);

@interface FFTBall_AddPlayersVC : UIViewController

- (instancetype)initWithNumberBlock:(FFTBall_AddPlayersBlock)numBlock;

@end

NS_ASSUME_NONNULL_END
