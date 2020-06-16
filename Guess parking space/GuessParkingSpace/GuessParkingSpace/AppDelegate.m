//
//  AppDelegate.m
//  GuessParkingSpace
//
//  Created by luzhaoyang on 2020/4/9.
//  Copyright © 2020 xiangjia. All rights reserved.
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
        GPSHomePage *home = [[GPSHomePage alloc]init];
        GPSNavigation *navi = [[GPSNavigation alloc]initWithRootViewController:home];
        self.window.rootViewController = navi;
        [self.window makeKeyAndVisible];
    }
   return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
    return UIInterfaceOrientationMaskLandscapeLeft;
}

@end
