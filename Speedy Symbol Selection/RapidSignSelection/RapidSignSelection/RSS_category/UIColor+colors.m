//
//  UIColor+colors.m
//  RapidSignSelection
//
//  Created by zy on 2020/6/4.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "UIColor+colors.h"

@implementation UIColor (colors)

+ (UIColor *)RSScolorWithHexString:(NSString*)stringToConvert{
    if([stringToConvert hasPrefix:@"#"]){
        stringToConvert = [stringToConvert substringFromIndex:1];
    }
    NSScanner*scanner = [NSScanner scannerWithString:stringToConvert];
    unsigned hexNum;
    if(![scanner scanHexInt:&hexNum]){
        return nil;
    }
    return [self RSScolorWithRGBHex:hexNum];
}
+ (UIColor *)RSScolorWithRGBHex:(UInt32)hex{
    int r = (hex >>16) &0xFF;
    int g = (hex >>8) &0xFF;
    int b = (hex) &0xFF;
    return[UIColor colorWithRed:r /255.0f
                          green:g /255.0f
                           blue:b /255.0f
                          alpha:1.0f];
}

@end
