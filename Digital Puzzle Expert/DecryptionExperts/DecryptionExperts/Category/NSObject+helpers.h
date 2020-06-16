//
//  NSObject+helpers.h
//  GuessParkingSpace
//
//  Created by luzhaoyang on 2020/4/9.
//  Copyright © 2020 xiangjia. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (helpers)

+ (NSString*)DEgetTaday;
+ (NSString *)DEbeforeDate:(NSInteger)n;
+ (NSInteger)DEgetDifferenceByDate:(NSString *)date;
+ (NSString *)DEgetweekDayStringWithDate:(NSDate *)date;

+ (void)DEsaveScore:(NSInteger)score key:(NSString *)key;
+ (NSArray *)DEgetRankingKey:(NSString *)key;

+ (NSString *)DErandomStringWithLength:(NSInteger)len;
+ (NSString *)DEfirstCharacterAcapital:(NSString *)string;
+ (void)DEsaveStringWithFileName:(NSString *)fileName strContent:(NSString *)content;
+ (NSString *)DEgetStringWithFileName:(NSString *)fileName;
+ (NSInteger)DEgetRandomNumber:(NSInteger)from to:(NSInteger)to;

+ (UIColor *)DEcolorWithHexString:(NSString*)stringToConvert;
+ (void)DEbgColorWithView:(UIView *)view;

+ (void)DEgetFontNames;

+ (NSString*)DEencodeToBase64String:(UIImage*)image;
+ (UIImage *)DEdecodeBase64ToImage:(NSString*)strEncodeData;
+ (NSMutableArray *)DErandamArry:(NSMutableArray *)arry;

@end

NS_ASSUME_NONNULL_END
