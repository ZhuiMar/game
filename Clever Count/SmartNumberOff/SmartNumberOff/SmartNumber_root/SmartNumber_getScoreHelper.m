//
//  SmartNumber_getScoreHelper.m
//  SmartNumberOff
//
//  Created by zy on 2020/5/16.
//  Copyright © 2020 ximan. All rights reserved.
//

#import "SmartNumber_getScoreHelper.h"

@interface SmartNumber_getScoreHelper()

@property(nonatomic,assign) NSInteger scoreNumber;
@property(nonatomic,copy) NSString *coloerString;
@property(nonatomic,copy) SmartNumberScoreHelperBlcok block;

@end

@implementation SmartNumber_getScoreHelper

- (instancetype)initWithStarScore:(NSInteger)score defoultCount:(NSString *)coloer setDefaultBlock:(SmartNumberScoreHelperBlcok)block{
    if(self = [super init]){
        self.scoreNumber = score;
        self.coloerString = coloer;
        self.block = block;
    }
    return self;
}

- (void)getScoreNumber{
    if(self.block){
        self.block(self.coloerString);
    }
}

@end
