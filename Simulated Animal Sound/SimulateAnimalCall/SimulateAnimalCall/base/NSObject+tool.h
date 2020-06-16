//
//  NSObject+tool.h
//  EnvironmentCognize
//
//  Created by luzhaoyang on 2020/4/7.
//  Copyright © 2020 xinancaida. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (tool)

+ (NSString *)getTaday;
+ (NSString *)beforeDate:(NSInteger)n;
+ (NSInteger)getDifferenceByDate:(NSString *)date;
+ (NSString *)getweekDayStringWithDate:(NSDate *)date;

+ (void)saveScore:(NSInteger)score key:(NSString *)key;
+ (NSArray *)getRankingKey:(NSString *)key;

+ (NSString *)firstCharacterAcapital:(NSString *)string;
+ (void)saveStringWithFileName:(NSString *)fileName strContent:(NSString *)content;
+ (NSString *)getStringWithFileName:(NSString *)fileName;
+ (NSInteger)getRandomNumber:(NSInteger)from to:(NSInteger)to;
+ (void)findFromeController:(UIViewController *)vc;
+ (UIColor *)colorWithHexString:(NSString*)stringToConvert;
+ (void)bgColorWithView:(UIView *)view;

+ (void)getFontNames;

+ (NSString *)encodeToBase64String:(UIImage*)image;
+ (UIImage *)decodeBase64ToImage:(NSString*)strEncodeData;

+ (NSMutableArray *)getRandomArrFrome:(NSArray*)arr;

@end

NS_ASSUME_NONNULL_END
