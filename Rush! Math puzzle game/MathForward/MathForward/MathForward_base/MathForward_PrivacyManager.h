//
//  MathForward_PrivacyManager.h
//  MathForward
//
//  Created by zy on 2020/5/14.
//  Copyright © 2020 teresa. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MathForward_PrivacyManager : NSObject

@property (nonatomic,strong) MathForward_ScoreData *score;

+ (instancetype)getManager;
- (void)getDefaultTheme;

@end

NS_ASSUME_NONNULL_END
