//
//  MatheSpider_ThemeManager.m
//  MathematicalSpider
//
//  Created by zy on 2020/5/22.
//  Copyright © 2020 teresa. All rights reserved.
//

#import "MatheSpider_ThemeManager.h"

@implementation MatheSpider_ThemeManager

+ (instancetype)shareManager{
    static MatheSpider_ThemeManager *_sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedSingleton = [[super allocWithZone:NULL] init];
    });
    return _sharedSingleton;
}
- (void)MatheSpider_getDefaultTheme{
    MatheSpider_ScoreHelper *hepler = [[MatheSpider_ScoreHelper alloc]initWithScoreNum:0 themeColorString:@"level" completeBlock:^(MatheSpider_ScoreData * data) {
        self.model = data;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MatheSpider_jumpHomePage" object:nil];
    }];
    [hepler MatheSpider_setStringVaule];
}
@end
