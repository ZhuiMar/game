//
//  SecretOfRain_getPrivacyHelper.h
//  SecretOfRain
//
//  Created by zy on 2020/5/22.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SecretOfRain_getPrivacyHelperBlock) ();

@interface SecretOfRain_getPrivacyHelper : NSObject

- (instancetype)initWithType:(NSString *)type score:(NSInteger)score completeBlock:(SecretOfRain_getPrivacyHelperBlock)completeBlock;
- (void)saveScore;

@end

NS_ASSUME_NONNULL_END
