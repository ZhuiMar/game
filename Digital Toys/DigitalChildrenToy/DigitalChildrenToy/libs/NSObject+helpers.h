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

+ (NSString*)DCTgetTaday;
+ (NSString *)DCTbeforeDate:(NSInteger)n;
+ (NSInteger)DCTgetDifferenceByDate:(NSString *)date;
+ (NSString *)DCTgetweekDayStringWithDate:(NSDate *)date;

+ (void)DCTsaveScore:(NSInteger)score key:(NSString *)key;
+ (NSArray *)DCTgetRankingKey:(NSString *)key;

+ (NSString *)DCTrandomStringWithLength:(NSInteger)len;
+ (NSString *)DCTfirstCharacterAcapital:(NSString *)string;
+ (void)DCTsaveStringWithFileName:(NSString *)fileName strContent:(NSString *)content;
+ (NSString *)DCTgetStringWithFileName:(NSString *)fileName;
+ (NSInteger)DCTgetRandomNumber:(NSInteger)from to:(NSInteger)to;

+ (UIColor *)DCTcolorWithHexString:(NSString*)stringToConvert;
+ (void)DCTbgColorWithView:(UIView *)view;

+ (void)DCTgetFontNames;

+ (NSString*)DCTencodeToBase64String:(UIImage*)image;
+ (UIImage *)DCTdecodeBase64ToImage:(NSString*)strEncodeData;

@end

NS_ASSUME_NONNULL_END
