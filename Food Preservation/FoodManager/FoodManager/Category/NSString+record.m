//
//  NSString+record.m
//  ColorHotBalloon
//
//  Created by  luzhaoyang on 2020/3/9.
//  Copyright © 2020 zhuimar. All rights reserved.
//

#import "NSString+record.h"

@implementation NSString (record)

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

@end
