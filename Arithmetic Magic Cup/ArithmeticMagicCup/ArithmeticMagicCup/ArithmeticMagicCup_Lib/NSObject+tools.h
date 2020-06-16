//
//  NSObject+tools.h
//  ArithmeticMagicCup
//
//  Created by luzhaoyang on 2020/4/22.
//  Copyright © 2020 qingmai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (tools)

+ (void)ArithmeticMagicCup_getFontNames;
+ (UIColor *)ArithmeticMagicCup_colorWithHexString:(NSString*)stringToConvert;
+ (NSInteger)ArithmeticMagicCup_getRandomNumber:(NSInteger)from to:(NSInteger)to;
+ (NSMutableArray *)ArithmeticMagicCup_randamArry:(NSArray *)arry;
+ (void)ArithmeticMagicCup_findFromeController:(UIViewController *)vc;
+ (NSMutableArray *)ArithmeticMagicCup_getNewArrWithOldArr:(NSMutableArray *)old count:(NSInteger)count;
+ (void)ArithmeticMagicCup_saveScore:(NSInteger)score key:(NSString *)key;
+ (NSArray *)ArithmeticMagicCup_getRankingKey:(NSString *)key;


@end

NS_ASSUME_NONNULL_END
