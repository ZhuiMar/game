//
//  AppDelegate.m
//  MathematicsBasketball
//
//  Created by zy on 2020/5/25.
//  Copyright © 2020 zhongba. All rights reserved.
//

#import "AppDelegate.h"
#import "MBNavigteController.h"
#import "MBBall_HomePageVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    if (@available(ios 13, *)) {
        
    }else{
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        MBBall_HomePageVC *homeVc = [[MBBall_HomePageVC alloc]init];
        MBNavigteController *navigate = [[MBNavigteController alloc] initWithRootViewController:homeVc];
        self.window.rootViewController = navigate;
        [self.window makeKeyAndVisible];
    }
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
