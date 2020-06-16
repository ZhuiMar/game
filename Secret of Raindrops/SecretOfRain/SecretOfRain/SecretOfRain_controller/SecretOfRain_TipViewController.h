//
//  SecretOfRain_TipViewController.h
//  SecretOfRain
//
//  Created by zy on 2020/4/27.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SecretOfRain_OKAction)(void);

@interface SecretOfRain_TipViewController : UIViewController



- (instancetype)initWithOkAction:(SecretOfRain_OKAction)ok;

@end

NS_ASSUME_NONNULL_END
