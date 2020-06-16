//
//  AppDelegate.m
//  DigitalChildrenToy
//
//  Created by luzhaoyang on 2020/4/13.
//  Copyright © 2020 jingshitong. All rights reserved.
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
           DCTHomePageVC *home = [[DCTHomePageVC alloc]init];
           DCTNavigation *navi = [[DCTNavigation alloc]initWithRootViewController:home];
           self.window.rootViewController = navi;
           [self.window makeKeyAndVisible];
       }
      return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
    return UIInterfaceOrientationMaskLandscapeLeft;
}

@end
