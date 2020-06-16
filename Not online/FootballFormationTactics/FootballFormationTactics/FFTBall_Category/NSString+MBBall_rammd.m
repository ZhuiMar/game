//
//  NSString+MBBall_rammd.m
//  MathematicsBasketball
//
//  Created by zy on 2020/5/26.
//  Copyright © 2020 zhongba. All rights reserved.
//

#import "NSString+MBBall_rammd.h"

@implementation NSString (MBBall_rammd)

+ (NSInteger)randomNumber:(NSInteger)from to:(NSInteger)to{
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}

@end
