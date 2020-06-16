//
//  SACProssTool.m
//  SimulatedAirCombat
//
//  Created by liping on 2020/6/9.
//  Copyright © 2020 xindu. All rights reserved.
//

#import "SACProssTool.h"

@implementation SACProssTool

- (instancetype)initGetProssToolWithFighterName:(NSString *)name complete:(SACProssToolBlock)complete{
    if(self = [super init]){
        self.complete = complete;
        self.fightName = name;
    }
    return self;
}
- (void)setData{
    if(self.complete){
        self.complete();
    }
}

@end
