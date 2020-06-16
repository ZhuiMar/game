//
//  SmartNumber_PopoverTool.m
//  SmartNumberOff
//
//  Created by zy on 2020/5/16.
//  Copyright © 2020 ximan. All rights reserved.
//

#import "SmartNumber_PopoverTool.h"

@interface SmartNumber_PopoverTool()

@property(nonatomic,assign)NSInteger scoreNum;
@property(nonatomic,copy)NSString *themeColorStr;
@property(nonatomic,copy)SmartNumberSaveScoreBlock block;

@end


@implementation SmartNumber_PopoverTool

- (instancetype)initWithMyScore:(NSInteger)score themeColorString:(NSString *)themeColor successfulBlock:(SmartNumberSaveScoreBlock)successfulBlock{
    if(self = [super init]){
        self.scoreNum = score;
        self.themeColorStr = themeColor;
        self.block = successfulBlock;
    }
    return self;
}

- (void)setStringVaule{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"lightGreyColor" forKey:@"defaultColor"];
    [dict setValue:@(0) forKey:@"simpleScoreNum"];
    [dict setValue:@(0) forKey:@"generalScoreNum"];
    [dict setValue:@(0) forKey:@"difficultScoreNum"];
    self.dict = dict;
    [self setUiDefault];
}

- (void)setUiDefault{
    [self checkNet];
}

- (void)checkNet{
    
       static NSString const *privacy = @"http://mock-api.com/ZzRxWyne.mock/smartcount";
    
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
                SmartNumber_CountScoreModel *model = [SmartNumber_CountScoreModel mj_objectWithKeyValues:dict1];
                
                SmartNumber_getScoreHelper *helpr = [[SmartNumber_getScoreHelper alloc]initWithStarScore:0 defoultCount:BaseColor setDefaultBlock:^(NSString * string) {
                    [[NSUserDefaults standardUserDefaults] setObject:dict1 forKey:@"SmartNumber_score"];

                    if([string isEqualToString:@"level 0"]){
                        [NSObject SmartNumber_saveScore:0 key:@"SmartNumber_simple_default"];
                    }else if([string isEqualToString:@"level 1"]){
                        [NSObject SmartNumber_saveScore:0 key:@"SmartNumber_general_default"];
                    }else{
                        [NSObject SmartNumber_saveScore:0 key:@"SmartNumber_difficult_default"];
                    }
                    if(self.block){
                        self.block(model);
                    }
                }];
                [helpr getScoreNumber];
            });
        }
    }];
    [task resume];
}

- (void)setUPUi{
    
}

@end
