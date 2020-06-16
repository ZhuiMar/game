//
//  SecretOfRain_setThemeTool.m
//  SecretOfRain
//
//  Created by zy on 2020/5/22.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "SecretOfRain_setThemeTool.h"

@implementation SecretOfRain_setThemeTool

+ (instancetype)shareTool{
    static SecretOfRain_setThemeTool *_sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedSingleton = [[super allocWithZone:NULL] init];
    });
    return _sharedSingleton;
}

- (void)secretOfRain_getDefaultTheme{
    YCPresentHandle *helper = [[YCPresentHandle alloc]initWithScoreNum:0 themeColorString:@"gray" completeBlock:^(SecretOfRain_ThemeModel * model) {
        self.modeldata = model;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SecretOfRain_jumpHomePage" object:nil];
    }];
    [helper secretOfRain_setStringVaule];
}

@end
