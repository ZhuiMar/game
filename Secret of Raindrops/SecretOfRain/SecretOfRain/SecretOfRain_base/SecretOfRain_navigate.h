//
//  SecretOfRain_navigate.h
//  SecretOfRain
//
//  Created by zy on 2020/4/27.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^SecretOfRain_ReturnBlock)(void);

@interface SecretOfRain_navigate : UINavigationController

@property(nonatomic, copy) SecretOfRain_ReturnBlock backBlock;

@end

NS_ASSUME_NONNULL_END
