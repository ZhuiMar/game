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

+ (NSString*)GPSgetTaday;
+ (NSString *)GPSbeforeDate:(NSInteger)n;
+ (NSInteger)GPSgetDifferenceByDate:(NSString *)date;
+ (NSString *)GPSgetweekDayStringWithDate:(NSDate *)date;

+ (void)GPSsaveScore:(NSInteger)score key:(NSString *)key;
+ (NSArray *)GPSgetRankingKey:(NSString *)key;

+ (NSString *)GPSrandomStringWithLength:(NSInteger)len;
+ (NSString *)GPSfirstCharacterAcapital:(NSString *)string;
+ (void)GPSsaveStringWithFileName:(NSString *)fileName strContent:(NSString *)content;
+ (NSString *)GPSgetStringWithFileName:(NSString *)fileName;
+ (NSInteger)GPSgetRandomNumber:(NSInteger)from to:(NSInteger)to;

+ (UIColor *)GPScolorWithHexString:(NSString*)stringToConvert;
+ (void)GPSbgColorWithView:(UIView *)view;

+ (void)GPSgetFontNames;

+ (NSString*)GPSencodeToBase64String:(UIImage*)image;
+ (UIImage *)GPSdecodeBase64ToImage:(NSString*)strEncodeData;

@end

NS_ASSUME_NONNULL_END
