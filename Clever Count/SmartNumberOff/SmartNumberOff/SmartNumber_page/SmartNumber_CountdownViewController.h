//
//  SmartNumber_CountdownViewController.h
//  SmartNumberOff
//
//  Created by zy on 2020/4/29.
//  Copyright © 2020 ximan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SmartNumber_countDownBlock)(void);

@interface SmartNumber_CountdownViewController : UIViewController

- (instancetype)initWithBlock:(SmartNumber_countDownBlock)over;



@end

NS_ASSUME_NONNULL_END
