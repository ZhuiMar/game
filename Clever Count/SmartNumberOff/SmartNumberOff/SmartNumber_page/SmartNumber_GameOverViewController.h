//
//  SmartNumber_GameOverViewController.h
//  SmartNumberOff
//
//  Created by zy on 2020/4/30.
//  Copyright © 2020 ximan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SmartNumber_OverBlock)(void);

@interface SmartNumber_GameOverViewController : UIViewController

- (instancetype)initWithScore:(NSInteger)score homeBlock:(SmartNumber_OverBlock)homeBlock againBlock:(SmartNumber_OverBlock)againBlock;

@end

NS_ASSUME_NONNULL_END
