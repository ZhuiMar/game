//
//  YCPDataHelper.h
//  SimulatedAirCombat
//
//  Created by liping on 2020/6/9.
//  Copyright © 2020 xindu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^YCPDataHelperBlock)(NSString *);

@interface YCPDataHelper : NSObject

@property(nonatomic, strong) SACFightModel *model;

- (instancetype)initDataHelperWithFighterNameString:(YCPDataHelperBlock)nameString;

- (void)DetermineNetworkStatus;

- (void)setDefaultName;

@end

NS_ASSUME_NONNULL_END
