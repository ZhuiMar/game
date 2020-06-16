//
//  NSString+string.m
//  RapidSignSelection
//
//  Created by zy on 2020/6/4.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "NSString+string.h"

@implementation NSString (string)

+ (NSInteger)randomNumber:(NSInteger)from to:(NSInteger)to{
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}

@end
