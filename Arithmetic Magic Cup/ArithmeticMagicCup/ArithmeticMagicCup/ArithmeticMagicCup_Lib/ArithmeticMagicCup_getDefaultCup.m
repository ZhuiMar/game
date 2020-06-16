//
//  ArithmeticMagicCup_getDefaultCup.m
//  ArithmeticMagicCup
//
//  Created by zy on 2020/5/12.
//  Copyright © 2020 qingmai. All rights reserved.
//

#import "ArithmeticMagicCup_getDefaultCup.h"

@interface ArithmeticMagicCup_getDefaultCup()

@property(nonatomic,copy)ArithmeticMagicCup_getDefaultCupNBlock myCupBlcok;

@end

@implementation ArithmeticMagicCup_getDefaultCup

- (instancetype)initGetMyCup:(ArithmeticMagicCup_getDefaultCupNBlock)myCupBlock{
    if(self = [super init]){
        self.myCupBlcok = myCupBlock;
    }
    return self;
}

- (void)getMyFisrtCup{
    if (self.myCupBlcok){
        self.myCupBlcok(@"Cup_useing");
    }
}

@end
