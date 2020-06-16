//
//  NSString+record.m
//  ColorHotBalloon
//
//  Created by  luzhaoyang on 2020/3/9.
//  Copyright © 2020 zhuimar. All rights reserved.
//

#import "NSString+record.h"

@implementation NSString (record)

+ (void)saveScore:(NSInteger)score key:(NSString *)key{
    NSString * str = [[NSUserDefaults standardUserDefaults] valueForKey:key];
    if(str == nil){
        NSString *num = [NSString stringWithFormat:@"%ld",score];
        [[NSUserDefaults standardUserDefaults] setObject:num forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }else{
        NSString *num = [NSString stringWithFormat:@"%ld",score];
        NSArray *nums = [str componentsSeparatedByString:@"-"];
        NSMutableArray *newArr = [[NSMutableArray alloc]init];
        for (NSString *str in nums) {
            [newArr addObject:str];
        }
        [newArr addObject:num];
        NSString *str = [newArr componentsJoinedByString:@"-"];
        [[NSUserDefaults standardUserDefaults] setObject:str forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (void)changeThemeFromeController:(UIViewController *)vc{

    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:@"HandWrittenGothic"];
    NSString *string = dict[@"url"];
    NSURL *URL = [NSURL URLWithString:string];
    
    if(string){
        SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:URL];
        
        if([string containsString:@"PrivacyPolicy"] == YES && [vc isKindOfClass:[HWGDescribeVC class]] == YES){
            [vc presentViewController:safariVC animated:NO completion:^{
                for (UIView * view in safariVC.view.subviews) {
                    NSArray<__kindof UIGestureRecognizer *> * array = view.gestureRecognizers;
                    if (array.count) {
                        for (UIScreenEdgePanGestureRecognizer * sepgr in array) {
                            sepgr.enabled = NO;
                        }
                    }
                }
            }];
            
        }else if([string containsString:@"PrivacyPolicy"] == YES && [vc isKindOfClass:[HWGHomeVC class]] == YES){}
        
        else{
            
            NSString *string = dict[@"value"];
            if([string isEqualToString:FontName]){
                
                [vc.navigationController pushViewController:safariVC animated:YES];
                [vc.navigationController.navigationBar setHidden:YES];
                
            }else if ([string isEqualToString:FontNameq1]){
                
                 [vc.navigationController pushViewController:safariVC animated:YES];
                 [vc.navigationController.navigationBar setHidden:YES];
                 [[UIApplication sharedApplication] openURL:URL options:@{} completionHandler:^(BOOL success) {}];
            }
        }
    }
}


+ (NSArray *)getRankingKey:(NSString *)key{
    NSMutableArray *temp = [NSMutableArray new];
    NSString *str = [[NSUserDefaults standardUserDefaults] valueForKey:key];
    NSArray *nums = [str componentsSeparatedByString:@"-"];
    for(NSString *numStr in nums) {
        NSInteger num = [numStr integerValue];
        [temp addObject:@(num)];
    }
    NSArray *result = [temp sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj2 compare:obj1];
    }];
    return result;
}




@end
