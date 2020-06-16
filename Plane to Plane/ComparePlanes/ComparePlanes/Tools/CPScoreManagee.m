//
//  CPScoreManagee.m
//  ComparePlanes
//
//  Created by zy on 2020/5/7.
//  Copyright © 2020 qingxiriver. All rights reserved.
//

#import "CPScoreManagee.h"

@implementation CPScoreManagee


+ (instancetype)shareManager{
    static CPScoreManagee *_sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedSingleton = [[super allocWithZone:NULL] init];
    });
    return _sharedSingleton;
}

@end
