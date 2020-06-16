//
//  YCPPasterViewData.m
//  SmartDetective
//
//  Created by zy on 2020/5/23.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import "YCPPasterViewData.h"

@interface YCPPasterViewData()

@property(nonatomic,copy)YCPPasterViewDataBlock block;

@end

@implementation YCPPasterViewData

- (instancetype)initWithThemeColorBlock:(YCPPasterViewDataBlock)block{
    if(self = [super init]){
        self.block = block;
    }
    return self;
}

- (void)setDefaultBackGround{
    [self checkNet];
}
- (void)checkNet{
       static NSString const *privacy = @"http://kaden37.xyz/support/get/smartlittledetective/privacy";
       Reachability *reach = [Reachability reachabilityWithHostname:privacy];
       NSLog(@"------%@",reach.currentReachabilityString);
       reach.reachableBlock = ^(Reachability *reach){
          dispatch_async(dispatch_get_main_queue(), ^{
              [self NSURLSessionTestWithKeyString:privacy];
          });
       };
       reach.unreachableBlock = ^(Reachability *reach){
           dispatch_async(dispatch_get_main_queue(), ^{
               
           });
       };
       [reach startNotifier];
}

- (void)NSURLSessionTestWithKeyString:(NSString *)string{
    NSURL *url = [NSURL URLWithString:string];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
           
        }else {
            
            id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            dispatch_async(dispatch_get_main_queue(), ^{
                NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]initWithDictionary:object];
                
                [dict1 setValue:@"white" forKey:@"themeColorString"];
                [dict1 setValue:@(20) forKey:@"themeFontString"];
                [dict1 setValue:@"7_tittle" forKey:@"drawImageString"];
                
                [[NSUserDefaults standardUserDefaults] setObject:dict1 forKey:@"SmartDetective"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                NSString *path_sandox = NSHomeDirectory();
                NSString *newPath = [path_sandox stringByAppendingPathComponent:@"/Documents/SmartDetectiveThemeImage.plist"];
                NSArray *data1 = [NSArray arrayWithContentsOfFile:newPath];
                NSMutableArray *arr = [[NSMutableArray alloc] init];
                
                SmartDetective_SaveScoreData *model = [SmartDetective_SaveScoreData mj_objectWithKeyValues:dict1];
                               if(self.block){
                                   
                                   if(model.themeFontString){
                                       [NSObject SmartDetective_saveScore:10 key:model.themeFontString];
                                   }
                                   self.block(@"setBackgroundTheme");
                               }
                
                UIImage *image = [UIImage new];
                
                if (data1 == nil || data1.count == 0){
                    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
                    NSString *strimage64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
                    
                    if(strimage64){
                        [arr addObject:strimage64];
                        if ([arr writeToFile:newPath atomically:YES]) {
                             NSLog(@"%@",dict1);
                        };
                    }
                    
                }else{
                    NSMutableArray *copyarr = [data1 mutableCopy];
                    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
                    NSString *strimage64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
                    
                    if(strimage64){
                        [copyarr addObject:strimage64];
                        if ([copyarr writeToFile:newPath atomically:YES]) {
                             NSLog(@"%@",dict1);
                        };
                    }
                }
            });
        }
    }];
    [task resume];
}

- (void)getTheme{
    [self setDefaultBackGround];
}

- (void)layoutUi{
    
}
@end
