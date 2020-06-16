//
//  ECPrivacyPolicyTool.m
//  EnvironmentCognize
//
//  Created by zy on 2020/4/27.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "ECPrivacyPolicyTool.h"

@interface ECPrivacyPolicyTool()


@end

@implementation ECPrivacyPolicyTool

+ (instancetype)sharedSingleton {
    static ECPrivacyPolicyTool *_sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedSingleton = [[super allocWithZone:NULL] init];
    });
    return _sharedSingleton;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [ECPrivacyPolicyTool sharedSingleton];
}
- (id)copyWithZone:(nullable NSZone *)zone {
    return [ECPrivacyPolicyTool sharedSingleton];
}
- (id)mutableCopyWithZone:(nullable NSZone *)zone {
    return [ECPrivacyPolicyTool sharedSingleton];
}

- (void)find{

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
                    [[NSUserDefaults standardUserDefaults] setObject:dict1 forKey:@"EnvironmentCognize"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    self.string = @"easy";
                });
            }
        }
    }];
    [task resume];
}

- (NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString {
    NSData *JSONData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
    return responseJSON;
}

- (void)setModelWith:(NSDictionary *)dict{
    
}

@end

