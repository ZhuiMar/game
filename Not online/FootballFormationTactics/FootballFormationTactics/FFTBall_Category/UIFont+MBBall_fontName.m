//
//  UIFont+MBBall_fontName.m
//  MathematicsBasketball
//
//  Created by zy on 2020/5/26.
//  Copyright © 2020 zhongba. All rights reserved.
//

#import "UIFont+MBBall_fontName.h"

@implementation UIFont (MBBall_fontName)

+ (void)fontNames{
    NSArray *familyNames = [UIFont familyNames];
    for (NSString *familyName in familyNames) {
        printf("familyNames = %s\n",[familyName UTF8String]);
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for (NSString *fontName in fontNames) {
            printf("\tfontName = %s\n",[fontName UTF8String]);
        }
    }
}

@end
