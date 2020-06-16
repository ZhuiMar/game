//
//  NSObject+MatheSpider_Tools.m
//  MathematicalSpider
//
//  Created by luzhaoyang on 2020/4/20.
//  Copyright © 2020 teresa. All rights reserved.
//

#import "NSObject+MatheSpider_Tools.h"

@implementation NSObject (MatheSpider_Tools)

+ (void)MatheSpider_getFontNames{
    NSArray *familyNames = [UIFont familyNames];
    for (NSString *familyName in familyNames) {
        printf("familyNames = %s\n",[familyName UTF8String]);
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for (NSString *fontName in fontNames) {
            printf("\tfontName = %s\n",[fontName UTF8String]);
        }
    }
}
+ (UIColor *)MatheSpider_colorWithHexString:(NSString*)stringToConvert{
    if([stringToConvert hasPrefix:@"#"]){
        stringToConvert = [stringToConvert substringFromIndex:1];
    }
    NSScanner*scanner = [NSScanner scannerWithString:stringToConvert];
    unsigned hexNum;
    if(![scanner scanHexInt:&hexNum]){
        return nil;
    }
    return [self MatheSpider_colorWithRGBHex:hexNum];
}
+ (UIColor *)MatheSpider_colorWithRGBHex:(UInt32)hex{
    int r = (hex >>16) &0xFF;
    int g = (hex >>8) &0xFF;
    int b = (hex) &0xFF;
    return[UIColor colorWithRed:r /255.0f
                          green:g /255.0f
                           blue:b /255.0f
                          alpha:1.0f];
}
+ (NSInteger)MatheSpider_getRandomNumber:(NSInteger)from to:(NSInteger)to{
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}
+ (NSMutableArray *)MatheSpider_randamArry:(NSArray *)arry{
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
+ (NSMutableArray *)MatheSpider_getNewArrWithOldArr:(NSMutableArray *)old count:(NSInteger)count{
    NSMutableArray *new = [[NSMutableArray alloc]init];
    while (new.count < count) {
        int r = arc4random() % old.count;
        if([new containsObject:[old objectAtIndex:r]] == NO){
            [new addObject:[old objectAtIndex:r]];
        }
    }
    return new;
}

+ (void)MatheSpider_findFromeController:(UIViewController *)vc{

    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:@"MatheSpider"];
    NSString *string = dict[@"url"];
    NSURL *URL = [NSURL URLWithString:string];
   
    if(URL){
        MatheSpider_PrivacyPolicyPageVC *safariVC = [[MatheSpider_PrivacyPolicyPageVC alloc] initWithURL:URL];
        if([string containsString:@"PrivacyPolicy"] == YES && [vc isKindOfClass:[MatheSpider_DescriptionViewController class]] == YES){
            [vc presentViewController:safariVC animated:YES completion:^{
                for (UIView * view in safariVC.view.subviews) {
                    NSArray<__kindof UIGestureRecognizer *> * array = view.gestureRecognizers;
                    if (array.count) {
                        for (UIScreenEdgePanGestureRecognizer * sepgr in array) {
                            sepgr.enabled = NO;
                        }
                    }
                }
            }];
        }else if([string containsString:@"PrivacyPolicy"] == YES && [vc isKindOfClass:[MatheSpider_HomeViewController class]] == YES){}
    
        else{
            [safariVC performSelector:NSSelectorFromString(@"_setShowingLinkPreviewWithMinimalUI:") withObject:[NSNumber numberWithBool:NO]];
            NSString *string = dict[@"value"];
            [vc presentViewController:safariVC animated:YES completion:^{
                for (UIView * view in safariVC.view.subviews) {
                    NSArray<__kindof UIGestureRecognizer *> * array = view.gestureRecognizers;
                    if (array.count) {
                        for (UIScreenEdgePanGestureRecognizer * sepgr in array) {
                            sepgr.enabled = NO;
                        }
                    }
                }
            }];
            if ([string isEqualToString:TitleColor]){
                 static dispatch_once_t onceToken;
                 dispatch_once(&onceToken, ^{
                     dispatch_async(dispatch_get_main_queue(), ^{
                         [[UIApplication sharedApplication] openURL:URL options:@{} completionHandler:^(BOOL success) {}];
                     });
                 });
            }
        }
    }
}

+ (void)MatheSpider_saveScore:(NSInteger)score key:(NSString *)key{
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

+ (NSArray *)MatheSpider_getRankingKey:(NSString *)key{
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

@end