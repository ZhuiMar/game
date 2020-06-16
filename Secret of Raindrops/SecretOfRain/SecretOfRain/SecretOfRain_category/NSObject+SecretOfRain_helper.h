//
//  NSObject+SecretOfRain_helper.h
//  SecretOfRain
//
//  Created by zy on 2020/4/27.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (SecretOfRain_helper)

+ (void)SecretOfRain_getFontNames;
+ (UIColor *)SecretOfRain_colorWithHexString:(NSString*)stringToConvert;
+ (NSInteger)SecretOfRain_getRandomNumber:(NSInteger)from to:(NSInteger)to;
+ (NSMutableArray *)SecretOfRain_randamArry:(NSArray *)arry;
+ (NSMutableArray *)SecretOfRain_getNewArrWithOldArr:(NSMutableArray *)old count:(NSInteger)count;
+ (void)SecretOfRain_saveScore:(NSInteger)score key:(NSString *)key;
+ (NSArray *)SecretOfRain_getRankingKey:(NSString *)key;
+ (void)SecretOfRain_findFromeController:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
