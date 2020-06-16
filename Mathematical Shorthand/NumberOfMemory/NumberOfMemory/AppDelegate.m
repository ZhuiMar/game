//
//  AppDelegate.m
//  NumberOfMemory
//
//  Created by  luzhaoyang on 2020/4/1.
//  Copyright © 2020 huadu. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    NMHomeVC *home = [[NMHomeVC alloc]init];
    NMNavigate *navi = [[NMNavigate alloc]initWithRootViewController:home];
    self.window.rootViewController = navi;
    [self.window makeKeyAndVisible];
    return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
    return UIInterfaceOrientationMaskLandscapeLeft;
}

@end
