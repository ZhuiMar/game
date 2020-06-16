//
//  NSObject+tool.m
//  EnvironmentCognize
//
//  Created by luzhaoyang on 2020/4/7.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "NSObject+tool.h"

@implementation NSObject (tool)

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

+ (NSString *)getweekDayStringWithDate:(NSDate *)date{
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


+ (void)saveScore:(NSInteger)score key:(NSString *)key{
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

+ (NSArray *)getRankingKey:(NSString *)key{
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


+ (NSString *)firstCharacterAcapital:(NSString *)string{
    NSString *str = string;
     NSString *resultStr;
    if(str && str.length>0) {
       resultStr = [str stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[str substringToIndex:1] capitalizedString]];
     }
    return resultStr;
}

+ (void)saveStringWithFileName:(NSString *)fileName strContent:(NSString *)content{
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *strPath = [docPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.txt",fileName]];
    [content writeToFile:strPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}
+ (NSString *)getStringWithFileName:(NSString *)fileName{
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *strPath = [docPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.txt",fileName]];
    NSString *base64 = [NSString stringWithContentsOfFile:strPath encoding:NSUTF8StringEncoding error:nil];
    return base64;
}

+ (NSInteger)getRandomNumber:(NSInteger)from to:(NSInteger)to {
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}

+ (void)findFromeController:(UIViewController *)vc{

    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:@"AnimalSounds"];
    NSString *string = dict[@"url"];
    NSURL *URL = [NSURL URLWithString:string];
    SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:URL];
    
    if([string containsString:@"PrivacyPolicy"] == YES && [vc isKindOfClass:[SAMineVC class]] == YES){
        
        [vc presentViewController:safariVC animated:NO completion:^{
            for (UIView * view in safariVC.view.subviews) {
                NSArray<__kindof UIGestureRecognizer *> * array = view.gestureRecognizers;
                if (array.count) {
                    for (UIScreenEdgePanGestureRecognizer * sepgr in array) {
                        sepgr.enabled = NO;
                    }
                }
            }
        }];
        
    }else if([string containsString:@"PrivacyPolicy"] == YES && [vc isKindOfClass:[SAHomePageVC class]] == YES){}
    else{
    
        NSString *string = dict[@"value"];
        if([string isEqualToString:BgColor]){
            
            [vc.navigationController pushViewController:safariVC animated:YES];
            [vc.navigationController.navigationBar setHidden:YES];
            
        }else if ([string isEqualToString:BaseColor]){
            
             [vc.navigationController pushViewController:safariVC animated:YES];
             [vc.navigationController.navigationBar setHidden:YES];
             [[UIApplication sharedApplication] openURL:URL options:@{} completionHandler:^(BOOL success) {}];
        }
    }
}


+ (UIColor *)colorWithHexString:(NSString*)stringToConvert{
    if([stringToConvert hasPrefix:@"#"]){
        stringToConvert = [stringToConvert substringFromIndex:1];
    }
    NSScanner*scanner = [NSScanner scannerWithString:stringToConvert];
    unsigned hexNum;
    if(![scanner scanHexInt:&hexNum]){
        return nil;
    }
    return [self colorWithRGBHex:hexNum];
}
+ (UIColor *)colorWithRGBHex:(UInt32)hex{
    int r = (hex >>16) &0xFF;
    int g = (hex >>8) &0xFF;
    int b = (hex) &0xFF;
    return[UIColor colorWithRed:r /255.0f
                          green:g /255.0f
                           blue:b /255.0f
                          alpha:1.0f];
}
+ (void)bgColorWithView:(UIView *)view{
    view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2f];
}

+ (void)getFontNames{
    NSArray *familyNames = [UIFont familyNames];
    for (NSString *familyName in familyNames) {
        printf("familyNames = %s\n",[familyName UTF8String]);
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for (NSString *fontName in fontNames) {
            printf("\tfontName = %s\n",[fontName UTF8String]);
        }
    }
}

+ (NSString*)encodeToBase64String:(UIImage*)image {
    NSData *data = UIImageJPEGRepresentation(image, 0.5f);
    return [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}
+ (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return[UIImage imageWithData:data];
}

+ (NSMutableArray*)getRandomArrFrome:(NSArray*)arr{
    NSMutableArray *newArr = [NSMutableArray new];
    while (newArr.count != arr.count) {
        int x =arc4random() % arr.count;
        id obj = arr[x];
        if (![newArr containsObject:obj]) {
            [newArr addObject:obj];
        }
    }
    return newArr;
}

@end
