//
//  SecretOfRain_getPrivacyHelper.m
//  SecretOfRain
//
//  Created by zy on 2020/5/22.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "SecretOfRain_getPrivacyHelper.h"

@interface SecretOfRain_getPrivacyHelper()

@property(nonatomic,copy)NSString *type;
@property(nonatomic,assign)NSInteger score;
@property(nonatomic,copy)SecretOfRain_getPrivacyHelperBlock completeBlock;

@end

@implementation SecretOfRain_getPrivacyHelper

- (instancetype)initWithType:(NSString *)type score:(NSInteger)score completeBlock:(SecretOfRain_getPrivacyHelperBlock)completeBlock{
    if(self = [super init]){
        self.type = type;
        self.score = score;
        self.completeBlock = completeBlock;
    }
    return self;
}
- (void)saveScore{
    if(self.completeBlock){
        self.completeBlock();
    }
}

@end
