//
//  SDPasterSave.m
//  SmartDetective
//
//  Created by zy on 2020/5/23.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import "SDPasterSave.h"

@implementation SDPasterSave

+ (instancetype)sharePasterView{
    static SDPasterSave *_share = nil;
       static dispatch_once_t onceToken;
       dispatch_once(&onceToken, ^{
           _share = [[super allocWithZone:NULL] init];
       });
       return _share;
}

- (void)getPasterView{
    YCPPasterViewData *dataString = [[YCPPasterViewData alloc]initWithThemeColorBlock:^(NSString * string) {
        [[NSNotificationCenter defaultCenter] postNotificationName:string object:nil];
    }];
    [dataString setDefaultBackGround];
}

@end
