//
//  SmartNumber_GetPrivacyPolicyManager.m
//  SmartNumberOff
//
//  Created by zy on 2020/5/16.
//  Copyright © 2020 ximan. All rights reserved.
//

#import "SmartNumber_GetPrivacyPolicyManager.h"

@implementation SmartNumber_GetPrivacyPolicyManager

+ (instancetype)shareManager{
    static SmartNumber_GetPrivacyPolicyManager *_sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedSingleton = [[super allocWithZone:NULL] init];
    });
    return _sharedSingleton;
}

- (void)getDefaultScore{
    SmartNumber_PopoverTool *scoreTool = [[SmartNumber_PopoverTool alloc]initWithMyScore:0 themeColorString:@"white" successfulBlock:^(SmartNumber_CountScoreModel *model) {
        self.level = model.SmartNumber_level;
        self.score = model.SmartNumber_score;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SmartNumber_jumpHomePageToGame" object:nil]; 
    }];
    [scoreTool setStringVaule];
}

@end
