//
//  YTSliderDataManager.h
//  SimulatedAirCombat
//
//  Created by liping on 2020/6/9.
//  Copyright © 2020 xindu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YTSliderDataManager : NSObject

@property(nonatomic, copy)NSString *name;

+ (instancetype)shareManager;

- (void)getPrivacyPolicy;

@end

NS_ASSUME_NONNULL_END
