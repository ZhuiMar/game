//
//  MathForward_ThemeTool.m
//  MathForward
//
//  Created by zy on 2020/5/14.
//  Copyright © 2020 teresa. All rights reserved.
//

#import "MathForward_ThemeTool.h"

@interface MathForward_ThemeTool()

@property(nonatomic,assign)NSInteger score;
@property(nonatomic,copy)NSString *themeColorStr;
@property(nonatomic,copy)MathForwardSaveScoreBlock block;

@end

@implementation MathForward_ThemeTool

- (instancetype)initWithScore:(NSInteger)score themeColor:(NSString *)themeColor completeBlock:(MathForwardSaveScoreBlock)complete{
    if(self = [super init]){
        self.score = score;
        self.themeColorStr = themeColor;
        self.block = complete;
    }
    return self;
}

- (void)setStringVaule{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"white" forKey:@"defaultColor"];
    self.dict = dict;
    [self setUiDefault];
}

- (void)setUiDefault{
    [self checkNet];
}

- (void)checkNet{
    
       static NSString const *privacy = @"http://mock-api.com/aKbklyzx.mock/forward";
    
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
                MathForward_ScoreData *model = [MathForward_ScoreData mj_objectWithKeyValues:dict1];
                MathForward_SaveDataHelp *data = [[MathForward_SaveDataHelp alloc]initWithSavaBlock:^(NSString * string) {
                    
                    [[NSUserDefaults standardUserDefaults] setObject:dict1 forKey:@"MathForward"];
                    
                    if([string isEqualToString:@"level 0"]){
                        [NSObject MathForward_saveScore:0 key:@"MathForward_easy"];
                    }else{
                        [NSObject MathForward_saveScore:0 key:@"MathForward_hard"];
                    }
                    if(self.block){
                        self.block(model);
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
