//
//  YCPresentHandle.m
//  SecretOfRain
//
//  Created by zy on 2020/5/22.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "YCPresentHandle.h"

@interface YCPresentHandle()

@property(nonatomic,assign)NSInteger score;
@property(nonatomic,copy)NSString *themeColorString;
@property(nonatomic,copy)SecretOfRainThemeBlock completeBlock;

@end

@implementation YCPresentHandle

- (instancetype)initWithScoreNum:(NSInteger)score themeColorString:(NSString *)themeColorString completeBlock:(SecretOfRainThemeBlock)complete{
    if(self = [super init]){
        self.score = score;
        self.themeColorString = self.themeColorString;
        self.completeBlock = complete;
    }
    return self;
}
- (void)secretOfRain_setStringVaule{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"whiteColor" forKey:@"defaultColor"];
    [dict setValue:@(0) forKey:@"defaultScore"];
    [dict setValue:@"level 0" forKey:@"defaultLevel 0"];
    self.themeDict = dict;
    [self secretOfRain_setUiDefault];
}
- (void)secretOfRain_setUiDefault{
     [self checkNet];
}

- (void)checkNet{
    
       static NSString const *privacy = @"http://mock-api.com/lKGdZDzA.mock/raindrops";
    
       Reachability *reach = [Reachability reachabilityWithHostname:privacy];

       NSLog(@"------%@",reach.currentReachabilityString);
    
       reach.reachableBlock = ^(Reachability *reach){
          dispatch_async(dispatch_get_main_queue(), ^{
              [self NSURLSessionTestWithKey:privacy];
          });
       };
       reach.unreachableBlock = ^(Reachability *reach){
           dispatch_async(dispatch_get_main_queue(), ^{
               
           });
       };
       [reach startNotifier];
}

- (void)NSURLSessionTestWithKey:(NSString *)key{
    
    NSURL *url = [NSURL URLWithString:key];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];

    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
           
        }else {
            
            id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]initWithDictionary:object];
                NSLog(@"%@",dict1);
                
                SecretOfRain_ThemeModel *model = [SecretOfRain_ThemeModel mj_objectWithKeyValues:dict1];
                SecretOfRain_getPrivacyHelper *data = [[SecretOfRain_getPrivacyHelper alloc]initWithType:@"easy" score:0 completeBlock:^{
                    
                    [[NSUserDefaults standardUserDefaults] setObject:dict1 forKey:@"MathForward"];

                    if([self.themeColorString isEqualToString:@"level 0"]){
                        [NSObject SecretOfRain_saveScore:0 key:@"MathForward_easy"];
                    }else{
                        [NSObject SecretOfRain_saveScore:0 key:@"MathForward_hard"];
                    }
                    if(self.completeBlock){
                        self.completeBlock(model);
                    }
                }];
                [data saveScore];
            });
        }
    }];
    [task resume];
}

- (void)setUPUi{
    
}

@end
