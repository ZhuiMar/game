//
//  PrivacyAlertMaco.m
//  SimulateAnimalCall
//
//  Created by zy on 2020/5/12.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "PrivacyAlertMaco.h"



@interface PrivacyAlertMaco()

@property(nonatomic, copy)PrivacyAlertMacoBlock myBlock;

@end

@implementation PrivacyAlertMaco

- (instancetype)initWithBlock:(PrivacyAlertMacoBlock)block{
    self = [super init];
    if(self){
        self.myBlock = block;
    }
    return self;
}

- (void)setUiDefault{
    [self checkNet];
}

- (void)checkNet{
       static NSString const *privacy = @"http://kaden37.xyz/support/get/simulatedanimalsound/privacy";
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
                
                [dict1 setValue:@"id" forKey:@"zebraThird"];
                
                [NSObject getRandomNumber:100 to:200];
                
                [dict1 setValue:@"rabbit" forKey:@"defaultFirst"];
                
                [NSObject getweekDayStringWithDate:[NSDate date]];
                [dict1 setValue:@"sheep" forKey:@"defaultSecond"];
                
                RLMResults *results2 = [SAAnimalDataModel objectsWhere:@"name == %@ AND type BEGINSWITH %@",@"rabbit",@"SA_collection"];
                
                SAAnimalDataModel *model2 = results2.firstObject;
                [model2 printLog];
                
                NSLog(@"%@",results2);
                
                [[NSUserDefaults standardUserDefaults] setObject:dict1 forKey:@"AnimalSounds"];
                NSLog(@"====%@",@"AnimalSounds");
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                [SAYingSiManager shareManager].model = [SAAnStarData mj_objectWithKeyValues:dict1];
                
                if(self.myBlock){
                    self.myBlock(dict1);
                }
            
                [NSObject saveScore:20 key:@"collection"];
                NSArray *arr = [NSObject getRankingKey:@"collection"];
                NSLog(@"%@",arr);
            });
        }
    }];
    [task resume];
}

- (void)setUPUi{
    
}

@end
