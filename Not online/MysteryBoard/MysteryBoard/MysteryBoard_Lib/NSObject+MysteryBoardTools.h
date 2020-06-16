//
//  NSObject+MysteryBoardTools.h
//  MysteryBoard
//
//  Created by luzhaoyang on 2020/4/22.
//  Copyright © 2020 wansheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MysteryBoardTools)

+ (void)MysteryBoard_getFontNames;
+ (UIColor *)MysteryBoard_colorWithHexString:(NSString*)stringToConvert;
+ (NSInteger)MysteryBoard_getRandomNumber:(NSInteger)from to:(NSInteger)to;
+ (NSMutableArray *)MysteryBoard_randamArry:(NSArray *)arry;
+ (NSMutableArray *)MysteryBoard_getNewArrWithOldArr:(NSMutableArray *)old count:(NSInteger)count;
+ (void)MysteryBoard_saveScore:(NSInteger)score key:(NSString *)key;
+ (NSArray *)MysteryBoard_getRankingKey:(NSString *)key;
+ (NSMutableArray *)MysteryBoard_charsWithString:(NSString *)string;
+ (NSMutableArray *)MysteryBoard_uppercaseStringWithChars:(NSMutableArray *)chars;
+ (NSMutableArray *)MysteryBoard_deleSameObjectFromeArr:(NSMutableArray *)array;
+ (void)MysteryBoard_findFromeController:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
