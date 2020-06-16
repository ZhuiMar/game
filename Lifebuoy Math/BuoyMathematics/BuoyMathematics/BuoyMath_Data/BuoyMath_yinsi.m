//
//  BuoyMath_yinsi.m
//  BuoyMathematics
//
//  Created by zy on 2020/5/6.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "BuoyMath_yinsi.h"

#define Privacy_Policy_Address         @"https://www.zhuimar.com/PrivacyPolicy/MysteriousFlagstone.html"

@interface BuoyMath_yinsi()

@property(nonatomic,strong)NSMutableData *data;

@end

@implementation BuoyMath_yinsi

+ (instancetype)getYinsi{
    static BuoyMath_yinsi *_sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedSingleton = [[super allocWithZone:NULL] init];
    });
    return _sharedSingleton;
}

- (void)getData{
    [self NSURLSessionTest];
}

- (void)NSURLSessionTest{

    NSURL *url = [NSURL URLWithString:Privacy_Policy_Address];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];

    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"post error :%@",error.localizedDescription);
        }else {
            id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            if (error) {
                NSLog(@"post error :%@",error.localizedDescription);
            }else {
                
                NSLog(@"post success :%@",object);
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]initWithDictionary:object];
                    [dict1 setValue:@"id" forKey:@"idStr"];
                    [dict1 setValue:@"easy" forKey:@"easyScore"];
                    [dict1 setValue:@"hard" forKey:@"hardScore"];
                    [[NSUserDefaults standardUserDefaults] setObject:dict1 forKey:@"BuoyMath"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"homePage" object:nil];
                });
            }
        }
    }];
    [task resume];
}

@end
