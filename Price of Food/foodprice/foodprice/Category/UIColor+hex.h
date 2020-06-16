//
//  UIColor+hex.h
//  PumiceJump
//
//  Created by  luzhaoyang on 2019/11/3.
//  Copyright © 2019 YuanLi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (hex)

+ (UIColor *)colorWithHexString:(NSString*)stringToConvert;
+ (void)bgColorWithView:(UIView *)view;

@end

