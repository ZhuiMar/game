//
//  SmartNumber_GameViewController.h
//  SmartNumberOff
//
//  Created by zy on 2020/4/30.
//  Copyright © 2020 ximan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SmartNumber_GameViewController : UIViewController

- (instancetype)initWithLevel:(NSInteger)level score:(NSInteger)score life:(NSInteger)life showTip:(BOOL)showTip;

@end

NS_ASSUME_NONNULL_END
