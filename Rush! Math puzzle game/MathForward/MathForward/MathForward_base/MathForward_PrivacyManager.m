//
//  MathForward_PrivacyManager.m
//  MathForward
//
//  Created by zy on 2020/5/14.
//  Copyright © 2020 teresa. All rights reserved.
//

#import "MathForward_PrivacyManager.h"

@implementation MathForward_PrivacyManager

+ (instancetype)getManager{
    static MathForward_PrivacyManager *_sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedSingleton = [[super allocWithZone:NULL] init];
    });
    return _sharedSingleton;
}
- (void)getDefaultTheme{
    MathForward_ThemeTool *score = [[MathForward_ThemeTool alloc]initWithScore:0 themeColor:@"green" completeBlock:^(MathForward_ScoreData * model) {
        self.score = model;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MysteryBoard_jumpHomePage" object:nil];
    }];
    [score setStringVaule];
}
@end
