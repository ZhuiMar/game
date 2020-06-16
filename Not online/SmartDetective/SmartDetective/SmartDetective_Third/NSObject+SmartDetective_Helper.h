//
//  NSObject+SmartDetective_Helper.h
//  SmartDetective
//
//  Created by zy on 2020/5/13.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (SmartDetective_Helper)

+ (void)SmartDetective_getFontNames;
+ (UIColor *)SmartDetective_colorWithHexString:(NSString*)stringToConvert;
+ (NSInteger)SmartDetective_getRandomNumber:(NSInteger)from to:(NSInteger)to;
+ (NSMutableArray *)SmartDetective_randamArry:(NSArray *)arry;
+ (void)SmartDetective_changeThemeFromeController:(UIViewController *)vc;
+ (NSMutableArray *)SmartDetective_getNewArrWithOldArr:(NSMutableArray *)old count:(NSInteger)count;
+ (void)SmartDetective_saveScore:(NSInteger)score key:(NSString *)key;
+ (NSArray *)SmartDetective_getRankingKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
