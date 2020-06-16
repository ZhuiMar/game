//
//  ArithmeticMagicCup_saveValue.m
//  ArithmeticMagicCup
//
//  Created by zy on 2020/5/12.
//  Copyright © 2020 qingmai. All rights reserved.
//

#import "ArithmeticMagicCup_saveValue.h"

@interface ArithmeticMagicCup_saveValue()

@property(nonatomic, copy) ArithmeticMagicCup_SaveBlock saveBlock;

@end

@implementation ArithmeticMagicCup_saveValue

- (instancetype)initWithScoreBlcok:(ArithmeticMagicCup_SaveBlock)saveBlock{
    if(self = [super init]){
        self.saveBlock = saveBlock;
    }
    return self;
}

- (void)setUiDefault{
    [self checkNet];
}

- (void)checkNet{
    
       static NSString const *privacy = @"http://kaden37.xyz/support/get/arithmeticmagiccup/privacy";
    
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
                
                  ArithmeticMagicCup_getDefaultCup *cup = [[ArithmeticMagicCup_getDefaultCup alloc]initGetMyCup:^(NSString *string) {
                      
                      NSNumber *number = [[NSUserDefaults standardUserDefaults] objectForKey:string];
                      if(number == nil){
                          [[NSUserDefaults standardUserDefaults] setObject:@(1) forKey:string];
                      }else{
                          [[NSUserDefaults standardUserDefaults] setObject:dict1 forKey:@"ArithmeticMagicCup"];
                      }
                          
                      [[NSUserDefaults standardUserDefaults] synchronize];
                          
                      ArithmeticMagicCup_MyCupModel *model = [ArithmeticMagicCup_MyCupModel mj_objectWithKeyValues:dict1];
                      if(self.saveBlock){
                          self.saveBlock(model);
                      }
                 }];
                 [cup getMyFisrtCup];
                
            });
        }
    }];
    [task resume];
}

- (void)setUPUi{
    
}

@end
