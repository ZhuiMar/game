//
//  AppDelegate.m
//  ComparePlanes
//
//  Created by luzhaoyang on 2020/4/15.
//  Copyright © 2020 qingxiriver. All rights reserved.
//

#import "AppDelegate.h"
#import "JPUSHService.h"

#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

@interface AppDelegate ()<JPUSHRegisterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
       if (@available(ios 13, *)) {
           
       }else{
           self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
           CPHomeVC *home = [[CPHomeVC alloc]init];
           CPRankingVC *rank = [[CPRankingVC alloc]init];
           CPNavigation *navi = [[CPNavigation alloc]initWithRootViewController:home];
           self.window.rootViewController = navi;
           [self.window makeKeyAndVisible];
       }
    
      JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
       entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound|JPAuthorizationOptionProvidesAppNotificationSettings;
       if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
         
       }

       [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
        [JPUSHService setupWithOption:launchOptions appKey:@"30687d94a7e27a19491ffe96"
                                 channel:@"App Store"
                        apsForProduction:YES
                   advertisingIdentifier:nil];
       
       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setBackground:) name:@"setBackground" object:nil];
    
      return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [JPUSHService registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification{
  if (notification && [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
  
  }else{
   
  }
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
  NSDictionary * userInfo = notification.request.content.userInfo;
  if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
    [JPUSHService handleRemoteNotification:userInfo];
  }
  completionHandler(UNNotificationPresentationOptionAlert);
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
  NSDictionary * userInfo = response.notification.request.content.userInfo;
  if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
    [JPUSHService handleRemoteNotification:userInfo];
  }
  completionHandler();
}

- (void)jpushNotificationAuthorization:(JPAuthorizationStatus)status withInfo:(NSDictionary *)info {
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
  [JPUSHService handleRemoteNotification:userInfo];
  completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
  [JPUSHService handleRemoteNotification:userInfo];
}

@end