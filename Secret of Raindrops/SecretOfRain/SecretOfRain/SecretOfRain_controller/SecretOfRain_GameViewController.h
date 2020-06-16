//
//  SecretOfRain_GameViewController.h
//  SecretOfRain
//
//  Created by zy on 2020/4/27.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecretOfRain_GameViewController : UIViewController

- (instancetype)initWithLevel:(NSInteger)level score:(NSInteger)score life:(NSInteger)life tip:(BOOL)tip;

@end

NS_ASSUME_NONNULL_END
