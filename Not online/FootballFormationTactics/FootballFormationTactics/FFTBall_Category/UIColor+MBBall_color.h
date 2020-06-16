//
//  UIColor+MBBall_color.h
//  MathematicsBasketball
//
//  Created by zy on 2020/5/26.
//  Copyright © 2020 zhongba. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (MBBall_color)

+ (UIColor *)FFTBall_colorWithHexString:(NSString*)stringToConvert;
+ (UIColor *)FFTBall_colorWithRGBHex:(UInt32)hex;

@end

NS_ASSUME_NONNULL_END
