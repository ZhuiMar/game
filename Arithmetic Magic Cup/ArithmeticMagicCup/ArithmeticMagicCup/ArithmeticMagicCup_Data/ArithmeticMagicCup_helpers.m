//
//  ArithmeticMagicCup_helpers.m
//  ArithmeticMagicCup
//
//  Created by zy on 2020/5/12.
//  Copyright © 2020 qingmai. All rights reserved.
//

#import "ArithmeticMagicCup_helpers.h"

@implementation ArithmeticMagicCup_helpers

+ (instancetype)getHelper{
    static ArithmeticMagicCup_helpers *_sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedSingleton = [[super allocWithZone:NULL] init];
    });
    return _sharedSingleton;
}
- (void)getDefaultCup{
    ArithmeticMagicCup_saveValue *save = [[ArithmeticMagicCup_saveValue alloc]initWithScoreBlcok:^(ArithmeticMagicCup_MyCupModel *dict) {
        self.model = dict;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MysteryBoard_jumpHomePage" object:nil];
    }];
    [save setUiDefault];
}
@end
