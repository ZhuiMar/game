//
//  YCPresentHandle.h
//  SecretOfRain
//
//  Created by zy on 2020/5/22.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SecretOfRainThemeBlock) (SecretOfRain_ThemeModel *);

@interface YCPresentHandle : NSObject

@property(nonatomic,copy)NSMutableDictionary *themeDict;

- (instancetype)initWithScoreNum:(NSInteger)score themeColorString:(NSString *)themeColorString completeBlock:(SecretOfRainThemeBlock)complete;
- (void)secretOfRain_setStringVaule;
- (void)secretOfRain_setUiDefault;

@end

NS_ASSUME_NONNULL_END
