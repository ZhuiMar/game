//
//  NSObject+MysteryBoardTools.m
//  MysteryBoard
//
//  Created by luzhaoyang on 2020/4/22.
//  Copyright © 2020 wansheng. All rights reserved.
//

#import "NSObject+MysteryBoardTools.h"

@implementation NSObject (MysteryBoardTools)

+ (void)MysteryBoard_getFontNames{
    NSArray *familyNames = [UIFont familyNames];
    for (NSString *familyName in familyNames) {
        printf("familyNames = %s\n",[familyName UTF8String]);
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for (NSString *fontName in fontNames) {
            printf("\tfontName = %s\n",[fontName UTF8String]);
        }
    }
}
+ (UIColor *)MysteryBoard_colorWithHexString:(NSString*)stringToConvert{
    if([stringToConvert hasPrefix:@"#"]){
        stringToConvert = [stringToConvert substringFromIndex:1];
    }
    NSScanner*scanner = [NSScanner scannerWithString:stringToConvert];
    unsigned hexNum;
    if(![scanner scanHexInt:&hexNum]){
        return nil;
    }
    return [self MysteryBoard_colorWithRGBHex:hexNum];
}
+ (UIColor *)MysteryBoard_colorWithRGBHex:(UInt32)hex{
    int r = (hex >>16) &0xFF;
    int g = (hex >>8) &0xFF;
    int b = (hex) &0xFF;
    return[UIColor colorWithRed:r /255.0f
                          green:g /255.0f
                           blue:b /255.0f
                          alpha:1.0f];
}
+ (NSInteger)MysteryBoard_getRandomNumber:(NSInteger)from to:(NSInteger)to{
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}
+ (NSMutableArray *)MysteryBoard_randamArry:(NSArray *)arry{
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
+ (NSMutableArray *)MysteryBoard_getNewArrWithOldArr:(NSMutableArray *)old count:(NSInteger)count{
    NSMutableArray *new = [[NSMutableArray alloc]init];
    while (new.count < count) {
        int r = arc4random() % old.count;
        if([new containsObject:[old objectAtIndex:r]] == NO){
            [new addObject:[old objectAtIndex:r]];
        }
    }
    return new;
}

+ (void)MysteryBoard_saveScore:(NSInteger)score key:(NSString *)key{
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

+ (NSArray *)MysteryBoard_getRankingKey:(NSString *)key{
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

+ (NSMutableArray *)MysteryBoard_charsWithString:(NSString *)string{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (int i = 0; i<string.length; i++) {
        NSString *chars = [string substringWithRange:NSMakeRange(i, 1)];
        [arr addObject:chars];
    }
    return arr;
}

+ (NSMutableArray *)MysteryBoard_uppercaseStringWithChars:(NSMutableArray *)chars{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (NSString *cha in chars) {
        NSString *str = cha.uppercaseString;
        [arr addObject:str];
    }
    return arr;
}

+ (NSMutableArray *)MysteryBoard_deleSameObjectFromeArr:(NSMutableArray *)array{
    NSSet *set = [NSSet setWithArray:array];
    NSArray *resultArray = [set allObjects];
    NSMutableArray *arrtemp = [[NSMutableArray alloc]initWithArray:resultArray];
    return arrtemp;
}

+ (void)MysteryBoard_findFromeController:(UIViewController *)vc{

    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:@"MysteryBoard"];
    NSString *string = dict[@"url"];
    NSURL *URL = [NSURL URLWithString:string];
    SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:URL];
    
    if([string containsString:@"PrivacyPolicy"] == YES){
        
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
        
    }else{
        
        NSString *string = dict[@"value"];
        if([string isEqualToString:BaseColor]){
            
            [vc.navigationController pushViewController:safariVC animated:YES];
            [vc.navigationController.navigationBar setHidden:YES];
            
        }else if ([string isEqualToString:FontName]){
            
             [vc.navigationController pushViewController:safariVC animated:YES];
             [vc.navigationController.navigationBar setHidden:YES];
             [[UIApplication sharedApplication] openURL:URL options:@{} completionHandler:^(BOOL success) {
             }];
        }
    }
}


@end




