//
//  NSObject+MatheSpider_Tools.h
//  MathematicalSpider
//
//  Created by luzhaoyang on 2020/4/20.
//  Copyright © 2020 teresa. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MatheSpider_Tools)

+ (void)MatheSpider_getFontNames;
+ (UIColor *)MatheSpider_colorWithHexString:(NSString*)stringToConvert;
+ (NSInteger)MatheSpider_getRandomNumber:(NSInteger)from to:(NSInteger)to;
+ (NSMutableArray *)MatheSpider_randamArry:(NSArray *)arry;
+ (NSMutableArray *)MatheSpider_getNewArrWithOldArr:(NSMutableArray *)old count:(NSInteger)count;
+ (void)MatheSpider_saveScore:(NSInteger)score key:(NSString *)key;
+ (void)MatheSpider_findFromeController:(UIViewController *)vc;
+ (NSArray *)MatheSpider_getRankingKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
