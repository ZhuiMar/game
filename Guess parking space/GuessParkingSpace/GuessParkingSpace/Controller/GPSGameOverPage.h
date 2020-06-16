//
//  GPSGameOverPage.h
//  GuessParkingSpace
//
//  Created by luzhaoyang on 2020/4/9.
//  Copyright © 2020 xiangjia. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^GameOverBlock) (void);

@interface GPSGameOverPage : UIViewController


- (instancetype)initWithScore:(NSInteger)score homeBlock:(GameOverBlock)homeBlock againBlock:(GameOverBlock)againBlock;

@end

NS_ASSUME_NONNULL_END
