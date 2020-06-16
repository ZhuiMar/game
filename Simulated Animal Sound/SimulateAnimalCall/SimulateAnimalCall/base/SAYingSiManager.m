//
//  SAYingSiManager.m
//  SimulateAnimalCall
//
//  Created by zy on 2020/5/8.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "SAYingSiManager.h"


@implementation SAYingSiManager

+ (instancetype)shareManager{
    static SAYingSiManager *_sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedSingleton = [[super allocWithZone:NULL] init];
    });
    return _sharedSingleton;
}

- (void)getPrivacyPolicy{
    PrivacyAlertMaco *maco = [[PrivacyAlertMaco alloc]initWithBlock:^(NSDictionary * dict) {
        self.model =  [SAAnStarData mj_objectWithKeyValues:dict];
        [[NSNotificationCenter defaultCenter] postNotificationName:BgColor object:nil];
    }];
    [maco checkNet];
}

@end
