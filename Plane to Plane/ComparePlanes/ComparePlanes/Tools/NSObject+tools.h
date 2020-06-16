//
//  NSObject+tools.h
//  ComparePlanes
//
//  Created by luzhaoyang on 2020/4/15.
//  Copyright © 2020 qingxiriver. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (tools)

+ (NSString*)CPgetTaday;
+ (NSString *)CPbeforeDate:(NSInteger)n;
+ (NSInteger)CPgetDifferenceByDate:(NSString *)date;
+ (NSString *)CPgetweekDayStringWithDate:(NSDate *)date;

+ (void)CPsaveScore:(NSInteger)score key:(NSString *)key;
+ (NSArray *)CPgetRankingKey:(NSString *)key;

+ (NSString *)CPrandomStringWithLength:(NSInteger)len;
+ (NSString *)CPfirstCharacterAcapital:(NSString *)string;
+ (void)CPsaveStringWithFileName:(NSString *)fileName strContent:(NSString *)content;
+ (NSString *)CPgetStringWithFileName:(NSString *)fileName;
+ (NSInteger)CPgetRandomNumber:(NSInteger)from to:(NSInteger)to;

+ (UIColor *)CPcolorWithHexString:(NSString*)stringToConvert;
+ (void)CPbgColorWithView:(UIView *)view;

+ (void)CPgetFontNames;

+ (NSString*)CPencoCPToBase64String:(UIImage*)image;
+ (UIImage *)CPCPcoCPBase64ToImage:(NSString*)strEncoCPData;
+ (NSMutableArray *)CPrandamArry:(NSMutableArray *)arry;

+ (void)jumpToViewController:(UIViewController *)controller;

@end

NS_ASSUME_NONNULL_END
