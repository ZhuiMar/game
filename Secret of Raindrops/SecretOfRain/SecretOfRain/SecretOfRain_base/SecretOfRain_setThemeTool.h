//
//  SecretOfRain_setThemeTool.h
//  SecretOfRain
//
//  Created by zy on 2020/5/22.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SecretOfRain_ThemeModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecretOfRain_setThemeTool : NSObject

@property(nonatomic,strong)SecretOfRain_ThemeModel *modeldata;

+ (instancetype)shareTool;
- (void)secretOfRain_getDefaultTheme;

@end

NS_ASSUME_NONNULL_END
