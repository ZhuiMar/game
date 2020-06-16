//
//  NSObject+helpers.m
//  GuessParkingSpace
//
//  Created by luzhaoyang on 2020/4/9.
//  Copyright © 2020 xiangjia. All rights reserved.
//

#import "NSObject+helpers.h"

@implementation NSObject (helpers)

+ (NSString *)DEgetTaday{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}
+ (NSString *)DEbeforeDate:(NSInteger)n {
    NSDate *date = [self DEgetTimeAfterNowWithDay:n];
    NSString *dataStr = [self DEgetStringByDate:date];
    return dataStr;
}
+ (NSDate *)DEgetTimeAfterNowWithDay:(NSInteger)day{
    NSDate *nowDate = [NSDate date];
    NSDate *theDate;
    if(day!=0){
        NSTimeInterval  oneDay = 24*60*60*1;  //The length of a day
        theDate = [nowDate initWithTimeIntervalSinceNow: oneDay*day ];
    }else{
        theDate = nowDate;
    }
    return theDate;
}
+ (NSString *)DEgetStringByDate:(NSDate *)date {
    return [self DEstringWithFormat:@"yyyy-MM-dd" date:date];
}
+ (NSString *)DEstringWithFormat:(NSString *)format date:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    [formatter setLocale:[NSLocale currentLocale]];
    return [formatter stringFromDate:date];
}
+ (NSInteger)DEgetDifferenceByDate:(NSString *)date {
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *oldDate = [dateFormatter dateFromString:date];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unsigned int unitFlags = NSDayCalendarUnit;
    NSDateComponents *comps = [gregorian components:unitFlags fromDate:oldDate  toDate:now  options:0];
    return [comps day];
}

+ (NSString *)DEgetweekDayStringWithDate:(NSDate *)date{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [calendar components:NSWeekdayCalendarUnit fromDate:date];
    NSNumber * weekNumber = @([comps weekday]);
    NSInteger weekInt = [weekNumber integerValue];
    NSString *weekDayString = @"Mon";
    switch (weekInt) {
    case 1:
    {
        weekDayString = @"Sun";
    }
    break;
    case 2:
    {
        weekDayString = @"Mon";
    }
    break;

    case 3:
    {
        weekDayString = @"Tues";
    }
    break;

    case 4:
    {
        weekDayString = @"Wed";
    }
    break;
            
    case 5:
    {
        weekDayString = @"Thur";
    }
    break;
            
    case 6:
    {
        weekDayString = @"Fri";
    }
    break;

    case 7:
    {
        weekDayString = @"Sat";
    }
    break;
            
    default:
    break;
    }
        return weekDayString;
}


+ (void)DEsaveScore:(NSInteger)score key:(NSString *)key{
    NSString * str = [[NSUserDefaults standardUserDefaults] valueForKey:key];
    if(str == nil){
        NSString *num = [NSString stringWithFormat:@"%ld",score];
        [[NSUserDefaults standardUserDefaults] setObject:num forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }else{
        NSString *num = [NSString stringWithFormat:@"%ld",score];
        NSArray *nums = [str componentsSeparatedByString:@"-"];
        NSMutableArray *newArr = [[NSMutableArray alloc]init];
        for (NSString *str in nums) {
            [newArr addObject:str];
        }
        [newArr addObject:num];
        NSString *str = [newArr componentsJoinedByString:@"-"];
        [[NSUserDefaults standardUserDefaults] setObject:str forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (NSArray *)DEgetRankingKey:(NSString *)key{
    NSMutableArray *temp = [NSMutableArray new];
    NSString *str = [[NSUserDefaults standardUserDefaults] valueForKey:key];
    NSArray *nums = [str componentsSeparatedByString:@"-"];
    for(NSString *numStr in nums) {
        NSInteger num = [numStr integerValue];
        [temp addObject:@(num)];
    }
    NSArray *result = [temp sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj2 compare:obj1];
    }];
    return result;
}


+ (NSString *)DErandomStringWithLength:(NSInteger)len {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    for (NSInteger i = 0; i < len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    return randomString;
}
+ (NSString *)DEfirstCharacterAcapital:(NSString *)string{
    NSString *str = string;
     NSString *resultStr;
    if(str && str.length>0) {
       resultStr = [str stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[str substringToIndex:1] capitalizedString]];
     }
    return resultStr;
}
+ (void)DEsaveStringWithFileName:(NSString *)fileName strContent:(NSString *)content{
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *strPath = [docPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.txt",fileName]];
    [content writeToFile:strPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}
+ (NSString *)DEgetStringWithFileName:(NSString *)fileName{
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *strPath = [docPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.txt",fileName]];
    NSString *base64 = [NSString stringWithContentsOfFile:strPath encoding:NSUTF8StringEncoding error:nil];
    return base64;
}

+ (NSInteger)DEgetRandomNumber:(NSInteger)from to:(NSInteger)to{
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}

+ (UIColor *)DEcolorWithHexString:(NSString*)stringToConvert{
    if([stringToConvert hasPrefix:@"#"]){
        stringToConvert = [stringToConvert substringFromIndex:1];
    }
    NSScanner*scanner = [NSScanner scannerWithString:stringToConvert];
    unsigned hexNum;
    if(![scanner scanHexInt:&hexNum]){
        return nil;
    }
    return [self DEcolorWithRGBHex:hexNum];
}
+ (UIColor *)DEcolorWithRGBHex:(UInt32)hex{
    int r = (hex >>16) &0xFF;
    int g = (hex >>8) &0xFF;
    int b = (hex) &0xFF;
    return[UIColor colorWithRed:r /255.0f
                          green:g /255.0f
                           blue:b /255.0f
                          alpha:1.0f];
}
+ (void)DEbgColorWithView:(UIView *)view{
    view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2f];
}

+ (void)DEgetFontNames{
    NSArray *familyNames = [UIFont familyNames];
    for (NSString *familyName in familyNames) {
        printf("familyNames = %s\n",[familyName UTF8String]);
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for (NSString *fontName in fontNames) {
            printf("\tfontName = %s\n",[fontName UTF8String]);
        }
    }
}

+ (NSString*)DEencodeToBase64String:(UIImage*)image {
    NSData *data = UIImageJPEGRepresentation(image, 0.5f);
    return [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}
+ (UIImage *)DEdecodeBase64ToImage:(NSString *)strEncodeData {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return[UIImage imageWithData:data];
}

+ (NSMutableArray *)DErandamArry:(NSMutableArray *)arry{
    NSMutableArray *newArr = [NSMutableArray new];
    arry = [arry sortedArrayUsingComparator:^NSComparisonResult(NSString *str1, NSString *str2) {
        int seed = arc4random_uniform(2);
        if (seed) {
            return [str1 compare:str2];
        } else {
            return [str2 compare:str1];
        }
    }];
    for (NSString *str in arry) {
        [newArr addObject:str];
    }
    return newArr;
}

@end
