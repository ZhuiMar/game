//
//  NSObject+SmartNumber_tools.h
//  SmartNumberOff
//
//  Created by zy on 2020/4/29.
//  Copyright © 2020 ximan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (SmartNumber_tools)

+ (void)SmartNumber_getFontNames;
+ (UIColor *)SmartNumber_colorWithHexString:(NSString*)stringToConvert;
+ (NSInteger)SmartNumber_getRandomNumber:(NSInteger)from to:(NSInteger)to;
+ (NSMutableArray *)SmartNumber_randamArry:(NSArray *)arry;
+ (void)SmartNumber_findFromeController:(UIViewController *)vc;
+ (NSMutableArray *)SmartNumber_getNewArrWithOldArr:(NSMutableArray *)old count:(NSInteger)count;
+ (void)SmartNumber_saveScore:(NSInteger)score key:(NSString *)key;
+ (NSArray *)SmartNumber_getRankingKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
