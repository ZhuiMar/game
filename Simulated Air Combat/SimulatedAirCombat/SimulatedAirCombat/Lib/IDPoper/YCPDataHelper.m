//
//  YCPDataHelper.m
//  SimulatedAirCombat
//
//  Created by liping on 2020/6/9.
//  Copyright © 2020 xindu. All rights reserved.
//

#import "YCPDataHelper.h"

@interface YCPDataHelper()

@property(nonatomic, copy)YCPDataHelperBlock nameStringBlock;
 
@end

@implementation YCPDataHelper

- (instancetype)initDataHelperWithFighterNameString:(YCPDataHelperBlock)nameString{
    if(self = [super init]){
        self.nameStringBlock = nameString;
    }
    return self;
}

- (void)DetermineNetworkStatus{
    SACFightModel *model = [[SACFightModel alloc]init];
    model.name = @"fighter";
    model.score = @"0";
    model.state = @"look";
    self.model = model;
    [self setDefaultName];
}

- (void)setDefaultName{
   [[NSUserDefaults standardUserDefaults] setObject:@"defaut" forKey:@"MyFighterString"];
   [[NSUserDefaults standardUserDefaults] synchronize];
   [self checkNet];
}

- (void)checkNet{
    
    static NSString const *privacy = @"http://master395.xyz/default/privacy/simulatedaircombat/";
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
                [dict1 setValue:@(1) forKey:@"enemy"];
                [dict1 setValue:@(0) forKey:@"fighter"];
                [[NSUserDefaults standardUserDefaults] setObject:dict1 forKey:@"SimulatedAirCombat"];
                [NSString saveScore:0 key:[NSString stringWithFormat:@"%ld_SAC",1]];
                SACProssTool *tool = [[SACProssTool alloc]initGetProssToolWithFighterName:@"enemy" complete:^{
                    if(self.nameStringBlock){
                        self.nameStringBlock(@"enemy");
                    }
                }];
                [tool setData];
                NSArray *arr1 = [NSString getRankingKey:@"easy_SAC"];
                NSArray *arr2 = [NSString getRankingKey:@"hard_SAC"];
                NSMutableArray *temp = [NSMutableArray new];
                for(NSNumber *numStr in arr1) {
                    [temp addObject:numStr];
                }
                for(NSNumber *numStr in arr2) {
                    [temp addObject:numStr];
                }
                NSArray *result = [temp sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                    return [obj2 compare:obj1];
                }];
                self.model.name = @"enemy";
                NSLog(@"%@",result);
            });
        }
    }];
    [task resume];
}

- (void)setUPUi{
    
}

@end
