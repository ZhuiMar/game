//
//  NSDate+date.m
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/15.
//  Copyright © 2020 guanhua. All rights reserved.
//

#import "NSDate+date.h"

@implementation NSDate (date)

+ (NSString *)getTaday{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}
+ (NSString *)beforeDate:(NSInteger)n {
    NSDate *date = [self getTimeAfterNowWithDay:n];
    NSString *dataStr = [self getStringByDate:date];
    return dataStr;
}
+ (NSDate *)getTimeAfterNowWithDay:(NSInteger)day{
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
+ (NSString *)getStringByDate:(NSDate *)date {
    return [self stringWithFormat:@"yyyy-MM-dd" date:date];
}
+ (NSString *)stringWithFormat:(NSString *)format date:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    [formatter setLocale:[NSLocale currentLocale]];
    return [formatter stringFromDate:date];
}
+ (NSInteger)getDifferenceByDate:(NSString *)date {
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *oldDate = [dateFormatter dateFromString:date];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned int unitFlags = NSDayCalendarUnit;
    NSDateComponents *comps = [gregorian components:unitFlags fromDate:oldDate  toDate:now  options:0];
    return [comps day];
}

+ (NSString *) getweekDayStringWithDate:(NSDate *)date{
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

@end
