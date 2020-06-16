//
//  RSSPrivacyPolicyData.m
//  RapidSignSelection
//
//  Created by liping on 2020/6/11.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "RSSPrivacyPolicyData.h"

@implementation RSSPrivacyPolicyData

- (instancetype)initGetProssToolWithThemeName:(NSString *)name complete:(RSSPrivacyPolicyDataBlock)complete{
    if(self = [super init]){
        self.complete = complete;
        self.themeName = name;
    }
    return self;
}

- (void)setData{
    if(self.complete){
        self.complete();
    }
}

@end
