//
//  NSObject+BuoyMath_tool.h
//  BuoyMathematics
//
//  Created by zy on 2020/4/26.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (BuoyMath_tool)

+ (void)BuoyMath_getFontNames;
+ (UIColor *)BuoyMath_colorWithHexString:(NSString*)stringToConvert;
+ (NSInteger)BuoyMath_getRandomNumber:(NSInteger)from to:(NSInteger)to;
+ (NSMutableArray *)BuoyMath_randamArry:(NSArray *)arry;
+ (NSMutableArray *)BuoyMath_getNewArrWithOldArr:(NSMutableArray *)old count:(NSInteger)count;
+ (void)BuoyMath_saveScore:(NSInteger)score key:(NSString *)key;
+ (NSArray *)BuoyMath_getRankingKey:(NSString *)key;
+ (void)BuoyMath_findFromeController:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
