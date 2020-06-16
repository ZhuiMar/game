//
//  MathForward_SaveDataHelp.m
//  MathForward
//
//  Created by zy on 2020/5/14.
//  Copyright © 2020 teresa. All rights reserved.
//

#import "MathForward_SaveDataHelp.h"

@interface MathForward_SaveDataHelp()

@property(nonatomic,copy) MathForwardVBlock block;

@end

@implementation MathForward_SaveDataHelp

- (instancetype)initWithSavaBlock:(MathForwardVBlock)block{
    if(self = [super init]){
        self.block = block;
    }
    return self;
}
- (void)saveScore{
    if(self.block){
        self.block(@"level 0");
    }
}
@end
