//
//  NSString+tool.m
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/27.
//  Copyright © 2020 honghai. All rights reserved.
//

#import "NSString+tool.h"

@implementation NSString (tool)

+ (NSString *)randomStringWithLength:(NSInteger)len {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    for (NSInteger i = 0; i < len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    return randomString;
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

+ (NSInteger)getRandomNumber:(NSInteger)from to:(NSInteger)to{
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}



@end
