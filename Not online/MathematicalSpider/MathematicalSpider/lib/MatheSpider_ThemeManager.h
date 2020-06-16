//
//  MatheSpider_ThemeManager.h
//  MathematicalSpider
//
//  Created by zy on 2020/5/22.
//  Copyright © 2020 teresa. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MatheSpider_ThemeManager : NSObject

@property(nonatomic,strong)MatheSpider_ScoreData *model;

+ (instancetype)shareManager;
- (void)MatheSpider_getDefaultTheme;

@end

NS_ASSUME_NONNULL_END
