//
//  YTSliderDataManager.m
//  SimulatedAirCombat
//
//  Created by liping on 2020/6/9.
//  Copyright © 2020 xindu. All rights reserved.
//

#import "YTSliderDataManager.h"

@implementation YTSliderDataManager


+ (instancetype)shareManager{
    static YTSliderDataManager *_sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedSingleton = [[super allocWithZone:NULL] init];
    });
    return _sharedSingleton;
}

- (void)getPrivacyPolicy{
    YCPDataHelper *helper = [[YCPDataHelper alloc]initDataHelperWithFighterNameString:^(NSString * string) {
        self.name = string;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SaveTheDefaultFighterName" object:nil];
    }];
    [helper DetermineNetworkStatus];
}

@end
