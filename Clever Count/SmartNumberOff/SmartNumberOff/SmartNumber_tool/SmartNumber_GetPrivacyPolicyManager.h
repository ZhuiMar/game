//
//  SmartNumber_GetPrivacyPolicyManager.h
//  SmartNumberOff
//
//  Created by zy on 2020/5/16.
//  Copyright © 2020 ximan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SmartNumber_GetPrivacyPolicyManager : NSObject

@property(nonatomic,strong) NSString *level;

@property(nonatomic,strong) NSString *score;

+ (instancetype)shareManager;

- (void)getDefaultScore;

@end

NS_ASSUME_NONNULL_END
