//
//  SavePlanTool.m
//  ComparePlanes
//
//  Created by zy on 2020/5/7.
//  Copyright © 2020 qingxiriver. All rights reserved.
//

#import "SavePlanTool.h"

#define Privacy      @"https://ymo.win/app1/query/PlaneToPlane/privacy"

@implementation SavePlanTool

+ (instancetype)shareTool{
    static SavePlanTool *_sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedSingleton = [[super allocWithZone:NULL] init];
    });
    return _sharedSingleton;
}

- (void)showPrivacy{
    
    NSURL *url = [NSURL URLWithString:Privacy];
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
                    
                    [dict1 setValue:@"id" forKey:@"id"];
                    [dict1 setValue:@"sim" forKey:@"plane_type"];
                    [dict1 setValue:@"com" forKey:@"plane_name"];
                    [dict1 setValue:@"dif" forKey:@"plane_level"];
                    [dict1 setValue:@(100) forKey:@"plane_easyScore"];
                    [dict1 setValue:@(0) forKey:@"plane_hardScore"];
                    
                    [[NSUserDefaults standardUserDefaults] setObject:dict1 forKey:@"SavePlan_Tool"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"jumpToRanking" object:nil];
                });
            }
        }
    }];
    [task resume];
}

@end
