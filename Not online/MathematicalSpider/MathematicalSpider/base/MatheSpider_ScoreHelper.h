//
//  MatheSpider_ScoreHelper.h
//  MathematicalSpider
//
//  Created by zy on 2020/5/22.
//  Copyright © 2020 teresa. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^MatheSpider_ScoreHelperBlock) (MatheSpider_ScoreData *);

@interface MatheSpider_ScoreHelper : NSObject

@property(nonatomic,copy)NSMutableDictionary *themeDict;

- (instancetype)initWithScoreNum:(NSInteger)score themeColorString:(NSString *)themeColorString completeBlock:(MatheSpider_ScoreHelperBlock)complete;
- (void)MatheSpider_setStringVaule;
- (void)MatheSpider_setUiDefault;

@end

NS_ASSUME_NONNULL_END
