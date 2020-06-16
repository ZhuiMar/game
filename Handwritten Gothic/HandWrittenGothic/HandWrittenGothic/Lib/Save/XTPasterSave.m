//
//  XTPasterSave.m
//  HandWrittenGothic
//
//  Created by zy on 2020/5/13.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import "XTPasterSave.h"

@implementation XTPasterSave

+ (instancetype)sharePaster{
    static XTPasterSave *_sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedSingleton = [[super allocWithZone:NULL] init];
    });
    return _sharedSingleton;
}

- (void)getPaster{
    YCPopoverData *datestring = [[YCPopoverData alloc]initWithThemeBlock:^(NSString * them) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"setBackgroundTheme" object:nil];
    }];
    [datestring getTheme];
}

@end
