//
//  AppDelegate.m
//  SleepHelper
//
//  Created by zy on 2020/5/18.
//  Copyright © 2020 tianma. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    if (@available(ios 13, *)) {
        
    }else{
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        SleepHelper_RootTab *tab = [[SleepHelper_RootTab alloc]init];
        self.window.rootViewController = tab;
        [self.window makeKeyAndVisible];
    }
    return YES;
}

@end
