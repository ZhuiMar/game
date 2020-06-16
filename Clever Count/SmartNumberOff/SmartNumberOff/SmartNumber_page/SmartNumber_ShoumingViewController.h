//
//  SmartNumber_ShoumingViewController.h
//  SmartNumberOff
//
//  Created by zy on 2020/4/30.
//  Copyright © 2020 ximan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SmartNumber_okAction)(void);

@interface SmartNumber_ShoumingViewController : UIViewController

- (instancetype)initTypeOK:(SmartNumber_okAction)okAction;

@end

NS_ASSUME_NONNULL_END
