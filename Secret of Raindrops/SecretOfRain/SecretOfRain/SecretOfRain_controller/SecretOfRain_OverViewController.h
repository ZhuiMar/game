//
//  SecretOfRain_OverViewController.h
//  SecretOfRain
//
//  Created by zy on 2020/4/27.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SecretOfRain_OverBlcok)(void);

@interface SecretOfRain_OverViewController : UIViewController

- (instancetype)initWithScore:(NSInteger)score type:(NSInteger)type isSu:(BOOL)isSu home:(SecretOfRain_OverBlcok)home again:(SecretOfRain_OverBlcok)again card:(SecretOfRain_OverBlcok)card;

@end

NS_ASSUME_NONNULL_END
