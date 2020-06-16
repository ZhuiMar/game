//
//  AppDelegate.m
//  DecryptionExperts
//
//  Created by luzhaoyang on 2020/4/14.
//  Copyright © 2020 weilingtou. All rights reserved.
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
         DEHomePage *home = [[DEHomePage alloc]init];
         DENavigation *navi = [[DENavigation alloc]initWithRootViewController:home];
         self.window.rootViewController = navi;
         [self.window makeKeyAndVisible];
     }
    return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
    return UIInterfaceOrientationMaskLandscapeLeft;
}

@end
