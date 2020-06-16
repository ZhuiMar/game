//
//  SACProssTool.h
//  SimulatedAirCombat
//
//  Created by liping on 2020/6/9.
//  Copyright © 2020 xindu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SACProssToolBlock)();

@interface SACProssTool : NSObject

@property(nonatomic, copy)SACProssToolBlock complete;
@property(nonatomic, copy)NSString *fightName;

- (instancetype)initGetProssToolWithFighterName:(NSString *)name complete:(SACProssToolBlock)complete;

- (void)setData;

@end

NS_ASSUME_NONNULL_END
