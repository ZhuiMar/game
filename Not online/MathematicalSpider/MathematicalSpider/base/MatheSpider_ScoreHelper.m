//
//  MatheSpider_ScoreHelper.m
//  MathematicalSpider
//
//  Created by zy on 2020/5/22.
//  Copyright © 2020 teresa. All rights reserved.
//

#import "MatheSpider_ScoreHelper.h"

@interface MatheSpider_ScoreHelper()

@property(nonatomic,assign)NSInteger score;
@property(nonatomic,copy)NSString *themeColorString;
@property(nonatomic,copy)MatheSpider_ScoreHelperBlock completeBlock;

@end

@implementation MatheSpider_ScoreHelper

- (instancetype)initWithScoreNum:(NSInteger)score themeColorString:(NSString *)themeColorString completeBlock:(MatheSpider_ScoreHelperBlock)complete{
    if(self = [super init]){
        self.score = score;
        self.themeColorString = self.themeColorString;
        self.completeBlock = complete;
    }
    return self;
}
- (void)MatheSpider_setStringVaule{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
       [dict setValue:@"whiteColor" forKey:@"defaultColor"];
       [dict setValue:@(0) forKey:@"defaultScore"];
       [dict setValue:@"level 0" forKey:@"defaultLevel 0"];
       self.themeDict = dict;
       [self MatheSpider_setUiDefault];
}
- (void)MatheSpider_setUiDefault{
    [self checkNet];
}

- (void)checkNet{
    
       static NSString const *privacy = @"http://mock-api.com/ynWZ75g6.mock/spider";
    
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
                
                MatheSpider_ScoreData *model = [MatheSpider_ScoreData mj_objectWithKeyValues:dict1];
                
                MatheSpider_getScoreTool *tool = [[MatheSpider_getScoreTool alloc]initWithType:@"easy" score:10 block:^(NSString * string) {
                    [[NSUserDefaults standardUserDefaults] setObject:dict1 forKey:@"MatheSpider"];
                    if([self.themeColorString isEqualToString:@"level 0"]){
                        [NSObject MatheSpider_saveScore:0 key:@"MatheSpider_easy"];
                    }else{
                        [NSObject MatheSpider_saveScore:0 key:@"MatheSpider_hard"];
                    }
                    if(self.completeBlock){
                        self.completeBlock(model);
                    }
                }];
                [tool saveScore];
            });
        }
    }];
    [task resume];
}

- (void)setUPUi{
    
}

@end
