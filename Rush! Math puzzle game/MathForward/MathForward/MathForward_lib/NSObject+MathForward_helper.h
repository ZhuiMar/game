//
//  NSObject+MathForward_helper.h
//  MathForward
//
//  Created by luzhaoyang on 2020/4/21.
//  Copyright © 2020 teresa. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MathForward_helper)

+ (void)MathForward_getFontNames;
+ (UIColor *)MathForward_colorWithHexString:(NSString*)stringToConvert;
+ (NSInteger)MathForward_getRandomNumber:(NSInteger)from to:(NSInteger)to;
+ (NSMutableArray *)MathForward_randamArry:(NSArray *)arry;
+ (NSMutableArray *)MathForward_getNewArrWithOldArr:(NSMutableArray *)old count:(NSInteger)count;
+ (void)MathForward_findFromeController:(UIViewController *)vc;
+ (void)MathForward_saveScore:(NSInteger)score key:(NSString *)key;
+ (NSArray *)MathForward_getRankingKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
