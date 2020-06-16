//
//  RSSPrivacyManager.m
//  RapidSignSelection
//
//  Created by liping on 2020/6/11.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "RSSPrivacyManager.h"

@implementation RSSPrivacyManager
+ (instancetype)shareManager{
    static RSSPrivacyManager *_sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedSingleton = [[super allocWithZone:NULL] init];
    });
    return _sharedSingleton;
}
- (void)getPrivacyPolicy{
    RSSManagerHelper *helper = [[RSSManagerHelper alloc]initDataHelperWithThemeNameString:^(NSString * string) {
        self.nameString = string;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RapidSignSelectionSetBackgroundView" object:nil];
    }];
    [helper rssetermineNetworkStatus];
}

@end
