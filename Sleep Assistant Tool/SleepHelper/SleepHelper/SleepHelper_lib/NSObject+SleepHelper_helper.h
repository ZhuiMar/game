//
//  NSObject+SleepHelper_helper.h
//  SleepHelper
//
//  Created by zy on 2020/5/18.
//  Copyright © 2020 tianma. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (SleepHelper_helper)

+ (void)SleepHelper_getFontNames;
+ (UIColor *)SleepHelper_colorWithHexString:(NSString*)stringToConvert;
+ (NSInteger)SleepHelper_getRandomNumber:(NSInteger)from to:(NSInteger)to;
+ (NSMutableArray *)SleepHelper_randamArry:(NSArray *)arry;
+ (NSMutableArray *)SleepHelper_getNewArrWithOldArr:(NSMutableArray *)old count:(NSInteger)count;
+ (void)SleepHelper_saveScore:(NSInteger)score key:(NSString *)key;
+ (NSArray *)SleepHelper_getRankingKey:(NSString *)key;
+ (NSString *)SleepHelper_getTaday;

@end

NS_ASSUME_NONNULL_END
