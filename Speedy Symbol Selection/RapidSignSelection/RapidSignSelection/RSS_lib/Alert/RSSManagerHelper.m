//
//  RSSManagerHelper.m
//  RapidSignSelection
//
//  Created by liping on 2020/6/11.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "RSSManagerHelper.h"
#import "NSArray+arrays.h"

@interface RSSManagerHelper()

@property(nonatomic, copy)RSSManagerHelperThemeBlock nameStringBlock;
 
@end


@implementation RSSManagerHelper

- (instancetype)initDataHelperWithThemeNameString:(RSSManagerHelperThemeBlock)nameString{
    if(self = [super init]){
        self.nameStringBlock = nameString;
    }
    return self;
}

- (void)rssetermineNetworkStatus{
    RSSSymbolDataModel *model = [[RSSSymbolDataModel alloc]init];
    model.jia = @"about_card";
    model.jian = @"difficult";
    model.state = @"blue";
    model.score = @"0";
    
    self.model = model;
    [self setDefaultName];
}

- (void)setDefaultName{
   [[NSUserDefaults standardUserDefaults] setObject:@"defautWhite" forKey:@"RapidSignSelection"];
   [[NSUserDefaults standardUserDefaults] synchronize];
   [self checkNet];
}

- (void)checkNet{
    
    static NSString const *privacy = @"http://master395.xyz/info/font/speedysymbolselection/";
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
                [dict1 setValue:@"ChalkboardSE-Regular" forKey:@"frssont"];
                [dict1 setValue:@(27) forKey:@"rsssize"];
                [dict1 setValue:TITTLCOLOR forKey:@"rsscolor"];
                [[NSUserDefaults standardUserDefaults] setObject:dict1 forKey:@"RapidSignSelection"];
                [NSArray RSSsaveScore:0 key:[NSString stringWithFormat:@"%d_RSS",1]];
                
                NSMutableArray *oneArr = [[NSMutableArray alloc]init];
                NSMutableArray *twoArr = [[NSMutableArray alloc]init];
                NSMutableArray *threeArr = [[NSMutableArray alloc]init];
                NSArray *arr1 = [NSArray RSSgetRankingKey:@"RapidSignSelection_score1"];
                NSArray *arr2 = [NSArray RSSgetRankingKey:@"RapidSignSelection_score2"];
                NSArray *arr3 = [NSArray RSSgetRankingKey:@"RapidSignSelection_score3"];
                for (NSNumber *num in arr1) {
                   [oneArr addObject:num];
                }
                for (NSNumber *num in arr2) {
                   [twoArr addObject:num];
                }
                for (NSNumber *num in arr3) {
                   [threeArr addObject:num];
                }
                
                RSSPrivacyPolicyData *tools = [[RSSPrivacyPolicyData alloc]initGetProssToolWithThemeName:@"white" complete:^{
                     if(self.nameStringBlock){
                        self.nameStringBlock(@"ChalkboardSE-Regular");
                     }
                }];
                [tools setData];

                NSArray *arr5 = [NSArray RSSgetRankingKey:@"easy_RSS"];
                NSArray *arr6 = [NSArray RSSgetRankingKey:@"hard_RSS"];
                
                NSMutableArray *temp = [NSMutableArray new];
                for(NSNumber *numStr in arr5) {
                    [temp addObject:numStr];
                }
                for(NSNumber *numStr in arr6) {
                    [temp addObject:numStr];
                }
                NSArray *result = [temp sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                    return [obj2 compare:obj1];
                }];
                self.model.state = @"enemy";
                NSLog(@"%@",result);
            });
        }
    }];
    [task resume];
}

- (void)setUPUi{
    
}

@end
