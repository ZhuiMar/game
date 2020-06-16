//
//  UIColor+colors.h
//  RapidSignSelection
//
//  Created by zy on 2020/6/4.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (colors)

+ (UIColor *)RSScolorWithHexString:(NSString*)stringToConvert;
+ (UIColor *)RSScolorWithRGBHex:(UInt32)hex;

@end

NS_ASSUME_NONNULL_END
